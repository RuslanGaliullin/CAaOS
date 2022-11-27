# 24. Разработать программу, которая ищет в ASCII-строке заданную подстроку и возвращает список индексов первого символа для всех вхождений подстроки в строке. Подстрока вводится как параметр. Галиуллин Руслан БПИ217
## На оценку 4
### Шаг № 1. Программа на С
  - Написать программу на С из нескольких единиц компиляции:
  
  2 единицы компиляции: [main.c](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/main.c) [addition.c](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/addition.c)
- В main находится основная программа. В addition вспомогательные функции для проверки точек, считывание ввода разными способами и вывод результата
### Шаг № 2. В ассемблер
- Откомпилировать без оптимизирующих и отладочных опций программу на С

| Использовались соответствующие параметры компиляции | 
:--------------------:
| gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -O0 main.c addition.c |

- Полученные файлы при добавлении парамтера -S: 
  - [main.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_gcc/main.s)
  - [addition.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_gcc/addition.s)
### Шаг № 3. Комментарии
- Написать комментарии к программе и убрать макросы, полученные файлы: 
  - [main_w_comments.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_human/Mark-4/main_w_comments.s)
  - [addition_w_comments.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_human/Mark-4/addition_w_comments.s)
- Макросов (macro) не было обнаружено
### Шаг № 4. Тесты
- Откомпилирована и скомпонована программа после моей редакции в [Assembly_by_human/Mark-4/main_w_comments.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_human/Mark-4/main_w_comments.out)
- Полученный описанным выше способом исполняемый файл сравнивается с [main.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/main.out) (компиляция из начального С файла) поочередным запуском на тестах:


  ![](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/data/output_test_mark_4.png)
- Тесты находятся в [test](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/test)
- Ожидаемые выводы (массива В) для каждого теста:


|  Файл теста | Ожидаемые вывод |
| :-------------: | :------------- |
| test01.in | лежат на одной окружности |
| test02.in | лежат на одной окружности |
| test03.in | не лежат на одной окружности |
| test04.in | лежат на одной окружности |
| test05.in ||
- Как можно заметить по скриншоту и ожидаемому выводу, обе программы дают одинаковый, а главное правильный результат
## На оценку 5
### Шаг № 1. Функции
  - Используемые функции с передачей параметров: Output, CheckCircle, CheckSimilarPoints, FindCenter, ReadFromFile, main, fprintf, printf, strcmp, fopen, fclose, fscanf, time, srand, putchar, puts
  - Локальные переменные: double cx01, double cy01, double dx01, double dy01, double mx01, double my01, double cx12, double cy12, double dx12, double dy12, double mx12, double my12, double center_x, double center_y, double distance_1, double distance_2, int i, double proportion, double c1, double c2, int result, FILE \*ifst, clock_t start, clock_t end, FILE\* ofst (не писал переменные, создаваемые при передачи параметров по значению)
  - Файлы с комментарием вызовов функций:
    - [main_w_func_comm.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_human/Mark-5/main_w_func_comm.s)
    - [addition_w_func_comm.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_human/Mark-5/addition_w_func_comm.s)
### Шаг №2. Изменения
  - Для каждого вызова call написан комментарий рядом с вызовом функции о способе передаче параметров в функцию и сохранении возвращаемого значения
  - Рядом с объявлением каждой функции, которая написана мной, находится комментарий о фактических параметрах функции и в конце о возвращаемом значении
  - Через что передаются аргументы в формальные параметры написано рядом с объявлением соответствующих локальных переменных
## На оценку 6
### Шаг № 1. Замена на регистры
  - Максимальное использование регистров было достигнуто использованием их для локальных переменных во вспомогательных функциях: GenerateRandomCoordinates, main, CheckSimilarPoints, ReadFromFile. В них использовались регистры от r13d, r14d и r15d. GenerateRandomCoordinates, main в файле [main_w_reg.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_human/Mark-6-7/main_w_reg.s), остальные во вспомогательном файле [addition_w_reg.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_human/Mark-6-7/addition_w_reg.s). Подробно какой регистр отвечает за какую переменную написано в комментариях к коду. В основным замена была проделана за счет использования регистров для i в for - циклах (регистры r13d, r14d, r15d)
