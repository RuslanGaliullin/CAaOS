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
	mov	QWORD PTR -24[rbp], rdi                     # QWORD PTR -24[rbp] - это int answ[]
	mov	QWORD PTR -32[rbp], rsi                     # QWORD PTR -32[rbp] - это char sub[]
	mov	DWORD PTR -36[rbp], edx                     # DWORD PTR -36[rbp] - это int size_sub
	mov	QWORD PTR -48[rbp], rcx                     # QWORD PTR -48[rbp] - это char A[]
	mov	DWORD PTR -40[rbp], r8d                     # DWORD PTR -40[rbp] - это int size_A
	mov	DWORD PTR -4[rbp], 0                        # DWORD PTR -4[rbp] - это int j
	mov	DWORD PTR -8[rbp], 0                        # DWORD PTR -8[rbp] - это int i
	jmp	.L2
.L4:
	mov	eax, DWORD PTR -36[rbp]                     # DWORD PTR -36[rbp] - это int size_sub
	movsx	rdx, eax
	mov	eax, DWORD PTR -8[rbp]                      # DWORD PTR -8[rbp] - это int i
	movsx	rcx, eax
	mov	rax, QWORD PTR -48[rbp]                     # QWORD PTR -48[rbp] - это char A[]
	add	rcx, rax
	mov	rax, QWORD PTR -32[rbp]                     # QWORD PTR -32[rbp] - это char sub[]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncmp@PLT
	test	eax, eax
	jne	.L3
	mov	eax, DWORD PTR -4[rbp]                      # DWORD PTR -4[rbp] - это int j
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]                     # QWORD PTR -24[rbp] - это int answ[]
	add	rdx, rax
	mov	eax, DWORD PTR -8[rbp]                      # DWORD PTR -8[rbp] - это int i
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -4[rbp], 1                        # DWORD PTR -4[rbp] - это int j
.L3:
	add	DWORD PTR -8[rbp], 1                        # DWORD PTR -8[rbp] - это int i
.L2:
	mov	eax, DWORD PTR -40[rbp]                     # DWORD PTR -40[rbp] - это int size_A
	sub	eax, DWORD PTR -36[rbp]                     # DWORD PTR -36[rbp] - это int size_sub
	cmp	DWORD PTR -8[rbp], eax                      # DWORD PTR -8[rbp] - это int i
	jle	.L4
	mov	eax, DWORD PTR -4[rbp]                      # DWORD PTR -4[rbp] - это int j
	leave
	ret
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
	mov	QWORD PTR -24[rbp], rdi                     # QWORD PTR -24[rbp] - это FILE *ofst
	mov	QWORD PTR -32[rbp], rsi                     # QWORD PTR -32[rbp] - это int array[]
	mov	DWORD PTR -36[rbp], edx                     # DWORD PTR -36[rbp] - это int size
	mov	DWORD PTR -4[rbp], 0                        # DWORD PTR -4[rbp] - это int i
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -4[rbp]                      # DWORD PTR -4[rbp] - это int i
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]                     # QWORD PTR -32[rbp] - это int array[]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]                     # QWORD PTR -24[rbp] - это FILE *ofst
	lea	rcx, .LC0[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -4[rbp], 1                        # DWORD PTR -4[rbp] - это int i
.L7:
	mov	eax, DWORD PTR -4[rbp]                      # DWORD PTR -4[rbp] - это int i
	cmp	eax, DWORD PTR -36[rbp]                     # DWORD PTR -36[rbp] - это int size
	jl	.L8
	mov	rax, QWORD PTR -24[rbp]                     # QWORD PTR -24[rbp] - это FILE *ofst
	mov	rsi, rax
	mov	edi, 10
	call	fputc@PLT
	nop
	leave
	ret
	.size	Output, .-Output
	.globl	ReadFromFile
	.type	ReadFromFile, @function
ReadFromFile:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi                     # QWORD PTR -24[rbp] - это FILE *fin
	mov	QWORD PTR -32[rbp], rsi                     # QWORD PTR -32[rbp] - char A[]
	mov	DWORD PTR -36[rbp], edx                     # DWORD PTR -36[rbp] - это int max_size
	mov	DWORD PTR -4[rbp], 0                        # DWORD PTR -4[rbp] - это int i
.L12:
	mov	eax, DWORD PTR -4[rbp]                      # DWORD PTR -4[rbp] - это int i
	cmp	eax, DWORD PTR -36[rbp]                     # DWORD PTR -36[rbp] - это int max_size
	je	.L15
	mov	rax, QWORD PTR -24[rbp]                     # QWORD PTR -24[rbp] - это FILE *fin
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -8[rbp], eax                      # DWORD PTR -8[rbp] - это int ch
	mov	eax, DWORD PTR -4[rbp]                      # DWORD PTR -4[rbp] - это int i
	movsx	rdx, eax
	mov	rax, QWORD PTR -32[rbp]                     # QWORD PTR -32[rbp] - char A[]
	add	rax, rdx
	mov	edx, DWORD PTR -8[rbp]                      # DWORD PTR -8[rbp] - это int ch
	mov	BYTE PTR [rax], dl                          # BYTE PTR [rax] - это A[i], в dl лежит int ch
	add	DWORD PTR -4[rbp], 1                        # DWORD PTR -4[rbp] - это int i
	cmp	DWORD PTR -8[rbp], -1                       # DWORD PTR -8[rbp] - это int ch
	jne	.L12
	jmp	.L11
.L15:
	nop
.L11:
	mov	eax, DWORD PTR -4[rbp]                      # DWORD PTR -4[rbp] - это int i
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -32[rbp]                     # QWORD PTR -32[rbp] - char A[]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]                     # BYTE PTR [rax] - это A[i - 1]
	cmp	al, -1
	jne	.L13
	mov	eax, DWORD PTR -4[rbp]                      # DWORD PTR -4[rbp] - это int i
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -32[rbp]                     # QWORD PTR -32[rbp] - char A[]
	add	rax, rdx
	mov	BYTE PTR [rax], 0                           # BYTE PTR [rax] - это A[i - 1]
.L13:
	mov	eax, DWORD PTR -4[rbp]                      # DWORD PTR -4[rbp] - это int i
	leave
	ret
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
	mov	rax, QWORD PTR stdin[rip]
	mov	edx, DWORD PTR -12[rbp]
	mov	rcx, QWORD PTR -8[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	ReadFromFile
	leave
	ret
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
