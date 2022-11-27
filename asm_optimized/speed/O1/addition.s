	.file	"addition.c"
	.text
	.globl	CheckSimilarPoints
	.type	CheckSimilarPoints, @function
CheckSimilarPoints:
.LFB36:
	.cfi_startproc
	endbr64
	movq	%rdi, %rcx
	movl	$1, %edx
.L8:
	movsd	(%rcx), %xmm0
	movq	%rdx, %rax
	jmp	.L6
.L2:
	addq	$1, %rax
	cmpl	$2, %eax
	jg	.L14
.L6:
	ucomisd	(%rdi,%rax,8), %xmm0
	jp	.L2
	jne	.L2
	movsd	-8(%rsi,%rdx,8), %xmm1
	ucomisd	(%rsi,%rax,8), %xmm1
	jp	.L2
	jne	.L2
	movl	$1, %eax
	ret
.L14:
	addq	$1, %rdx
	addq	$8, %rcx
	cmpq	$3, %rdx
	jne	.L8
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE36:
	.size	CheckSimilarPoints, .-CheckSimilarPoints
	.globl	FindCenter
	.type	FindCenter, @function
FindCenter:
.LFB37:
	.cfi_startproc
	endbr64
	movq	%rdi, %rdx
	movq	%rsi, %rax
	movapd	%xmm7, %xmm8
	mulsd	%xmm2, %xmm8
	movapd	%xmm3, %xmm9
	mulsd	%xmm6, %xmm9
	subsd	%xmm9, %xmm8
	comisd	.LC0(%rip), %xmm8
	jbe	.L16
	movl	$0, %ecx
	movsd	.LC1(%rip), %xmm9
	comisd	%xmm8, %xmm9
	ja	.L15
.L16:
	mulsd	%xmm3, %xmm0
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	mulsd	%xmm7, %xmm4
	mulsd	%xmm6, %xmm5
	subsd	%xmm5, %xmm4
	mulsd	%xmm4, %xmm2
	mulsd	%xmm0, %xmm6
	subsd	%xmm6, %xmm2
	divsd	%xmm8, %xmm2
	movsd	%xmm2, (%rdx)
	mulsd	%xmm4, %xmm3
	mulsd	%xmm0, %xmm7
	subsd	%xmm7, %xmm3
	divsd	%xmm8, %xmm3
	movsd	%xmm3, (%rax)
	movl	$1, %ecx
.L15:
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE37:
	.size	FindCenter, .-FindCenter
	.globl	CheckCircle
	.type	CheckCircle, @function
CheckCircle:
.LFB35:
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movq	8(%rdi), %r12
	movsd	(%rdi), %xmm6
	movsd	%xmm6, 8(%rsp)
	movsd	8(%rsi), %xmm2
	movsd	%xmm2, 24(%rsp)
	movsd	(%rsi), %xmm9
	movsd	%xmm9, 16(%rsp)
	movq	16(%rdi), %r14
	movq	16(%rsi), %r15
	movq	$0x000000000, 40(%rsp)
	movq	$0x000000000, 48(%rsp)
	call	CheckSimilarPoints
	movl	%eax, %r13d
	movl	$1, %eax
	testl	%r13d, %r13d
	je	.L30
.L21:
	movq	56(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L31
	addq	$72, %rsp
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
.L30:
	.cfi_restore_state
	movq	%r14, %xmm7
	movq	%r12, %xmm4
	subsd	%xmm4, %xmm7
	movq	.LC3(%rip), %xmm0
	xorpd	%xmm0, %xmm7
	movq	%r15, %xmm5
	movsd	24(%rsp), %xmm2
	addsd	%xmm2, %xmm5
	movsd	.LC4(%rip), %xmm1
	movq	%r14, %xmm4
	movq	%r12, %xmm3
	addsd	%xmm3, %xmm4
	movsd	8(%rsp), %xmm6
	subsd	%xmm6, %xmm3
	xorpd	%xmm0, %xmm3
	movapd	%xmm2, %xmm8
	movsd	16(%rsp), %xmm9
	addsd	%xmm9, %xmm8
	movq	%r12, %xmm0
	addsd	%xmm6, %xmm0
	mulsd	%xmm1, %xmm0
	leaq	48(%rsp), %rsi
	leaq	40(%rsp), %rdi
	movq	%r15, %xmm10
	subsd	%xmm2, %xmm10
	movapd	%xmm10, %xmm6
	mulsd	%xmm1, %xmm5
	mulsd	%xmm1, %xmm4
	subsd	%xmm9, %xmm2
	mulsd	%xmm8, %xmm1
	call	FindCenter
	testl	%eax, %eax
	je	.L21
	movsd	40(%rsp), %xmm0
	movapd	%xmm0, %xmm1
	subsd	24(%rbp), %xmm1
	movsd	48(%rsp), %xmm2
	movapd	%xmm2, %xmm3
	subsd	24(%rbx), %xmm3
	subsd	8(%rsp), %xmm0
	subsd	16(%rsp), %xmm2
	mulsd	%xmm1, %xmm1
	mulsd	%xmm3, %xmm3
	addsd	%xmm3, %xmm1
	mulsd	%xmm0, %xmm0
	mulsd	%xmm2, %xmm2
	addsd	%xmm2, %xmm0
	subsd	%xmm0, %xmm1
	movsd	.LC1(%rip), %xmm0
	movl	%r13d, %eax
	comisd	%xmm1, %xmm0
	jbe	.L21
	comisd	.LC0(%rip), %xmm1
	seta	%al
	movzbl	%al, %eax
	jmp	.L21
.L31:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE35:
	.size	CheckCircle, .-CheckCircle
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"All points belong to the one circle\n"
	.align 8
.LC6:
	.string	"The points don't belong to the one circle\n"
	.align 8
.LC7:
	.string	"Points: (%lf, %lf); (%lf, %lf); (%lf, %lf); (%lf, %lf)\n"
	.text
	.globl	Output
	.type	Output, @function
Output:
.LFB38:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbx
	movl	%ecx, %ebp
	movsd	24(%rdx), %xmm7
	movsd	24(%rsi), %xmm6
	movsd	16(%rdx), %xmm5
	movsd	16(%rsi), %xmm4
	movsd	8(%rdx), %xmm3
	movsd	8(%rsi), %xmm2
	movsd	(%rdx), %xmm1
	movsd	(%rsi), %xmm0
	leaq	.LC7(%rip), %rdx
	movl	$1, %esi
	movl	$8, %eax
	call	__fprintf_chk@PLT
	testl	%ebp, %ebp
	leaq	.LC5(%rip), %rdi
	leaq	.LC6(%rip), %rax
	cmove	%rax, %rdi
	movq	%rbx, %rsi
	call	fputs@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	Output, .-Output
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC8:
	.string	"%lf"
	.text
	.globl	ReadFromFile
	.type	ReadFromFile, @function
ReadFromFile:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbp
	movq	%rsi, %r13
	movq	%rdx, %r14
	movl	$0, %ebx
	leaq	.LC8(%rip), %r12
.L38:
	leaq	0(%r13,%rbx), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$-1, %eax
	je	.L39
	leaq	(%r14,%rbx), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$-1, %eax
	je	.L40
	addq	$8, %rbx
	cmpq	$32, %rbx
	jne	.L38
	movl	$0, %eax
.L36:
	popq	%rbx
	.cfi_remember_state
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
.L39:
	.cfi_restore_state
	movl	$2, %eax
	jmp	.L36
.L40:
	movl	$2, %eax
	jmp	.L36
	.cfi_endproc
.LFE39:
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
