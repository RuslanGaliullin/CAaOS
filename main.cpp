#include "patient.h"
#include "query.h"
#include <algorithm>
#include <cstring>
#include <fstream>
#include <iostream>
#include <pthread.h>
#include <random>
#include <unistd.h>
#include <utility>

// Поток для вывода в файл и флаг его работоспособности
std::fstream file_output;
bool is_file_output = false;

// Инициализатор генератора случайных чисел
std::random_device rd;

// Инициализация очередей для всех врачей
auto query_doc = new Query("Дежурный врач");
auto query_surgeon = new Query("Хирург Максим");
auto query_dentist = new Query("Дантист Георгий");
auto query_GP = new Query("Педиатр Пересвет");
// Объявления мьютекса для синхронизации вывода в файл (flush)
pthread_mutex_t output_mutex;

/// Функция для периодической записи больного из param на прием к ДЕЖУРНЫМ врачам
/// \param param Это указатель на пациента, который будет записываться
/// \return
void *RegistrationToTheDoc(void *param) {
  auto *patientNum = (Patient *) param;
  std::string message;
  while (true) {
    // Рандомно выбирается, какой специалист нужен пациенту
    if (rd() % 3 == 0) {
      patientNum->doctor = "surgeon";
    } else if (rd() % 3 == 1) {
      patientNum->doctor = "dentist";
    } else {
      patientNum->doctor = "GP";
    }
    // Защита операции записи в очередь - буфер к дежурным врачам
    pthread_mutex_lock(&query_doc->mutex);
    // Ожидание места для записи в буфере
    while (query_doc->count == bufSize) {
      pthread_cond_wait(&query_doc->not_full, &query_doc->mutex);
    };
    // Записи в буфер
    query_doc->buf[query_doc->rear] = *patientNum;
    query_doc->rear = (query_doc->rear + 1) % bufSize;
    ++query_doc->count;
    // Формирование сообщения о записи пациента
    message = patientNum->name + " was directed to " + patientNum->doctor + "\n";
    // Конец критической секции
    pthread_mutex_unlock(&query_doc->mutex);
    std::cout << message;
    if (is_file_output) {
      // Синхронизация ввода сообщения в файл
      pthread_mutex_lock(&output_mutex);
      file_output << message;
      file_output.flush();
      pthread_mutex_unlock(&output_mutex);
    }
    // Разбудить потоки-читатели после добавления элемента в буфер
    pthread_cond_broadcast(&query_doc->not_empty);
    sleep(4);
  }
}

/// Метод для записи пациента к СПЕЦИАЛИСТУ ДЕЖУРНЫМ ВРАЧОМ
/// \param patient Указатель на объект пациента, которого надо записать
void RegistrationToTheSpec(Patient *patient) {
  // Определение буфера, в который надо записать пациента
  Query *queue;
  if (patient->doctor == "surgeon") {
    queue = query_surgeon;
  } else if (patient->doctor == "dentist") {
    queue = query_dentist;
  } else {
    queue = query_GP;
  }
  // Защита операции записи
  pthread_mutex_lock(&queue->mutex);
  while (queue->count == bufSize) {
    pthread_cond_wait(&queue->not_full, &queue->mutex);
  };
  // Запись в общий буфер врача
  queue->buf[queue->rear] = *patient;
  queue->rear = (queue->rear + 1) % bufSize;
  ++queue->count;
  // Конец критической секции
  pthread_mutex_unlock(&queue->mutex);
  // Разбудить потоки-читатели после добавления элемента в буфер(очередь) конкретного врача
  pthread_cond_broadcast(&queue->not_empty);
}

