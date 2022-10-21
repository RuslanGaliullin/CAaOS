#include "Output_input_B.h"

void BuildBArray(int B[], int A[], int size) {
  for (int i = 1; i < size; i += 2) {
    B[(i - 1) / 2] = A[i];
  }
  for (int i = 0; i < size; i += 2) {
    B[size / 2 + i / 2] = A[i];
  }
}
void Output(FILE *ofst, int B[], int size) {
  fprintf(ofst, "B array contains %d elements.\n", size);
  int i;
  for (i = 0; i < size; i++) {
    fprintf(ofst, "%d ", B[i]);
  }
  fprintf(ofst, "\n");
}
int ReadFromFile(FILE *fin, int A[]) {
  int size;
  if (fscanf(fin, "%d", &size) == EOF) {
    return -1;
  }
  if ((size < 1) || (size > 10000000)) {
    return -2;
  }
  for (int i = 0; i < size; ++i) {
    if (fscanf(fin, "%d", &A[i]) == EOF) {
      return -1;
    }
  }
  return size;
}
void InputArrayFromConsole(int A[], int size) {
  for (int i = 0; i < size; i++) {
    scanf("%d", &A[i]);
  }
}
