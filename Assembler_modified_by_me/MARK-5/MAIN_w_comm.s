        .file   "main.c"
        .intel_syntax noprefix
        .text
        .globl  A
        .bss
        .align 32
        .type   A, @object          # Массив А из 100000 интов
        .size   A, 40000000
A:
        .zero   40000000
        .globl  B
        .align 32
        .type   B, @object          # Массив B из 100000 интов
        .size   B, 40000000
B:
        .zero   40000000
        .section        .rodata
        .align 8
.LC0:
        .string "incorrect command line!\n  Waited:\n     command -f infile outfile\n  Or:\n     command -n number -c/-r outfile"
        .text
        .globl  errMessage1
        .type   errMessage1, @function
errMessage1:                        # В функции errMessage1 нет формальных параметров
        endbr64
        push    rbp
        mov     rbp, rsp
        lea     rax, .LC0[rip]
        mov     rdi, rax
        call    puts@PLT            # char* .LC0 передана в функцию printf через регистр rdi
        nop                         # Возвращаемый результат в eax, но он не используется
        pop     rbp
        ret
        .size   errMessage1, .-errMessage1
        .section        .rodata
        .align 8
.LC1:
        .string "incorrect qualifier value!\n  Waited:\n     command -f infile outfile\n  Or:\n     command -n number -c/-r outfile"
        .text
        .globl  errMessage2
        .type   errMessage2, @function
errMessage2:                        # В функции errMessage2 нет формальных параметров
        endbr64
        push    rbp
        mov     rbp, rsp
        lea     rax, .LC1[rip]      # char* .LC1 передана в функцию printf через регистр rdi
        mov     rdi, rax
        call    puts@PLT            # Возвращаемый результат в eax, но он не используется
        nop
        pop     rbp
        ret
        .size   errMessage2, .-errMessage2
        .section        .rodata
        .align 8
.LC2:
        .string "incorrect qualifier in file value!\n  Waited:\n     number\n     A[0] A[1] ... A[number - 1]"
        .text
        .globl  errMessage3
        .type   errMessage3, @function
errMessage3:                        # В функции errMessage3 нет формальных параметров
        endbr64
        push    rbp
        mov     rbp, rsp
        lea     rax, .LC2[rip]      # char* .LC2 передана в функцию printf через регистр rdi
        mov     rdi, rax
        call    puts@PLT            # Возвращаемый результат в eax, но он не используется
        nop
        pop     rbp
        ret
        .size   errMessage3, .-errMessage3
        .globl  GenerateRandomArray
        .type   GenerateRandomArray, @function
GenerateRandomArray:                # В функции GenerateRandomArray есть 1 параметр: int size
        endbr64                     # Функция его берет из регистра rdi. Ничего не возвращает
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     DWORD PTR -20[rbp], edi             # Сохраняем на стеке переменную size с переданным значением
        mov     DWORD PTR -4[rbp], 0                # Сохраняем на стеке переменную i = 0 для итерации
        jmp     .L5
.L6:
        call    rand@PLT            # Функция rand не принимает параметров
        movsx   rdx, eax
        imul    rdx, rdx, 351843721
        shr     rdx, 32
        sar     edx, 13
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        imul    ecx, edx, 100000
        sub     eax, ecx
        mov     edx, eax
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rcx, 0[0+rax*4]
        lea     rax, A[rip]
        mov     DWORD PTR [rcx+rax], edx
        add     DWORD PTR -4[rbp], 1
.L5:
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -20[rbp]
        jl      .L6
        nop
        nop
        leave
        ret
        .size   GenerateRandomArray, .-GenerateRandomArray
        .section        .rodata
.LC3:
        .string "-f"
.LC4:
        .string "r"
.LC5:
        .string "Cannot open infile."
        .align 8
.LC6:
        .string "incorrect number of elements = %d. Set 0 < number <= 10000000\n"
.LC7:
        .string "-n"
        .align 8
.LC8:
        .string "incorrect number of elements = %d. Set 0 < number <= %d\n"
.LC9:
        .string "-r"
.LC10:
        .string "Filled array A:\n"
.LC11:
        .string "-c"
.LC13:
        .string "Built array B:\n"
.LC14:
        .string "w"
.LC15:
        .string "Cannot open %s to write\n"
.LC16:
        .string "Calculation time = %g\n"
.LC17:
        .string "\nCalculation time = %g\n"
        .text
        .globl  main
        .type   main, @function
