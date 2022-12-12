//
// Created by Ruslan Galiullin on 12.12.2022.
//
#ifndef CAAOS__QUERY_H_
#define CAAOS__QUERY_H_
#include "patient.h"
#include <pthread.h>
const int bufSize = 30;
class Query {
 public:
  std::string name;
  pthread_mutex_t mutex{};
  pthread_cond_t not_empty{};
  pthread_cond_t not_full{};
  int front;
  int rear;
  int count;
  Patient buf[bufSize]{};
  explicit Query(std::string name) : name(std::move(name)), front(0), rear(0), count(0) {
  }
};
#endif//CAAOS__QUERY_H_