/// Метод для чтения записей к ДЕЖУРНЫМ ВРАЧАМ
/// \param param ничего не передается
/// \return
void *DoctorConsumer(void *param) {
  // Поле для пациента, который на приеме будет
  Patient result;
  while (true) {
    // Изъятие из общего буфера – начало критической секции
    pthread_mutex_lock(&query_doc->mutex);
    // Заснуть, если количество занятых ячеек равно нулю
    while (query_doc->count == 0) {
      pthread_cond_wait(&query_doc->not_empty, &query_doc->mutex);
    };
    result = query_doc->buf[query_doc->front];
    // Вызываем метод для записи пациента к специалисту
    RegistrationToTheSpec(&result);
    query_doc->front = (query_doc->front + 1) % bufSize;
    --query_doc->count;
    // Конец критической секции
    pthread_mutex_unlock(&query_doc->mutex);
    // Разбудить потоки-писатели после получения элемента из буфера
    pthread_cond_broadcast(&query_doc->not_full);
    sleep(4);
  }
}

/// Метод для чтения записей к ПЕДИАТОРУ
/// \param param ничего не передается
/// \return
void *GPConsumer(void *param) {
  // Поле для пациента, который на приеме будет
  Patient result;
  std::string message;
  while (true) {
    // Изъятие из общего буфера – начало критической секции
    pthread_mutex_lock(&query_GP->mutex);// Защита операции чтения
    // Заснуть, если количество занятых ячеек равно нулю
    while (query_GP->count == 0) {
      pthread_cond_wait(&query_GP->not_empty, &query_GP->mutex);
    }
    result = query_GP->buf[query_GP->front];
    query_GP->front = (query_GP->front + 1) % bufSize;
    --query_GP->count;// Занятая ячейка стала свободной
    message = query_GP->name + " hills " + result.name + "'s stomach\n";
    // Конец критической секции
    pthread_mutex_unlock(&query_GP->mutex);
    std::cout << message;
    if (is_file_output) {
      // Синхронизация ввода сообщения в файл
      pthread_mutex_lock(&output_mutex);
      file_output << message;
      file_output.flush();
      pthread_mutex_unlock(&output_mutex);
    }
    // Разбудить потоки-читатели после добавления элемента в буфер
    pthread_cond_broadcast(&query_GP->not_full);
    sleep(4);
  }
}

/// Метод для чтения записей к ХИРУРГУ
/// \param param ничего не передается
/// \return
void *SurgeonConsumer(void *param) {
  // Поле для пациента, который на приеме будет
  Patient result;
  std::string message;
  while (true) {
    // Изъятие из общего буфера – начало критической секции
    pthread_mutex_lock(&query_surgeon->mutex);// Защита операции чтения
    // Заснуть, если количество занятых ячеек равно нулю
    while (query_surgeon->count == 0) {
      pthread_cond_wait(&query_surgeon->not_empty, &query_surgeon->mutex);
    }
    result = query_surgeon->buf[query_surgeon->front];
    query_surgeon->front = (query_surgeon->front + 1) % bufSize;
    --query_surgeon->count;// Занятая ячейка стала свободной
    message = query_surgeon->name + " hills " + result.name + "'s leg\n";
    // Конец критической секции
    pthread_mutex_unlock(&query_surgeon->mutex);
    std::cout << message;
    if (is_file_output) {
      // Синхронизация ввода сообщения в файл
      pthread_mutex_lock(&output_mutex);
      file_output << message;
      file_output.flush();
      pthread_mutex_unlock(&output_mutex);
    }
    // Разбудить потоки-читатели после добавления элемента в буфер
    pthread_cond_broadcast(&query_surgeon->not_full);
    sleep(4);
  }
}

