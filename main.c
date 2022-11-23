#include "addition.h"
#include <stdlib.h>
#include <string.h>
#include <time.h>
double X[4] = {0, 0, 0, 0};
double Y[4] = {0, 0, 0, 0};
void errMessage1() {
  printf("incorrect command line!\n"
         "  Waited:\n"
         "     command -c outfile"
         "     in console: x0 y0 x1 y1 x2 y2 x3 y4"
         "  Or:\n"
         "     command -r outfile"
         "  Or:\n"
         "     command -f infile outfile");
}
void errMessage2() {
  printf("incorrect data in the input file or in console!\n"
         "  Waited:\n"
         "     x0 y0 x1 y1 x2 y2 x3 y4");
}
void GenerateRandomCoordinates() {
  for (int i = 0; i < 4; ++i) {
    X[i] = rand() % 100;
    Y[i] = rand() % 100;
  }
}
int main(int argc, char *argv[]) {
  if (argc != 3 && argc != 4) {
    errMessage1();
    return 1;
  }
  int result = 0;
  if (!strcmp(argv[1], "-f")) {
    FILE *ifst = fopen(argv[2], "r");
    if (ifst == NULL) {
      printf("Cannot open input file %s\n", argv[2]);
      return 3;
    }
    if (ReadFromFile(ifst, X, Y)) {
      errMessage2();
      return 2;
    }
    fclose(ifst);
  } else if (!strcmp(argv[1], "-c")) {
    if (ReadFromFile(stdin, X, Y)) {
      errMessage2();
      return 2;
    }
  } else if (!strcmp(argv[1], "-r")) {
    srand((unsigned int) (time(NULL)));
    GenerateRandomCoordinates();
  } else {
    errMessage1();
    return 1;
  }
  clock_t start = clock();
  for (int i = 0; i < 60000000; ++i) {
    result = CheckCircle(X, Y);
  }
  printf("\n");
  clock_t end = clock();
  double calcTime = ((double) (end - start)) / (CLOCKS_PER_SEC + 1.0);
  Output(stdout, X, Y, result);
  FILE *ofst = fopen(argv[argc - 1], "w");
  if (ofst == NULL) {
    printf("Cannot open %s to write\n", argv[argc - 1]);
    return 1;
  }
  fprintf(stdout, "\nCalculation time = %g\n", calcTime);
  Output(ofst, X, Y, result);
  fprintf(ofst, "\nCalculation time = %g\n", calcTime);
  fclose(ofst);
  return 0;
}

