	.file	"addition.c"
	.intel_syntax noprefix
	.text
	.globl	BuildIndexArray
	.type	BuildIndexArray, @function
BuildIndexArray:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi                     # QWORD PTR -24[rbp] - это int answ[] сохраняется через rdi
	mov	QWORD PTR -32[rbp], rsi                     # QWORD PTR -32[rbp] - это char sub[] сохраняется через rsi
	mov	DWORD PTR -36[rbp], edx                     # DWORD PTR -36[rbp] - это int size_sub сохраняется через edx
	mov	QWORD PTR -48[rbp], rcx                     # QWORD PTR -48[rbp] - это char A[] сохраняется через rcx
	mov	DWORD PTR -40[rbp], r8d                     # DWORD PTR -40[rbp] - это int size_A сохраняется через r8d
	mov	r14d, 0                                     # r14d - это int j
	mov	r15d, 0                                     # r15d - это int i
	jmp	.L2
.L4:
	mov	eax, DWORD PTR -36[rbp]                     # DWORD PTR -36[rbp] - это int size_sub
	movsx	rdx, eax
	mov	eax, r15d                                   # r15d - это int i
	movsx	rcx, eax
	mov	rax, QWORD PTR -48[rbp]                     # QWORD PTR -48[rbp] - это char A[]
	add	rcx, rax
	mov	rdi, QWORD PTR -32[rbp]                     # QWORD PTR -32[rbp] - это char sub[]
	mov	rsi, rcx
	call	strncmp@PLT                             # В strncmp передается char sub[], &A[i], int size_sub через rdi, rsi, rdx
	test	eax, eax                                # возвращаемое значение сохранено в eax
	jne	.L3
	mov	eax, r14d                                   # r14d - это int j
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]                     # QWORD PTR -24[rbp] - это int answ[]
	add	rdx, rax
	mov	eax, r15d                                   # r15d - это int i
	mov	DWORD PTR [rdx], eax
	add	r14d, 1                                     # r14d - это int j
.L3:
	add	r15d, 1                                     # r15d - это int i
.L2:
	mov	eax, DWORD PTR -40[rbp]                     # DWORD PTR -40[rbp] - это int size_A
	sub	eax, DWORD PTR -36[rbp]                     # DWORD PTR -36[rbp] - это int size_sub
	cmp	r15d, eax                                   # r15d - это int i
	jle	.L4
	mov	eax, r14d                                   # r14d - это int j
	leave
	ret                                             # Возвращается значение переменной j через eax
	.size	BuildIndexArray, .-BuildIndexArray
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	Output
	.type	Output, @function
Output:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi                     # QWORD PTR -24[rbp] - это FILE *ofst сохраняется через rdi
	mov	QWORD PTR -32[rbp], rsi                     # QWORD PTR -32[rbp] - это int array[] сохраняется через rsi
	mov	DWORD PTR -36[rbp], edx                     # DWORD PTR -36[rbp] - это int size сохраняется через edx
	mov	r14d, 0                                     # r14d - это int i
	jmp	.L7
.L8:
	mov	eax, r14d                                   # r14d - это int i
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]                     # QWORD PTR -32[rbp] - это int array[]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rdi, QWORD PTR -24[rbp]                     # QWORD PTR -24[rbp] - это FILE *ofst
	lea	rsi, .LC0[rip]
	mov	eax, 0
	call	fprintf@PLT                             # в fprintf передаются FILE* ofst, char* .LC0, array[i] через rdi, rsi и rdx, возвращаемое значение сохраняется в eax, но оно не используется
	add	r14d, 1                                     # r14d - это int i
.L7:
	mov	eax, r14d                                   # r14d - это int i
	cmp	eax, DWORD PTR -36[rbp]                     # DWORD PTR -36[rbp] - это int size
	jl	.L8
	mov	rsi, QWORD PTR -24[rbp]                     # QWORD PTR -24[rbp] - это FILE *ofst
	mov	edi, 10
	call	fputc@PLT                               # в fputc передаются char 10, FILE* ofst через edi и rsi, возвращаемое значение сохраняется в eax, но оно не используется
	nop
	leave
	ret                                             # Функция Output ничего не возвращает
	.size	Output, .-Output
	.globl	ReadFromFile
	.type	ReadFromFile, @function
ReadFromFile:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi                     # QWORD PTR -24[rbp] - это FILE *fin сохраняется через rdi
	mov	QWORD PTR -32[rbp], rsi                     # QWORD PTR -32[rbp] - char A[] сохраняется через rsi
	mov	DWORD PTR -36[rbp], edx                     # DWORD PTR -36[rbp] - это int max_size сохраняется через edx
	mov	r14d, 0                                     # r14d - это int i
.L12:
	mov	eax, r14d                                   # r14d - это int i
	cmp	eax, DWORD PTR -36[rbp]                     # DWORD PTR -36[rbp] - это int max_size
	je	.L15
	mov	rdi, QWORD PTR -24[rbp]                     # QWORD PTR -24[rbp] - это FILE *fin
	call	fgetc@PLT                               # в fgetc передаются FILE *fin через rdi,
	                                                # возвращаемое значение сохраняется в eax
	mov	DWORD PTR -8[rbp], eax                      # DWORD PTR -8[rbp] - это int ch
	mov	eax, r14d                                   # r14d - это int i
	movsx	rdx, eax
	mov	rax, QWORD PTR -32[rbp]                     # QWORD PTR -32[rbp] - char A[]
	add	rax, rdx
	mov	edx, DWORD PTR -8[rbp]                      # DWORD PTR -8[rbp] - это int ch
	mov	BYTE PTR [rax], dl                          # BYTE PTR [rax] - это A[i], в dl лежит int ch
	add	r14d, 1                                     # r14d - это int i
	cmp	DWORD PTR -8[rbp], -1                       # DWORD PTR -8[rbp] - это int ch
	jne	.L12
	jmp	.L11
.L15:
	nop
.L11:
	mov	eax, r14d                                   # r14d - это int i
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -32[rbp]                     # QWORD PTR -32[rbp] - char A[]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]                     # BYTE PTR [rax] - это A[i - 1]
	cmp	al, -1
	jne	.L13
	mov	eax, r14d                                   # r14d - это int i
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -32[rbp]                     # QWORD PTR -32[rbp] - char A[]
	add	rax, rdx
	mov	BYTE PTR [rax], 0                           # BYTE PTR [rax] - это A[i - 1]
.L13:
	mov	eax, r14d                                   # r14d - это int i
	leave
	ret                                             # Функция ReadFromFile возвращает значение i через eax
	.size	ReadFromFile, .-ReadFromFile
	.globl	ReadFromConsole
	.type	ReadFromConsole, @function
ReadFromConsole:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi                      # QWORD PTR -8[rbp] - это char A[]
	mov	DWORD PTR -12[rbp], esi                     # DWORD PTR -12[rbp] - это int max_size
	mov	rdi, QWORD PTR stdin[rip]
	mov	edx, DWORD PTR -12[rbp]
	mov	rsi, QWORD PTR -8[rbp]
	call	ReadFromFile                            # В функцию ReadFromFile передаются аргументы stdin, char A[], int max_size,
	                                                # возвращаемое значение сохраняется в aex
	leave
	ret                                             # Функция ReadFromConsole возвращает значение ReadFromFile(stdin, A, max_size) через eax
	.size	ReadFromConsole, .-ReadFromConsole
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
