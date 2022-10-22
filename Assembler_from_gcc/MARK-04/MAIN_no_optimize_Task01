        .file   "main.c"
        .intel_syntax noprefix
        .text
        .globl  A
        .bss
        .align 32
        .type   A, @object
        .size   A, 40000000
A:
        .zero   40000000
        .globl  B
        .align 32
        .type   B, @object
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
errMessage1:
        endbr64
        push    rbp
        mov     rbp, rsp
        lea     rax, .LC0[rip]
        mov     rdi, rax
        call    puts@PLT
        nop
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
errMessage2:
        endbr64
        push    rbp
        mov     rbp, rsp
        lea     rax, .LC1[rip]
        mov     rdi, rax
        call    puts@PLT
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
errMessage3:
        endbr64
        push    rbp
        mov     rbp, rsp
        lea     rax, .LC2[rip]
        mov     rdi, rax
        call    puts@PLT
        nop
        pop     rbp
        ret
        .size   errMessage3, .-errMessage3
        .globl  GenerateRandomArray
        .type   GenerateRandomArray, @function
GenerateRandomArray:
        endbr64
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     DWORD PTR -20[rbp], edi
        mov     DWORD PTR -4[rbp], 0
        jmp     .L5
.L6:
        call    rand@PLT
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
main:
        endbr64
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     DWORD PTR -52[rbp], edi
        mov     QWORD PTR -64[rbp], rsi
        cmp     DWORD PTR -52[rbp], 3
        jle     .L8
        cmp     DWORD PTR -52[rbp], 5
        jle     .L9
.L8:
        mov     eax, 0
        call    errMessage1
        mov     eax, 1
        jmp     .L10
.L9:
        mov     rax, QWORD PTR -64[rbp]
        add     rax, 8
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC3[rip]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp@PLT
        test    eax, eax
        jne     .L11
        mov     rax, QWORD PTR -64[rbp]
        add     rax, 16
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC4[rip]
        mov     rsi, rdx
        mov     rdi, rax
        call    fopen@PLT
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L12
        lea     rax, .LC5[rip]
        mov     rdi, rax
        call    puts@PLT
        mov     eax, 3
        jmp     .L10
.L12:
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, A[rip]
        mov     rsi, rdx
        mov     rdi, rax
        call    ReadFromFile@PLT
        mov     DWORD PTR -4[rbp], eax
        mov     rax, QWORD PTR -16[rbp]
        mov     rdi, rax
        call    fclose@PLT
        cmp     DWORD PTR -4[rbp], -2
        jne     .L13
        mov     eax, DWORD PTR -4[rbp]
        mov     esi, eax
        lea     rax, .LC6[rip]
        mov     rdi, rax
        mov     eax, 0
        call    printf@PLT
        mov     eax, 3
        jmp     .L10
.L13:
        cmp     DWORD PTR -4[rbp], -1
        jne     .L14
        mov     eax, 0
        call    errMessage3
        mov     eax, 3
        jmp     .L10
.L11:
        mov     rax, QWORD PTR -64[rbp]
        add     rax, 8
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC7[rip]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp@PLT
        test    eax, eax
        jne     .L15
        mov     rax, QWORD PTR -64[rbp]
        add     rax, 16
        mov     rax, QWORD PTR [rax]
        mov     edx, 10
        mov     esi, 0
        mov     rdi, rax
        call    strtol@PLT
        mov     DWORD PTR -4[rbp], eax
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
        call    printf@PLT
        mov     eax, 3
        jmp     .L10
.L17:
        mov     edi, 0
        call    time@PLT
        mov     edi, eax
        call    srand@PLT
        mov     rax, QWORD PTR -64[rbp]
        add     rax, 24
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC9[rip]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp@PLT
        test    eax, eax
        jne     .L18
        mov     eax, DWORD PTR -4[rbp]
        mov     edi, eax
        call    GenerateRandomArray
        mov     rax, QWORD PTR stdout[rip]
        mov     rcx, rax
        mov     edx, 16
        mov     esi, 1
        lea     rax, .LC10[rip]
        mov     rdi, rax
        call    fwrite@PLT
        mov     rax, QWORD PTR stdout[rip]
        mov     edx, DWORD PTR -4[rbp]
        lea     rcx, A[rip]
        mov     rsi, rcx
        mov     rdi, rax
        call    Output@PLT
        jmp     .L14
.L18:
        mov     rax, QWORD PTR -64[rbp]
        add     rax, 24
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC11[rip]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp@PLT
        test    eax, eax
        jne     .L14
        mov     eax, DWORD PTR -4[rbp]
        mov     esi, eax
        lea     rax, A[rip]
        mov     rdi, rax
        call    InputArrayFromConsole@PLT
        jmp     .L14
.L15:
        mov     eax, 0
        call    errMessage2
        mov     eax, 2
        jmp     .L10
.L14:
        call    clock@PLT
        mov     QWORD PTR -24[rbp], rax
        mov     eax, DWORD PTR -4[rbp]
        mov     edx, eax
        lea     rax, A[rip]
        mov     rsi, rax
        lea     rax, B[rip]
        mov     rdi, rax
        call    BuildBArray@PLT
        call    clock@PLT
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        sub     rax, QWORD PTR -24[rbp]
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, rax
        movsd   xmm1, QWORD PTR .LC12[rip]
        divsd   xmm0, xmm1
        movsd   QWORD PTR -40[rbp], xmm0
        mov     rax, QWORD PTR stdout[rip]
        mov     rcx, rax
        mov     edx, 15
        mov     esi, 1
        lea     rax, .LC13[rip]
        mov     rdi, rax
        call    fwrite@PLT
        mov     rax, QWORD PTR stdout[rip]
        mov     edx, DWORD PTR -4[rbp]
        lea     rcx, B[rip]
        mov     rsi, rcx
        mov     rdi, rax
        call    Output@PLT
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
        call    fopen@PLT
        mov     QWORD PTR -48[rbp], rax
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
        call    printf@PLT
        mov     eax, 1
        jmp     .L10
.L19:
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, rax
        mov     edx, 15
        mov     esi, 1
        lea     rax, .LC13[rip]
        mov     rdi, rax
        call    fwrite@PLT
        mov     edx, DWORD PTR -4[rbp]
        mov     rax, QWORD PTR -48[rbp]
        lea     rcx, B[rip]
        mov     rsi, rcx
        mov     rdi, rax
        call    Output@PLT
        mov     rax, QWORD PTR stdout[rip]
        mov     rdx, QWORD PTR -40[rbp]
        movq    xmm0, rdx
        lea     rdx, .LC16[rip]
        mov     rsi, rdx
        mov     rdi, rax
        mov     eax, 1
        call    fprintf@PLT
        mov     rdx, QWORD PTR -40[rbp]
        mov     rax, QWORD PTR -48[rbp]
        movq    xmm0, rdx
        lea     rdx, .LC17[rip]
        mov     rsi, rdx
        mov     rdi, rax
        mov     eax, 1
        call    fprintf@PLT
        mov     rax, QWORD PTR -48[rbp]
        mov     rdi, rax
        call    fclose@PLT
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
        .ident  "GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
        .section        .note.GNU-stack,"",@progbits
        .section        .note.gnu.property,"a"
        .align 8
        .long   1f - 0f
        .long   4f - 1f
        .long   5
0:
        .string "GNU"
1:
        .align 8
        .long   0xc0000002
        .long   3f - 2f
2:
        .long   0x3
3:
        .align 8
4:
