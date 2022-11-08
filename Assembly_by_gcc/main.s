	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	Text
	.bss
	.align 32
	.type	Text, @object
	.size	Text, 10000000
Text:
	.zero	10000000
	.globl	Sub
	.align 32
	.type	Sub, @object
	.size	Sub, 10000000
Sub:
	.zero	10000000
	.globl	Index
	.align 32
	.type	Index, @object
	.size	Index, 40000000
Index:
	.zero	40000000
	.section	.rodata
	.align 8
.LC0:
	.string	"incorrect command line!\n  Waited:\n     command -f size \"word\" infile outfile\n  Or:\n     command -n size \"word\" -c/-r outfile"
	.text
	.globl	errMessage1
	.type	errMessage1, @function
errMessage1:
	endbr64
	push	rbp
	mov	rbp, rsp
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	nop
	pop	rbp
	ret
	.size	errMessage1, .-errMessage1
	.section	.rodata
	.align 8
.LC1:
	.string	"incorrect size of substring!\n1 <= size <= %d"
	.text
	.globl	errMessage3
	.type	errMessage3, @function
errMessage3:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	esi, 10000000
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	nop
	pop	rbp
	ret
	.size	errMessage3, .-errMessage3
	.globl	GenerateRandomString
	.type	GenerateRandomString, @function
GenerateRandomString:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L4
.L5:
	call	rand@PLT
	cdq
	shr	edx, 25
	add	eax, edx
	and	eax, 127
	sub	eax, edx
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, Text[rip]
	mov	BYTE PTR [rax+rdx], cl
	add	DWORD PTR -4[rbp], 1
.L4:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L5
	nop
	nop
	leave
	ret
	.size	GenerateRandomString, .-GenerateRandomString
	.section	.rodata
.LC2:
	.string	"-f"
.LC3:
	.string	"r"
.LC4:
	.string	"Cannot open input file."
.LC5:
	.string	"-n"
.LC6:
	.string	"-r"
.LC7:
	.string	"-c"
.LC9:
	.string	"w"
.LC10:
	.string	"Cannot open %s to write\n"
.LC11:
	.string	"Calculation time = %g\n"
.LC12:
	.string	"\nCalculation time = %g\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi
	mov	QWORD PTR -80[rbp], rsi
	cmp	DWORD PTR -68[rbp], 4
	jle	.L7
	cmp	DWORD PTR -68[rbp], 6
	jle	.L8
.L7:
	mov	eax, 0
	call	errMessage1
	mov	eax, 1
	jmp	.L9
.L8:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L10
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	jne	.L11
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 3
	jmp	.L9
.L11:
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, 10000000
	lea	rcx, Text[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	ReadFromFile@PLT
	mov	DWORD PTR -4[rbp], eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	edx, 10
	mov	esi, 0
	mov	rdi, rax
	call	strtol@PLT
	mov	DWORD PTR -8[rbp], eax
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, Sub[rip]
	mov	rdi, rax
	call	strcpy@PLT
	jmp	.L12
.L10:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L13
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	edx, 10
	mov	esi, 0
	mov	rdi, rax
	call	strtol@PLT
	mov	DWORD PTR -8[rbp], eax
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, Sub[rip]
	mov	rdi, rax
	call	strcpy@PLT
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -4[rbp], 10000000
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L14
	mov	eax, DWORD PTR -4[rbp]
	mov	edi, eax
	call	GenerateRandomString
	jmp	.L12
.L14:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC7[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L15
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rax, Text[rip]
	mov	rdi, rax
	call	ReadFromConsole@PLT
	mov	DWORD PTR -4[rbp], eax
	jmp	.L12
.L15:
	mov	eax, 0
	call	errMessage1
	mov	eax, 2
	jmp	.L9
.L13:
	mov	eax, 2
	jmp	.L9
.L12:
	cmp	DWORD PTR -8[rbp], 0
	jle	.L16
	cmp	DWORD PTR -8[rbp], 10000000
	jle	.L17
.L16:
	mov	eax, 0
	call	errMessage3
	mov	eax, 3
	jmp	.L9
.L17:
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -16[rbp], 0
	jmp	.L18
.L19:
	mov	edx, DWORD PTR -4[rbp]
	mov	eax, DWORD PTR -8[rbp]
	mov	r8d, edx
	lea	rdx, Text[rip]
	mov	rcx, rdx
	mov	edx, eax
	lea	rax, Sub[rip]
	mov	rsi, rax
	lea	rax, Index[rip]
	mov	rdi, rax
	call	BuildIndexArray@PLT
	mov	DWORD PTR -12[rbp], eax
	add	DWORD PTR -16[rbp], 1
.L18:
	cmp	DWORD PTR -16[rbp], 19
	jle	.L19
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	sub	rax, QWORD PTR -32[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC8[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -48[rbp], xmm0
	mov	rax, QWORD PTR stdout[rip]
	mov	edx, DWORD PTR -12[rbp]
	lea	rcx, Index[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	Output@PLT
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC9[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax
	cmp	QWORD PTR -56[rbp], 0
	jne	.L20
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC10[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L9
.L20:
	mov	edx, DWORD PTR -12[rbp]
	mov	rax, QWORD PTR -56[rbp]
	lea	rcx, Index[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	Output@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdx, QWORD PTR -48[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC11[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC12[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
.L9:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC8:
	.long	0
	.long	1093567618
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
