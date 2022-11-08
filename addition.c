#include "addition.h"

int BuildIndexArray(int answ[], char sub[], int size_sub, char A[], int size_A) {
  int j = 0;
  for (int i = 0; i < size_A - size_sub + 1; ++i) {
    if (strncmp(sub, &A[i], size_sub) == 0) {
      answ[j] = i;
      ++j;
    }
  }
  return j;
}
void Output(FILE *ofst, int array[], int size) {
  for (int i = 0; i < size; i++) {
    fprintf(ofst, "%d ", array[i]);
  }
  fprintf(ofst, "\n");
}
int ReadFromFile(FILE *fin, char A[], int max_size) {
  int i = 0;
  int ch;
  do {
    if (i == max_size) {
      break;
    }
    ch = fgetc(fin);
    A[i] = ch;
    ++i;
  } while (ch != -1);
  if (A[i - 1] == -1) {
    A[i - 1] = '\0';
  }
  return i;
}

int ReadFromConsole(char A[], int max_size) {
  return ReadFromFile(stdin, A, max_size);
}
