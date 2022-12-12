#include <algorithm>
#include <iostream>
#include <pthread.h>
#include <random>
#include <semaphore.h>
#include <unistd.h>
#include <utility>
const int bufSize = 30;
std::random_device rd;
class Patient {
 public:
  std::string name;
  std::string doctor;
  explicit Patient(std::string name, std::string doc) : name(std::move(name)), doctor(std::move(doc)) {
  }
  Patient() {}
};
class Query {
 public:
  std::string name;
  pthread_mutex_t mutex{};
  pthread_cond_t not_empty;
  pthread_cond_t not_full;
  int front;
  int rear;
  int count;
  Patient buf[bufSize]{};
  explicit Query(std::string name) : name(std::move(name)), front(0), rear(0), count(0) {
  }
};
auto query_doc = new Query("Дежурный врач");
auto query_surgeon = new Query("Хирург Максим");
auto query_dentist = new Query("Дантист Георгий");
auto query_GP = new Query("Педиатр Пересвет");
// инициализатор генератора случайных чисел

//
void *RegistrationToTheDoc(void *param) {
  auto *patientNum = (Patient *) param;
  std::string message;
  while (true) {
    if (rd() % 3 == 0) {
      patientNum->doctor = "surgeon";
    } else if (rd() % 3 == 1) {
      patientNum->doctor = "dentist";
    } else {
      patientNum->doctor = "GP";
    }
    pthread_mutex_lock(&query_doc->mutex);//защита операции записи
    while (query_doc->count == bufSize) {
      pthread_cond_wait(&query_doc->not_full, &query_doc->mutex);
    };
    //запись в общий буфер
    query_doc->buf[query_doc->rear] = *patientNum;
    query_doc->rear = (query_doc->rear + 1) % bufSize;
    ++(query_doc->count);//появилась занятая ячейка
    message = patientNum->name + " was directed to " + patientNum->doctor + "\n";
    std::cout << message;
    //конец критической секции
    pthread_mutex_unlock(&query_doc->mutex);
    pthread_cond_broadcast(&query_doc->not_empty);
    //разбудить потоки-читатели после добавления элемента в буфер
    sleep(4);
  }
}
void RegistrationToTheSpec(Patient *patient) {
  Query *queue;
  if (patient->doctor == "surgeon") {
    queue = query_surgeon;
  } else if (patient->doctor == "dentist") {
    queue = query_dentist;
  } else {
    queue = query_GP;
  }
  pthread_mutex_lock(&queue->mutex);//защита операции записи
  while (queue->count == bufSize) {
    pthread_cond_wait(&queue->not_full, &queue->mutex);
  };
  //запись в общий буфер
  queue->buf[queue->rear] = *patient;
  queue->rear = (queue->rear + 1) % bufSize;
  ++(queue->count);//появилась занятая ячейка
  //конец критической секции
  pthread_mutex_unlock(&queue->mutex);
  //разбудить потоки-читатели после добавления элемента в буфер
  pthread_cond_broadcast(&queue->not_empty);
}
void *DoctorConsumer(void *param) {
  Patient result;
  while (true) {
    //извлечь элемент из буфера
    pthread_mutex_lock(&query_doc->mutex);//защита операции чтения
    //заснуть, если количество занятых ячеек равно нулю
    //sem_wait(&query_doc->full);
    while (query_doc->count == 0) {
      pthread_cond_wait(&query_doc->not_empty, &query_doc->mutex);
    };
    //изъятие из общего буфера – начало критической секции
    result = query_doc->buf[query_doc->front];
    RegistrationToTheSpec(&result);
    query_doc->front = (query_doc->front + 1) % bufSize;//критическая секция
    query_doc->count--;                                 //занятая ячейка стала свободной//конец критической секции
    pthread_mutex_unlock(&query_doc->mutex);
    //разбудить потоки-писатели после получения элемента из буфера
    pthread_cond_broadcast(&query_doc->not_full);
    sleep(4);
  }
}
void *GPConsumer(void *param) {
  Patient result;
  std::string message;
  while (true) {
    //извлечь элемент из буфера
    pthread_mutex_lock(&query_GP->mutex);//защита операции чтения

    //заснуть, если количество занятых ячеек равно нулю
    while (query_GP->count == 0) {
      pthread_cond_wait(&query_GP->not_empty, &query_GP->mutex);
    }
    //изъятие из общего буфера – начало критической секции
    result = query_GP->buf[query_GP->front];
    query_GP->front = (query_GP->front + 1) % bufSize;//критическая секция
    query_GP->count--;                                //занятая ячейка стала свободной
    message = query_GP->name + " hills " + result.name + "'s stomach\n";
    //конец критической секции
    pthread_mutex_unlock(&query_GP->mutex);
    std::cout << message;
    //разбудить потоки-писатели после получения элемента из буфера
    pthread_cond_broadcast(&query_GP->not_full);
    sleep(4);
  }
}
void *SurgeonConsumer(void *param) {
  Patient result;
  std::string message;
  while (true) {
    //извлечь элемент из буфера
    pthread_mutex_lock(&query_surgeon->mutex);//защита операции чтения
    //заснуть, если количество занятых ячеек равно нулю
    while (query_surgeon->count == 0) {
      pthread_cond_wait(&query_surgeon->not_empty, &query_surgeon->mutex);
    }
    //изъятие из общего буфера – начало критической секции
    result = query_surgeon->buf[query_surgeon->front];
    query_surgeon->front = (query_surgeon->front + 1) % bufSize;//критическая секция
    query_surgeon->count--;                                     //занятая ячейка стала свободной
    message = query_surgeon->name + " hills " + result.name + "'s leg\n";
    //конец критической секции
    pthread_mutex_unlock(&query_surgeon->mutex);
    std::cout << message;
    //разбудить потоки-писатели после получения элемента из буфера
    pthread_cond_broadcast(&query_surgeon->not_full);
    sleep(4);
  }
}
void *DentistConsumer(void *param) {
  Patient result;
  std::string message;
  while (true) {
    //извлечь элемент из буфера
    pthread_mutex_lock(&query_dentist->mutex);//защита операции чтения

    //заснуть, если количество занятых ячеек равно нулю
    while (query_dentist->count == 0) {
      pthread_cond_wait(&query_dentist->not_empty, &query_dentist->mutex);
    }
    //изъятие из общего буфера – начало критической секции
    result = query_dentist->buf[query_dentist->front];
    query_dentist->front = (query_dentist->front + 1) % bufSize;//критическая секция
    query_dentist->count--;                                     //занятая ячейка стала свободной
    message = query_surgeon->name + " hills " + result.name + "'s tooth\n";
    //конец критической секции
    pthread_mutex_unlock(&query_dentist->mutex);
    std::cout << message;
    //разбудить потоки-писатели после получения элемента из буфера
    pthread_cond_broadcast(&query_dentist->not_full);
    sleep(4);
  }
}
int main() {
  int n;
  std::cin >> n;
  //инициализация мутексов и семафоров
  pthread_mutex_init(&query_dentist->mutex, nullptr);
  pthread_mutex_init(&query_GP->mutex, nullptr);
  pthread_mutex_init(&query_surgeon->mutex, nullptr);
  pthread_mutex_init(&query_doc->mutex, nullptr);
  pthread_cond_init(&query_dentist->not_empty, nullptr);
  pthread_cond_init(&query_GP->not_empty, nullptr);
  pthread_cond_init(&query_surgeon->not_empty, nullptr);
  pthread_cond_init(&query_doc->not_empty, nullptr);
  pthread_cond_init(&query_dentist->not_full, nullptr);
  pthread_cond_init(&query_GP->not_full, nullptr);
  pthread_cond_init(&query_surgeon->not_full, nullptr);
  pthread_cond_init(&query_doc->not_full, nullptr);
  //запуск производителей
  pthread_t threadP[n];
  Patient patients[n];
  for (int i = 0; i < n; ++i) {
    patients[i] = Patient(std::to_string(i), "");
    pthread_create(&threadP[i], nullptr, RegistrationToTheDoc, (void *) (patients + i));
  }
  pthread_t threadC[4];
  pthread_create(&threadC[0], nullptr, DoctorConsumer, nullptr);
  pthread_create(&threadC[1], nullptr, DoctorConsumer, nullptr);
  pthread_create(&threadC[2], nullptr, DentistConsumer, nullptr);
  pthread_create(&threadC[3], nullptr, SurgeonConsumer, nullptr);
  GPConsumer(nullptr);
  return 0;
}
