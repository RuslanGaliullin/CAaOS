
        .file   "Output_input_B.c"
        .intel_syntax noprefix
        .text
        .globl  BuildBArray
        .type   BuildBArray, @function
BuildBArray:                                    # Функция BuildBArray принимает 3 параметра:
        endbr64                                 # int B[], int A[], int size через регистры: rdi, rsi, edx соответственно
        push    rbp                             # Функция ничего не возвращает
        mov     rbp, rsp
        mov     QWORD PTR -24[rbp], rdi         # QWORD PTR -24[rbp] - переменная int B[]
        mov     QWORD PTR -32[rbp], rsi         # QWORD PTR -32[rbp] - переменная int A[]
        mov     DWORD PTR -36[rbp], edx         # QWORD PTR -36[rbp] - переменная int size
        mov     DWORD PTR -4[rbp], 1            # DWORD PTR -4[rbp] - переменная int i = 1
        jmp     .L2
.L3:
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -32[rbp]
        add     rax, rdx
        mov     edx, DWORD PTR -4[rbp]
        sub     edx, 1
        mov     ecx, edx
        shr     ecx, 31
        add     edx, ecx
        sar     edx
        movsx   rdx, edx
        lea     rcx, 0[0+rdx*4]
        mov     rdx, QWORD PTR -24[rbp]
        add     rdx, rcx
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR [rdx], eax
        add     DWORD PTR -4[rbp], 2
.L2:
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -36[rbp]
        jl      .L3
        mov     DWORD PTR -8[rbp], 0            # DWORD PTR -8[rbp] - переменная int i = 0
        jmp     .L4
