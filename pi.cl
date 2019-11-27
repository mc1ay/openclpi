__kernel void add_point(__global bool *inside, __global unsigned int *prng_state, __global unsigned int *wg_size) {
    unsigned int state = prng_state[get_group_id(0) * *wg_size + get_local_id(0)];
    
    // XOR-Shift state array element
    state ^= state << 13;
    state ^= state >> 17;
    state ^= state << 5;

    // Use state element for x coordinate, dividing by max int size
    // to get range 0-1
    float x = state / (float)0xFFFFFFFF;

    // XOR-Shift state array element
    state ^= state << 13;
    state ^= state >> 17;
    state ^= state << 5;
    
    // Use state element for y coordinate, dividing by max int size
    // to get range 0-1
    float y = state / (float)0xFFFFFFFF;

    // Write new state element back to array
    prng_state[get_group_id(0) * *wg_size + get_local_id(0)] = state; 

    // See if point is inside circle, if it is, increment counter array
    if (sqrt((x*x) + (y*y)) < 1.0) {
	inside[get_group_id(0) * *wg_size + get_local_id(0)] = true;
    }         
}
