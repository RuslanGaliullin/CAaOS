    .intel_syntax noprefix

    .section .rodata
output:
    .string "%lu! = %llu"
msg_in:
    .string     "n? "
format_in:
    .string     "%lu"
    .section .data
n:  .long   0
    .text
_factorial:
    push rbp           
    mov rbp, rsp
    mov rax, 1              # Здесь будут результат вычисления факториалаа
    
    loop:
        mul     rdi         # Цикл умножения rax на rdi
        sub     rdi, 1      # Уменьшение rdi на 1
        cmp     rdi, 1      
        ja     loop         # Переход к строке 18, если rdi > 1
    mov rsp, rbp
    pop rbp
    ret

.globl  main
.type   main, @function
main:
    push    rbp
    mov     rbp, rsp

    lea     rdi, msg_in[rip]  # Подсказка при вводе
    mov     eax, 0
    call    printf@PLT


    lea     rdi, format_in[rip]    # Считывание вводимого значения
    lea     rsi, n[rip]             
    mov     eax, 0                 
    call    scanf@plt              
    
    mov     rdi, [n + rip]         # Записываем аргументы функции factorial
    call    _factorial             # Вызов функции factorial

    lea     rdi, output[rip]       # Сообщение при выводе результата
    mov     rsi, [n + rip]         # Вставка введенного в начале n
    mov     rdx, rax               # Вставка найденного факториала для n
    mov	    eax, 0
    call    printf@PLT
    
    mov	eax, 0                     # Выход из программы
    pop	rbp
    ret
