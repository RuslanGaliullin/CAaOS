	.file	"addition.c"
	.text
	.globl	CheckCircle
	.type	CheckCircle, @function
CheckCircle:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$144, %rsp
	movq	%rdi, -136(%rbp)
	movq	%rsi, -144(%rbp)
	movq	-136(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm0
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-144(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm0
	movq	-144(%rbp), %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-8(%rbp), %xmm0
	movq	.LC0(%rip), %xmm1
	xorpd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movq	-136(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm1
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC1(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movq	-144(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm1
	movq	-144(%rbp), %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC1(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	movq	-136(%rbp), %rax
	addq	$16, %rax
	movsd	(%rax), %xmm0
	movq	-136(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movq	-144(%rbp), %rax
	addq	$16, %rax
	movsd	(%rax), %xmm0
	movq	-144(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	movsd	-64(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	movsd	-56(%rbp), %xmm0
	movq	.LC0(%rip), %xmm1
	xorpd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
	movq	-136(%rbp), %rax
	addq	$16, %rax
	movsd	(%rax), %xmm1
	movq	-136(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC1(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	movq	-144(%rbp), %rax
	addq	$16, %rax
	movsd	(%rax), %xmm1
	movq	-144(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC1(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -120(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -128(%rbp)
	movq	-144(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	CheckSimilarPoints
	testl	%eax, %eax
	je	.L2
	movl	$1, %eax
	jmp	.L9
.L2:
	movsd	-80(%rbp), %xmm6
	movsd	-72(%rbp), %xmm5
	movsd	-96(%rbp), %xmm4
	movsd	-88(%rbp), %xmm3
	movsd	-32(%rbp), %xmm2
	movsd	-24(%rbp), %xmm1
	movsd	-48(%rbp), %xmm0
	movq	-40(%rbp), %rcx
	leaq	-128(%rbp), %rdx
	leaq	-120(%rbp), %rax
	movapd	%xmm6, %xmm7
	movapd	%xmm5, %xmm6
	movapd	%xmm4, %xmm5
	movapd	%xmm3, %xmm4
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rcx, %xmm0
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	FindCenter
	testl	%eax, %eax
	jne	.L4
	movl	$0, %eax
	jmp	.L9
.L4:
	movsd	-120(%rbp), %xmm0
	movq	-136(%rbp), %rax
	addq	$24, %rax
	movsd	(%rax), %xmm2
	movapd	%xmm0, %xmm1
	subsd	%xmm2, %xmm1
	movsd	-120(%rbp), %xmm0
	movq	-136(%rbp), %rax
	addq	$24, %rax
	movsd	(%rax), %xmm2
	subsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	movsd	-128(%rbp), %xmm0
	movq	-144(%rbp), %rax
	addq	$24, %rax
	movsd	(%rax), %xmm3
	movapd	%xmm0, %xmm2
	subsd	%xmm3, %xmm2
	movsd	-128(%rbp), %xmm0
	movq	-144(%rbp), %rax
	addq	$24, %rax
	movsd	(%rax), %xmm3
	subsd	%xmm3, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -104(%rbp)
	movsd	-120(%rbp), %xmm0
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm2
	movapd	%xmm0, %xmm1
	subsd	%xmm2, %xmm1
	movsd	-120(%rbp), %xmm0
	movq	-136(%rbp), %rax
	movsd	(%rax), %xmm2
	subsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	movsd	-128(%rbp), %xmm0
	movq	-144(%rbp), %rax
	movsd	(%rax), %xmm3
	movapd	%xmm0, %xmm2
	subsd	%xmm3, %xmm2
	movsd	-128(%rbp), %xmm0
	movq	-144(%rbp), %rax
	movsd	(%rax), %xmm3
	subsd	%xmm3, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -112(%rbp)
	movsd	-104(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	subsd	-112(%rbp), %xmm1
	movsd	.LC3(%rip), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L5
	movsd	-104(%rbp), %xmm0
	subsd	-112(%rbp), %xmm0
	comisd	.LC4(%rip), %xmm0
	jbe	.L5
	movl	$1, %eax
	jmp	.L9
.L5:
	movl	$0, %eax
.L9:
	leave
	ret
	.size	CheckCircle, .-CheckCircle
	.globl	CheckSimilarPoints
	.type	CheckSimilarPoints, @function
CheckSimilarPoints:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L13
.L20:
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L14
.L19:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L15
	ucomisd	%xmm1, %xmm0
	jne	.L15
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L15
	ucomisd	%xmm1, %xmm0
	jne	.L15
	movl	$1, %eax
	jmp	.L18
.L15:
	addl	$1, -8(%rbp)
.L14:
	cmpl	$2, -8(%rbp)
	jle	.L19
	addl	$1, -4(%rbp)
.L13:
	cmpl	$2, -4(%rbp)
	jle	.L20
	movl	$0, %eax
.L18:
	popq	%rbp
	ret
	.size	CheckSimilarPoints, .-CheckSimilarPoints
	.globl	FindCenter
	.type	FindCenter, @function
FindCenter:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movsd	%xmm0, -56(%rbp)
	movsd	%xmm1, -64(%rbp)
	movsd	%xmm2, -72(%rbp)
	movsd	%xmm3, -80(%rbp)
	movsd	%xmm4, -88(%rbp)
	movsd	%xmm5, -96(%rbp)
	movsd	%xmm6, -104(%rbp)
	movsd	%xmm7, -112(%rbp)
	movsd	-112(%rbp), %xmm0
	mulsd	-72(%rbp), %xmm0
	movsd	-80(%rbp), %xmm1
	mulsd	-104(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	comisd	.LC4(%rip), %xmm0
	jbe	.L24
	movsd	.LC3(%rip), %xmm0
	comisd	-8(%rbp), %xmm0
	jbe	.L24
	movl	$0, %eax
	jmp	.L27
.L24:
	movsd	-80(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	movsd	-72(%rbp), %xmm1
	mulsd	-64(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-112(%rbp), %xmm0
	mulsd	-88(%rbp), %xmm0
	movsd	-104(%rbp), %xmm1
	mulsd	-96(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	mulsd	-72(%rbp), %xmm0
	movsd	-16(%rbp), %xmm1
	mulsd	-104(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	divsd	-8(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movsd	%xmm0, (%rax)
	movsd	-24(%rbp), %xmm0
	mulsd	-80(%rbp), %xmm0
	movsd	-16(%rbp), %xmm1
	mulsd	-112(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	divsd	-8(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movsd	%xmm0, (%rax)
	movl	$1, %eax
.L27:
	popq	%rbp
	ret
	.size	FindCenter, .-FindCenter
	.section	.rodata
	.align 8
.LC5:
	.string	"Points: (%lf, %lf); (%lf, %lf); (%lf, %lf); (%lf, %lf)\n"
	.align 8
.LC6:
	.string	"All points belong to the one circle\n"
	.align 8
.LC7:
	.string	"The points don't belong to the one circle\n"
	.text
	.globl	Output
	.type	Output, @function
Output:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movq	-24(%rbp), %rax
	addq	$24, %rax
	movsd	(%rax), %xmm6
	movq	-16(%rbp), %rax
	addq	$24, %rax
	movsd	(%rax), %xmm5
	movq	-24(%rbp), %rax
	addq	$16, %rax
	movsd	(%rax), %xmm4
	movq	-16(%rbp), %rax
	addq	$16, %rax
	movsd	(%rax), %xmm3
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm2
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm1
	movq	-24(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movapd	%xmm6, %xmm7
	movapd	%xmm5, %xmm6
	movapd	%xmm4, %xmm5
	movapd	%xmm3, %xmm4
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rdx, %xmm0
	leaq	.LC5(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$8, %eax
	call	fprintf@PLT
	cmpl	$0, -28(%rbp)
	je	.L31
	leaq	.LC6(%rip), %rax
	jmp	.L32
.L31:
	leaq	.LC7(%rip), %rax
.L32:
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs@PLT
	nop
	leave
	ret
	.size	Output, .-Output
	.section	.rodata
.LC8:
	.string	"%lf"
	.text
	.globl	ReadFromFile
	.type	ReadFromFile, @function
ReadFromFile:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L34
.L38:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$-1, %eax
	je	.L35
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$-1, %eax
	jne	.L36
.L35:
	movl	$2, %eax
	jmp	.L37
.L36:
	addl	$1, -4(%rbp)
.L34:
	cmpl	$3, -4(%rbp)
	jle	.L38
	movl	$0, %eax
.L37:
	leave
	ret
	.size	ReadFromFile, .-ReadFromFile
	.section	.rodata
	.align 16
.LC0:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC3:
	.long	-1998362383
	.long	1055193269
	.align 8
.LC4:
	.long	-1998362383
	.long	-1092290379
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
