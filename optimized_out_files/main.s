	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"incorrect command line!\n  Waited:\n     command -f size \"word\" infile outfile\n  Or:\n     command -n size \"word\" -c/-r outfile"
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
	.string	"the specified length of the substring does not correspond to reality"
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
	.section	.rodata.str1.1
.LC2:
	.string	"incorrect size of substring!\n1 <= size <= %d\n"
	.text
	.globl	errMessage3
	.type	errMessage3, @function
errMessage3:
.LFB38:
	.cfi_startproc
	endbr64
	movl	$10000000, %edx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE38:
	.size	errMessage3, .-errMessage3
	.globl	check_sub
	.type	check_sub, @function
check_sub:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	%edi, %rbx
	movq	%rsi, %rdi
	call	strlen@PLT
	cmpq	%rax, %rbx
	popq	%rbx
	.cfi_def_cfa_offset 8
	setne	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE39:
	.size	check_sub, .-check_sub
	.globl	GenerateRandomString
	.type	GenerateRandomString, @function
GenerateRandomString:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$128, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	Text(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%r12, %rbx
	pushq	%rdx
	.cfi_def_cfa_offset 48
.L7:
	movl	%ebx, %eax
	subl	%r12d, %eax
	cmpl	%eax, %ebp
	jle	.L11
	call	rand@PLT
	incq	%rbx
	cltd
	idivl	%r13d
	movb	%dl, -1(%rbx)
	jmp	.L7
.L11:
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
.LFE40:
	.size	GenerateRandomString, .-GenerateRandomString
	.section	.rodata.str1.1
.LC3:
	.string	"-f"
.LC4:
	.string	"r"
.LC5:
	.string	"Cannot open input file."
.LC6:
	.string	"-n"
.LC7:
	.string	"-r"
.LC8:
	.string	"-c"
.LC10:
	.string	"w"
.LC11:
	.string	"Cannot open %s to write\n"
.LC12:
	.string	"Calculation time = %g\n"
.LC13:
	.string	"\nCalculation time = %g\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	subl	$5, %edi
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
	cmpl	$1, %edi
	jbe	.L13
.L19:
	xorl	%eax, %eax
	call	errMessage1
	jmp	.L27
.L13:
	movq	8(%rsi), %rbp
	movq	%rsi, %rbx
	leaq	.LC3(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L15
	movq	32(%rbx), %rdi
	leaq	.LC4(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L16
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	jmp	.L28
.L16:
	movl	$10000000, %edx
	leaq	Text(%rip), %rsi
	movq	%rax, %rdi
	call	ReadFromFile@PLT
	movq	%r12, %rdi
	movl	%eax, %ebp
	call	fclose@PLT
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	24(%rbx), %rsi
	movl	$10000000, %edx
	leaq	Sub(%rip), %rdi
	movq	%rax, %r12
	movl	%eax, %r13d
	call	__strcpy_chk@PLT
	movq	24(%rbx), %rdi
	call	strlen@PLT
	movq	%rax, %r8
	movslq	%r12d, %rax
	cmpq	%rax, %r8
	je	.L17
.L20:
	xorl	%eax, %eax
	call	errMessage2
	movl	$2, %eax
	jmp	.L12
.L17:
	decl	%r12d
	cmpl	$9999999, %r12d
	jbe	.L18
.L21:
	xorl	%eax, %eax
	call	errMessage3
.L28:
	movl	$3, %eax
	jmp	.L12
.L15:
	leaq	.LC6(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L19
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	24(%rbx), %rsi
	movl	$10000000, %edx
	leaq	Sub(%rip), %rdi
	movq	%rax, %rbp
	movl	%eax, %r13d
	call	__strcpy_chk@PLT
	movq	24(%rbx), %rdi
	call	strlen@PLT
	movq	%rax, %r8
	movslq	%ebp, %rax
	cmpq	%rax, %r8
	jne	.L20
	decl	%ebp
	cmpl	$9999999, %ebp
	ja	.L21
	xorl	%edi, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movq	32(%rbx), %rbp
	leaq	.LC7(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L22
	movl	$10000000, %edi
	movl	$10000000, %ebp
	call	GenerateRandomString
	jmp	.L18
.L22:
	leaq	.LC8(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L19
	movl	$10000000, %esi
	leaq	Text(%rip), %rdi
	call	ReadFromConsole@PLT
	movl	%eax, %ebp
.L18:
	call	clock@PLT
	movl	$100, %r9d
	leaq	Text(%rip), %rcx
	movq	%rax, %r15
.L23:
	leaq	Index(%rip), %r12
	movl	%ebp, %r8d
	movl	%r13d, %edx
	movl	%r9d, 12(%rsp)
	leaq	Sub(%rip), %rsi
	movq	%r12, %rdi
	call	BuildIndexArray@PLT
	movl	12(%rsp), %r9d
	leaq	Text(%rip), %rcx
	movl	%eax, %r14d
	decl	%r9d
	jne	.L23
	call	clock@PLT
	movq	stdout(%rip), %rdi
	movl	%r14d, %edx
	movq	%r12, %rsi
	subq	%r15, %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC9(%rip), %xmm0
	movq	%xmm0, %r13
	call	Output@PLT
	movq	40(%rbx), %rdi
	leaq	.LC10(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L24
	movq	40(%rbx), %rdx
	leaq	.LC11(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L27:
	movl	$1, %eax
	jmp	.L12
.L24:
	movq	%rax, %rdi
	movl	%r14d, %edx
	movq	%r12, %rsi
	call	Output@PLT
	movq	stdout(%rip), %rdi
	movq	%r13, %xmm0
	movb	$1, %al
	leaq	.LC12(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	%r13, %xmm0
	movq	%rbp, %rdi
	movb	$1, %al
	leaq	.LC13(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	xorl	%eax, %eax
.L12:
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
.LFE41:
	.size	main, .-main
	.globl	Index
	.bss
	.align 32
	.type	Index, @object
	.size	Index, 40000000
Index:
	.zero	40000000
	.globl	Sub
	.align 32
	.type	Sub, @object
	.size	Sub, 10000000
Sub:
	.zero	10000000
	.globl	Text
	.align 32
	.type	Text, @object
	.size	Text, 10000000
Text:
	.zero	10000000
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC9:
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
