        .file   "Output_input_B.c"
        .intel_syntax noprefix
        .text
        .globl  BuildBArray
        .type   BuildBArray, @function
BuildBArray:
        endbr64
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR -24[rbp], rdi
        mov     QWORD PTR -32[rbp], rsi
        mov     DWORD PTR -36[rbp], edx
        mov     DWORD PTR -4[rbp], 1
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
        mov     DWORD PTR -8[rbp], 0
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
Output:
        endbr64
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR -24[rbp], rdi
        mov     QWORD PTR -32[rbp], rsi
        mov     DWORD PTR -36[rbp], edx
        mov     DWORD PTR -4[rbp], 0
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
        call    fprintf@PLT
        add     DWORD PTR -4[rbp], 1
.L7:
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -36[rbp]
        jl      .L8
        mov     rax, QWORD PTR -24[rbp]
        mov     rsi, rax
        mov     edi, 10
        call    fputc@PLT
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
ReadFromFile:
        endbr64
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR -24[rbp], rdi
        mov     QWORD PTR -32[rbp], rsi
        lea     rdx, -8[rbp]
        mov     rax, QWORD PTR -24[rbp]
        lea     rcx, .LC1[rip]
        mov     rsi, rcx
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf@PLT
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
        mov     DWORD PTR -4[rbp], 0
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
        call    __isoc99_fscanf@PLT
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
InputArrayFromConsole:
        endbr64
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR -24[rbp], rdi
        mov     DWORD PTR -28[rbp], esi
        mov     DWORD PTR -4[rbp], 0
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
        call    __isoc99_scanf@PLT
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
