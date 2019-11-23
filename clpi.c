#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <CL/cl.h>
#include <stdbool.h>

 
#define MAX_SOURCE_SIZE (0x10000)

// Function to print ret status from OpenCL functions
void print_ret_status(int ret) {
    if(ret == CL_SUCCESS) {
        printf("OK\n");
    }
    else {
        printf("ERROR: %d\n", ret);
    }
}

int main(void) {

    printf("Starting Program\n");

    // Set inital PRNG state to be used for array
    unsigned int host_prng_state = 0xc69cffa1;

    // Other initializations
    cl_uint maxComputeUnits;
    size_t maxWorkGroupSize;
    unsigned long inside_total = 0;
    clock_t t1, t2;
    FILE *fp;
    char *source_str;
    size_t source_size;

    // Load the kernel source code into the array source_str
    printf("Loading kernel source\n");
 
    fp = fopen("pi.cl", "r");
    if (!fp) {
        fprintf(stderr, "Failed to load kernel.\n");
        exit(1);
    }
    source_str = (char*)malloc(MAX_SOURCE_SIZE);
    source_size = fread( source_str, 1, MAX_SOURCE_SIZE, fp);
    fclose( fp );
 
    // Get platform and device information
    printf("Getting platform and device information: ");
    cl_platform_id platform_id = NULL;
    cl_device_id device_id = NULL;   
    cl_uint ret_num_devices;
    cl_uint ret_num_platforms;
    cl_int ret = clGetPlatformIDs(1, &platform_id, &ret_num_platforms);
    ret = clGetDeviceIDs( platform_id, CL_DEVICE_TYPE_DEFAULT, 1, 
            &device_id, &ret_num_devices);
    print_ret_status(ret);

    // Get Max Compute Units
    clGetDeviceInfo(device_id, CL_DEVICE_MAX_COMPUTE_UNITS,
                    sizeof(maxComputeUnits), &maxComputeUnits, NULL);
    printf("Parallel compute units: %d\n", maxComputeUnits);

    // Get Max Workgroup Size
    clGetDeviceInfo(device_id, CL_DEVICE_MAX_WORK_GROUP_SIZE,
                    sizeof(maxWorkGroupSize), &maxWorkGroupSize, NULL);
    printf("Max workgroup size: %lu\n", maxWorkGroupSize);

    // Create an OpenCL context
    printf("Creating context: "); 
    cl_context context = clCreateContext( NULL, 1, &device_id, NULL, NULL, &ret);
    print_ret_status(ret);

    // Create a command queue
    printf("Creating queue: ");
    cl_command_queue command_queue = clCreateCommandQueue(context, device_id, 0, &ret);
    print_ret_status(ret);

    // Set number of points for calculation
    const unsigned long TEST_POINTS = 256000 * maxComputeUnits * maxWorkGroupSize;

    // Create memory buffers
    cl_mem workgroupsize_mem_obj = clCreateBuffer(context, CL_MEM_READ_ONLY, 
            sizeof(int), NULL, &ret);
    cl_mem inside_mem_obj = clCreateBuffer(context, CL_MEM_READ_WRITE, 
            maxComputeUnits * maxWorkGroupSize * sizeof(bool), NULL, &ret);
    cl_mem prng_state_mem_obj = clCreateBuffer(context, CL_MEM_READ_WRITE, 
            maxComputeUnits * maxWorkGroupSize * sizeof(int), NULL, &ret);

    // Set up PRNG state array
    int *prng_state = (int*)malloc(sizeof(int) * maxComputeUnits * maxWorkGroupSize);
    for (int i = 0; i < maxComputeUnits * maxWorkGroupSize; i++) {
        prng_state[i] = rand();
    }
    printf("Set up PRNG Array\n");
    
    // Set up counter array
    bool inside[maxComputeUnits * maxWorkGroupSize];
    for (int i = 0; i < maxComputeUnits * maxWorkGroupSize; i++) {
        inside[i] = false;
    }
    printf("Set up inside array\n");

    // Copy counter and workgroup size variables to buffers
    printf("Copying variables to buffers\n");
    printf("Counter Array: ");
    ret = clEnqueueWriteBuffer(command_queue, prng_state_mem_obj, CL_TRUE, 0, 
            maxComputeUnits * maxWorkGroupSize * sizeof(bool), inside, 0, NULL, NULL);
    print_ret_status(ret);
    printf("Workgroup Size: ");
    ret = clEnqueueWriteBuffer(command_queue, workgroupsize_mem_obj, CL_TRUE, 0, 
        sizeof(int), &maxWorkGroupSize, 0, NULL, NULL);
    print_ret_status(ret);
    printf("PRNG State Array: ");
    ret = clEnqueueWriteBuffer(command_queue, prng_state_mem_obj, CL_TRUE, 0, 
            maxComputeUnits * maxWorkGroupSize * sizeof(int), prng_state, 0, NULL, NULL);
    print_ret_status(ret);

    // Create a program from the kernel source
    printf("Creating program from source: ");
    cl_program program = clCreateProgramWithSource(context, 1, 
            (const char **)&source_str, (const size_t *)&source_size, &ret);
    print_ret_status(ret);

    // Build the program
    printf("Building program: ");
    ret = clBuildProgram(program, 1, &device_id, NULL, NULL, NULL);
    print_ret_status(ret);
    if(ret != CL_SUCCESS)
    {
        size_t log_size;
        clGetProgramBuildInfo(program, device_id, CL_PROGRAM_BUILD_LOG, 0, NULL, &log_size);
        char *buildLog = calloc(log_size, sizeof(char));
        clGetProgramBuildInfo(program, device_id, CL_PROGRAM_BUILD_LOG, log_size, buildLog, NULL);
        buildLog[log_size]='\0';
        printf("\nError in kernel BUILD PGM: %s\n ",buildLog);
        exit(1);
    }
 
    // Create the OpenCL kernel
    printf("Creating OpenCL kernel: ");
    cl_kernel kernel = clCreateKernel(program, "add_point", &ret);
    print_ret_status(ret);
 
    // Set the arguments of the kernel
    printf("Setting kernel arguments: \n");
    ret = clSetKernelArg(kernel, 0, sizeof(cl_mem), (void *)&inside_mem_obj);
    printf("1 - "); 
    print_ret_status(ret);
    ret = clSetKernelArg(kernel, 1, sizeof(cl_mem), (void *)&prng_state_mem_obj);
    printf("2 - ");
    print_ret_status(ret);
    ret = clSetKernelArg(kernel, 2, sizeof(cl_mem), (void *)&workgroupsize_mem_obj);
    printf("3 - ");
    print_ret_status(ret);

    t1 = clock();
    for (unsigned int i = 0; i < TEST_POINTS / (maxComputeUnits * maxWorkGroupSize); i++) {
        for (int j = 0; j < maxComputeUnits * maxWorkGroupSize; j++) {
            inside[j] = false; 
        }
        ret = clEnqueueWriteBuffer(command_queue, inside_mem_obj, CL_TRUE, 0, 
                maxComputeUnits * maxWorkGroupSize * sizeof(bool), inside, 0, NULL, NULL);
        // Execute the OpenCL kernel on the list
        size_t global_item_size = maxComputeUnits * maxWorkGroupSize;
        size_t local_item_size = maxWorkGroupSize;
        ret = clEnqueueNDRangeKernel(command_queue, kernel, 1, NULL, 
                &global_item_size, &local_item_size, 0, NULL, NULL);
        
        clFinish(command_queue); 
        // Read the memory buffers
        ret = clEnqueueReadBuffer(command_queue, inside_mem_obj, CL_TRUE, 0, 
                maxComputeUnits * maxWorkGroupSize * sizeof(bool), inside, 0, NULL, NULL);
        // Add to inside total
        for (int j = 0; j < maxComputeUnits * maxWorkGroupSize; j++) {
            if (inside[j] == true) {
                inside_total++;
            }
        }
    }

    // Display the result to the screen
    t2 = clock();
    double runTime = (double)(t2 - t1)/CLOCKS_PER_SEC;
    printf("Using %lu test points: \n", TEST_POINTS);
	printf("Pi: %f\n", ((double)inside_total / TEST_POINTS) * 4);
    printf("Runtime: %f seconds\n", runTime);
    
    // Clean up
    ret = clFlush(command_queue);
    ret = clFinish(command_queue);
    ret = clReleaseKernel(kernel);
    ret = clReleaseProgram(program);
    ret = clReleaseMemObject(inside_mem_obj);
    ret = clReleaseMemObject(prng_state_mem_obj);
    ret = clReleaseCommandQueue(command_queue);
    ret = clReleaseContext(context);
    free(prng_state);
    printf("Done.\n");
    return 0;
}
