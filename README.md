## На оценку 4
### Шаг № 1. Программа на С
  - Написать программу на С из нескольких единиц компиляции:
  
  2 единицы компиляции: [main.c](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/main.c) [addition.c](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/addition.c)
- В main находится основная программа. В addition вспомогательные функции для построения массива с индаксами подстроки, считывание ввода разными способами и вывод результата.
### Шаг № 2. В ассемблер
- Откомпилировать без оптимизирующих и отладочных опций программу на С

|Использовались соответствующие параметры компиляции| 
:--------------------:
|gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -O0 main.c addition.c|

- Полученные файлы при добавлении парамтера -S: 
  - [main.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_gcc/main.s)
  - [addition.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_gcc/addition.s)
### Шаг № 3. Комментарии
- Написать комментарии к программе и убрать макросы, полученные файлы: 
  - [main_w_comments.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_human/Mark-4/main_w_comments.s)
  - [addition_w_comments.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_human/Mark-4/addition_w_comments.s)
- Макросов (macro) не было обнаружено
### Шаг № 4. Тесты
- Откомпилирована и скомпонована программа после моей редакции в [Assembly_by_human/Mark-4/main_w_comments.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_human/Mark-4/main_w_comments.out)
- Полученный описанным выше способом исполняемый файл сравнивается с [main.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/main.out) (компиляция из начального С файла) поочередным запуском на тестах:


  ![](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/data/tests_for_mark_4.png)
- Тесты находятся в [test](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_02/test)
- Ожидаемые выводы (массива В) для каждого теста:


|   Файл теста  | Массив индексов    |
| :-------------: | :------------- |
| test01.in  | 2 11 30 38 52 58 63   |
| test02.in  | |
| test03.in  | 0 2 4 6 8 10 12 |
| test04.in  | |
- Как можно заметить по скриншоту и ожидаемому выводу, обе программы дают одинаковый, а главное правильный результат
## На оценку 5
### Шаг № 1. Функции
  - Используемые функции с передачей параметров: BuildIndexArray, Output, ReadFromFile, ReadFromConsole, check_sub, GenerateRandomString, main, strncmp, fprintf, fputc, fgetc, puts, printf, strlen, strcmp, fopen, fclose, strtol, strcpy, time, srand 
  - Локальные переменные: int text_size, sub_size, index_size, int i, FILE *ifst, clock_t start, clock_t end, double calcTime, FILE * ofst1, int argc, char* argv\[\] (не писал переменные, создаваемые при передачи параметров по значению)
  - Файлы с комментарием вызовов функций:
    - [main_w_func_comm.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_human/Mark-5/main_w_func_comm.s)
    - [addition_w_func_comm.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_human/Mark-5/addition_w_func_comm.s)
### Шаг №2. Изменения
  - Для каждого вызова call написан комментарий рядом с вызовом функции о способе передаче параметров в функцию и сохранении возвращаемого значения
  - Рядом с объявлением каждой функции, которая написана мной, находится комментарий о фактических параметрах функции и в конце о возвращаемом значении
## На оценку 6
### Шаг № 1. Замена на регистры
  - Максимальное использование регистров было достигнуто использованием их для локальных переменных во вспомогательных функциях: BuildIndexArray, Output, ReadFromFile, ReadFromConsole, check_sub, GenerateRandomString. В них использовались регистры от r14d и r15d . check_sub, GenerateRandomString в файле [main_w_reg.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_human/Mark-6-7/main_w_reg.s), остальные во вспомогательном файле [addition_w_reg.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_human/Mark-6-7/addition_w_reg.s). Подробно какой регистр отвечает за какую переменную написано в комментариях к коду. В основным замена была проделана за счет использования регистров для i в циклах (регистры r14d, r15d, r12d, 13d)
### Шаг № 2. Тестирование. Проверка
  - Запускаеся файл [Assembler_modified_by_me/MARK-6-7/main_w_reg.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_human/Mark-6-7/main_w_reg.out) на тестах [test](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_02/test):
  ![](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/data/test_for_mark_6.png)
  - Ожидаемый результат:
  
  |   Файл теста  | Массив B    |
  | :-------------: | :------------- |
  | test01.in  | 2 11 30 38 52 58 63 |
  | test02.in  | 0 1 2 |
  | test03.in  | 0 2 4 6 8 10 12 |

  - Как можно заметить по скриншоту и ожидаемому выводу, программа работает корректно на тестах
  - Сравнение размеров запускаемых файлов:
  ![](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/data/compare_size_of_exe.png)
  Как мы видим размер исполняемого файла существенно не изменился от размера файла, скомпилированного gcc
## На оценку 7
### Шаг № 1. Реализовать программу в виду 2 единиц компиляции
  - Это задание было выполнено в самом начале и везде приводился код из 2 файлов
### Шаг № 2. Ввод через файл
  - Проверка на число аргументов:
    ```
    if (argc < 5 || argc > 6) {
        errMessage1();
        return 1;
    }
    ```
  - Проверка на открытие файлов:
    ```
    FILE *ifst = fopen(argv[4], "r");
    if (ifst == NULL) {
      printf("Cannot open input file.\n");
      return 3;
    }
    FILE *ofst1 = fopen(argv[5], "w");
    if (ofst1 == NULL) {
      printf("Cannot open %s to write\n", argv[5]);
      return 1;
    }
    ```
  - Это задание было выполнено в самом начале и тесты проганялись с помощью ввода через файл. Чтение из файла реализовано в функции ReadFromFile в [addition.c](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/addition.c). Также приведу возможный ввод:
    
    Waited:
    
         command -f size "word" infile outfile    # infile - файл с исходными данными, outfile - выходные данные 
         
     Or:
     
         command -n size "word" -c/-r outfile       # с параметром -c ввод через консоль, -r - рандомом
   - Итог:
     
     Изначально декомпозировав код на функции BuildIndexArray, Output, ReadFromFile, ReadFromConsole, возникла необходимость выделить их в отдельную единицу компиляции; все представленные выше тесты были проведены для прграммы с 2 единицами компиляции, поэтому не считаю необходимым проводить тестирование; специального формата от входного файла не требуется, нужно, чтобы его можно было прочесть + есть вывод результата в консоль, чтобы сразу увидеть результат/время работы.
