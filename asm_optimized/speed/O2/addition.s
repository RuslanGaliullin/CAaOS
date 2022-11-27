	.file	"addition.c"
	.text
	.p2align 4
	.globl	CheckSimilarPoints
	.type	CheckSimilarPoints, @function
CheckSimilarPoints:
.LFB36:
	.cfi_startproc
	endbr64
	movsd	(%rdi), %xmm2
	movsd	8(%rdi), %xmm0
	ucomisd	%xmm0, %xmm2
	jp	.L2
	jne	.L2
	movsd	(%rsi), %xmm1
	ucomisd	8(%rsi), %xmm1
	jp	.L2
	je	.L14
.L2:
	movsd	16(%rdi), %xmm1
	ucomisd	%xmm2, %xmm1
	jp	.L6
	jne	.L6
	movsd	(%rsi), %xmm2
	ucomisd	16(%rsi), %xmm2
	jp	.L6
	je	.L14
.L6:
	ucomisd	%xmm0, %xmm1
	jp	.L13
	jne	.L13
	movsd	8(%rsi), %xmm0
	ucomisd	16(%rsi), %xmm0
	jp	.L13
	je	.L14
.L13:
	xorl	%eax, %eax
	ret
.L14:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE36:
	.size	CheckSimilarPoints, .-CheckSimilarPoints
	.p2align 4
	.globl	CheckCircle
	.type	CheckCircle, @function
CheckCircle:
.LFB35:
	.cfi_startproc
	endbr64
	call	CheckSimilarPoints
	testl	%eax, %eax
	je	.L28
	movl	$1, %eax
.L20:
	ret
	.p2align 4,,10
	.p2align 3
.L28:
	movsd	8(%rdi), %xmm2
	movsd	8(%rsi), %xmm8
	movsd	(%rdi), %xmm4
	movsd	16(%rdi), %xmm14
	movsd	(%rsi), %xmm3
	movsd	16(%rsi), %xmm12
	movapd	%xmm2, %xmm0
	movapd	%xmm8, %xmm1
	subsd	%xmm4, %xmm0
	movapd	%xmm14, %xmm7
	movq	.LC0(%rip), %xmm5
	movsd	.LC2(%rip), %xmm13
	subsd	%xmm3, %xmm1
	subsd	%xmm2, %xmm7
	movapd	%xmm12, %xmm9
	subsd	%xmm8, %xmm9
	xorpd	%xmm5, %xmm0
	xorpd	%xmm5, %xmm7
	movapd	%xmm0, %xmm6
	movapd	%xmm1, %xmm5
	mulsd	%xmm7, %xmm5
	mulsd	%xmm9, %xmm6
	subsd	%xmm6, %xmm5
	comisd	.LC1(%rip), %xmm5
	jbe	.L22
	comisd	%xmm5, %xmm13
	ja	.L20
.L22:
	movapd	%xmm2, %xmm6
	movapd	%xmm8, %xmm10
	addsd	%xmm14, %xmm2
	movsd	.LC3(%rip), %xmm11
	addsd	%xmm4, %xmm6
	addsd	%xmm3, %xmm10
	addsd	%xmm12, %xmm8
	mulsd	%xmm11, %xmm2
	mulsd	%xmm11, %xmm6
	mulsd	%xmm11, %xmm10
	mulsd	%xmm11, %xmm8
	mulsd	%xmm7, %xmm2
	mulsd	%xmm0, %xmm6
	mulsd	%xmm1, %xmm10
	mulsd	%xmm9, %xmm8
	subsd	%xmm10, %xmm6
	subsd	%xmm8, %xmm2
	mulsd	%xmm6, %xmm9
	mulsd	%xmm2, %xmm1
	mulsd	%xmm2, %xmm0
	mulsd	%xmm6, %xmm7
	subsd	%xmm9, %xmm1
	subsd	%xmm7, %xmm0
	divsd	%xmm5, %xmm1
	divsd	%xmm5, %xmm0
	movapd	%xmm1, %xmm2
	subsd	%xmm4, %xmm1
	subsd	24(%rdi), %xmm2
	mulsd	%xmm1, %xmm1
	mulsd	%xmm2, %xmm2
	movapd	%xmm0, %xmm5
	subsd	%xmm3, %xmm0
	subsd	24(%rsi), %xmm5
	mulsd	%xmm0, %xmm0
	mulsd	%xmm5, %xmm5
	addsd	%xmm0, %xmm1
	addsd	%xmm5, %xmm2
	subsd	%xmm1, %xmm2
	comisd	%xmm2, %xmm13
	jbe	.L20
	xorl	%eax, %eax
	comisd	.LC1(%rip), %xmm2
	seta	%al
	ret
	.cfi_endproc
.LFE35:
	.size	CheckCircle, .-CheckCircle
	.p2align 4
	.globl	FindCenter
	.type	FindCenter, @function
FindCenter:
.LFB37:
	.cfi_startproc
	endbr64
	movapd	%xmm7, %xmm8
	movapd	%xmm3, %xmm9
	movq	%rdi, %rdx
	movq	%rsi, %rax
	mulsd	%xmm2, %xmm8
	mulsd	%xmm6, %xmm9
	subsd	%xmm9, %xmm8
	comisd	.LC1(%rip), %xmm8
	jbe	.L30
	movsd	.LC2(%rip), %xmm9
	xorl	%r8d, %r8d
	comisd	%xmm8, %xmm9
	ja	.L29
.L30:
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
.L29:
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE37:
	.size	FindCenter, .-FindCenter
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"All points belong to the one circle\n"
	.align 8
.LC5:
	.string	"The points don't belong to the one circle\n"
	.align 8
.LC6:
	.string	"Points: (%lf, %lf); (%lf, %lf); (%lf, %lf); (%lf, %lf)\n"
	.text
	.p2align 4
	.globl	Output
	.type	Output, @function
Output:
.LFB38:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$8, %eax
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%ecx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movsd	24(%rdx), %xmm7
	movsd	24(%rsi), %xmm6
	movsd	16(%rdx), %xmm5
	movsd	16(%rsi), %xmm4
	movsd	8(%rdx), %xmm3
	movsd	8(%rsi), %xmm2
	movsd	(%rdx), %xmm1
	movsd	(%rsi), %xmm0
	leaq	.LC6(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	testl	%ebx, %ebx
	leaq	.LC4(%rip), %rdi
	movq	%rbp, %rsi
	leaq	.LC5(%rip), %rax
	cmove	%rax, %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	fputs@PLT
	.cfi_endproc
.LFE38:
	.size	Output, .-Output
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC7:
	.string	"%lf"
	.text
	.p2align 4
	.globl	ReadFromFile
	.type	ReadFromFile, @function
ReadFromFile:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	.LC7(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xorl	%ebx, %ebx
.L41:
	xorl	%eax, %eax
	leaq	0(%r13,%rbx), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	__isoc99_fscanf@PLT
	cmpl	$-1, %eax
	je	.L40
	xorl	%eax, %eax
	leaq	(%r14,%rbx), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	__isoc99_fscanf@PLT
	cmpl	$-1, %eax
	je	.L40
	addq	$8, %rbx
	cmpq	$32, %rbx
	jne	.L41
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 40
	movl	$2, %eax
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
.LFE39:
	.size	ReadFromFile, .-ReadFromFile
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	-1998362383
	.long	-1092290379
	.align 8
.LC2:
	.long	-1998362383
	.long	1055193269
	.align 8
.LC3:
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
