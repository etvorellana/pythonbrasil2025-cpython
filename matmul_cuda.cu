#include <cublas_v2.h>
extern "C" void matmul_cuda(int n, const float *A, const float *B, float *C) {
    cublasHandle_t h; cublasCreate(&h);
    const float alf = 1.0f, bet = 0.0f;
    cublasSgemm(h, CUBLAS_OP_N, CUBLAS_OP_N, n, n, n, &alf, B, n, A, n, &bet, C, n);
    cudaDeviceSynchronize();
    cublasDestroy(h);
}
