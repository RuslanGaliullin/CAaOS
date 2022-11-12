## На оценку 4
### Шаг № 1. Программа на С
  - Написать программу на С из нескольких единиц компиляции:
  
  2 единицы компиляции: [main.c](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/main.c) [addition.c](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/addition.c)
- В main находится основная программа. В addition вспомогательные функции для построения массива с индаксами подстроки, считывание ввода разными способами и вывод резульата.
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
- Тесты находятся в [test](https://github.com/RuslanGaliullin/CAaOS/tree/PHW_01/test)
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
  - Максимальное использование регистров было достигнуто использованием их для локальных переменных во вспомогательных функциях: BuildIndexArray, Output, ReadFromFile, ReadFromConsole, check_sub, GenerateRandomString. В них использовались регистры от r14d и r15d . check_sub, GenerateRandomString в файле [main_w_reg.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_human/Mark-6-7/main_w_reg.s), остальные во вспомогательном файле [addition_w_reg.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_human/Mark-6-7/addition_w_reg.s). Подробно какой регистр отвечает за какую переменную написано в комментариях к коду
### Шаг № 2. Тестирование
  - Запускаеся файл [Assembler_modified_by_me/MARK-6-7/main.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/Assembly_by_human/Mark-6-7/main_w_reg.out) на тестах [test](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_02/test):
  ![](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_02/data/test_for_mark_6.png)
  - Ожидаемый результат:
  
  |   Файл теста  | Массив B    |
  | :-------------: | :------------- |
  | test01.in  | 2 11 30 38 52 58 63 |
  | test02.in  | 0 1 2 |
  | test03.in  | 0 2 4 6 8 10 12 |

  - Как можно заметить по скриншоту и ожидаемому выводу, программа работает корректно на тестах
  - Сравнение размеров запускаемых файлов:
  ![comparison](smth)
## На оценку 7
### Шаг № 1. Реализовать программу в виду 2 единиц компиляции
  - Это задание было выполнено в самом начале и везде приводился код из 2 файлов
### Шаг № 2. Ввод через файл
  - Это задание было выполнено в самом начале и тесты проганялись с помощью ввода через файл. Чтение из файла реализовано в функции ReadFromFile в [Output_input_B.c](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Output_input_B.c). Также приведу возможный ввод:
    
    Waited:
    
         command -f infile outfile            # infile - файл с исходными данными, outfile - выходные данные 
         
     Or:
     
         command -n number -c/-r outfile      # с параметром -c ввод через консоль, -r - рандомом
## На оценку 8
### Шаг № 1. Подключить генератор рандомных чисел
  - В файле [main.c](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/main.c), также можно посмотреть в [main.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-8/Main_with_cycle_opt.s)
 
        void GenerateRandomArray(int size) {
          for (int i = 0; i < size; ++i) {
            A[i] = rand() % 100000;
          }
        }
  - Для генерации случайного набора используется команда 

        command -n number -r outfile
        
  - Обрабатываются введенные параметры с помощью argc, argv
### Шаг № 2. Сравнение скорости
  - Сравним скорость программы, которая было создана без оптимизации с параметрами из [пункта](https://github.com/RuslanGaliullin/CAaOS/edit/PHW_01/README.md#шаг--2-в-ассемблер) в начале, но с циклом, который выполняет построение массива B 100 раз, запустив [main_no_opt.out](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-8/main_no_opt.out). Этот исполняемый файл создан при компиляции файлов [Main_no_opt.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-8/Main_cycle_no_opt.s) и [Output_input_B_not_opt.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-8/Output_input_cycle_no_opt.s)
    
    P.S. Это те же файлы из первого пунтка, только с добавлением цикла:
                
                mov     r8d, 1
                mov     QWORD PTR -24[rbp], rax             # QWORD PTR -24[rbp] - переменная clock_t start
        Cycle:
                mov     eax, DWORD PTR -4[rbp]              # DWORD PTR -4[rbp] - это size
                mov     edx, eax
                lea     rax, A[rip]
                mov     rsi, rax
                lea     rax, B[rip]
                mov     rdi, rax
                call    BuildBArray@PLT                 # В BuildBArray передаются 3 параметра через регистры
                                                # rdi, rsi, edx: int B[], int A[], int size
                                                # Функция ничего не возвращает
                add     r8d, 1
                cmp     r8d, 100
                jne     Cycle          
  - Вторая программа будет [main_opt.out](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-8/main_opt.out) скомиплированная из [main_opt.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-8/Main_with_cycle_opt.s) и [Output_input_B_opt.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-8/Output_input_B_opt.s). Последняя программа также строит массив B 100 раз + время замеряется только на этом цикле
  - Результаты запуска на время с параметрами **-n 10000000 -r test/test01.out**: 
 
 |     | main_opt.out (оптимизация регистрами) | main_no_opt.out (без какой либо оптимизации)|
 |:-----:|:---------------------------------------:|:---------------------------------------------:|
 |Команда|./main_opt.out -n 10000000 -r test/test_opt.out|./main_no_opt.out -n 10000000 -r test/test_no_opt.out|
 |Время|Calculation time = 2.60638|Calculation time = 2.94435|
 |Пруфы|![](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/data/Test_opt_time.png)|![](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/data/No_opt_time.png)|
 
 - Вывод: у нас удалось улучшить скорость работы алогоритма за счет использования регистров вместо памяти на стеке
 ## На оценку 9
 ### Шаг № 1. Сравнение времени работы
 - [Скрины](https://github.com/RuslanGaliullin/CAaOS/tree/PHW_01/data)
 
 | Параметры | Время работы |  Количество строк (main.s + Output_input_B.s) |
 |:--:|:---:|:---:|
 |-fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -O0|Calculation time = 2.94435|414 + 229|
 |-O1|Calculation time = 0.032683|375 + 249|
 |-O2|Calculation time = 0.034351|372 + 261|
 |-O3|Calculation time = 0.032118|403 + 261|
 |-Ofast|Calculation time = 0.029173|403 + 261|
 |-O0|Calculation time = 0.039069|426 + 268|
 |-Os|Calculation time = 0.028374|333 + 243|
 
### Шаг № 2. Сравнение размера кода на ассемблере
| Параметры | Количество строк (main.s + Output_input_B.s) | время работы|
 |:--:|:---:|:--:|
 |без параметров|453 + 268|Calculation time = 0.045827|
 |-ffunction-sections -Wl,--gc-sections|454 + 270|Calculation time = 0.046978|
 |-ffunction-sections -Wl,--gc-sections -fno-asynchronous-unwind-tables|414 + 238|Calculation time = 0.045296|
 |-ffunction-sections -Wl,--gc-sections -fno-asynchronous-unwind-tables -Wl,--strip-all|414 + 238|Calculation time = 0.046244|

