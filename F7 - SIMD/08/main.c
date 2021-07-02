#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern long int test(float *V, long int n, float lim);
extern void ajusteSIMD(float *X, float *Y, int n, float da);


void ajuste(float *X, float *Y, int n, float da) {
	for (int i = 0; i < n; i++) {
		Y[i] = Y[i] - da * fabs(X[i]);
	}
}


void printVec(float arr[], int len) {
	printf("[");
	for (int i = 0; i < len; i++) {
		if (i == (len - 1)) {
			printf("%f", arr[i]);
		} else {
			printf("%f, ", arr[i]);
		}
	}
	printf("]\n");
}


int main(void) {
	float a1[] = {1.1, 2.2, 3.3, 4.4};
	float b1[] = {0.1, 0.2, 0.3, 0.4};

	float a2[] = {1.1, 2.2, 3.3, 4.4};
	float b2[] = {0.1, 0.2, 0.3, 0.4};

	int len = 4;
	float da = 0.3;

	ajuste(a1, b1, len, da);

	ajusteSIMD(a2, b2, len, da);

	printVec(b1, len);
	printVec(b2, len);

	return 0;
}