main:                                           # В функции main есть 2 параметра:   int argc, char *argv[]
        endbr64                                 # argc берется из регистра edi
        push    rbp                             # argv берется из регистра rsi
        mov     rbp, rsp
        sub     rsp, 64
        mov     DWORD PTR -52[rbp], edi         # DWORD PTR -52[rbp] - переменная argc
        mov     QWORD PTR -64[rbp], rsi         # QWORD PTR -64[rbp] - переменная argv
        cmp     DWORD PTR -52[rbp], 3
        jle     .L8
        cmp     DWORD PTR -52[rbp], 5
        jle     .L9
.L8:
        mov     eax, 0
        call    errMessage1                     # Функция errMessage1 не принимает параметров
                                                # Функция ничего не возвращает
        mov     eax, 1
        jmp     .L10
.L9:
        mov     rax, QWORD PTR -64[rbp]
        add     rax, 8
        mov     rax, QWORD PTR [rax]            # Берем значение argv[1]
        lea     rdx, .LC3[rip]
        mov     rsi, rdx
        mov     rdi, rax                        # В функцию strcmp передается char* argv[2]
        call    strcmp@PLT                      # через регистр rdi, char* .LC3 через регистр rsi.
        test    eax, eax                        # Результат функции strcmp в eax. ZF = 1 <=> eax & eax = 0 <=> eax = 0
        jne     .L11                            # ZF = 0 <=> JNE должно прыгнуть в .L11, иначе продолжаем
        mov     rax, QWORD PTR -64[rbp]
        add     rax, 16                         # Берем значение argv[2]
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC4[rip]
        mov     rsi, rdx
        mov     rdi, rax
        call    fopen@PLT                       # В функцию strcmp передается char* argv[2]
                                                # через регистр rdi, char* .LC4 через регистр rsi
                                                # Возвращаемый результат в rax
        mov     QWORD PTR -16[rbp], rax         # QWORD PTR -16[rbp] - переменная FILE* ifst файлового потока
        cmp     QWORD PTR -16[rbp], 0
        jne     .L12
        lea     rax, .LC5[rip]
        mov     rdi, rax
        call    puts@PLT                         # char* .LC5 передана в функцию printf через регистр rdi
                                                 # Возвращаемый результат в eax, но он не используется
        mov     eax, 3
        jmp     .L10
.L12:
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, A[rip]
        mov     rsi, rdx
        mov     rdi, rax
        call    ReadFromFile@PLT                # В функцию передаются 2 параметра через
                                                # регистры rdi и rsi: FILE* ifst, int A[]
                                                # сохраняется возвращаемый результат в eax
        mov     DWORD PTR -4[rbp], eax          # Сохранение переменной size = ReadFromFile(ifst, A)
        mov     rax, QWORD PTR -16[rbp]         # DWORD PTR -4[rbp] - это size, QWORD PTR -16[rbp] - переменная FILE* ifst файлового потока
        mov     rdi, rax
        call    fclose@PLT                      # В функцию fclose передается 1 параметр через
                                                # регистр rdi: FILE* ifst
                                                # сохраняется возвращаемый результат в eax, но не используется дальше
        cmp     DWORD PTR -4[rbp], -2
        jne     .L13
        mov     eax, DWORD PTR -4[rbp]
        mov     esi, eax
        lea     rax, .LC6[rip]
        mov     rdi, rax
        mov     eax, 0
        call    printf@PLT                      # char* .LC6 передана в функцию printf через регистр rdi
                                                # Возвращаемый результат в eax, но он не используется
        mov     eax, 3
        jmp     .L10
.L13:
        cmp     DWORD PTR -4[rbp], -1
        jne     .L14
        mov     eax, 0
        call    errMessage3                     # Функция errMessage3 не принимает параметров
                                                # Функция ничего не возвращает
        mov     eax, 3
        jmp     .L10
.L11:
        mov     rax, QWORD PTR -64[rbp]
        add     rax, 8                          # Считываем argv[1]
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC7[rip]
        mov     rsi, rdx
        mov     rdi, rax                        # В функцию strcmp передаются 2 параметра через
        call    strcmp@PLT                      # регистры rdi, rsi: char* argv[1], char* .LC7
                                                # Результат функции strcmp в eax. ZF = 1 <=> eax & eax = 0 <=> eax = 0
                                                # ZF = 0 <=> JNE должно прыгнуть в .L15, иначе продолжаем
        test    eax, eax
        jne     .L15
        mov     rax, QWORD PTR -64[rbp]
        add     rax, 16                         # Считываем argv[2]
        mov     rax, QWORD PTR [rax]
        mov     edx, 10
        mov     esi, 0
        mov     rdi, rax
        call    strtol@PLT                      # В функцию передаются 3 параметра через
                                                # регистры rdi, esi, edx: char* argv[2], NULL и int 10
                                                # Возвращаемое значение сохраняется в регистре eax
        mov     DWORD PTR -4[rbp], eax          # Записываем в переменную size результат strtol(argv[2], NULL, 10)
        cmp     DWORD PTR -4[rbp], 0
        jle     .L16
        cmp     DWORD PTR -4[rbp], 10000000
        jle     .L17
