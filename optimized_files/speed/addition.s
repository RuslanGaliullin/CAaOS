	.file	"addition.c"
	.text
	.globl	BuildIndexArray
	.type	BuildIndexArray, @function
BuildIndexArray:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	subl	%edx, %r8d
	movq	%rsi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%r8d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%edx, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
.L2:
	cmpl	%ebp, %r13d
	jl	.L7
	leaq	(%rcx,%rbp), %rsi
	movq	%rbx, %rdx
	movq	%r15, %rdi
	movq	%rcx, 8(%rsp)
	call	strncmp@PLT
	movq	8(%rsp), %rcx
	testl	%eax, %eax
	jne	.L3
	movslq	%r12d, %rax
	incl	%r12d
	movl	%ebp, (%r14,%rax,4)
.L3:
	incq	%rbp
	jmp	.L2
.L7:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movl	%r12d, %eax
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
.LFE25:
	.size	BuildIndexArray, .-BuildIndexArray
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d "
	.text
	.globl	Output
	.type	Output, @function
Output:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	.LC0(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xorl	%ebx, %ebx
.L9:
	cmpl	%ebx, %r12d
	jle	.L12
	movl	0(%r13,%rbx,4), %ecx
	movq	%r14, %rdx
	movl	$1, %esi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	incq	%rbx
	call	__fprintf_chk@PLT
	jmp	.L9
.L12:
	popq	%rbx
	.cfi_def_cfa_offset 40
	movq	%rbp, %rsi
	movl	$10, %edi
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	fputc@PLT
	.cfi_endproc
.LFE26:
	.size	Output, .-Output
	.globl	ReadFromFile
	.type	ReadFromFile, @function
ReadFromFile:
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%edx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%r13, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xorl	%ebx, %ebx
.L15:
	cmpq	%rbx, %r13
	je	.L17
	movq	%r14, %rdi
	call	fgetc@PLT
	leal	1(%rbx), %r8d
	movb	%al, 0(%rbp,%rbx)
	incq	%rbx
	incl	%eax
	jne	.L15
	jmp	.L14
.L17:
	movl	%r12d, %r8d
.L14:
	movslq	%r8d, %rax
	leaq	-1(%rbp,%rax), %rax
	cmpb	$-1, (%rax)
	jne	.L13
	movb	$0, (%rax)
.L13:
	popq	%rbx
	.cfi_def_cfa_offset 40
	movl	%r8d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE27:
	.size	ReadFromFile, .-ReadFromFile
	.globl	ReadFromConsole
	.type	ReadFromConsole, @function
ReadFromConsole:
.LFB28:
	.cfi_startproc
	endbr64
	movl	%esi, %edx
	movq	%rdi, %rsi
	movq	stdin(%rip), %rdi
	jmp	ReadFromFile
	.cfi_endproc
.LFE28:
	.size	ReadFromConsole, .-ReadFromConsole
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
