# 11. Задача о больнице. В больнице два дежурных врача принимают пациентов, выслушивают их жалобы и отправляют или к стоматологу, или к хирургу, или к терапевту. Стоматолог, хирург и терапевт лечат пациентов. Каждый врач может принять только одного пациента за раз. Пациенты стоят в очереди к врачам и никогда их не покидают. Создать многопоточное приложeние, моделирующее рабочий день клиники.
# Галиуллин Руслан БПИ217
## На оценку 4
### Шаг № 1. Модель многопоточного приложения
  ![](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_04/data/multithreading_model_01.png)
### Шаг № 2. Входные данные
- Входные данные - это одно неотрицательное целое число, обозначающее количество людей, \"прикрепленных\" к больнице
### Шаг № 3. Реализовать программу
- Программа состоит из главного файла [main.c](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_04/main.cpp) и хэдеров с классами [query.h](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_04/query.h), [patient.h](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_04/patient.h). Используется единственный синхропримитив _**conditional variables**_
### Шаг № 4. Ввод данных с консоли
- Ввод с помощью консоли осуществляется следующим способом вызова программа (fileout - name of the output file):
<div align="center">*.out -c [-fo fileout]</div>

## На оценку 5
### Шаг № 1. Комментарии
- Комментарии к коду были написаны с самого начала в [main.c](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_04/main.cpp), [query.h](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_04/query.h), [patient.h](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_04/patient.h)
### Шаг № 2. Описание алгоритма работы в терминах сущностей из условий
- В больнице есть 2 дежурных врача, у них есть жеский диск, в который могут поместиться только записи 30 пациентов одновременно. Есть также в больнице стоматолог, хирург и педиатр, у каждого из них есть жеский диск, в который могут поместиться только записи 30 пациентов одновременно. Пациенты нуждаются в помощи специалистов: стоматолога, хирурга или педиатра, но пациентов к этим врачам записывают только дежурные (видимо мы в детской поликлинике). Поэтому алгоритм выглядит так: пациент заболевает и ему надо к опред. специалисту -> записывается к дежурному врачу (ждет пока не появится место) -> дежурный врач записывает пациент в очередь к специалисту (ждет пока не появится место) -> спец вылечивает пациента

## На оценку 6
### Шаг № 1. Описание алгоритма работы в терминах сущностей из в программе
- Есть 4 объекта класса Query, в которых содержат очереди для каждого типо врачей: стоматолога, хирурга, педиатора и дежурного. Очередь реализуется на кольцевом буфере. 
Создаются потоки-писатели - это пациенты, которые с помощью RegistrationToTheDoc записываются в кольцевой буфер query_doc (очередь дежурных врачей) к конкретному специалисту.
Потом поток-читатель (дежурный врач) threadC[0] с помощью DoctorConsumer просматривает кольцевой буфер query_doc и принимает пациента Patient из него и направляет его (через RegistrationToTheSpec) в одну из очередей: query_surgeon, query_dentist, query_GP к хирургу, дантисту и педиатору соответственно. Поток-читатель threadC[1] действует аналогично предыдущемоу, над тем же кольцевым буфером в очереди query_doc. Поток-читатель threadC[2], в роли стоматолог, с помощью DentistConsumer просматривает очередь query_dentist и вытаскивает от туда пациента (Patient) и "лечит" его зумы. Поток-читатель threadC[3], в роли хирурга, с помощью SurgeonConsumer просматривает очередь query_surgeon и вытаскивает от туда пациента (Patient) и "лечит" его ноги. Главный поток тоже работает как читатель, в роли педиатора, с помощью GPConsumer просматривает очередь query_GP и вытаскивает от туда пациента (Patient) и "лечит" его желудок. 
### Шаг № 2. Реализован ввод данных из командной строки
- Команда для ввода данных из командной строки (fileout - name of the output file):
<div align="center">*.out -n number [-fo fileout]</div>

## На оценку 7
### Шаг № 1. Ввод/вывод в файл
- Необязательный параметры [-fo fileout] предназначен для задания файла для вывода
- Возможные запуски программы:

|Из командной строки|Из консоли|Из файла|Генератором случайных чисел|
|:--:|:--:|:--:|:--:|
|*.out -n number [-fo fileout]|*.out -c [-fo fileout]|*.out -f fin [-fo fileout]|*.out -r [-fo fileout]|

- Отмечу, что вывод в консоль присутствует _**всегда**_, а в файл по запросу
### Шаг № 2. Прогон тестов
- Тесты запущенны следующими командами:

  * ./main.out -f ./test/test01.in -fo ./test/test01.out
  * ./main.out -f ./test/test02.in -fo ./test/test02.out
  * ./main.out -f ./test/test03.in -fo ./test/test03.out
- Результаты прогонов и входные параметры находятся в [tests](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_04/test). Уточню, что каждый запуск останавливался CTRL+C, потому что по условию у работы больницы не конца
## На оценку 8
### Шаг № 1. Генератор случайных чисел
- Генратор сработает при заупске программы следующей командой:
<div align="center">*.out -r [-fo fileout]</div>

- Реализация в коде:
```
#include <random>
...
std::random_device rd;
...
else if (!strcmp(argv[1], "-r")) {
    n = rd() % 20;
}
```
### Шаг № 2. Прогон тестов
- Тест запущенн следующей командой:
  * ./main.out -r -fo ./test/test_random.out
- Результаты прогона в [test_random.out](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_04/test/test_random.out). Уточню, что запуск останавливался CTRL+C, потому что по условию у работы больницы не конца
