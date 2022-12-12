//
// Created by Ruslan Galiullin on 12.12.2022.
//
#ifndef CAAOS__QUERY_H_
#define CAAOS__QUERY_H_
#include "patient.h"
#include <pthread.h>
const int bufSize = 30;
/// Класса для очередей. Очереди представляют из себя кольцевые буферы размера 30
/// (считаем, что мы живем в мире, где есть возможность сохранить только 30 пациентов для каждого врача в базе).
/// Так же класс содержит поля мьютексов и условных переменных, которые синхронизируют чтение и запись для объектов очередей
class Query {
 public:
  // Имя врача, который работает с очередью
  std::string name;
  pthread_mutex_t mutex{};
  // Условные переменные о наличии элементов в очереди
  pthread_cond_t not_empty{};
  // Условные переменные о наличии свободных ячеек в очереди
  pthread_cond_t not_full{};
  // Индекс для чтения из буфера
  int front;
  // Количество элементов в буфере
  int count;
  // Индекс для записи в буфер
  int rear;
  // Очередь (кольцевой буфер) из пациентов
  Patient buf[bufSize]{};
  explicit Query(std::string name) : name(std::move(name)), front(0), count(0), rear(0) {
  }
};
#endif//CAAOS__QUERY_H_
