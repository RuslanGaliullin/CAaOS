#include "addition.h"

// Надо сначала найти точку пересечения 2 серединных перпендикуляров между 3 произвольными точками и это будет центр.
// Дальше проверить, что 4ая точка принадлежит окружности с найденным центром и радиусом.
// Первая пряма
int CheckCircle(const double X[], const double Y[]) {
  // Направляющий вектор между точками 0 и 1
  double cx01 = X[1] - X[0];
  double cy01 = Y[1] - Y[0];
  // Вектор перпендикулярный направляющему вектору между точками 0 и 1
  double dx01 = cy01;
  double dy01 = -cx01;
  // Середина между точками 0 1
  double mx01 = (X[1] + X[0]) / 2;
  double my01 = (Y[1] + Y[0]) / 2;
  // Направляющий вектор между точками 1 и 2
  double cx12 = X[2] - X[1];
  double cy12 = Y[2] - Y[1];
  // Вектор перпендикулярный направляющему вектору между точками 1 и 2
  double dx12 = cy12;
  double dy12 = -cx12;
  // Середина между точками 0 1
  double mx12 = (X[2] + X[1]) / 2;
  double my12 = (Y[2] + Y[1]) / 2;
  // Поиск центра окружности, на которой лежат точки с индексами 0, 1 и 2
  double center_x = 0, center_y = 0;
  // Проверка, что хотя бы 2 точки совпадают
  if (CheckSimilarPoints(X, Y)) {
    return 1;
  }
  if (!FindCenter(&center_x, &center_y, mx01, my01, dx01, dy01, mx12, my12, dx12, dy12)) {
    return 0;
  }
  double distance_1 = (center_x - X[3]) * (center_x - X[3]) + (center_y - Y[3]) * (center_y - Y[3]);
  double distance_2 = (center_x - X[0]) * (center_x - X[0]) + (center_y - Y[0]) * (center_y - Y[0]);

  return (distance_1 - distance_2) < 0.00001 && (distance_1 - distance_2) > -0.00001;
}
int CheckSimilarPoints(const double X[], const double Y[]) {
  for (int i = 0; i < 3; ++i) {
    for (int j = i + 1; j < 3; ++j) {
      if (X[i] == X[j] && Y[i] == Y[j]) {
        return 1;
      }
    }
  }
  return 0;
}

/// Метод нахождения центра окружности по 3 точкам
/// \param center_x - координата x искомого центра окружности
/// \param center_y - координата y искомого центра окружности
/// \param mx1 - координата x точки на прямой a
/// \param my1 - координата y точки на прямой a
/// \param ax - координата x направляющего вектора прямой a
/// \param ay - координата y направляющего вектора прямой a
/// \param mx2 - координата x точки на прямой b
/// \param my2 - координата y точки на прямой b
/// \param bx - координата x направляющего вектора прямой b
/// \param by - координата y направляющего вектора прямой b
/// \return
int FindCenter(double *center_x, double *center_y, double mx1, double my1, double ax, double ay, double mx2, double my2, double bx, double by) {
  double proportion = by * ax - ay * bx;// проверка пропорциональности направляющих векторов
  if ((proportion > -0.00001) && (proportion < 0.00001))
    return 0;                     // прямые параллельны
  double c1 = ay * mx1 - ax * my1;// решение системы пересечения 2 прямых
  double c2 = by * mx2 - bx * my2;
  *center_x = (c2 * ax - c1 * bx) / proportion;
  *center_y = (c2 * ay - c1 * by) / proportion;
  return 1;
}
void Output(FILE *fin, double X[], double Y[], int belongs) {
  fprintf(fin, "Points: (%lf, %lf); (%lf, %lf); (%lf, %lf); (%lf, %lf)\n", X[0], Y[0], X[1], Y[1], X[2], Y[2], X[3], Y[3]);
  fprintf(fin, "%s", belongs ? "All points belong to the one circle\n" : "The points don't belong to the one circle\n");
}
int ReadFromFile(FILE *fin, double array_x[], double array_y[]) {
  for (int i = 0; i < 4; i++) {
    if (fscanf(fin, "%lf", &array_x[i]) == EOF || fscanf(fin, "%lf", &array_y[i]) == EOF) {
      return 2;
    }
  }
  return 0;
}
