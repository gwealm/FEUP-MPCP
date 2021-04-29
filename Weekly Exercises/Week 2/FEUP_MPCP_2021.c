#include <stdio.h>
#include <stdlib.h>

extern int CheckABS( int numx, int size, int *baseAddr);

void displayIntArr(int arr[], int size) {
	for (int i = 0; i < size; i++) {
		printf("%d | ", arr[i]);
	}
	printf("\n");
}

int main(void) {

    int x = 20;

    int size = 8;

    int ve[] = {7, -8, -23, 56, 20, -10, 0, 40};


    int res = CheckABS(x, size, ve);

    printf("Foram modificados %d elementos da sequencia ve[]", res);

    displayIntArr(ve, size);

	return EXIT_SUCCESS;
}
