#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <pthread.h>
#include <random>
#include <semaphore.h>
#include <unistd.h>
#include <utility>
const int bufSize = 10;
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
  std::string name2;
  pthread_mutex_t mutex{};
  sem_t empty;
  sem_t full;//семафор, отображающий насколько полон буфер
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
pthread_mutex_t output_mutex;
// инициализатор генератора случайных чисел

//
void *RegistrationToTheDoc(void *param) {
  auto *patientNum = (Patient *) param;
  while (true) {
    if (rd() % 3 == 0) {
      patientNum->doctor = "surgeon";
    } else if (rd() % 3 == 1) {
      patientNum->doctor = "dentist";
    } else {
      patientNum->doctor = "GP";
    }
    pthread_mutex_lock(&query_doc->mutex);//защита операции записи
    sem_wait(&query_doc->empty);
    //запись в общий буфер
    query_doc->buf[query_doc->rear] = *patientNum;
    query_doc->rear = (query_doc->rear + 1) % bufSize;
    ++(query_doc->count);//появилась занятая ячейка
    pthread_mutex_lock(&output_mutex);
    std::cout << patientNum->name << " was directed to " << patientNum->doctor << std::endl;
    pthread_mutex_unlock(&output_mutex);
    sem_post(&query_doc->full);
    //конец критической секции
    pthread_mutex_unlock(&query_doc->mutex);
    //разбудить потоки-читатели после добавления элемента в буфер
    std::cout << "Ended righting\n";
    sleep(10);
  }
}
//int RegistrationToTheSpec(Patient *patient) {
//  Query *queue;
//  if (patient->doctor == "surgeon") {
//    queue = query_surgeon;
//  } else if (patient->doctor == "dentist") {
//    queue = query_dentist;
//  } else {
//    queue = query_GP;
//  }
//  pthread_mutex_lock(&queue->mutex);//защита операции записи
//  while (queue->count == bufSize) {
//    pthread_cond_wait(&queue->not_full, &queue->mutex);
//    sleep(5);
//  };
//  //запись в общий буфер
//  queue->buf[queue->rear] = *patient;
//  queue->rear = (queue->rear + 1) % bufSize;
//  ++(queue->count);//появилась занятая ячейка
//  //конец критической секции
//  pthread_mutex_unlock(&queue->mutex);
//  //разбудить потоки-читатели после добавления элемента в буфер
//  pthread_cond_broadcast(&queue->not_empty);
//  return 0;
//}
void *DoctorConsumer(void *param) {
  Patient result;
  while (true) {
    //извлечь элемент из буфера
    pthread_mutex_lock(&query_doc->mutex);//защита операции чтения
    //заснуть, если количество занятых ячеек равно нулю
    std::cout << "Not empty!!\n";
    sem_wait(&query_doc->full);
    //изъятие из общего буфера – начало критической секции
    result = query_doc->buf[query_doc->front];
    query_doc->front = (query_doc->front + 1) % bufSize;//критическая секция
    query_doc->count--;                                 //занятая ячейка стала свободной//конец критической секции
    sem_post(&query_doc->empty);
    pthread_mutex_unlock(&query_doc->mutex);
    //разбудить потоки-писатели после получения элемента из буфера
    //pthread_cond_broadcast(&query_doc->not_full);
    sleep(10);
  }
  return nullptr;
}
//void *GPConsumer(void *param) {
//  Patient result;
//  while (true) {
//    //извлечь элемент из буфера
//    pthread_mutex_lock(&query_GP->mutex);//защита операции чтения
//
//    //заснуть, если количество занятых ячеек равно нулю
//    while (query_GP->count == 0) {
//      pthread_cond_wait(&query_GP->not_empty, &query_GP->mutex);
//    }
//    //изъятие из общего буфера – начало критической секции
//    result = query_GP->buf[query_GP->front];
//    query_GP->front = (query_GP->front + 1) % bufSize;//критическая секция
//    query_GP->count--;                                //занятая ячейка стала свободной
//    pthread_mutex_lock(&output_mutex);
//    std::cout << query_GP->name << " hill " << result.name << "'s stomach" << std::endl;
//    pthread_mutex_unlock(&output_mutex);
//    //конец критической секции
//    pthread_mutex_unlock(&query_GP->mutex);
//    //разбудить потоки-писатели после получения элемента из буфера
//    pthread_cond_broadcast(&query_GP->not_full);
//    sleep(10);
//  }
//}
//void *SurgeonConsumer(void *param) {
//  Patient result;
//  while (true) {
//    //извлечь элемент из буфера
//    pthread_mutex_lock(&query_surgeon->mutex);//защита операции чтения
//    //заснуть, если количество занятых ячеек равно нулю
//    while (query_surgeon->count == 0) {
//      pthread_cond_wait(&query_surgeon->not_empty, &query_surgeon->mutex);
//    }
//    //изъятие из общего буфера – начало критической секции
//    result = query_surgeon->buf[query_surgeon->front];
//    query_surgeon->front = (query_surgeon->front + 1) % bufSize;//критическая секция
//    query_surgeon->count--;                                     //занятая ячейка стала свободной
//    pthread_mutex_lock(&output_mutex);
//    std::cout << query_surgeon->name << " hill " << result.name << "'s leg" << std::endl;
//    pthread_mutex_unlock(&output_mutex);
//    //конец критической секции
//    pthread_mutex_unlock(&query_surgeon->mutex);
//    //разбудить потоки-писатели после получения элемента из буфера
//    pthread_cond_broadcast(&query_surgeon->not_full);
//    sleep(10);
//  }
//}
//void *DentistConsumer(void *param) {
//  Patient result;
//  while (true) {
//    //извлечь элемент из буфера
//    pthread_mutex_lock(&query_dentist->mutex);//защита операции чтения
//
//    //заснуть, если количество занятых ячеек равно нулю
//    while (query_dentist->count == 0) {
//      pthread_cond_wait(&query_dentist->not_empty, &query_dentist->mutex);
//    }
//
//    //изъятие из общего буфера – начало критической секции
//    result = query_dentist->buf[query_dentist->front];
//    query_dentist->front = (query_dentist->front + 1) % bufSize;//критическая секция
//    query_dentist->count--;                                     //занятая ячейка стала свободной
//    pthread_mutex_lock(&output_mutex);
//    std::cout << query_dentist->name << " hill " << result.name << "'s tooth" << std::endl;
//    pthread_mutex_unlock(&output_mutex);
//    //конец критической секции
//    pthread_mutex_unlock(&query_dentist->mutex);
//    //разбудить потоки-писатели после получения элемента из буфера
//    pthread_cond_broadcast(&query_dentist->not_full);
//    sleep(10);
//  }
//}
int main() {
  int n;
  std::cin >> n;

  //инициализация мутексов и семафоров
  pthread_mutex_init(&output_mutex, nullptr);
  pthread_mutex_init(&query_dentist->mutex, nullptr);
  pthread_mutex_init(&query_GP->mutex, nullptr);
  pthread_mutex_init(&query_surgeon->mutex, nullptr);
  pthread_mutex_init(&query_doc->mutex, nullptr);
  //запуск производителей
  pthread_t threadP[n];
  Patient patients[n];
  for (int i = 0; i < n; i++) {
    patients[i] = Patient(std::to_string(i), "");
    pthread_create(&threadP[i], nullptr, RegistrationToTheDoc, (void *) (patients + i));
  }
  pthread_t threadC[5];
  pthread_create(&threadC[0], nullptr, DoctorConsumer, nullptr);
  pthread_create(&threadC[1], nullptr, DoctorConsumer, nullptr);

  //  pthread_create(&threadC[2], nullptr, DentistConsumer, nullptr);
  //  pthread_create(&threadC[3], nullptr, SurgeonConsumer, nullptr);
  //  pthread_create(&threadC[4], nullptr, GPConsumer, nullptr);
  pthread_join(threadC[0], nullptr);
  pthread_join(threadC[1], nullptr);
  pthread_join(threadC[2], nullptr);
  pthread_join(threadC[3], nullptr);
  pthread_join(threadC[4], nullptr);
  pthread_join(threadP[0], nullptr);
  pthread_join(threadP[1], nullptr);
  pthread_join(threadP[2], nullptr);
  return 0;
}

