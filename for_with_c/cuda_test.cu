#include <stdio.h>

#define cudaCheckErrors(msg) \
do { \
  cudaError_t __err = cudaGetLastError(); \
  if (__err != cudaSuccess) { \
    fprintf(stderr, "Fatal error: %s (%s at %s:%d)\n", \
    msg, cudaGetErrorString(__err), \
    __FILE__, __LINE__); \
    fprintf(stderr, "*** FAILED - ABORTING\n"); \
    exit(1); \
  } \
} while (0)

__global__ void testkernel(int *data, int size){

  for (int i = 1; i < size; i++) data[0] += data[i];
}
extern "C" {
  int cudatestfunc(int *data, int size){

    int *d_data;
    cudaMalloc(&d_data, size*sizeof(int));
    cudaMemcpy(d_data, data, size*sizeof(int), cudaMemcpyHostToDevice);
    testkernel<<<1,1>>>(d_data, size);
    int result;
    cudaMemcpy(&result, d_data, sizeof(int), cudaMemcpyDeviceToHost);
    cudaCheckErrors("cuda error");
    return result;
  }
}
