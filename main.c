#include "addition.h"
#include <stdlib.h>// для функций rand() и srand()
#include <string.h>
#include <time.h>
#define SIZE_ARRAY 10000000

char Text[SIZE_ARRAY];
char Sub[SIZE_ARRAY];
int Index[SIZE_ARRAY];

void errMessage1() {
  printf("incorrect command line!\n"
         "  Waited:\n"
         "     command -f size \"word\" infile outfile\n"
         "  Or:\n"
         "     command -n size \"word\" -c/-r outfile\n");
}
void errMessage2() {
  printf("the specified length of the substring does not correspond to reality\n");
}
void errMessage3() {
  printf("incorrect size of substring!\n"
         "1 <= size <= %d\n",
         SIZE_ARRAY);
}
int check_sub(int real_size, char *str) {
  return strlen(str) != real_size;
}
void GenerateRandomString(int text_size) {
  for (int i = 0; i < text_size; i++) {
    Text[i] = rand() % 128;
  }
}
int main(int argc, char *argv[]) {
  if (argc < 5 || argc > 6) {
    errMessage1();
    return 1;
  }
  int text_size, sub_size, index_size;

  if (!strcmp(argv[1], "-f")) {
    FILE *ifst = fopen(argv[4], "r");
    if (ifst == NULL) {
      printf("Cannot open input file.\n");
      return 3;
    }
    text_size = ReadFromFile(ifst, Text, SIZE_ARRAY);
    fclose(ifst);
    sub_size = strtol(argv[2], NULL, 10);
    stpcpy(Sub, argv[3]);
    if (check_sub(sub_size, argv[3])) {
      errMessage2();
      return 2;
    }
    if (sub_size > SIZE_ARRAY || sub_size <= 0) {
      errMessage3();
      return 3;
    }
  } else if (!strcmp(argv[1], "-n")) {
    sub_size = strtol(argv[2], NULL, 10);
    stpcpy(Sub, argv[3]);
    if (check_sub(sub_size, argv[3])) {
      errMessage2();
      return 2;
    }
    if (sub_size > SIZE_ARRAY || sub_size <= 0) {
      errMessage3();
      return 3;
    }
    srand((unsigned int) (time(0)));
    text_size = SIZE_ARRAY;
    if (!strcmp(argv[4], "-r")) {
      GenerateRandomString(text_size);
    } else if (!strcmp(argv[4], "-c")) {
      text_size = ReadFromConsole(Text, text_size);
    } else {
      errMessage1();
      return 1;
    }
  } else {
    errMessage1();
    return 1;
  }
  clock_t start = clock();
  for (int i = 0; i < 41; ++i) {
    index_size = BuildIndexArray(Index, Sub, sub_size, Text, text_size);
  }
  clock_t end = clock();
  double calcTime = ((double) (end - start)) / (CLOCKS_PER_SEC + 1.0);
  Output(stdout, Index, index_size);
  FILE *ofst1 = fopen(argv[5], "w");
  if (ofst1 == NULL) {
    printf("Cannot open %s to write\n", argv[5]);
    return 1;
  }
  Output(ofst1, Index, index_size);
  fprintf(stdout, "Calculation time = %g\n", calcTime);
  fprintf(ofst1, "\nCalculation time = %g\n", calcTime);
  fclose(ofst1);
  return 0;
}

