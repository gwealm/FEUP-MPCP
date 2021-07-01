#include <stdio.h>
#include <stdlib.h>


extern int SOMA(int[], int);
extern float MEDIA(int[], int);
extern float MAXMED(int[], int, int[], int);


void printData(int arr[], int len, int sum, float med) {
	printf("[");
	for (int i = 0; i < len; i++) {
		if (i == (len - 1)) {
			printf("%d", arr[i]);
		} else {
			printf("%d, ", arr[i]);
		}
	}
	printf("]\n");
	printf("Soma: %d\n", sum);
	printf("Média: %f\n", med);
}


int main(void) {

	int vec1[] = {1, 2, 3, 1};
	int vec2[] = {3, 0};
	int len1 = 4, len2 = 2;

	int somavec1 = SOMA(vec1, len1);
	float medvec1 = MEDIA(vec1, len1);

	int somavec2 = SOMA(vec2, len2);
	float medvec2 = MEDIA(vec2, len2);


	float maxmed = MAXMED(vec1, len1, vec2, len2);

	printf("--------VECTOR 1--------\n");
	printData(vec1, len1, somavec1, medvec1);

	printf("--------VECTOR 2--------\n");
	printData(vec2, len2, somavec2, medvec2);

	printf("----------------\n");
	printf("maxmed: %f\n", maxmed);

	return 0;
}