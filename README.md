## На оценку 4
### Шаг № 1. Программа на С
  - Написать программу на С из нескольких единиц компиляции:
  
  2 единицы компиляции: [main.c](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/main.c) [Output_input_B.c](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Output_input_B.c)
- В main находится основная программа. В Output_input_B вспомогательные функции для построения массива В, считывание ввода разными способами и вывод резульата.
### Шаг № 2. В ассемблер
- Откомпилировать без оптимизирующих и отладочных опций программу на С

|Использовались соответствующие параметры компиляции| 
:--------------------:
|gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -O0 main.c Output_input_B.c|

- Полученные файлы: 
  - [main.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_from_gcc/MARK-04/MAIN_no_optimize_Task01.s)
  - [Output_input_B.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_from_gcc/MARK-04/Output_input_no_opt.s)
### Шаг № 3. Комментарии
- Написать комментарии к программе и убрать макросы, полученные файлы: 
  - [main.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-4/MAIN_comm_and_macro.s)
  - [Output_input_B.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-4/Output_input_comm_macro.s)
- Комментарии были написаны к таким переменным, как size, int A[10000000], int B[10000000], i, argc, argv, ifst, start, end, calcTime, ofst1
- Макросов (macro) не было обнаружено
### Шаг № 4. Тесты
- Откомпилирована и скомпонована программа после моей редакции в [Assembler_modified_by_me/MARK-4/main_without_macro.out](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-4/main_without_macro.out)
- Полученный описанным выше способом исполняемый файл сравнивается с [main.out](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/main.out) (компиляция из начального С файла) поочередным запуском на тестах:


  ![](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/data/Снимок%20экрана%202022-10-22%20в%2014.37.08.png)
- Тесты находятся в [test](https://github.com/RuslanGaliullin/CAaOS/tree/PHW_01/test).
- Ожидаемые выводы (массива В) для каждого теста:


|   Файл теста  | Массив B    |
| :-------------: | :------------- |
| test01.in  | 2 4 6 8 10 12 1 3 5 7 9 11  |
| test02.in  | 86364 2853 78043 67895  |
| test03.in  | 5  |
| test04.in  | 59547 26552 32979 70108 22142 40904 80770 98662 75994 4516 33855 67744 26903 97734 71246 34143 43774 48545 14807 22036 26365 15669 77445 13097 49587 50279 2688 15862 27608 91362 26319 57502 29350 96354 63094 58388 22803 1876 99886 78194 81974 58512 61105 36480 20849 53683 10693 69546 37589 34626 |
- Как можно заметить по скриншоту и ожидаемому выводу, обе программы дают одинаковый, а главное правильный результат
## На оценку 5
### Шаг № 1. Функции
  - Используемые функции с передачей параметров: GenerateRandomArray, strcmp, fopen, printf, ReadFromFile, fclose, strtol, time, srand, GenerateRandomArray, fprintf, Output, InputArrayFromConsole, BuildBArray
  - Локальные переменные: int size, int i, FILE *ifst, clock_t start, clock_t end, double calcTime, FILE * ofst1 (не писал переменные, создаваемые при передачи параметров по значению)
  - Файлы с комментарием вызовов функций:
    - [main.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-5/MAIN_w_comm.s)
    - [Output_input_B.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-5/Output_input_w_comm.s)
### Шаг №2. Изменения
  - Для каждого вызова call написан комментарий рядом с вызовом функции о способе передаче параметров в функцию и сохранении возвращаемого значения
  - Рядом с объявлением каждой функции, которая написана мной, находится комментарий о фактических параметрах функции и о ее возвращаемом значении
## На оценку 6
### Шаг № 1. Замена на регистры
  - Максимальное использование регистров было достигнуто использованием их для локальных переменных во вспомогательных функциях: GenerateRandomArray, BuildBArray, Output, ReadFromFile, InputArrayFromConsole. В них использовались регистры от r12 - r15 (в зависимости от количества переменных). GenerateRandomArray в файле [main.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-6-7/Main_w_reg.s), остальные во вспомогательном файле [Output_input_B.s](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-6-7/Output_input_B_w_reg.s). Подробно какой регистр отвечает за какую переменную написано в комментариях к коду
### Шаг № 2. Тестирование
  - Запускаеся файл [CAaOS/Assembler_modified_by_me/MARK-6-7/main.out](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-6-7/main.out) на тестах [test](https://github.com/RuslanGaliullin/CAaOS/tree/PHW_01/test):
  ![](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/data/Test_register_programm.png)
  - Ожидаемый результат:
  
  |   Файл теста  | Массив B    |
  | :-------------: | :------------- |
  | test01.in  | 2 4 6 8 10 12 1 3 5 7 9 11  |
  | test02.in  | 86364 2853 78043 67895  |
  | test03.in  | 5  |
  | test04.in  | 59547 26552 32979 70108 22142 40904 80770 98662 75994 4516 33855 67744 26903 97734 71246 34143 43774 48545 14807 22036 26365   15669 77445 13097 49587 50279 2688 15862 27608 91362 26319 57502 29350 96354 63094 58388 22803 1876 99886 78194 81974 58512 61105 36480 20849   53683 10693 69546 37589 34626 |

  - Как можно заметить по скриншоту и ожидаемому выводу, программа работает корректно на тестах
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
