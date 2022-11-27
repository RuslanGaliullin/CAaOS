	.file	"main.c"
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
	.section	.text.errMessage1,"ax",@progbits
	.globl	errMessage1
	.type	errMessage1, @function
errMessage1:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	errMessage1, .-errMessage1
	.section	.rodata
	.align 8
.LC1:
	.string	"incorrect data in the input file or in console!\n  Waited:\n     x0 y0 x1 y1 x2 y2 x3 y4"
	.section	.text.errMessage2,"ax",@progbits
	.globl	errMessage2
	.type	errMessage2, @function
errMessage2:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	errMessage2, .-errMessage2
	.section	.text.GenerateRandomCoordinates,"ax",@progbits
	.globl	GenerateRandomCoordinates
	.type	GenerateRandomCoordinates, @function
GenerateRandomCoordinates:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L4
.L5:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$100, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edx, %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	X(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$100, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edx, %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	Y(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L4:
	cmpl	$3, -4(%rbp)
	jle	.L5
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
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
	.section	.text.main,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	cmpl	$3, -52(%rbp)
	je	.L7
	cmpl	$4, -52(%rbp)
	je	.L7
	movl	$0, %eax
	call	errMessage1
	movl	$1, %eax
	jmp	.L8
.L7:
	movl	$0, -48(%rbp)
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L9
	movq	-64(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L10
	movq	-64(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$3, %eax
	jmp	.L8
.L10:
	movq	-40(%rbp), %rax
	leaq	Y(%rip), %rdx
	leaq	X(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	ReadFromFile@PLT
	testl	%eax, %eax
	je	.L11
	movl	$0, %eax
	call	errMessage2
	movl	$2, %eax
	jmp	.L8
.L11:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L12
.L9:
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L13
	movq	stdin(%rip), %rax
	leaq	Y(%rip), %rdx
	leaq	X(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	ReadFromFile@PLT
	testl	%eax, %eax
	je	.L12
	movl	$0, %eax
	call	errMessage2
	movl	$2, %eax
	jmp	.L8
.L13:
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L14
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, %eax
	call	GenerateRandomCoordinates
	jmp	.L12
.L14:
	movl	$0, %eax
	call	errMessage1
	movl	$1, %eax
	jmp	.L8
.L12:
	call	clock@PLT
	movq	%rax, -32(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L15
.L16:
	leaq	Y(%rip), %rax
	movq	%rax, %rsi
	leaq	X(%rip), %rax
	movq	%rax, %rdi
	call	CheckCircle@PLT
	movl	%eax, -48(%rbp)
	addl	$1, -44(%rbp)
.L15:
	cmpl	$59999999, -44(%rbp)
	jle	.L16
	movl	$10, %edi
	call	putchar@PLT
	call	clock@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC7(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movq	stdout(%rip), %rax
	movl	-48(%rbp), %edx
	movl	%edx, %ecx
	leaq	Y(%rip), %rdx
	leaq	X(%rip), %rsi
	movq	%rax, %rdi
	call	Output@PLT
	movl	-52(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L17
	movl	-52(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L8
.L17:
	movq	stdout(%rip), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %xmm0
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movl	-48(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %ecx
	leaq	Y(%rip), %rdx
	leaq	X(%rip), %rsi
	movq	%rax, %rdi
	call	Output@PLT
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %xmm0
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
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