/// Метод для чтения записей к СТОМАТОЛОГУ
/// \param param ничего не передается
/// \return
void *DentistConsumer(void *param) {
  // Поле для пациента, который на приеме будет
  Patient result;
  std::string message;
  while (true) {
    // Изъятие из общего буфера – начало критической секции
    pthread_mutex_lock(&query_dentist->mutex);// Защита операции чтения
    // Заснуть, если количество занятых ячеек равно нулю
    while (query_dentist->count == 0) {
      pthread_cond_wait(&query_dentist->not_empty, &query_dentist->mutex);
    }
    result = query_dentist->buf[query_dentist->front];
    query_dentist->front = (query_dentist->front + 1) % bufSize;
    query_dentist->count--;// Занятая ячейка стала свободной
    message = query_surgeon->name + " hills " + result.name + "'s tooth\n";
    // Конец критической секции
    pthread_mutex_unlock(&query_dentist->mutex);
    std::cout << message;
    if (is_file_output) {
      // Синхронизация ввода сообщения в файл
      pthread_mutex_lock(&output_mutex);
      file_output << message;
      file_output.flush();
      pthread_mutex_unlock(&output_mutex);
    }
    // Разбудить потоки-читатели после добавления элемента в буфер
    pthread_cond_broadcast(&query_dentist->not_full);
    sleep(4);
  }
}

// Метод для вывода сообщения при ошибках входных данных
void error_message_1() {
  std::cout << "\nInput parameter is passed through argv:"
               "\n*.out -n number [-fo fileout] fileout - name of the output file"
               "\n\nInput parameter is passed from console:"
               "\n*.out -c [-fo fileout] fileout - name of the output file"
               "\n\nInput parameter is passed from file"
               "\n*.out -f fin [-fo fileout] fin - name of the input file, fileout - name of the output file\n"
               "\n\nInput parameter is created by random generator"
               "\n*.out -r [-fo fileout] fileout - name of the output file\n";
};

int main(int argc, char *argv[]) {
  int n = -1;
  // Проверка корректности входных данных
  if (argc < 2 || argc > 5) {
    error_message_1();
    return 1;
  }
  // Проверка корректности входных данных
  try {
    if (!strcmp(argv[1], "-c") && (argc == 2 || !strcmp(argv[argc - 2], "-fo"))) {
      std::string temp;
      std::cin >> temp;
      n = std::stoi(temp);
    } else if (!strcmp(argv[1], "-f") && (argc == 3 || !strcmp(argv[argc - 2], "-fo"))) {
      auto fin = std::fstream(argv[2]);
      if (fin.is_open()) {
        fin >> n;
      } else {
        std::cout << "Impossible to read from the input file\n";
        return 1;
      }
    } else if (!strcmp(argv[1], "-n") && (argc == 3 || !strcmp(argv[argc - 2], "-fo"))) {
      n = std::stoi(argv[2]);
    } else if (!strcmp(argv[1], "-r")) {
      n = rd() % 20;
    } else {
      error_message_1();
      return 1;
    }
  } catch (...) {
    error_message_1();
    return 1;
  }
  // Проверка корректности входных данных и работоспособности вывода в файл
  if (argc > 3 && !strcmp(argv[argc - 2], "-fo")) {
    file_output.open(argv[argc - 1], std::ios::out);
    if (file_output.is_open()) {
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
  // Инициализация всех мьютексов и условных переменных в объектах очереди
  pthread_mutex_init(&output_mutex, nullptr);
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
  // Запуск производителей, которые записываются в дежурному врачу
  pthread_t threadP[n];
  Patient patients[n];
  for (int i = 0; i < n; ++i) {
    patients[i] = Patient(std::to_string(i), "");
    pthread_create(&threadP[i], nullptr, RegistrationToTheDoc, (void *) (patients + i));
  }
  // Запуск потребителей: 2 дежурных, стоматолог, хирург и педиатр. Главный поток работает как потребитель-педиатр
  pthread_t threadC[4];
  pthread_create(&threadC[0], nullptr, DoctorConsumer, nullptr);
  pthread_create(&threadC[1], nullptr, DoctorConsumer, nullptr);
  pthread_create(&threadC[2], nullptr, DentistConsumer, nullptr);
  pthread_create(&threadC[3], nullptr, SurgeonConsumer, nullptr);
  GPConsumer(nullptr);
  if (is_file_output) {
    file_output.close();
  }
  return 0;
}