.L16:
        mov     eax, DWORD PTR -4[rbp]
        mov     edx, 10000000
        mov     esi, eax
        lea     rax, .LC8[rip]
        mov     rdi, rax
        mov     eax, 0
        call    printf@PLT                      # char* .LC8 передана в функцию printf через регистр rdi
                                                # Возвращаемый результат в eax, но он не используется
        mov     eax, 3
        jmp     .L10
.L17:
        mov     edi, 0
        call    time@PLT                        # Через регистр edi в функцию time передается int 0
        mov     edi, eax                        # Возвращаемый результат сохраняется в регистр eax
        call    srand@PLT                       # В функцию scrand передается значение time(0) через edi
        mov     rax, QWORD PTR -64[rbp]         # в функции scrand нет возвращаемого значения
        add     rax, 24
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC9[rip]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp@PLT                      # В функцию strcmp передаются 2 параметра через rdi, rsi: char* argv[3], char* .LC9
                                                # Результат функции strcmp в eax. ZF = 1 <=> eax & eax = 0 <=> eax = 0
                                                # ZF = 0 <=> JNE должно прыгнуть в .L18, иначе продолжаем
        test    eax, eax
        jne     .L18
        mov     eax, DWORD PTR -4[rbp]
        mov     edi, eax
        call    GenerateRandomArray             # В функцию GenerateRandomArray 1 аргумент через rdi: int size
        mov     rax, QWORD PTR stdout[rip]
        mov     rcx, rax
        mov     edx, 16
        mov     esi, 1
        lea     rax, .LC10[rip]
        mov     rdi, rax
        call    fwrite@PLT                      # В fwrite передаются 2 параметра через rdi, esi: stdout, char* .LC10
                                                # возвращаемое значение сохраняется в eax, но не используется
        mov     rax, QWORD PTR stdout[rip]
        mov     edx, DWORD PTR -4[rbp]
        lea     rcx, A[rip]
        mov     rsi, rcx
        mov     rdi, rax
        call    Output@PLT                      # В Output передаются 3 параметра через rdi, rsi, edx:
                                                # stdout, int A[], int size
                                                # Возвращаемого значения у функции нет
        jmp     .L14
.L18:
        mov     rax, QWORD PTR -64[rbp]
        add     rax, 24
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC11[rip]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp@PLT                      # В функцию strcmp передаются 2 параметра через rdi, rsi: char* argv[3], char* .LC11
                                                # Результат функции strcmp в eax. ZF = 1 <=> eax & eax = 0 <=> eax = 0
                                                # ZF = 0 <=> JNE должно прыгнуть в .L14, иначе продолжаем
        test    eax, eax
        jne     .L14
        mov     eax, DWORD PTR -4[rbp]
        mov     esi, eax
        lea     rax, A[rip]
        mov     rdi, rax
        call    InputArrayFromConsole@PLT       # В функцию InputArrayFromConsole передаются 2 параметра
                                                # через регистры rdi, esi: int A[], int size
                                                # Возвращаемого значения у функции нет
        jmp     .L14
.L15:
        mov     eax, 0
        call    errMessage2                     # Функция errMessage2 не принимает параметров
                                                # Функция ничего не возвращает
        mov     eax, 2
        jmp     .L10
