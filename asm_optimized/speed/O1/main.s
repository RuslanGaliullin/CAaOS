	.file	"main.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"incorrect command line!\n  Waited:\n     command -c outfile     in console: x0 y0 x1 y1 x2 y2 x3 y4  Or:\n     command -r outfile  Or:\n     command -f infile outfile"
	.text
	.globl	errMessage1
	.type	errMessage1, @function
errMessage1:
.LFB51:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
	.size	errMessage1, .-errMessage1
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"incorrect data in the input file or in console!\n  Waited:\n     x0 y0 x1 y1 x2 y2 x3 y4"
	.text
	.globl	errMessage2
	.type	errMessage2, @function
errMessage2:
.LFB52:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE52:
	.size	errMessage2, .-errMessage2
	.globl	GenerateRandomCoordinates
	.type	GenerateRandomCoordinates, @function
GenerateRandomCoordinates:
.LFB53:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	X(%rip), %rbx
	leaq	Y(%rip), %rbp
	leaq	32(%rbx), %r12
.L6:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	sarq	$37, %rdx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$100, %edx, %edx
	subl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, (%rbx)
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	sarq	$37, %rdx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$100, %edx, %edx
	subl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, 0(%rbp)
	addq	$8, %rbx
	addq	$8, %rbp
	cmpq	%r12, %rbx
	jne	.L6
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	leal	-3(%rdi), %eax
	cmpl	$1, %eax
	ja	.L22
	movl	%edi, %r14d
	movq	%rsi, %r15
	movq	8(%rsi), %rbx
	leaq	.LC2(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L23
	leaq	.LC5(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L24
	leaq	.LC6(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L17
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, %eax
	call	GenerateRandomCoordinates
.L15:
	call	clock@PLT
	movq	%rax, 8(%rsp)
	movl	$60000000, %ebp
	leaq	Y(%rip), %r13
	leaq	X(%rip), %r12
.L18:
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	CheckCircle@PLT
	movl	%eax, %ebx
	subl	$1, %ebp
	jne	.L18
	movl	$10, %edi
	call	putchar@PLT
	call	clock@PLT
	subq	8(%rsp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC7(%rip), %xmm0
	movq	%xmm0, %r12
	movl	%ebx, %ecx
	leaq	Y(%rip), %rdx
	leaq	X(%rip), %rsi
	movq	stdout(%rip), %rdi
	call	Output@PLT
	movslq	%r14d, %r14
	leaq	-8(%r15,%r14,8), %r13
	leaq	.LC8(%rip), %rsi
	movq	0(%r13), %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L25
	movq	%r12, %xmm0
	leaq	.LC10(%rip), %r13
	movq	%r13, %rdx
	movl	$1, %esi
	movq	stdout(%rip), %rdi
	movl	$1, %eax
	call	__fprintf_chk@PLT
	movl	%ebx, %ecx
	leaq	Y(%rip), %rdx
	leaq	X(%rip), %rsi
	movq	%rbp, %rdi
	call	Output@PLT
	movq	%r12, %xmm0
	movq	%r13, %rdx
	movl	$1, %esi
	movq	%rbp, %rdi
	movl	$1, %eax
	call	__fprintf_chk@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	movl	$0, %eax
.L9:
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
.L22:
	.cfi_restore_state
	movl	$0, %eax
	call	errMessage1
	movl	$1, %eax
	jmp	.L9
.L23:
	movq	16(%r15), %rdi
	leaq	.LC3(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L26
	leaq	Y(%rip), %rdx
	leaq	X(%rip), %rsi
	movq	%rax, %rdi
	call	ReadFromFile@PLT
	testl	%eax, %eax
	jne	.L27
	movq	%rbx, %rdi
	call	fclose@PLT
	jmp	.L15
.L26:
	movq	16(%r15), %rdx
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$3, %eax
	jmp	.L9
.L27:
	movl	$0, %eax
	call	errMessage2
	movl	$2, %eax
	jmp	.L9
.L24:
	leaq	Y(%rip), %rdx
	leaq	X(%rip), %rsi
	movq	stdin(%rip), %rdi
	call	ReadFromFile@PLT
	testl	%eax, %eax
	je	.L15
	movl	$0, %eax
	call	errMessage2
	movl	$2, %eax
	jmp	.L9
.L17:
	movl	$0, %eax
	call	errMessage1
	movl	$1, %eax
	jmp	.L9
.L25:
	movq	0(%r13), %rdx
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$1, %eax
	jmp	.L9
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