.L5:
        mov     eax, DWORD PTR -8[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -32[rbp]
        lea     rcx, [rdx+rax]
        mov     eax, DWORD PTR -36[rbp]
        mov     edx, eax
        shr     edx, 31
        add     eax, edx
        sar     eax
        mov     esi, eax
        mov     eax, DWORD PTR -8[rbp]
        mov     edx, eax
        shr     edx, 31
        add     eax, edx
        sar     eax
        add     eax, esi
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rdx, rax
        mov     eax, DWORD PTR [rcx]
        mov     DWORD PTR [rdx], eax
        add     DWORD PTR -8[rbp], 2
.L4:
        mov     eax, DWORD PTR -8[rbp]
        cmp     eax, DWORD PTR -36[rbp]
        jl      .L5
        nop
        nop
        pop     rbp
        ret
        .size   BuildBArray, .-BuildBArray
        .section        .rodata
.LC0:
        .string "%d "
        .text
        .globl  Output
        .type   Output, @function
Output:                                             # Функция Output принимает 3 параметра:
        endbr64                                     # FILE* ofst, int B[], int size через регистры: rdi, rsi, edx
        push    rbp                                 # Функция ничего не возвращает
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR -24[rbp], rdi             # QWORD PTR -24[rbp] - переменная FILE *ofst
        mov     QWORD PTR -32[rbp], rsi             # QWORD PTR -32[rbp] - переменная int B[]
        mov     DWORD PTR -36[rbp], edx             # DWORD PTR -36[rbp] - переменная int size
        mov     DWORD PTR -4[rbp], 0                # DWORD PTR -4[rbp] - переменная int i = 0
        jmp     .L7
.L8:
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -32[rbp]
        add     rax, rdx
        mov     edx, DWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        lea     rcx, .LC0[rip]
        mov     rsi, rcx
        mov     rdi, rax
        mov     eax, 0
        call    fprintf@PLT                         # В функцию frpintf передаются 3 параметра через регистры
                                                    # rdi, rsi, edx: FILE* ofst, char* .LC0, int B[i]
                                                    # Возвращаемый результат сохраняется в eax, но он не используется
        add     DWORD PTR -4[rbp], 1
.L7:
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -36[rbp]
        jl      .L8
        mov     rax, QWORD PTR -24[rbp]
        mov     rsi, rax
        mov     edi, 10
        call    fputc@PLT                           # В функцию fputc передаются 2 параметра через регистры
                                                    # edi, rsi: int 10 (это '\n'), FILE* ofst
                                                    # Возвращаемый результат сохраняется в eax, но он не используется
        nop
        leave
        ret
        .size   Output, .-Output
        .section        .rodata
.LC1:
        .string "%d"
        .text
        .globl  ReadFromFile
        .type   ReadFromFile, @function
ReadFromFile:                                       # Функция ReadFromFile принимает 2 параметра:
        endbr64                                     # FILE *fin, int A[] через регистры: rdi, rsi, соответственно
        push    rbp                                 # Возвращаемое значение сохраняется в eax - код ошибки или размер
                                                    # считанного массива
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR -24[rbp], rdi             # QWORD PTR -24[rbp] - переменная FILE *fin
        mov     QWORD PTR -32[rbp], rsi             # QWORD PTR -32[rbp] - переменная int A[]
        lea     rdx, -8[rbp]                        # DWORD PTR -8[rbp] - переменная int size
        mov     rax, QWORD PTR -24[rbp]
        lea     rcx, .LC1[rip]
        mov     rsi, rcx
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf@PLT                 # В функцию fscanf передаются 3 параметра через регистры:
                                                    # rdi, rsi, rdx: FILE *fin, char* .LC1, int* &size
                                                    # Возвращаемое значение у fscanf в eax.
        cmp     eax, -1
        jne     .L10
        mov     eax, -1
        jmp     .L17
.L10:
        mov     eax, DWORD PTR -8[rbp]
        test    eax, eax
        jle     .L12
        mov     eax, DWORD PTR -8[rbp]
        cmp     eax, 10000000
        jle     .L13
.L12:
        mov     eax, -2
        jmp     .L17
.L13:
        mov     DWORD PTR -4[rbp], 0                    # DWORD PTR -4[rbp] - переменная int i = 0
        jmp     .L14
.L16:
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -32[rbp]
        add     rdx, rax
        mov     rax, QWORD PTR -24[rbp]
        lea     rcx, .LC1[rip]
        mov     rsi, rcx
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf@PLT                     # В функцию fscanf передаются 3 параметра через регистры:
                                                        # rdi, rsi, rdx: FILE *fin, char* .LC1, int* &A[i]
                                                        # Возвращаемое значение у fscanf в eax.
        cmp     eax, -1
        jne     .L15
        mov     eax, -1
        jmp     .L17
.L15:
        add     DWORD PTR -4[rbp], 1
.L14:
        mov     eax, DWORD PTR -8[rbp]
        cmp     DWORD PTR -4[rbp], eax
        jl      .L16
        mov     eax, DWORD PTR -8[rbp]
.L17:
        leave
        ret
        .size   ReadFromFile, .-ReadFromFile
        .globl  InputArrayFromConsole
        .type   InputArrayFromConsole, @function
InputArrayFromConsole:                                  # Функция InputArrayFromConsole принимает 2 параметра:
        endbr64                                         # int A[], int size через регистры: rdi, esi, соответственно
        push    rbp                                     # Функция ничего не возвращает
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR -24[rbp], rdi                 # QWORD PTR -24[rbp] - переменная int A[]
        mov     DWORD PTR -28[rbp], esi                 # DWORD PTR -28[rbp] - переменная int size
        mov     DWORD PTR -4[rbp], 0                    # DWORD PTR -4[rbp] - переменная int i = 0
        jmp     .L19
.L20:
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     rsi, rax
        lea     rax, .LC1[rip]
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_scanf@PLT                      # В функцию fscanf передаются 2 параметра через регистры:
                                                        # rdi, rsi: char* .LC1, int* &A[i]
                                                        # Возвращаемое значение у fscanf в eax, но оно не используется
        add     DWORD PTR -4[rbp], 1
.L19:
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -28[rbp]
        jl      .L20
        nop
        nop
        leave
        ret
        .size   InputArrayFromConsole, .-InputArrayFromConsole
