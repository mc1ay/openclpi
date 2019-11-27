#include "libspir_types.h"
#define EXPORT_PIPE_SYMBOLS 1
#include "cpu_pipes.h"
#undef EXPORT_PIPE_SYMBOLS
#include "xcl_half.h"
#include <cstddef>
#include <vector>
#include <pthread.h>

extern "C" {

void __stub____xlnx_cl_single_thread_add_point(char **argv);
static pthread_mutex_t __xlnx_cl_add_point_mutex = PTHREAD_MUTEX_INITIALIZER;
void __stub____xlnx_cl_add_point(char **argv) {
  pthread_mutex_lock(&__xlnx_cl_add_point_mutex);
  __stub____xlnx_cl_single_thread_add_point(argv);
  pthread_mutex_unlock(&__xlnx_cl_add_point_mutex);
}
}
