Code for the gnu asm assembler to show message "Hello, World" on Linux-64


1) тест 5 3 2 4 1 break shell_sort size == 6?????? frame argc считает количество параметров при вводу в командную строку с учетом ./a.out слова7

(gdb) display a[0]

1: a[0] = 5

(gdb) display a[1]

2: a[1] = 3

(gdb) display a[2]

3: a[2] = 2

(gdb) display a[3]

4: a[3] = 4

(gdb) display a[4]

5: a[4] = 1

Breakpoint 1, shell_sort (a=0x5555555592a0, size=6) at shell-sort.c:8

8	  int h = 1;

#0  shell_sort (a=0x5555555592a0, size=5) at shell-sort.c:8

#1  0x000055555555536d in main (argc=6, argv=0x7fffffffe028) at shell-sort.c:36

(gdb) frame 1

#1  0x000055555555536d in main (argc=6, argv=0x7fffffffe028) at shell-sort.c:36

36	  shell_sort(a, argc-1);
