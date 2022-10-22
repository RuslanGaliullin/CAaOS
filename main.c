#include "Output_input_B.h"
#include <stdlib.h>// для функций rand() и srand()
#include <string.h>
#include <time.h>
#define SIZE_ARRAY 10000000

int A[SIZE_ARRAY];
int B[SIZE_ARRAY];
void errMessage1() {
  printf("incorrect command line!\n"
         "  Waited:\n"
         "     command -f infile outfile\n"
         "  Or:\n"
         "     command -n number -c/-r outfile\n");
}
void errMessage2() {
  printf("incorrect qualifier value!\n"
         "  Waited:\n"
         "     command -f infile outfile\n"
         "  Or:\n"
         "     command -n number -c/-r outfile\n");// -c - ввод из консоли; -r - случайный ввод
}
void errMessage3() {
  printf("incorrect qualifier in file value!\n"
         "  Waited:\n"
         "     number\n"
         "     A[0] A[1] ... A[number - 1]\n");
}

void GenerateRandomArray(int size) {
  for (int i = 0; i < size; ++i) {
    A[i] = rand() % 100000;
  }
}

int main(int argc, char *argv[]) {
  if (argc < 4 || argc > 5) {
    errMessage1();
    return 1;
  }
  int size;
  if (!strcmp(argv[1], "-f")) {
    FILE *ifst = fopen(argv[2], "r");
    if (ifst == NULL) {
      printf("Cannot open infile.\n");
      return 3;
    }
    size = ReadFromFile(ifst, A);
    fclose(ifst);
    if (size == -2) {
      printf("incorrect number of elements = %d. Set 0 < number <= 10000000\n", size);
      return 3;
    }
    if (size == -1) {
      errMessage3();
      return 3;
    }
  } else if (!strcmp(argv[1], "-n")) {
    size = strtol(argv[2], NULL, 10);
    if ((size < 1) || (size > SIZE_ARRAY)) {
      printf("incorrect number of elements = %d. Set 0 < number <= %d\n", size, SIZE_ARRAY);
      return 3;
    }
    srand((unsigned int) (time(0)));
    if (!strcmp(argv[3], "-r")) {
      GenerateRandomArray(size);
      fprintf(stdout, "Filled array A:\n");
      Output(stdout, A, size);
    } else if (!strcmp(argv[3], "-c")) {
      InputArrayFromConsole(A, size);
    }
  } else {
    errMessage2();
    return 2;
  }

  clock_t start = clock();
  BuildBArray(B, A, size);
  clock_t end = clock();
  double calcTime = ((double) (end - start)) / (CLOCKS_PER_SEC + 1.0);

  fprintf(stdout, "Built array B:\n");
  Output(stdout, B, size);

  FILE *ofst1 = fopen(argv[argc - 1], "w");
  if (ofst1 == NULL) {
    printf("Cannot open %s to write\n", argv[argc - 1]);
    return 1;
  }
  fprintf(ofst1, "Built array B:\n");
  Output(ofst1, B, size);
  fprintf(stdout, "Calculation time = %g\n", calcTime);
  fprintf(ofst1, "\nCalculation time = %g\n", calcTime);

  fclose(ofst1);
  return 0;
}