### Шаг № 2. Тестирование. Проверка
  - Запускаеся файл [Assembler_modified_by_me/MARK-6-7/main_w_reg.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_human/Mark-6-7/main_w_reg.out) на тестах [test](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/test):
  ![](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/data/output_test_mark_6.png)
  - Ожидаемый результат:
  
  | Файл теста | Ожидаемый вывод |
  | :-------------: | :------------- |
  | test01.in | лежат на одной окружности |
  | test02.in | лежат на одной окружности |
  | test03.in | не лежат на одной окружности |
  | test04.in | лежат на одной окружности |

  - Как можно заметить по скриншоту и ожидаемому выводу, программа работает корректно на тестах
  - Сравнение размеров запускаемых файлов:

  ![](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/data/exe_size_compare.png)
  Как мы видим размер исполняемого файла существенно не изменился по сравнению с файлом, скомпилированным gcc без оптимизаций
## На оценку 7
### Шаг № 1. Реализовать программу в виде 2 единиц компиляции
  - Это задание было выполнено в самом начале и везде приводился код из 2 файлов
### Шаг № 2. Ввод через файл
  - Проверка на число аргументов:
    ```
    if (argc != 3 && argc != 4) {
    	errMessage1();
    	return 1;
    }
    ```
  - Проверка на открытие файлов:
    ```
    FILE *ifst = fopen(argv[2], "r");
    if (ifst == NULL) {
      printf("Cannot open input file %s\n", argv[2]);
      return 3;
    }
    FILE *ofst = fopen(argv[argc - 1], "w");
    if (ofst == NULL) {
    	printf("Cannot open %s to write\n", argv[argc - 1]);
    	return 1;
    }
    ```
  - Это задание было выполнено в самом начале и тесты прогонялись с помощью ввода через файл. Чтение из файла реализовано в функции ReadFromFile в [addition.c](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/addition.c). Также приведу возможный ввод:
    
    Waited:
    
              command -c outfile
              in console: x0 y0 x1 y1 x2 y2 x3 y4
         
     Or:
     
              command -r outfile
     Or:
     
              command -f infile outfile
   - Итог:
     
     Изначально декомпозировав код на функции CheckCircle, CheckSimilarPoints, ReadFromFile, FindCenter, Output возникла необходимость выделить их в отдельную единицу компиляции; все представленные выше тесты были проведены для прграммы с 2 единицами компиляции, поэтому тестирование эквивалентно тестированию [Assembler_modified_by_me/MARK-6-7/main_w_reg.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_human/Mark-6-7/main_w_reg.out) в [пункте](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/README.md#шаг--2-тестирование-проверка); специального формата от входного файла не требуется, нужно, чтобы его можно было прочесть + есть вывод результата в консоль, чтобы сразу увидеть результат/время работы.
## На оценку 8
### Шаг № 1. Подключить генератор рандомных чисел
  - В файле [main.c](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/main.c), также можно посмотреть в [main.s](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_gcc/main.s)
    ``` 
    void GenerateRandomCoordinates() {
  	    for (int i = 0; i < 4; ++i) {
	       X[i] = rand() % 100;
	       Y[i] = rand() % 100;
  	    }
    }
    ```
  - Для генерации случайного набора используется команда 

        command -r outfile
        
  - Обрабатываются введенные параметры с помощью argc, argv
  - Итоговые способы ввода-вывода:
      
      a. консоль -> файл и консоль
      
      b. файл -> файл и консоль
      
      c. случайный ввод -> файл и консоль
### Шаг № 2. Сравнение скорости
  - Сравним скорость программы, которая была создана без оптимизации с параметрами из [пункта](https://github.com/RuslanGaliullin/CAaOS/edit/IHW_03/README.md#шаг--2-в-ассемблер) в начале с программой после ручного добавления регистров в [пункте на оценку 6](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03#на-оценку-6). Замечу, что построение искомого массива в программе выполняется 60000000 раз в цикле
  - Получается сравниваются 2 программы по скорости: [main_w_reg.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_human/Mark-6-7/main_w_reg.out) и [main.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_gcc/main.out). Остальные написанные программы сравнивать бессмысленно так как комментарии, которые я добавлял никак не влияют на скорость выполнения программы и их результат идентичен [main.out](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_gcc/main.out)
  - Результаты запуска на время с параметрами **-r -r test/test_random.out**: 
 
 |      | main_w_reg.out (оптимизация регистрами) | main.out (без какой либо оптимизации) |
 |:-----:|:---------------------------------------:|:---------------------------------------------:|
 | Команда | Mark-6-7/main_w_reg.out -r test/test_random.out | Assembly_by_gcc/main.out -r test/test_random.out |
 | Время | Calculation time = 2.20377 | Calculation time = 2.41889 |
 | Пруфы |![](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/data/register_opt_random_test.png)|![](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/data/no_opt_random_test.png)|
 
 - Вывод: у нас удалось улучшить скорость работы алогоритма за счет использования регистров вместо памяти на стеке
 ## На оценку 9
 ### Шаг № 1. Сравнение времени работы
 [Скрины с запусками](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/data/speed_opt)
 
 ![Скрин с размерами файлов](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/data/speed_opt/compare_size_of_speed_exe.png)
 | Параметры | Время работы | Размер исполняемого файла | Количество строк (main.s + addition.s) | Где расположен код на asm |
 |:--:|:---:|:---:|:---:|:--:|
 |-fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -O0|Calculation time = 2.48678|20Кб|351 + 491|[папка](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/asm_optimized/speed/O0_opt)|
 |-O0|Calculation time = 2.53151|20Кб|383 + 539|[папка](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/asm_optimized/speed/O0)|[папка](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/asm_optimized/speed/O0)|
 |-O1|Calculation time = 0.909421|20Кб|342 + 377|[папка](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/asm_optimized/speed/O1)|
 |-O2|Calculation time = 0.568231|20Кб|333 + 353|[папка](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/asm_optimized/speed/O2)|
 |-O3|Calculation time = 0.575897|20Кб|333 + 376|[папка](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/asm_optimized/speed/O3)|
 |-Ofast|Calculation time = 0.9144|20Кб|333 + 355|[папка](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/asm_optimized/speed/Ofast)|
 |-Os|Calculation time = 0.887754|20Кб|319 + 325|[папка](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/asm_optimized/speed/Os)|
 |моя программа с регистрами|Calculation time = 2.20377|20Кб|337 + 477|[папка](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_human/Mark-6-7/)|
 
### Шаг № 2. Сравнение размера исполняемых файлов и кода на ассемблере
 [Скрины с запусками](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/data/size_opt)
 
 ![Скрин с размерами файлов](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/data/size_opt/size_opt_size_files.png)
 | № | Параметры | Время работы | Размер исполняемого файла | Количество строк (main.s + addition.s) | Где расположен код на asm |
 |:--:|:--:|:---:|:--:|:--:|:--:|
 | 1 |без параметров|Calculation time = 2.53106|20Кб|383 + 539|[папка](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/asm_optimized/size/size_01)|[папка](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/asm_optimized/size/size_01)|
 | 2 |-ffunction-sections -Wl,--gc-sections|Calculation time = 2.52524|20Кб|384 + 542|[папка](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/asm_optimized/size/size_02)|
 | 3 |-ffunction-sections -Wl,--gc-sections -fno-asynchronous-unwind-tables|Calculation time = 2.37064|20Кб|352 + 502|[папка](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/asm_optimized/size/size_03)|
 | 4 |-ffunction-sections -Wl,--gc-sections -fno-asynchronous-unwind-tables -Wl,--strip-all|Calculation time = 2.3569|16Кб|352 + 502|[папка](https://github.com/RuslanGaliullin/CAaOS/tree/IHW_03/asm_optimized/size/size_04)|
 | 5 |моя программа с регистрами|Calculation time = 2.20377|20Кб|337 + 477 |[папка](https://github.com/RuslanGaliullin/CAaOS/blob/IHW_03/Assembly_by_human/Mark-6-7/)|