.L14:
        call    clock@PLT                       # Функция clock не принимает параметров
                                                # Возвращаемый результат сохраняется в rax
        mov     QWORD PTR -24[rbp], rax             # QWORD PTR -24[rbp] - переменная clock_t start
        mov     eax, DWORD PTR -4[rbp]              # DWORD PTR -4[rbp] - это size
        mov     edx, eax
        lea     rax, A[rip]
        mov     rsi, rax
        lea     rax, B[rip]
        mov     rdi, rax
        call    BuildBArray@PLT                 # В BuildBArray передаются 3 параметра через регистры
                                                # rdi, rsi, edx: int B[], int A[], int size
                                                # Функция ничего не возвращает
        call    clock@PLT                       # Функция clock не принимает параметров
                                                # Возвращаемый результат сохраняется в rax
        mov     QWORD PTR -32[rbp], rax         # QWORD PTR -32[rbp] - переменная clock_t end
        mov     rax, QWORD PTR -32[rbp]
        sub     rax, QWORD PTR -24[rbp]
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, rax
        movsd   xmm1, QWORD PTR .LC12[rip]
        divsd   xmm0, xmm1
        movsd   QWORD PTR -40[rbp], xmm0        # QWORD PTR -40[rbp] - переменная double calcTime
        mov     rax, QWORD PTR stdout[rip]
        mov     rcx, rax
        mov     edx, 15
        mov     esi, 1
        lea     rax, .LC13[rip]
        mov     rdi, rax
        call    fwrite@PLT                      # char* .LC13 передана в функцию printf через регистр rdi
                                                # Возвращаемый результат в eax, но он не используется
        mov     rax, QWORD PTR stdout[rip]
        mov     edx, DWORD PTR -4[rbp]
        lea     rcx, B[rip]
        mov     rsi, rcx
        mov     rdi, rax
        call    Output@PLT                      # В Output передаются 3 параметра через rdi, rsi, edx:
                                                # stdout, int B[], int size
                                                # Возвращаемого значения у функции нет
        mov     eax, DWORD PTR -52[rbp]
        cdqe
        sal     rax, 3
        lea     rdx, -8[rax]
        mov     rax, QWORD PTR -64[rbp]
        add     rax, rdx
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC14[rip]
        mov     rsi, rdx
        mov     rdi, rax
        call    fopen@PLT                       # В функцию strcmp передается char* argv[argc - 1]
                                                # через регистр rdi, char* .LC14 через регистр rsi
                                                # Возвращаемый результат в rax
        mov     QWORD PTR -48[rbp], rax         # QWORD PTR -48[rbp] - переменная ofst1
        cmp     QWORD PTR -48[rbp], 0
        jne     .L19
        mov     eax, DWORD PTR -52[rbp]
        cdqe
        sal     rax, 3
        lea     rdx, -8[rax]
        mov     rax, QWORD PTR -64[rbp]
        add     rax, rdx
        mov     rax, QWORD PTR [rax]
        mov     rsi, rax
        lea     rax, .LC15[rip]
        mov     rdi, rax
        mov     eax, 0
        call    printf@PLT                      # D функцию printf передается 1 параметра через регистр rdi: char* LC15
                                                # Возвращаемый результат сохраняется в eax, но он не используется
        mov     eax, 1
        jmp     .L10
.L19:
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, rax
        mov     edx, 15
        mov     esi, 1
        lea     rax, .LC13[rip]
        mov     rdi, rax
        call    fwrite@PLT                      # В функцию fwrite передается 2 параметра через регистры
                                                # rdi, esi: File* ofst1, char* .LC13
                                                # Возвращаемый результат сохраняется в eax, но он не используется
        mov     edx, DWORD PTR -4[rbp]
        mov     rax, QWORD PTR -48[rbp]
        lea     rcx, B[rip]
        mov     rsi, rcx
        mov     rdi, rax
        call    Output@PLT                      # В Output передаются 3 параметра через rdi, rsi, edx:
                                                # File* ofst1, int B[], int size
                                                # Возвращаемого значения у функции нет
        mov     rax, QWORD PTR stdout[rip]
        mov     rdx, QWORD PTR -40[rbp]
        movq    xmm0, rdx
        lea     rdx, .LC16[rip]
        mov     rsi, rdx
        mov     rdi, rax
        mov     eax, 1
        call    fprintf@PLT                     # В функцию frpintf передаются 3 параметра через регистры
                                                # rdi, rsi, xmm0: stdout, char* .LC16, double calcTime
                                                # Возвращаемый результат сохраняется в eax, но он не используется
        mov     rdx, QWORD PTR -40[rbp]
        mov     rax, QWORD PTR -48[rbp]
        movq    xmm0, rdx
        lea     rdx, .LC17[rip]
        mov     rsi, rdx
        mov     rdi, rax
        mov     eax, 1
        call    fprintf@PLT                     # В функцию frpintf передаются 3 параметра через регистры
                                                # rdi, rsi, xmm0: File* ofst1, char* .LC17, double calcTime
                                                # Возвращаемый результат сохраняется в eax, но он не используется
        mov     rax, QWORD PTR -48[rbp]
        mov     rdi, rax
        call    fclose@PLT                      # В функцию fclose передается 1 параметр через
                                                # регистр rdi: FILE* ofst1
                                                # сохраняется возвращаемый результат в eax, но не используется дальше
        mov     eax, 0
.L10:
        leave
        ret
        .size   main, .-main
        .section        .rodata
        .align 8
.LC12:
        .long   0
        .long   1093567618
