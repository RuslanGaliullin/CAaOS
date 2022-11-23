#ifndef CAAOS__ADDITION_H_
#define CAAOS__ADDITION_H_
#include <stdio.h>
#include <string.h>
int CheckCircle(const double X[], const double Y[]);
int CheckSimilarPoints(const double X[], const double Y[]);
int ReadFromFile(FILE *fin, double array_x[], double array_y[]);
int FindCenter(double *center_x, double *center_y, double mx1, double my1, double ax, double ay, double mx2, double my2, double bx, double by);
void Output(FILE *fin, double array_x[], double array_y[], int belongs);
#endif//CAAOS__ADDITION_H_