## На оценку 8
### Шаг № 1. Подключить генератор рандомных чисел
  - В файле [main.c](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/main.c), также можно посмотреть в [main.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-8/Main_with_cycle_opt.s)
    ```        
    void GenerateRandomString(int text_size) {
      for (int i = 0; i < text_size; i++) {
        Text[i] = rand() % 128;
      }
    }
    ```
  - Для генерации случайного набора используется команда 

        command -n size "word" -r outfile
        
  - Обрабатываются введенные параметры с помощью argc, argv
  - Итоговые способы ввода-вывода:
      
      a. консоль -> файл и консоль
      
      b. файл -> файл и консоль
      
      c. случайный ввод -> файл и консоль
### Шаг № 2. Сравнение скорости
  - Сравним скорость программы, которая было создана без оптимизации с параметрами из [пункта](https://github.com/RuslanGaliullin/CAaOS/edit/IHW_02/README.md#шаг--2-в-ассемблер) в начале с программой, после ручного добавления регистров в [пункте](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/README.md#шаг--1-замена-на-регистры). Замечу, что построение искомого массива в программе выполняется 100 раз в цикле
    
    Цикл:
         
    ```
         .L25:
	           mov	edx, DWORD PTR -4[rbp]
	           mov	eax, DWORD PTR -8[rbp]
	           mov	r8d, edx
	           lea	rdx, Text[rip]
	           mov	rcx, rdx
	           mov	edx, eax
		         lea	rax, Sub[rip]
		         mov	rsi, rax
		         lea	rax, Index[rip]
		         mov	rdi, rax
		         call	BuildIndexArray@PLT
		         mov	DWORD PTR -12[rbp], eax
	           add	DWORD PTR -16[rbp], 1
         .L24:
		         cmp	DWORD PTR -16[rbp], 99
		         jle	.L25
     ```
  - Получается сравниваются 2 программы по скорости: [main_w_reg.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_human/Mark-6-7/main_w_reg.out) и [main.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_gcc/main.out). Остальные написанные программы сравнивать бессмысленно так как комментарии, которые я добавлял никак не влияют на скорость выполнения программы и их результат идентичен [main.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_gcc/main.out)
  - Результаты запуска на время с параметрами **-n 1 "a" -r ../../test/test_random.out**: 
 
 |      | main_w_reg.out (оптимизация регистрами) | main.out (без какой либо оптимизации) |
 |:-----:|:---------------------------------------:|:---------------------------------------------:|
 |Команда|main_w_reg.out -n 1 "a" -r ../../test/test_random.out|main.out -n 1 "a" -r ../../test/test_random.out |
 |Время|Calculation time = 2.84221|Calculation time = 3.21016|
 |Пруфы|![](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/data/register_opt_random_test.png)|![](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/data/no_opt_random_test.png)|
 
 - Вывод: у нас удалось улучшить скорость работы алогоритма за счет использования регистров вместо памяти на стеке
 ## На оценку 9
 ### Шаг № 1. Сравнение времени работы
 [Скрины с запусками](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_02/data/speed_opt)
 
 [Скрин с размерами файлов](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/data/speed_opt/compare_size_of_speed_exe.png)
 | Параметры | Время работы | Размер исполняемого файла | Количество строк (main.s + addition.s) |
 |:--:|:---:|:---:|:---:|
 |-fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -O0|Calculation time = Calculation time = 3.21016| 20Кб |449 + 179|
 |-O1|Calculation time = 2.43094|20Кб|445 + 235|
 |-O2|Calculation time = 2.56971|20Кб|425 + 305|
 |-O3|Calculation time = 2.94647|20Кб|437 + 305|
 |-Ofast|Calculation time = 2.54926|20Кб|437 + 305|
 |-O0|Calculation time = 3.22262|20Кб|496 + 210|
 |-Os|Calculation time = 2.91244|20Кб|403 + 222|
 |register|Calculation time = 2.84221|20Кб| 440 + 174|
 
### Шаг № 2. Сравнение размера кода на ассемблере
 [Скрины с запусками](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_02/data/size_opt)
 
 [Скрин с размерами файлов](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/data/size_opt/size_opt_size_files.png)
 | № | Параметры | Время работы | Размер исполняемого файла | Количество строк (main.s + addition.s) |
 |:--:|:--:|:---:|:--:|:--:|
 | 1 |без параметров|Calculation time = 0.045827|20Кб|496 + 210|
 | 2 |-ffunction-sections -Wl,--gc-sections|Calculation time = 3.21151|20Кб|498 + 213|
 | 3 |-ffunction-sections -Wl,--gc-sections -fno-asynchronous-unwind-tables|Calculation time = 3.19093|20Кб|450 + 181|
 | 4 |-ffunction-sections -Wl,--gc-sections -fno-asynchronous-unwind-tables -Wl,--strip-all|Calculation time = 3.19991|16Кб|450 + 181|
 | 5 |register|Calculation time = 2.84221| 20Кб | 440 + 174|

