	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	X
	.bss
	.align 32
	.type	X, @object
	.size	X, 32
X:
	.zero	32
	.globl	Y
	.align 32
	.type	Y, @object
	.size	Y, 32
Y:
	.zero	32
	.section	.rodata
	.align 8
.LC0:
	.string	"incorrect command line!\n  Waited:\n     command -c outfile     in console: x0 y0 x1 y1 x2 y2 x3 y4  Or:\n     command -r outfile  Or:\n     command -f infile outfile"
	.text
	.globl	errMessage1
	.type	errMessage1, @function
errMessage1:
	endbr64
	push	rbp
	mov	rbp, rsp
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	nop
	pop	rbp
	ret
	.size	errMessage1, .-errMessage1
	.section	.rodata
	.align 8
.LC1:
	.string	"incorrect data in the input file or in console!\n  Waited:\n     x0 y0 x1 y1 x2 y2 x3 y4"
	.text
	.globl	errMessage2
	.type	errMessage2, @function
errMessage2:
	endbr64
	push	rbp
	mov	rbp, rsp
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	nop
	pop	rbp
	ret
	.size	errMessage2, .-errMessage2
	.globl	GenerateRandomCoordinates
	.type	GenerateRandomCoordinates, @function
GenerateRandomCoordinates:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], 0
	jmp	.L4
.L5:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	sar	edx, 5
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 100
	sub	eax, ecx
	mov	edx, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, edx
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, X[rip]
	movsd	QWORD PTR [rdx+rax], xmm0
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	sar	edx, 5
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 100
	sub	eax, ecx
	mov	edx, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, edx
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, Y[rip]
	movsd	QWORD PTR [rdx+rax], xmm0
	add	DWORD PTR -4[rbp], 1
.L4:
	cmp	DWORD PTR -4[rbp], 3
	jle	.L5
	nop
	nop
	leave
	ret
	.size	GenerateRandomCoordinates, .-GenerateRandomCoordinates
	.section	.rodata
.LC2:
	.string	"-f"
.LC3:
	.string	"r"
.LC4:
	.string	"Cannot open input file %s\n"
.LC5:
	.string	"-c"
.LC6:
	.string	"-r"
.LC8:
	.string	"w"
.LC9:
	.string	"Cannot open %s to write\n"
.LC10:
	.string	"\nCalculation time = %g\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	DWORD PTR -52[rbp], edi
	mov	QWORD PTR -64[rbp], rsi
	cmp	DWORD PTR -52[rbp], 3
	je	.L7
	cmp	DWORD PTR -52[rbp], 4
	je	.L7
	mov	eax, 0
	call	errMessage1
	mov	eax, 1
	jmp	.L8
.L7:
	mov	DWORD PTR -4[rbp], 0
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L9
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L10
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 3
	jmp	.L8
.L10:
	mov	rax, QWORD PTR -16[rbp]
	lea	rdx, Y[rip]
	lea	rcx, X[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	ReadFromFile@PLT
	test	eax, eax
	je	.L11
	mov	eax, 0
	call	errMessage2
	mov	eax, 2
	jmp	.L8
.L11:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L12
.L9:
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L13
	mov	rax, QWORD PTR stdin[rip]
	lea	rdx, Y[rip]
	lea	rcx, X[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	ReadFromFile@PLT
	test	eax, eax
	je	.L12
	mov	eax, 0
	call	errMessage2
	mov	eax, 2
	jmp	.L8
.L13:
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L14
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	eax, 0
	call	GenerateRandomCoordinates
	jmp	.L12
.L14:
	mov	eax, 0
	call	errMessage1
	mov	eax, 1
	jmp	.L8
.L12:
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -8[rbp], 0
	jmp	.L15
.L16:
	lea	rax, Y[rip]
	mov	rsi, rax
	lea	rax, X[rip]
	mov	rdi, rax
	call	CheckCircle@PLT
	mov	DWORD PTR -4[rbp], eax
	add	DWORD PTR -8[rbp], 1
.L15:
	cmp	DWORD PTR -8[rbp], 59999999
	jle	.L16
	mov	edi, 10
	call	putchar@PLT
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	sub	rax, QWORD PTR -24[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC7[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0
	mov	rax, QWORD PTR stdout[rip]
	mov	edx, DWORD PTR -4[rbp]
	mov	ecx, edx
	lea	rdx, Y[rip]
	lea	rsi, X[rip]
	mov	rdi, rax
	call	Output@PLT
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	sal	rax, 3
	lea	rdx, -8[rax]
	mov	rax, QWORD PTR -64[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -48[rbp], rax
	cmp	QWORD PTR -48[rbp], 0
	jne	.L17
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	sal	rax, 3
	lea	rdx, -8[rax]
	mov	rax, QWORD PTR -64[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L8
.L17:
	mov	rax, QWORD PTR stdout[rip]
	mov	rdx, QWORD PTR -40[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	edx, DWORD PTR -4[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	ecx, edx
	lea	rdx, Y[rip]
	lea	rsi, X[rip]
	mov	rdi, rax
	call	Output@PLT
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
.L8:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC7:
	.long	0
	.long	1093567618
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
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
