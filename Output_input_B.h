#ifndef CAAOS__OUTPUT_INPUT_B_H_
#define CAAOS__OUTPUT_INPUT_B_H_
#include <stdio.h>
void BuildBArray(int B[], int A[], int size);

int ReadFromFile(FILE *fin, int A[]);
void Output(FILE *ofst, int B[], int size);
void InputArrayFromConsole(int A[], int size);
#endif//CAAOS__OUTPUT_INPUT_B_H_
