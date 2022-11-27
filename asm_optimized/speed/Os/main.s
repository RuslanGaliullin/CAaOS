	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"incorrect command line!\n  Waited:\n     command -c outfile     in console: x0 y0 x1 y1 x2 y2 x3 y4  Or:\n     command -r outfile  Or:\n     command -f infile outfile"
	.text
	.globl	errMessage1
	.type	errMessage1, @function
errMessage1:
.LFB36:
	.cfi_startproc
	endbr64
	leaq	.LC0(%rip), %rdi
	jmp	puts@PLT
	.cfi_endproc
.LFE36:
	.size	errMessage1, .-errMessage1
	.section	.rodata.str1.1
.LC1:
	.string	"incorrect data in the input file or in console!\n  Waited:\n     x0 y0 x1 y1 x2 y2 x3 y4"
	.text
	.globl	errMessage2
	.type	errMessage2, @function
errMessage2:
.LFB37:
	.cfi_startproc
	endbr64
	leaq	.LC1(%rip), %rdi
	jmp	puts@PLT
	.cfi_endproc
.LFE37:
	.size	errMessage2, .-errMessage2
	.globl	GenerateRandomCoordinates
	.type	GenerateRandomCoordinates, @function
GenerateRandomCoordinates:
.LFB38:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	Y(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	$100, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	X(%rip), %rbx
	pushq	%rdx
	.cfi_def_cfa_offset 48
	leaq	32(%rbx), %r13
.L4:
	call	rand@PLT
	addq	$8, %rbx
	addq	$8, %r12
	cltd
	idivl	%ebp
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, -8(%rbx)
	call	rand@PLT
	cltd
	idivl	%ebp
	cvtsi2sdl	%edx, %xmm0
	movsd	%xmm0, -8(%r12)
	cmpq	%r13, %rbx
	jne	.L4
	popq	%rax
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	GenerateRandomCoordinates, .-GenerateRandomCoordinates
	.section	.rodata.str1.1
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
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%edi, %rbx
	leal	-3(%rbx), %eax
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$1, %eax
	jbe	.L9
.L17:
	xorl	%eax, %eax
	call	errMessage1
	jmp	.L22
.L9:
	movq	8(%rsi), %r12
	movq	%rsi, %rbp
	leaq	.LC2(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L11
	movq	16(%rbp), %rdi
	leaq	.LC3(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L12
	movq	16(%rbp), %rdx
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$3, %eax
	jmp	.L8
.L12:
	leaq	Y(%rip), %rdx
	leaq	X(%rip), %rsi
	movq	%rax, %rdi
	call	ReadFromFile@PLT
	testl	%eax, %eax
	je	.L13
.L16:
	xorl	%eax, %eax
	call	errMessage2
	movl	$2, %eax
	jmp	.L8
.L13:
	movq	%r12, %rdi
	call	fclose@PLT
	jmp	.L14
.L11:
	leaq	.LC5(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L15
	movq	stdin(%rip), %rdi
	leaq	Y(%rip), %rdx
	leaq	X(%rip), %rsi
	call	ReadFromFile@PLT
	testl	%eax, %eax
	je	.L14
	jmp	.L16
.L15:
	leaq	.LC6(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L17
	xorl	%edi, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	xorl	%eax, %eax
	call	GenerateRandomCoordinates
.L14:
	call	clock@PLT
	leaq	Y(%rip), %r14
	movl	$60000000, %edx
	movq	%rax, %r15
.L18:
	leaq	X(%rip), %r13
	movq	%r14, %rsi
	movl	%edx, 8(%rsp)
	movq	%r13, %rdi
	call	CheckCircle@PLT
	movl	8(%rsp), %edx
	movl	%eax, %r12d
	decl	%edx
	jne	.L18
	movl	$10, %edi
	leaq	-8(%rbp,%rbx,8), %rbx
	call	putchar@PLT
	call	clock@PLT
	movl	%r12d, %ecx
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	stdout(%rip), %rdi
	subq	%r15, %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC7(%rip), %xmm0
	movsd	%xmm0, 8(%rsp)
	call	Output@PLT
	movq	(%rbx), %rdi
	leaq	.LC8(%rip), %rsi
	call	fopen@PLT
	movsd	8(%rsp), %xmm0
	testq	%rax, %rax
	movq	%rax, %rbp
	jne	.L19
	movq	(%rbx), %rdx
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L22:
	movl	$1, %eax
	jmp	.L8
.L19:
	movq	stdout(%rip), %rdi
	leaq	.LC10(%rip), %r15
	movl	$1, %esi
	movb	$1, %al
	movq	%r15, %rdx
	movsd	%xmm0, 8(%rsp)
	call	__fprintf_chk@PLT
	movl	%r12d, %ecx
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	Output@PLT
	movsd	8(%rsp), %xmm0
	movq	%r15, %rdx
	movb	$1, %al
	movl	$1, %esi
	movq	%rbp, %rdi
	call	__fprintf_chk@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	xorl	%eax, %eax
.L8:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.globl	Y
	.bss
	.align 32
	.type	Y, @object
	.size	Y, 32
Y:
	.zero	32
	.globl	X
	.align 32
	.type	X, @object
	.size	X, 32
X:
	.zero	32
	.section	.rodata.cst8,"aM",@progbits,8
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
