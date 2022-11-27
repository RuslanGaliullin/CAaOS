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
	mov	QWORD PTR -136[rbp], rdi                       # QWORD PTR -136[rbp] - double X[] параметр передается в функцию через регистр rdi
	mov	QWORD PTR -144[rbp], rsi                       # QWORD PTR -144[rbp] - double Y[] параметр передается в функцию через регистр rsi
	mov	rax, QWORD PTR -136[rbp]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR -136[rbp]                       # QWORD PTR -136[rbp] - double X[]
	movsd	xmm1, QWORD PTR [rax]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0                    # QWORD PTR -8[rbp] - double cx01
	mov	rax, QWORD PTR -144[rbp]                       # QWORD PTR -144[rbp] - double Y[]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR -144[rbp]
	movsd	xmm1, QWORD PTR [rax]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0                   # QWORD PTR -16[rbp] - double cy01
	movsd	xmm0, QWORD PTR -16[rbp]
	movsd	QWORD PTR -24[rbp], xmm0                   # QWORD PTR -24[rbp] - double dx01
	movsd	xmm0, QWORD PTR -8[rbp]                    # QWORD PTR -8[rbp] - double cx01
	movq	xmm1, QWORD PTR .LC0[rip]
	xorpd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0                   # QWORD PTR -32[rbp] -  double dy01
	mov	rax, QWORD PTR -136[rbp]                       # QWORD PTR -136[rbp] - double X[]
	add	rax, 8
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR -136[rbp]
	movsd	xmm0, QWORD PTR [rax]
	addsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0                   # QWORD PTR -40[rbp] - double mx01
	mov	rax, QWORD PTR -144[rbp]                       # QWORD PTR -144[rbp] - double Y[]
	add	rax, 8
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR -144[rbp]                       # QWORD PTR -144[rbp] - double Y[]
	movsd	xmm0, QWORD PTR [rax]
	addsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -48[rbp], xmm0                   # QWORD PTR -48[rbp] - double my01
	mov	rax, QWORD PTR -136[rbp]                       # QWORD PTR -136[rbp] - double X[]
	add	rax, 16
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR -136[rbp]
	add	rax, 8
	movsd	xmm1, QWORD PTR [rax]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -56[rbp], xmm0                   # QWORD PTR -56[rbp] - double cx12
	mov	rax, QWORD PTR -144[rbp]                       # QWORD PTR -144[rbp] - double Y[]
	add	rax, 16
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR -144[rbp]                       # QWORD PTR -144[rbp] - double Y[]
	add	rax, 8
	movsd	xmm1, QWORD PTR [rax]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -64[rbp], xmm0                   # QWORD PTR -64[rbp] - double cy12
	movsd	xmm0, QWORD PTR -64[rbp]
	movsd	QWORD PTR -72[rbp], xmm0                   # QWORD PTR -72[rbp] - double dx12
	movsd	xmm0, QWORD PTR -56[rbp]                   # QWORD PTR -56[rbp] - double cx12
	movq	xmm1, QWORD PTR .LC0[rip]
	xorpd	xmm0, xmm1
	movsd	QWORD PTR -80[rbp], xmm0                   # QWORD PTR -80[rbp] - double dy12
	mov	rax, QWORD PTR -136[rbp]                       # QWORD PTR -136[rbp] - double X[]
	add	rax, 16
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR -136[rbp]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	addsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -88[rbp], xmm0                   # QWORD PTR -88[rbp] - double mx12
	mov	rax, QWORD PTR -144[rbp]                       # QWORD PTR -144[rbp] - double Y[]
	add	rax, 16
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR -144[rbp]                       # QWORD PTR -144[rbp] - double Y[]
	add	rax, 8
	movsd	xmm0, QWORD PTR [rax]
	addsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -96[rbp], xmm0                  # QWORD PTR -96[rbp] - double my12
	pxor	xmm0, xmm0
	movsd	QWORD PTR -120[rbp], xmm0                 # QWORD PTR -120[rbp] - double center_x = 0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -128[rbp], xmm0                 # QWORD PTR -128[rbp] - double center_y = 0
	mov	rdx, QWORD PTR -144[rbp]                      # QWORD PTR -144[rbp] - double Y[]
	mov	rax, QWORD PTR -136[rbp]                      # QWORD PTR -136[rbp] - double X[]
	mov	rsi, rdx
	mov	rdi, rax
	call	CheckSimilarPoints
	test	eax, eax
	je	.L2
	mov	eax, 1
	jmp	.L9
