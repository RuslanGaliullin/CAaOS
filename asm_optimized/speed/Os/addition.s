	.file	"addition.c"
	.text
	.globl	CheckSimilarPoints
	.type	CheckSimilarPoints, @function
CheckSimilarPoints:
.LFB26:
	.cfi_startproc
	endbr64
	movl	$1, %eax
.L8:
	movq	%rax, %rdx
.L2:
	cmpl	$3, %edx
	je	.L13
	movsd	-8(%rdi,%rax,8), %xmm0
	ucomisd	(%rdi,%rdx,8), %xmm0
	jp	.L3
	jne	.L3
	movsd	-8(%rsi,%rax,8), %xmm0
	ucomisd	(%rsi,%rdx,8), %xmm0
	jp	.L3
	je	.L9
.L3:
	incq	%rdx
	jmp	.L2
.L13:
	incq	%rax
	cmpq	$4, %rax
	jne	.L8
	xorl	%eax, %eax
	ret
.L9:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE26:
	.size	CheckSimilarPoints, .-CheckSimilarPoints
	.globl	FindCenter
	.type	FindCenter, @function
FindCenter:
.LFB27:
	.cfi_startproc
	endbr64
	movaps	%xmm7, %xmm8
	movaps	%xmm3, %xmm9
	movq	%rdi, %rdx
	movq	%rsi, %rax
	mulsd	%xmm2, %xmm8
	mulsd	%xmm6, %xmm9
	subsd	%xmm9, %xmm8
	comisd	.LC0(%rip), %xmm8
	jbe	.L15
	movsd	.LC1(%rip), %xmm9
	xorl	%r8d, %r8d
	comisd	%xmm8, %xmm9
	ja	.L14
.L15:
	mulsd	%xmm3, %xmm0
	movl	$1, %r8d
	mulsd	%xmm2, %xmm1
	mulsd	%xmm7, %xmm4
	mulsd	%xmm6, %xmm5
	subsd	%xmm1, %xmm0
	subsd	%xmm5, %xmm4
	mulsd	%xmm0, %xmm6
	mulsd	%xmm0, %xmm7
	mulsd	%xmm4, %xmm2
	mulsd	%xmm4, %xmm3
	subsd	%xmm6, %xmm2
	subsd	%xmm7, %xmm3
	divsd	%xmm8, %xmm2
	divsd	%xmm8, %xmm3
	movsd	%xmm2, (%rdx)
	movsd	%xmm3, (%rax)
.L14:
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE27:
	.size	FindCenter, .-FindCenter
	.globl	CheckCircle
	.type	CheckCircle, @function
CheckCircle:
.LFB25:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%rsi, %rcx
	movsd	8(%rdi), %xmm8
	movsd	(%rdi), %xmm11
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movsd	8(%rsi), %xmm2
	movsd	(%rsi), %xmm10
	movq	$0x000000000, 8(%rsp)
	movq	$0x000000000, 16(%rsp)
	movsd	16(%rdi), %xmm4
	movsd	16(%rsi), %xmm6
	call	CheckSimilarPoints
	testl	%eax, %eax
	je	.L21
.L24:
	movl	$1, %r10d
	jmp	.L20
