	.file	"main.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"incorrect command line!\n  Waited:\n     command -c outfile     in console: x0 y0 x1 y1 x2 y2 x3 y4  Or:\n     command -r outfile  Or:\n     command -f infile outfile"
	.text
	.p2align 4
	.globl	errMessage1
	.type	errMessage1, @function
errMessage1:
.LFB51:
	.cfi_startproc
	endbr64
	leaq	.LC0(%rip), %rdi
	jmp	puts@PLT
	.cfi_endproc
.LFE51:
	.size	errMessage1, .-errMessage1
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"incorrect data in the input file or in console!\n  Waited:\n     x0 y0 x1 y1 x2 y2 x3 y4"
	.text
	.p2align 4
	.globl	errMessage2
	.type	errMessage2, @function
errMessage2:
.LFB52:
	.cfi_startproc
	endbr64
	leaq	.LC1(%rip), %rdi
	jmp	puts@PLT
	.cfi_endproc
.LFE52:
	.size	errMessage2, .-errMessage2
	.p2align 4
	.globl	GenerateRandomCoordinates
	.type	GenerateRandomCoordinates, @function
GenerateRandomCoordinates:
.LFB53:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	Y(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	X(%rip), %rbx
	leaq	32(%rbx), %rbp
.L5:
	call	rand@PLT
	pxor	%xmm0, %xmm0
	addq	$8, %rbx
	addq	$8, %r12
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$1374389535, %rdx, %rdx
	sarl	$31, %ecx
	sarq	$37, %rdx
	subl	%ecx, %edx
	imull	$100, %edx, %edx
	subl	%edx, %eax
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, -8(%rbx)
	call	rand@PLT
	pxor	%xmm0, %xmm0
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$1374389535, %rdx, %rdx
	sarl	$31, %ecx
	sarq	$37, %rdx
	subl	%ecx, %edx
	imull	$100, %edx, %edx
	subl	%edx, %eax
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, -8(%r12)
	cmpq	%rbp, %rbx
	jne	.L5
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE53:
	.size	GenerateRandomCoordinates, .-GenerateRandomCoordinates
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"r"
.LC3:
	.string	"Cannot open input file %s\n"
.LC4:
	.string	"-c"
.LC5:
	.string	"-r"
.LC7:
	.string	"w"
.LC8:
	.string	"Cannot open %s to write\n"
.LC9:
	.string	"\nCalculation time = %g\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB54:
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
	movslq	%edi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leal	-3(%r13), %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$1, %eax
	ja	.L18
	movq	8(%rsi), %rbp
	movq	%rsi, %r14
	cmpb	$45, 0(%rbp)
	je	.L23
.L12:
	leaq	.LC4(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L24
	leaq	.LC5(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L18
	xorl	%edi, %edi
	leaq	Y(%rip), %r12
	leaq	X(%rip), %rbp
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	xorl	%eax, %eax
	call	GenerateRandomCoordinates
.L15:
	call	clock@PLT
	movl	$60000000, %ebx
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	CheckCircle@PLT
	movl	%eax, %r15d
	subl	$1, %ebx
	jne	.L19
	movl	$10, %edi
	leaq	-8(%r14,%r13,8), %rbx
	call	putchar@PLT
	call	clock@PLT
	pxor	%xmm0, %xmm0
	movl	%r15d, %ecx
	movq	%r12, %rdx
	subq	8(%rsp), %rax
	movq	stdout(%rip), %rdi
	movq	%rbp, %rsi
	cvtsi2sdq	%rax, %xmm0
	mulsd	.LC6(%rip), %xmm0
	movsd	%xmm0, 8(%rsp)
	call	Output@PLT
	movq	(%rbx), %rdi
	leaq	.LC7(%rip), %rsi
	call	fopen@PLT
	movsd	8(%rsp), %xmm0
	testq	%rax, %rax
	movq	%rax, %r13
	je	.L25
	movl	$1, %esi
	movl	$1, %eax
	movq	stdout(%rip), %rdi
	leaq	.LC9(%rip), %r14
	movq	%r14, %rdx
	movsd	%xmm0, 8(%rsp)
	call	__fprintf_chk@PLT
	movl	%r15d, %ecx
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	Output@PLT
	movq	%r14, %rdx
	movl	$1, %esi
	movq	%r13, %rdi
	movsd	8(%rsp), %xmm0
	movl	$1, %eax
	call	__fprintf_chk@PLT
	movq	%r13, %rdi
	call	fclose@PLT
	xorl	%eax, %eax
.L8:
	addq	$24, %rsp
	.cfi_remember_state
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
.L23:
	.cfi_restore_state
	cmpb	$102, 1(%rbp)
	jne	.L12
	cmpb	$0, 2(%rbp)
	jne	.L12
	movq	16(%rsi), %rdi
	leaq	.LC2(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L26
	leaq	Y(%rip), %r12
	leaq	X(%rip), %rbp
	movq	%rax, %rdi
	movq	%r12, %rdx
	movq	%rbp, %rsi
	call	ReadFromFile@PLT
	testl	%eax, %eax
	jne	.L17
	movq	%r15, %rdi
	call	fclose@PLT
	jmp	.L15
.L18:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L8
.L24:
	leaq	Y(%rip), %r12
	leaq	X(%rip), %rbp
	movq	stdin(%rip), %rdi
	movq	%r12, %rdx
	movq	%rbp, %rsi
	call	ReadFromFile@PLT
	testl	%eax, %eax
	je	.L15
.L17:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L8
.L26:
	movq	16(%r14), %rdx
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$3, %eax
	jmp	.L8
.L25:
	movq	(%rbx), %rdx
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$1, %eax
	jmp	.L8
	.cfi_endproc
.LFE54:
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
.LC6:
	.long	-2026084371
	.long	1051772662
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
