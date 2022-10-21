### Шаг № 1
- Написать программу на С ....
### Шаг № 2
- Откомпилировать без оптимизирующих и отладочных опций программу на С.

|Использовались соответствующие параметры компиляции| 
:--------------------:
|gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -O0 main.c Output_input_B.c|

- Полученные файлы: 
  - main: https://github.com/RuslanGaliullin/CAaOS/blob/main/Clean_gcc_assembler_files/First_optimized_main.s
  - Out_input_b: 
### Шаг № 3
- Написать комментарии к программе и убрать макросы
- Полученный файл: https://github.com/RuslanGaliullin/CAaOS/blob/main/Modified_assembly_files/First_optimized_with_comments.s
