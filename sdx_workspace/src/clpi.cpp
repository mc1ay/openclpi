#include <stdlib.h>
#include <fstream>
#include <iostream>
#include <vector>
#include <time.h>
#include "clpi.h"

//TARGET_DEVICE macro needs to be passed from gcc command line
#if defined(SDX_PLATFORM) && !defined(TARGET_DEVICE)
    #define STR_VALUE(arg)      #arg
    #define GET_STRING(name) STR_VALUE(name)
    #define TARGET_DEVICE GET_STRING(SDX_PLATFORM)
#endif

static const std::string error_message =
    "Error: Result mismatch:\n"
    "i = %d CPU result = %d Device result = %d\n";

int main(int argc, char* argv[]) {

    int workgroupsize = 1024;
    unsigned int testpoints = 1024;

    //TARGET_DEVICE macro needs to be passed from gcc command line
    const char *target_device_name = TARGET_DEVICE;

    if(argc != 2) {
		std::cout << "Usage: " << argv[0] <<" <xclbin>" << std::endl;
		return EXIT_FAILURE;
	}

    printf("Starting Program\n");

    // Set inital PRNG state to be used for array
    unsigned int host_prng_state = 0xc69cffa1;

    // Other initializations
    unsigned long inside_total = 0;
    clock_t t1, t2;

    // Set up PRNG state array
    int prng_state[workgroupsize];
    for (int i = 0; i < workgroupsize; i++) {
        prng_state[i] = rand();
    }
    printf("Set up PRNG Array\n");

    // Set up counter array
    bool inside[workgroupsize];
    for (int i = 0; i < workgroupsize; i++) {
        inside[i] = false;
    }

    char* xclbinFilename = argv[1];
    
    std::vector<cl::Device> devices;
    cl::Device device;
    std::vector<cl::Platform> platforms;
    bool found_device = false;

    //traversing all Platforms To find Xilinx Platform and targeted
    //Device in Xilinx Platform
    cl::Platform::get(&platforms);
    for(size_t i = 0; (i < platforms.size() ) & (found_device == false) ;i++){
        cl::Platform platform = platforms[i];
        std::string platformName = platform.getInfo<CL_PLATFORM_NAME>();
        if ( platformName == "Xilinx"){
            devices.clear();
            platform.getDevices(CL_DEVICE_TYPE_ACCELERATOR, &devices);

            //Traversing All Devices of Xilinx Platform
            for (size_t j = 0 ; j < devices.size() ; j++){
                device = devices[j];
                std::string deviceName = device.getInfo<CL_DEVICE_NAME>();
                if (deviceName == target_device_name){
                    found_device = true;
                    break;
                }
            }
        }
    }
    if (found_device == false){
       std::cout << "Error: Unable to find Target Device " 
           << target_device_name << std::endl;
       return EXIT_FAILURE; 
    }

    // Creating Context and Command Queue for selected device
    cl::Context context(device);
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE);

    // Load xclbin 
    std::cout << "Loading: '" << xclbinFilename << "'\n";
    std::ifstream bin_file(xclbinFilename, std::ifstream::binary);
    bin_file.seekg (0, bin_file.end);
    unsigned nb = bin_file.tellg();
    bin_file.seekg (0, bin_file.beg);
    char *buf = new char [nb];
    bin_file.read(buf, nb);
    
    // Creating Program from Binary File
    cl::Program::Binaries bins;
    bins.push_back({buf,nb});
    devices.resize(1);
    cl::Program program(context, devices, bins);
    
    // This call will get the kernel object from program. A kernel is an 
    // OpenCL function that is executed on the FPGA. 
    cl::Kernel krnl_add_point(program,"add_point");
    
    // These commands will allocate memory on the Device. The cl::Buffer objects can
    // be used to reference the memory locations on the device. 
    cl::Buffer buffer_workgroupsize(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY,  
            sizeof(int), &workgroupsize);
    cl::Buffer buffer_inside(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE,  
            workgroupsize * sizeof(bool), inside);
    cl::Buffer buffer_prng_state(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE, 
            workgroupsize * sizeof(int), prng_state);

    // Data will be transferred from system memory over PCIe to the FPGA on-board
    // DDR memory.
    q.enqueueMigrateMemObjects({buffer_workgroupsize, buffer_inside, buffer_prng_state},0/* 0 means from host*/);

    //set the kernel Arguments
    int narg=0;
    krnl_add_point.setArg(narg++,buffer_inside);
    krnl_add_point.setArg(narg++,buffer_prng_state);
    krnl_add_point.setArg(narg++,buffer_workgroupsize);

    //Launch the Kernel
    t1 = clock();
    for (unsigned int i = 0; i < testpoints; i++) {
        for (int j = 0; j < workgroupsize; j++) {
            inside[j] = false; 
        }
    q.enqueueMigrateMemObjects({buffer_inside},0/* 0 means from host*/);
        
        // Execute the OpenCL kernel on the list
        size_t global_item_size = workgroupsize;
        size_t local_item_size = workgroupsize;
        q.enqueueNDRangeKernel(krnl_add_point, NULL, global_item_size, local_item_size);
        
        q.finish(); 
        // Read the memory buffers
        q.enqueueMigrateMemObjects({buffer_inside},CL_MIGRATE_MEM_OBJECT_HOST);
        q.finish();
        // Add to inside total
        for (int j = 0; j < workgroupsize; j++) {
            if (inside[j] == true) {
                inside_total++;
            }
        }
    }

    // Display the result to the screen
    t2 = clock();
    double runTime = (double)(t2 - t1)/CLOCKS_PER_SEC;
    printf("Using %lu test points: \n", testpoints);
	printf("Pi: %f\n", ((double)inside_total / (testpoints * workgroupsize)) * 4);
    printf("Runtime: %f seconds\n", runTime);

    printf("Done.\n");

    return (0);

}
