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
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -36[rbp], edx
	mov	QWORD PTR -48[rbp], rcx
	mov	DWORD PTR -40[rbp], r8d
	mov	DWORD PTR -4[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	jmp	.L2
.L4:
	mov	eax, DWORD PTR -36[rbp]
	movsx	rdx, eax
	mov	eax, DWORD PTR -8[rbp]
	movsx	rcx, eax
	mov	rax, QWORD PTR -48[rbp]
	add	rcx, rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncmp@PLT
	test	eax, eax
	jne	.L3
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR -8[rbp]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -4[rbp], 1
.L3:
	add	DWORD PTR -8[rbp], 1
.L2:
	mov	eax, DWORD PTR -40[rbp]
	sub	eax, DWORD PTR -36[rbp]
	cmp	DWORD PTR -8[rbp], eax
	jle	.L4
	mov	eax, DWORD PTR -4[rbp]
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
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -36[rbp], edx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC0[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -4[rbp], 1
.L7:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L8
	mov	rax, QWORD PTR -24[rbp]
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
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -36[rbp], edx
	mov	DWORD PTR -4[rbp], 0
.L12:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	je	.L15
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -8[rbp]
	mov	BYTE PTR [rax], dl
	add	DWORD PTR -4[rbp], 1
	cmp	DWORD PTR -8[rbp], -1
	jne	.L12
	jmp	.L11
.L15:
	nop
.L11:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, -1
	jne	.L13
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
.L13:
	mov	eax, DWORD PTR -4[rbp]
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
	mov	QWORD PTR -8[rbp], rdi
	mov	DWORD PTR -12[rbp], esi
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
