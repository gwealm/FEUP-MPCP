#include <stdio.h>
#include <stdlib.h>

extern double cosseno(double x);
extern double func(double graus);
extern void table(double[]);


void printVec(double arr[], int len) {
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

	double arr[91];

	table(arr);


	printVec(arr, 91);

	return 0;
}