	.file	"addition.c"
	.intel_syntax noprefix
	.text
	.globl	CheckCircle
	.type	CheckCircle, @function
CheckCircle:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 144
	mov	QWORD PTR -136[rbp], rdi
	mov	QWORD PTR -144[rbp], rsi
	mov	rax, QWORD PTR -136[rbp]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR -136[rbp]
	movsd	xmm1, QWORD PTR [rax]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR -144[rbp]
	movsd	xmm1, QWORD PTR [rax]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR -16[rbp]
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	xmm1, QWORD PTR .LC0[rip]
	xorpd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0
	mov	rax, QWORD PTR -136[rbp]
	add	rax, 8
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR -136[rbp]
	movsd	xmm0, QWORD PTR [rax]
	addsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 8
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR -144[rbp]
	movsd	xmm0, QWORD PTR [rax]
	addsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -48[rbp], xmm0
	mov	rax, QWORD PTR -136[rbp]
	add	rax, 16
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR -136[rbp]
	add	rax, 8
	movsd	xmm1, QWORD PTR [rax]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -56[rbp], xmm0
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 16
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 8
	movsd	xmm1, QWORD PTR [rax]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -64[rbp], xmm0
	movsd	xmm0, QWORD PTR -64[rbp]
	movsd	QWORD PTR -72[rbp], xmm0
	movsd	xmm0, QWORD PTR -56[rbp]
	movq	xmm1, QWORD PTR .LC0[rip]
	xorpd	xmm0, xmm1
	movsd	QWORD PTR -80[rbp], xmm0
	mov	rax, QWORD PTR -136[rbp]
	add	rax, 16
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR -136[rbp]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	addsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -88[rbp], xmm0
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 16
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	addsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -96[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -120[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -128[rbp], xmm0
	mov	rdx, QWORD PTR -144[rbp]
	mov	rax, QWORD PTR -136[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	CheckSimilarPoints
	test	eax, eax
	je	.L2
	mov	eax, 1
	jmp	.L9
.L2:
	movsd	xmm6, QWORD PTR -80[rbp]
	movsd	xmm5, QWORD PTR -72[rbp]
	movsd	xmm4, QWORD PTR -96[rbp]
	movsd	xmm3, QWORD PTR -88[rbp]
	movsd	xmm2, QWORD PTR -32[rbp]
	movsd	xmm1, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR -48[rbp]
	mov	rcx, QWORD PTR -40[rbp]
	lea	rdx, -128[rbp]
	lea	rax, -120[rbp]
	movapd	xmm7, xmm6
	movapd	xmm6, xmm5
	movapd	xmm5, xmm4
	movapd	xmm4, xmm3
	movapd	xmm3, xmm2
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rcx
	mov	rsi, rdx
	mov	rdi, rax
	call	FindCenter
	test	eax, eax
	jne	.L4
	mov	eax, 0
	jmp	.L9
.L4:
	movsd	xmm0, QWORD PTR -120[rbp]
	mov	rax, QWORD PTR -136[rbp]
	add	rax, 24
	movsd	xmm2, QWORD PTR [rax]
	movapd	xmm1, xmm0
	subsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR -120[rbp]
	mov	rax, QWORD PTR -136[rbp]
	add	rax, 24
	movsd	xmm2, QWORD PTR [rax]
	subsd	xmm0, xmm2
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -128[rbp]
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 24
	movsd	xmm3, QWORD PTR [rax]
	movapd	xmm2, xmm0
	subsd	xmm2, xmm3
	movsd	xmm0, QWORD PTR -128[rbp]
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 24
	movsd	xmm3, QWORD PTR [rax]
	subsd	xmm0, xmm3
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	movsd	QWORD PTR -104[rbp], xmm0
	movsd	xmm0, QWORD PTR -120[rbp]
	mov	rax, QWORD PTR -136[rbp]
	movsd	xmm2, QWORD PTR [rax]
	movapd	xmm1, xmm0
	subsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR -120[rbp]
	mov	rax, QWORD PTR -136[rbp]
	movsd	xmm2, QWORD PTR [rax]
	subsd	xmm0, xmm2
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -128[rbp]
	mov	rax, QWORD PTR -144[rbp]
	movsd	xmm3, QWORD PTR [rax]
	movapd	xmm2, xmm0
	subsd	xmm2, xmm3
	movsd	xmm0, QWORD PTR -128[rbp]
	mov	rax, QWORD PTR -144[rbp]
	movsd	xmm3, QWORD PTR [rax]
	subsd	xmm0, xmm3
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	movsd	QWORD PTR -112[rbp], xmm0
	movsd	xmm0, QWORD PTR -104[rbp]
	movapd	xmm1, xmm0
	subsd	xmm1, QWORD PTR -112[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	comisd	xmm0, xmm1
	jbe	.L5
	movsd	xmm0, QWORD PTR -104[rbp]
	subsd	xmm0, QWORD PTR -112[rbp]
	comisd	xmm0, QWORD PTR .LC4[rip]
	jbe	.L5
	mov	eax, 1
	jmp	.L9
.L5:
	mov	eax, 0
.L9:
	leave
	ret
	.size	CheckCircle, .-CheckCircle
	.globl	CheckSimilarPoints
	.type	CheckSimilarPoints, @function
CheckSimilarPoints:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L13
.L20:
	mov	eax, DWORD PTR -4[rbp]
	add	eax, 1
	mov	DWORD PTR -8[rbp], eax
	jmp	.L14
.L19:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movsd	xmm0, QWORD PTR [rax]
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movsd	xmm1, QWORD PTR [rax]
	ucomisd	xmm0, xmm1
	jp	.L15
	ucomisd	xmm0, xmm1
	jne	.L15
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	movsd	xmm0, QWORD PTR [rax]
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	movsd	xmm1, QWORD PTR [rax]
	ucomisd	xmm0, xmm1
	jp	.L15
	ucomisd	xmm0, xmm1
	jne	.L15
	mov	eax, 1
	jmp	.L18
.L15:
	add	DWORD PTR -8[rbp], 1
.L14:
	cmp	DWORD PTR -8[rbp], 2
	jle	.L19
	add	DWORD PTR -4[rbp], 1
.L13:
	cmp	DWORD PTR -4[rbp], 2
	jle	.L20
	mov	eax, 0
.L18:
	pop	rbp
	ret
	.size	CheckSimilarPoints, .-CheckSimilarPoints
	.globl	FindCenter
	.type	FindCenter, @function
FindCenter:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -48[rbp], rsi
	movsd	QWORD PTR -56[rbp], xmm0
	movsd	QWORD PTR -64[rbp], xmm1
	movsd	QWORD PTR -72[rbp], xmm2
	movsd	QWORD PTR -80[rbp], xmm3
	movsd	QWORD PTR -88[rbp], xmm4
	movsd	QWORD PTR -96[rbp], xmm5
	movsd	QWORD PTR -104[rbp], xmm6
	movsd	QWORD PTR -112[rbp], xmm7
	movsd	xmm0, QWORD PTR -112[rbp]
	mulsd	xmm0, QWORD PTR -72[rbp]
	movsd	xmm1, QWORD PTR -80[rbp]
	mulsd	xmm1, QWORD PTR -104[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	comisd	xmm0, QWORD PTR .LC4[rip]
	jbe	.L24
	movsd	xmm0, QWORD PTR .LC3[rip]
	comisd	xmm0, QWORD PTR -8[rbp]
	jbe	.L24
	mov	eax, 0
	jmp	.L27
.L24:
	movsd	xmm0, QWORD PTR -80[rbp]
	mulsd	xmm0, QWORD PTR -56[rbp]
	movsd	xmm1, QWORD PTR -72[rbp]
	mulsd	xmm1, QWORD PTR -64[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR -112[rbp]
	mulsd	xmm0, QWORD PTR -88[rbp]
	movsd	xmm1, QWORD PTR -104[rbp]
	mulsd	xmm1, QWORD PTR -96[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -72[rbp]
	movsd	xmm1, QWORD PTR -16[rbp]
	mulsd	xmm1, QWORD PTR -104[rbp]
	subsd	xmm0, xmm1
	divsd	xmm0, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -40[rbp]
	movsd	QWORD PTR [rax], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -80[rbp]
	movsd	xmm1, QWORD PTR -16[rbp]
	mulsd	xmm1, QWORD PTR -112[rbp]
	subsd	xmm0, xmm1
	divsd	xmm0, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -48[rbp]
	movsd	QWORD PTR [rax], xmm0
	mov	eax, 1
.L27:
	pop	rbp
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
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	QWORD PTR -24[rbp], rdx
	mov	DWORD PTR -28[rbp], ecx
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 24
	movsd	xmm6, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 24
	movsd	xmm5, QWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 16
	movsd	xmm4, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 16
	movsd	xmm3, QWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 8
	movsd	xmm2, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm7, xmm6
	movapd	xmm6, xmm5
	movapd	xmm5, xmm4
	movapd	xmm4, xmm3
	movapd	xmm3, xmm2
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rdx
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 8
	call	fprintf@PLT
	cmp	DWORD PTR -28[rbp], 0
	je	.L31
	lea	rax, .LC6[rip]
	jmp	.L32
.L31:
	lea	rax, .LC7[rip]
.L32:
	mov	rdx, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
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
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L34
.L38:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -32[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC8[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	cmp	eax, -1
	je	.L35
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -40[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC8[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	cmp	eax, -1
	jne	.L36
.L35:
	mov	eax, 2
	jmp	.L37
.L36:
	add	DWORD PTR -4[rbp], 1
.L34:
	cmp	DWORD PTR -4[rbp], 3
	jle	.L38
	mov	eax, 0
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