.L21:
	movaps	%xmm4, %xmm7
	movaps	%xmm8, %xmm3
	movaps	%xmm2, %xmm5
	movq	%rdi, %r9
	subsd	%xmm8, %xmm7
	movaps	%xmm2, %xmm9
	addsd	%xmm6, %xmm5
	movl	%eax, %r10d
	subsd	%xmm11, %xmm3
	movq	.LC3(%rip), %xmm0
	addsd	%xmm8, %xmm4
	movsd	.LC4(%rip), %xmm1
	addsd	%xmm10, %xmm9
	subsd	%xmm2, %xmm6
	xorps	%xmm0, %xmm7
	subsd	%xmm10, %xmm2
	leaq	16(%rsp), %rsi
	mulsd	%xmm1, %xmm5
	xorps	%xmm0, %xmm3
	movaps	%xmm8, %xmm0
	addsd	%xmm11, %xmm0
	mulsd	%xmm1, %xmm4
	leaq	8(%rsp), %rdi
	mulsd	%xmm1, %xmm0
	mulsd	%xmm9, %xmm1
	call	FindCenter
	testl	%eax, %eax
	je	.L20
	movsd	8(%rsp), %xmm1
	movsd	16(%rsp), %xmm2
	movaps	%xmm1, %xmm0
	movaps	%xmm2, %xmm3
	subsd	24(%r9), %xmm0
	subsd	24(%rcx), %xmm3
	subsd	%xmm11, %xmm1
	subsd	%xmm10, %xmm2
	mulsd	%xmm0, %xmm0
	mulsd	%xmm3, %xmm3
	mulsd	%xmm1, %xmm1
	mulsd	%xmm2, %xmm2
	addsd	%xmm3, %xmm0
	addsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movsd	.LC1(%rip), %xmm1
	comisd	%xmm0, %xmm1
	jbe	.L20
	comisd	.LC0(%rip), %xmm0
	ja	.L24
.L20:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	je	.L25
	call	__stack_chk_fail@PLT
.L25:
	movl	%r10d, %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	CheckCircle, .-CheckCircle
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"All points belong to the one circle\n"
.LC6:
	.string	"The points don't belong to the one circle\n"
.LC7:
	.string	"Points: (%lf, %lf); (%lf, %lf); (%lf, %lf); (%lf, %lf)\n"
	.text
	.globl	Output
	.type	Output, @function
Output:
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%ecx, %ebx
	pushq	%rax
	.cfi_def_cfa_offset 32
	movsd	24(%rdx), %xmm7
	movb	$8, %al
	movsd	24(%rsi), %xmm6
	movsd	16(%rdx), %xmm5
	movsd	16(%rsi), %xmm4
	movsd	8(%rdx), %xmm3
	movsd	8(%rsi), %xmm2
	movsd	(%rdx), %xmm1
	leaq	.LC7(%rip), %rdx
	movsd	(%rsi), %xmm0
	movl	$1, %esi
	call	__fprintf_chk@PLT
	testl	%ebx, %ebx
	leaq	.LC5(%rip), %rdi
	popq	%rdx
	.cfi_def_cfa_offset 24
	leaq	.LC6(%rip), %rax
	movq	%rbp, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	cmove	%rax, %rdi
	jmp	fputs@PLT
	.cfi_endproc
.LFE28:
	.size	Output, .-Output
	.section	.rodata.str1.1
.LC8:
	.string	"%lf"
	.text
	.globl	ReadFromFile
	.type	ReadFromFile, @function
ReadFromFile:
.LFB29:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	.LC8(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xorl	%ebx, %ebx
.L38:
	xorl	%eax, %eax
	leaq	(%r12,%rbx), %rdx
	movq	%r14, %rsi
	movq	%rbp, %rdi
	call	__isoc99_fscanf@PLT
	incl	%eax
	je	.L37
	xorl	%eax, %eax
	leaq	0(%r13,%rbx), %rdx
	movq	%r14, %rsi
	movq	%rbp, %rdi
	call	__isoc99_fscanf@PLT
	incl	%eax
	je	.L37
	addq	$8, %rbx
	cmpq	$32, %rbx
	jne	.L38
	xorl	%eax, %eax
	jmp	.L36
.L37:
	movl	$2, %eax
.L36:
	popq	%rbx
	.cfi_def_cfa_offset 40
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
.LFE29:
	.size	ReadFromFile, .-ReadFromFile
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-1998362383
	.long	-1092290379
	.align 8
.LC1:
	.long	-1998362383
	.long	1055193269
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC4:
	.long	0
	.long	1071644672
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