.L2:
	movsd	xmm6, QWORD PTR -80[rbp]                    # QWORD PTR -80[rbp] - double dy12
	movsd	xmm5, QWORD PTR -72[rbp]                    # QWORD PTR -72[rbp] - double dx12
	movsd	xmm4, QWORD PTR -96[rbp]                    # QWORD PTR -96[rbp] - double my12
	movsd	xmm3, QWORD PTR -88[rbp]                    # QWORD PTR -88[rbp] - double mx12
	movsd	xmm2, QWORD PTR -32[rbp]                    # QWORD PTR -32[rbp] -  double dy01
	movsd	xmm1, QWORD PTR -24[rbp]                    # QWORD PTR -24[rbp] - double dx01
	movsd	xmm0, QWORD PTR -48[rbp]                    # QWORD PTR -48[rbp] - double my01
	mov	rcx, QWORD PTR -40[rbp]                         # QWORD PTR -40[rbp] - double mx01
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
	movsd	xmm0, QWORD PTR -120[rbp]                    # QWORD PTR -120[rbp] - double center_x
	mov	rax, QWORD PTR -136[rbp]                         # QWORD PTR -136[rbp] - double X[]
	add	rax, 24
	movsd	xmm2, QWORD PTR [rax]
	movapd	xmm1, xmm0
	subsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR -120[rbp]                     # QWORD PTR -120[rbp] - double center_x
	mov	rax, QWORD PTR -136[rbp]                          # QWORD PTR -136[rbp] - double X[]
	add	rax, 24
	movsd	xmm2, QWORD PTR [rax]
	subsd	xmm0, xmm2
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -128[rbp]                     # QWORD PTR -128[rbp] - double center_y
	mov	rax, QWORD PTR -144[rbp]                          # QWORD PTR -144[rbp] - double Y[]
	add	rax, 24
	movsd	xmm3, QWORD PTR [rax]
	movapd	xmm2, xmm0
	subsd	xmm2, xmm3
	movsd	xmm0, QWORD PTR -128[rbp]                     # QWORD PTR -128[rbp] - double center_y
	mov	rax, QWORD PTR -144[rbp]                          # QWORD PTR -144[rbp] - double Y[]
	add	rax, 24
	movsd	xmm3, QWORD PTR [rax]
	subsd	xmm0, xmm3
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	movsd	QWORD PTR -104[rbp], xmm0                       # QWORD PTR -104[rbp] - double distance_1
	movsd	xmm0, QWORD PTR -120[rbp]                       # QWORD PTR -120[rbp] - double center_x
	mov	rax, QWORD PTR -136[rbp]                            # QWORD PTR -136[rbp] - double X[]
	movsd	xmm2, QWORD PTR [rax]
	movapd	xmm1, xmm0
	subsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR -120[rbp]                       # QWORD PTR -120[rbp] - double center_x
	mov	rax, QWORD PTR -136[rbp]                            # QWORD PTR -136[rbp] - double X[]
	movsd	xmm2, QWORD PTR [rax]
	subsd	xmm0, xmm2
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -128[rbp]                       # QWORD PTR -128[rbp] - double center_y
	mov	rax, QWORD PTR -144[rbp]                            # QWORD PTR -144[rbp] - double Y[]
	movsd	xmm3, QWORD PTR [rax]
	movapd	xmm2, xmm0
	subsd	xmm2, xmm3
	movsd	xmm0, QWORD PTR -128[rbp]                       # QWORD PTR -128[rbp] - double center_y
	mov	rax, QWORD PTR -144[rbp]                            # QWORD PTR -144[rbp] - double Y[]
	movsd	xmm3, QWORD PTR [rax]
	subsd	xmm0, xmm3
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	movsd	QWORD PTR -112[rbp], xmm0                       # QWORD PTR -112[rbp] - double distance_2
	movsd	xmm0, QWORD PTR -104[rbp]                       # QWORD PTR -104[rbp] - double distance_1
	movapd	xmm1, xmm0
	subsd	xmm1, QWORD PTR -112[rbp]                       # QWORD PTR -112[rbp] - double distance_2
	movsd	xmm0, QWORD PTR .LC3[rip]
	comisd	xmm0, xmm1
	jbe	.L5
	movsd	xmm0, QWORD PTR -104[rbp]                       # QWORD PTR -104[rbp] - double distance_1
	subsd	xmm0, QWORD PTR -112[rbp]                       # QWORD PTR -112[rbp] - double distance_2
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
	mov	QWORD PTR -24[rbp], rdi                         # QWORD PTR -24[rbp] - double X[] параметр, который передается в функцию через rdi
	mov	QWORD PTR -32[rbp], rsi                         # QWORD PTR -32[rbp] - double Y[] параметр, который передается в функцию через rsi
	mov	DWORD PTR -4[rbp], 0                            # DWORD PTR -4[rbp] - int i
	jmp	.L13
