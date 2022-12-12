#include "patient.h"
#include "query.h"
#include <algorithm>
#include <fstream>
#include <iostream>
#include <pthread.h>
#include <random>
#include <unistd.h>
#include <utility>
// Глобальные ссылки на потоки для вывода в файл и в консоль
std::ostream &console_output = std::cout;
std::fstream file_output;
bool is_file_output = false;

// инициализатор генератора случайных чисел
std::random_device rd;

// Инициализация очередей для всех врачей
auto query_doc = new Query("Дежурный врач");
auto query_surgeon = new Query("Хирург Максим");
auto query_dentist = new Query("Дантист Георгий");
auto query_GP = new Query("Педиатр Пересвет");

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

    //конец критической секции
    pthread_mutex_unlock(&query_doc->mutex);
    std::cout << message;
    if (is_file_output) {
      file_output << message;
    }
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
    if (is_file_output) {
      file_output << message;
    }
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
    if (is_file_output) {
      file_output << message;
    }
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
    if (is_file_output) {
      file_output << message;
    }
    //разбудить потоки-писатели после получения элемента из буфера
    pthread_cond_broadcast(&query_dentist->not_full);
    sleep(4);
  }
}
void error_message_1() {
  std::cout << "Input parameter is passed through argv:"
               "\n *.out -n number [-fo fileout] fileout - name of the output file"
               "\n Input parameter is passed from console:"
               "\n *.out -c [-fo fileout] fileout - name of the output file"
               "\n Input parameter is passed from file:\n"
               "\n *.out -f fin [-fo fileout] fin - name of the input file, fileout - name of the output file\n";
};
int main(int argc, char *argv[]) {
  int n = -1;
  if (argc < 2 || argc > 5) {
    error_message_1();
    return 1;
  }
  try {
    if (!strcmp(argv[1], "-c")) {
      std::string temp;
      std::cin >> temp;
      n = std::stoi(temp);
    } else if (!strcmp(argv[1], "-f")) {
      auto fin = std::fstream(argv[2]);
      if (fin.is_open()) {
        fin >> n;
      } else {
        std::cout << "Impossible to read from the input file\n";
        return 1;
      }
    } else if (!strcmp(argv[1], "-n")) {
      n = std::stoi(argv[2]);
    } else {
      error_message_1();
      return 1;
    }
  } catch (...) {
    error_message_1();
    return 1;
  }
  if (argc > 3 && !strcmp(argv[argc - 2], "-fo")) {
    auto fout = std::fstream(argv[argc - 1]);
    if (fout.is_open()) {
      file_output = std::move(fout);
      is_file_output = true;
    } else {
      std::cout << "Impossible to write to the output file\n";
    }
  } else if (argc > 3) {
    error_message_1();
    return 1;
  }
  if (n < 0) {
    std::cout << "Number should be integer equal or greater then 0\n";
    return 1;
  }
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
  if (is_file_output) {
    file_output.close();
  }
  pthread_t threadC[4];
  pthread_create(&threadC[0], nullptr, DoctorConsumer, nullptr);
  pthread_create(&threadC[1], nullptr, DoctorConsumer, nullptr);
  pthread_create(&threadC[2], nullptr, DentistConsumer, nullptr);
  pthread_create(&threadC[3], nullptr, SurgeonConsumer, nullptr);
  GPConsumer(nullptr);
  return 0;
}
