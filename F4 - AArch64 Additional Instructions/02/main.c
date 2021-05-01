#include <stdio.h>
#include <stdlib.h>

extern int maxWord(int *baseAddr, int size);
extern long minDoubleW(long *baseAddr, long size);
extern short maxHalf(short v, int DIM);
extern long average(long *v, long DIM);
extern long valuesBetween(long *v, long DIM, long lb, long ub);


void displayIntArr(int arr[], int size) {
	for (int i = 0; i < size; i++) {
		printf("%d | ", arr[i]);
	}
	printf("\n");
}

int main(void) {

	/* 2.1
	const int DIM = 5;
	int v[] = {3, -1, 8, 0, -3};
	int max = maxWord(v, DIM);
	printf("Maximum element: %d\n", max);
	*/


	/* 2.2
	long DIM = 5;
	long v[] = {3, -1, 8, 0, -3};
	long mx = minDoubleW(v, DIM);
	printf("Maximum element: %ld\n", mx);
	*/


	/* 2.3
	int DIM = 5;
	short v[] = {3, -1, 8, 0, -3};
	short mx = maxHalf(v, DIM);
	printf("Maximum element: %d\n", mx);
	*/


	/* 2.4
	long DIM = 5;
	long v[] = {3, -1, 8, 0, -3};
	long mx = average(v, DIM);
	printf("Maximum element: %ld\n", mx);
	*/


	/* 2.5
	long DIM = 5, lb = 2, ub = 6;
	long v[] = {3, -1, 8, 0, -3};
	long res = valuesBetween(v, DIM, lb, ub);
	printf("There %s %ld value(s) in the interval [%ld, %ld]", (res == 1) ? "is" : "are", res, lb, ub);
	*/


	return EXIT_SUCCESS;
}