.L20:
	mov	eax, DWORD PTR -4[rbp]
	add	eax, 1
	mov	DWORD PTR -8[rbp], eax                          # DWORD PTR -8[rbp] - int j
	jmp	.L14
.L19:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -24[rbp]                         # QWORD PTR -24[rbp] - double X[]
	add	rax, rdx
	movsd	xmm0, QWORD PTR [rax]
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -24[rbp]                         # QWORD PTR -24[rbp] - double X[]
	add	rax, rdx
	movsd	xmm1, QWORD PTR [rax]
	ucomisd	xmm0, xmm1
	jp	.L15
	ucomisd	xmm0, xmm1
	jne	.L15
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -32[rbp]                         # QWORD PTR -32[rbp] - double Y[]
	add	rax, rdx
	movsd	xmm0, QWORD PTR [rax]
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -32[rbp]                         # QWORD PTR -32[rbp] - double Y[]
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
	mov	QWORD PTR -40[rbp], rdi                         # QWORD PTR -40[rbp] - double *center_x параметр, который передается через rdi
	mov	QWORD PTR -48[rbp], rsi                         # QWORD PTR -48[rbp] - double *center_y параметр, который передается через rsi
	movsd	QWORD PTR -56[rbp], xmm0                    # QWORD PTR -56[rbp] - double mx1 параметр, который передается через xmm0
	movsd	QWORD PTR -64[rbp], xmm1                    # QWORD PTR -64[rbp] - double my1 параметр, который передается через xmm1
	movsd	QWORD PTR -72[rbp], xmm2                    # QWORD PTR -72[rbp] - double ax параметр, который передается через xmm2
	movsd	QWORD PTR -80[rbp], xmm3                    # QWORD PTR -80[rbp] - double ay параметр, который передается через xmm3
	movsd	QWORD PTR -88[rbp], xmm4                    # QWORD PTR -88[rbp] - double mx2 параметр, который передается через xmm4
	movsd	QWORD PTR -96[rbp], xmm5                    # QWORD PTR -96[rbp] - double my2 параметр, который передается через xmm5
	movsd	QWORD PTR -104[rbp], xmm6                   # QWORD PTR -104[rbp] - double bx параметр, который передается через xmm6
	movsd	QWORD PTR -112[rbp], xmm7                   # QWORD PTR -112[rbp] - double by параметр, который передается через xmm7
	movsd	xmm0, QWORD PTR -112[rbp]
	mulsd	xmm0, QWORD PTR -72[rbp]
	movsd	xmm1, QWORD PTR -80[rbp]
	mulsd	xmm1, QWORD PTR -104[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0                     # QWORD PTR -8[rbp] - double proportion
	movsd	xmm0, QWORD PTR -8[rbp]
	comisd	xmm0, QWORD PTR .LC4[rip]
	jbe	.L24
	movsd	xmm0, QWORD PTR .LC3[rip]
	comisd	xmm0, QWORD PTR -8[rbp]
	jbe	.L24
	mov	eax, 0
	jmp	.L27
.L24:
	movsd	xmm0, QWORD PTR -80[rbp]                    # QWORD PTR -80[rbp] - double ay
	mulsd	xmm0, QWORD PTR -56[rbp]                    # QWORD PTR -56[rbp] - double mx1
	movsd	xmm1, QWORD PTR -72[rbp]                    # QWORD PTR -72[rbp] - double ax
	mulsd	xmm1, QWORD PTR -64[rbp]                    # QWORD PTR -64[rbp] - double my1
	subsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0                    # QWORD PTR -16[rbp] - double c1
	movsd	xmm0, QWORD PTR -112[rbp]                   # QWORD PTR -112[rbp] - double by
	mulsd	xmm0, QWORD PTR -88[rbp]                    # QWORD PTR -88[rbp] - double mx2
	movsd	xmm1, QWORD PTR -104[rbp]                   # QWORD PTR -104[rbp] - double bx
	mulsd	xmm1, QWORD PTR -96[rbp]                    # QWORD PTR -96[rbp] - double my2
	subsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0                    # QWORD PTR -24[rbp] - double c2
	movsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -72[rbp]                    # QWORD PTR -72[rbp] - double ax
	movsd	xmm1, QWORD PTR -16[rbp]                    # QWORD PTR -16[rbp] - double c1
	mulsd	xmm1, QWORD PTR -104[rbp]                   # QWORD PTR -104[rbp] - double bx
	subsd	xmm0, xmm1
	divsd	xmm0, QWORD PTR -8[rbp]                     # QWORD PTR -8[rbp] - double proportion
	mov	rax, QWORD PTR -40[rbp]                         # QWORD PTR -40[rbp] - double *center_x
	movsd	QWORD PTR [rax], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]                    # QWORD PTR -24[rbp] - double c2
	mulsd	xmm0, QWORD PTR -80[rbp]                    # QWORD PTR -80[rbp] - double ay
	movsd	xmm1, QWORD PTR -16[rbp]                    # QWORD PTR -16[rbp] - double c1
	mulsd	xmm1, QWORD PTR -112[rbp]                   # QWORD PTR -112[rbp] - double by
	subsd	xmm0, xmm1
	divsd	xmm0, QWORD PTR -8[rbp]                     # QWORD PTR -8[rbp] - double proportion
	mov	rax, QWORD PTR -48[rbp]                         # QWORD PTR -48[rbp] - double *center_y
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
	mov	QWORD PTR -8[rbp], rdi                              # QWORD PTR -8[rbp] - FILE *fin параметр, который передается через rdi
	mov	QWORD PTR -16[rbp], rsi                             # QWORD PTR -16[rbp] - double X[], который передается через rsi
	mov	QWORD PTR -24[rbp], rdx                             # QWORD PTR -24[rbp] - double Y[], который передается через rdx
	mov	DWORD PTR -28[rbp], ecx                             # DWORD PTR -28[rbp] - int belongs, который передается через ecx
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 24
	movsd	xmm6, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]                             # QWORD PTR -16[rbp] - double X[]
	add	rax, 24
	movsd	xmm5, QWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]                             # QWORD PTR -24[rbp] - double Y[]
	add	rax, 16
	movsd	xmm4, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]                             # QWORD PTR -16[rbp] - double X[]
	add	rax, 16
	movsd	xmm3, QWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]                             # QWORD PTR -24[rbp] - double Y[]
	add	rax, 8
	movsd	xmm2, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]                             # QWORD PTR -16[rbp] - double X[]
	add	rax, 8
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]                             # QWORD PTR -24[rbp] - double Y[]
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]                             # QWORD PTR -16[rbp] - double X[]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]                              # QWORD PTR -8[rbp] - FILE *fin
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
	cmp	DWORD PTR -28[rbp], 0                               # DWORD PTR -28[rbp] - int belongs
	je	.L31
	lea	rax, .LC6[rip]
	jmp	.L32
