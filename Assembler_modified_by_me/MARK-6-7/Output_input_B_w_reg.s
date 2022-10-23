
        .file   "Output_input_B.c"
        .intel_syntax noprefix
        .text
        .globl  BuildBArray
        .type   BuildBArray, @function
BuildBArray:                                    # Функция BuildBArray принимает 3 параметра:
                                                # int B[], int A[], int size через регистры: rdi, rsi, edx соответственно
                                                # Функция ничего не возвращает
        endbr64
        push    rbp
        mov     rbp, rsp
        mov     r12, rdi                        # в r12 лежит переменная int B[]
        mov     r13, rsi                        # в r13 лежит переменная int A[]
        mov     r14d, edx                       # в r14d лежит переменная int size
        mov     r15d, 1                         # в r15d лежит переменная int i = 1
        jmp     .L2
.L3:
        mov     eax, r15d
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, r13
        add     rax, rdx
        mov     edx, r15d
        sub     edx, 1
        mov     ecx, edx
        shr     ecx, 31
        add     edx, ecx
        sar     edx
        movsx   rdx, edx
        lea     rcx, 0[0+rdx*4]
        mov     rdx, r12
        add     rdx, rcx
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR [rdx], eax
        add     r15d, 2
.L2:
        cmp     r15d, r14d
        jl      .L3
        mov     r15d, 0                         # в r15d переменная int i = 0
        jmp     .L4
.L5:
        mov     eax, r15d
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, r13
        lea     rcx, [rdx+rax]
        mov     eax, r14d
        mov     edx, eax
        shr     edx, 31
        add     eax, edx
        sar     eax
        mov     esi, eax
        mov     eax, r15d
        mov     edx, eax
        shr     edx, 31
        add     eax, edx
        sar     eax
        add     eax, esi
        cdqe
        lea     rdx, 0[0+rax*4]
        add     rdx, r12
        mov     eax, DWORD PTR [rcx]
        mov     DWORD PTR [rdx], eax
        add     r15d, 2
.L4:
        mov     eax, r15d
        cmp     eax, r14d
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
        mov     QWORD PTR -24[rbp], rdi             # в r12 лежит переменная FILE *ofst
        mov     QWORD PTR -32[rbp], rsi             # в r13 лежит переменная int B[]
        mov     DWORD PTR -36[rbp], edx             # в r14d лежит переменная int size
        mov     DWORD PTR -4[rbp], 0                # в r15d лежит переменная int i = 0
        jmp     .L7
.L8:
        mov     eax, r15d
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, r13
        add     rax, rdx
        mov     edx, DWORD PTR [rax]
        mov     rax, r12
        lea     rcx, .LC0[rip]
        mov     rsi, rcx
        mov     rdi, rax
        mov     eax, 0
        call    fprintf@PLT                         # В функцию frpintf передаются 3 параметра через регистры
                                                    # rdi, rsi, edx: FILE* ofst, char* .LC0, int B[i]
                                                    # Возвращаемый результат сохраняется в eax, но он не используется
        add     r15d, 1
.L7:
        cmp     r15d, r14d
        jl      .L8
        mov     rsi, r12
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
        mov     r12, rdi                            # r12 - переменная FILE *fin
        mov     r13, rsi                            # r13 - переменная int A[]
        lea     rdx, -8[rbp]                        # DWORD PTR -8[rbp] - переменная int size
        mov     rax, r12
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
        mov     r15d, 0                             # в r15d лежит переменная int i = 0
        jmp     .L14
.L16:
        mov     eax, r15d
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, r13
        add     rdx, rax
        mov     rax, r12
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
        add     r15d, 1
.L14:
        mov     eax, DWORD PTR -8[rbp]
        cmp     r15d, eax
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
        mov     r14, rdi                                # В r14 лежит переменная int A[]
        mov     r12d, esi                               # в r12d лежит переменная int size
        mov     r13d, 0                                 # в r13d лежит переменная int i = 0
        jmp     .L19
.L20:
        mov     eax, r13d
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, r14
        add     rax, rdx
        mov     rsi, rax
        lea     rax, .LC1[rip]
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_scanf@PLT                      # В функцию fscanf передаются 2 параметра через регистры:
                                                        # rdi, rsi: char* .LC1, int* &A[i]
                                                        # Возвращаемое значение у fscanf в eax, но оно не используется
        add     r13d, 1
.L19:
        cmp     r13d, r12d
        jl      .L20
        nop
        nop
        leave
        ret
        .size   InputArrayFromConsole, .-InputArrayFromConsole
