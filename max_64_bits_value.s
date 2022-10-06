    .intel_syntax noprefix

    .section .rodata
output:
    .string     "Max factorial value for 64-bit register is %llu"
    
    .text               # Code
    .globl  main
    .type   main, @function
main:
    push    rbp
    mov     rbp, rsp
    
    mov     rax, 1
    mov     rbx, 1
loop:                            # цикл умножения факториала и сохранения значения
    add     rbx, 1
    mov     rcx, rax
    mul     rbx
    jnc     loop
    
    lea     rdi, output[rip]     # формат вывода
    mov     rsi, rcx             # последнее значение факториала до переполнения
    mov	    eax, 0
    call    printf@PLT
    mov	eax, 0
    pop	rbp
    ret