.L31:
	lea	rax, .LC7[rip]
.L32:
	mov	rdx, QWORD PTR -8[rbp]                              # QWORD PTR -8[rbp] - FILE *fin
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
	mov	QWORD PTR -24[rbp], rdi                             # QWORD PTR -24[rbp] - FILE *fin параметр, который передается через регистр rdi
	mov	QWORD PTR -32[rbp], rsi                             # QWORD PTR -32[rbp] - double array_x[] параметр, который передается через регистр rdi
	mov	QWORD PTR -40[rbp], rdx                             # QWORD PTR -40[rbp] - double array_y[] параметр, который передается через регистр rdi
	mov	DWORD PTR -4[rbp], 0                                # DWORD PTR -4[rbp] - int i
	jmp	.L34
.L38:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -32[rbp]                             # QWORD PTR -32[rbp] - double array_x[]
	add	rdx, rax
	mov	rax, QWORD PTR -24[rbp]                             # QWORD PTR -24[rbp] - FILE *fin
	lea	rcx, .LC8[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	cmp	eax, -1
	je	.L35
	mov	eax, DWORD PTR -4[rbp]                              # DWORD PTR -4[rbp] - int i
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -40[rbp]                             # QWORD PTR -40[rbp] - double array_y[]
	add	rdx, rax
	mov	rax, QWORD PTR -24[rbp]                             # QWORD PTR -24[rbp] - FILE *fin
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
	add	DWORD PTR -4[rbp], 1                                # DWORD PTR -4[rbp] - int i
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
