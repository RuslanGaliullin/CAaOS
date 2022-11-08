#ifndef CAAOS__ADDITION_H_
#define CAAOS__ADDITION_H_
#include <stdio.h>
#include <string.h>
int BuildIndexArray(int answ[], char sub[], int size_sub, char A[], int size_A);
int ReadFromFile(FILE *fin, char A[], int max_size);
void Output(FILE *ofst, int array[], int size);
int ReadFromConsole(char A[], int max_size);
#endif//CAAOS__ADDITION_H_

