## На оценку 4
### Шаг № 1. Программа на С
  - Написать программу на С из нескольких единиц компиляции:
  
  2 единицы компиляции: [main:](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/main.c) [Output_input_B:](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Output_input_B.c)
- В main находится основная программа. В Output_input_B вспомогательные функции для построения массива В, считывание ввода разными способами и вывод резульата.
### Шаг № 2. В ассемблер
- Откомпилировать без оптимизирующих и отладочных опций программу на С

|Использовались соответствующие параметры компиляции| 
:--------------------:
|gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -O0 main.c Output_input_B.c|

- Полученные файлы: 
  - [main](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_from_gcc/MARK-04/MAIN_no_optimize_Task01)
  - [Output_input_B](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_from_gcc/MARK-04/Output_input_no_opt.s)
### Шаг № 3. Комментарии
- Написать комментарии к программе и убрать макросы, полученные файлы: 
  - [main](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-4/MAIN_comm_and_macro.s)
  - [Output_input_B](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-4/Output_input_comm_macro.s)
- Комментарии были написаны к таким переменным, как size, int A[10000000], int B[10000000], i, argc, argv, ifst, start, end, calcTime, ofst1
- Макросов (macro) не было обнаружено
### Шаг № 4. Тесты
- Откомпилирована и скомпонована программа после моей редакции в [Assembler_modified_by_me/MARK-4/main_without_macro.out](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-4/main_without_macro.out)
- Полученный описанным выше способом исполняемый файл сравнивается с [main.out](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/main.out) (компиляция из начального С файла) поочередным запуском на тестах:


  ![](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/data/Снимок%20экрана%202022-10-22%20в%2014.37.08.png)
- Тесты находятся в [test](https://github.com/RuslanGaliullin/CAaOS/tree/PHW_01/test). Ожидаемые выводы (массива В) для каждого теста:


|   Файл теста  | Массив B    |
| :-------------: | :------------- |
| test01.in  | 2 4 6 8 10 12 1 3 5 7 9 11  |
| test02.in  | 86364 2853 78043 67895  |
| test03.in  | 5  |
| test04.in  | 59547 26552 32979 70108 22142 40904 80770 98662 75994 4516 33855 67744 26903 97734 71246 34143 43774 48545 14807 22036 26365 15669 77445 13097 49587 50279 2688 15862 27608 91362 26319 57502 29350 96354 63094 58388 22803 1876 99886 78194 81974 58512 61105 36480 20849 53683 10693 69546 37589 34626 |
- Как можно заметить по скриншоту и ожидаемому выводу, обе программы дают одинаковый, а главное правильный результат
## На оценку 5
### Шаг № 1. Функции
  - Используемые функции с передачей параметров: GenerateRandomArray, strcmp, fopen, printf, ReadFromFile, fclose, strtol, time, srand, GenerateRandomArray, fprintf, Output, InputArrayFromConsole, BuildBArray. 
  - Локальные переменные: int size, int i, FILE *ifst, clock_t start, clock_t end, double calcTime, FILE * ofst1
  - Файлы с комментарием вызовов функций:
    - [main](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-5/MAIN_w_comm.s)
    - [Output_input_B](https://github.com/RuslanGaliullin/CAaOS/blob/PHW_01/Assembler_modified_by_me/MARK-5/Output_input_w_comm.s)
### Шаг №2. Изменения
  - Для каждого вызова call написан комментарий рядом с вызовом функции о способе передаче параметров в функцию и сохранении возвращаемого значения
  - Рядом с объявлением каждой функции, которая написана мной, находится комментарий о фактических параметрах функции и о ее возвращаемом значении
## На оценку 6
## Шан № 1. 
