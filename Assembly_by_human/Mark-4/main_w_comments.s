	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	Text
	.bss
	.align 32
	.type	Text, @object
	.size	Text, 10000000          # Массив Text из 10000000 char
Text:
	.zero	10000000
	.globl	Sub
	.align 32
	.type	Sub, @object
	.size	Sub, 10000000           # Массив Sub из 10000000 char
Sub:
	.zero	10000000
	.globl	Index
	.align 32
	.type	Index, @object
	.size	Index, 40000000         # Массив Index из 10000000 int
Index:
	.zero	40000000
	.section	.rodata
	.align 8
.LC0:
	.string	"incorrect command line!\n  Waited:\n     command -f size \"word\" infile outfile\n  Or:\n     command -n size \"word\" -c/-r outfile"
	.text
	.globl	errMessage1
	.type	errMessage1, @function
errMessage1:
	endbr64
	push	rbp
	mov	rbp, rsp
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	nop
	pop	rbp
	ret
	.size	errMessage1, .-errMessage1
	.section	.rodata
	.align 8
.LC1:
	.string	"the specified length of the substring does not correspond to reality"
	.text
	.globl	errMessage2
	.type	errMessage2, @function
errMessage2:
	endbr64
	push	rbp
	mov	rbp, rsp
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT
	nop
	pop	rbp
	ret
	.size	errMessage2, .-errMessage2
	.section	.rodata
	.align 8
.LC2:
	.string	"incorrect size of substring!\n1 <= size <= %d\n"
	.text
	.globl	errMessage3
	.type	errMessage3, @function
errMessage3:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	esi, 10000000
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	nop
	pop	rbp
	ret
	.size	errMessage3, .-errMessage3
	.globl	check_sub
	.type	check_sub, @function
check_sub:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], edi          # DWORD PTR -4[rbp]  - это int real_size
	mov	QWORD PTR -16[rbp], rsi         # QWORD PTR -16[rbp] - это char *str
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	edx, DWORD PTR -4[rbp]          # DWORD PTR -4[rbp]  - это int real_size
	movsx	rdx, edx
	cmp	rax, rdx
	setne	al
	movzx	eax, al
	leave
	ret
	.size	check_sub, .-check_sub
	.globl	GenerateRandomString
	.type	GenerateRandomString, @function
GenerateRandomString:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi             # DWORD PTR -20[rbp] - int text_size локальная в функции GenerateRandomString
	mov	DWORD PTR -4[rbp], 0                # DWORD PTR -4[rbp] - это переменная int i = 0
	jmp	.L7
.L8:
	call	rand@PLT
	cdq
	shr	edx, 25
	add	eax, edx
	and	eax, 127
	sub	eax, edx
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp]              # DWORD PTR -4[rbp] - это переменная int i
	cdqe
	lea	rdx, Text[rip]
	mov	BYTE PTR [rax+rdx], cl
	add	DWORD PTR -4[rbp], 1                # DWORD PTR -4[rbp] - это переменная int i
.L7:
	mov	eax, DWORD PTR -4[rbp]              # DWORD PTR -4[rbp] - это переменная int i
	cmp	eax, DWORD PTR -20[rbp]             # DWORD PTR -20[rbp] - int text_size локальная в функции GenerateRandomString
	jl	.L8
	nop
	nop
	leave
	ret
	.size	GenerateRandomString, .-GenerateRandomString
	.section	.rodata
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
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi                   # DWORD PTR -68[rbp] - это int argc
	mov	QWORD PTR -80[rbp], rsi                   # QWORD PTR -80[rbp] - это char *argv[]
	cmp	DWORD PTR -68[rbp], 4
	jle	.L10
	cmp	DWORD PTR -68[rbp], 6
	jle	.L11
.L10:
	mov	eax, 0
	call	errMessage1
	mov	eax, 1
	jmp	.L12
.L11:
	mov	rax, QWORD PTR -80[rbp]                    # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L13
	mov	rax, QWORD PTR -80[rbp]                    # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC4[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax                    # QWORD PTR -24[rbp] - это FILE *ifst
	cmp	QWORD PTR -24[rbp], 0
	jne	.L14
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 3
	jmp	.L12
.L14:
	mov	rax, QWORD PTR -24[rbp]                    # QWORD PTR -24[rbp] - это FILE *ifst
	mov	edx, 10000000
	lea	rcx, Text[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	ReadFromFile@PLT
	mov	DWORD PTR -4[rbp], eax                     # DWORD PTR -4[rbp] - это int text_size
	mov	rax, QWORD PTR -24[rbp]                    # QWORD PTR -24[rbp] - это FILE *ifst
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -80[rbp]                    # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	edx, 10
	mov	esi, 0
	mov	rdi, rax
	call	strtol@PLT
	mov	DWORD PTR -8[rbp], eax                     # DWORD PTR -8[rbp] - это int sub_size
	mov	rax, QWORD PTR -80[rbp]                    # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, Sub[rip]
	mov	rdi, rax
	call	strcpy@PLT
	mov	rax, QWORD PTR -80[rbp]                    # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 24
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -8[rbp]                     # DWORD PTR -8[rbp] - это int sub_size
	mov	rsi, rdx
	mov	edi, eax
	call	check_sub
	test	eax, eax
	je	.L15
	mov	eax, 0
	call	errMessage2
	mov	eax, 2
	jmp	.L12
.L15:
	cmp	DWORD PTR -8[rbp], 10000000                # DWORD PTR -8[rbp] - это int sub_size
	jg	.L16
	cmp	DWORD PTR -8[rbp], 0                       # DWORD PTR -8[rbp] - это int sub_size
	jg	.L17
.L16:
	mov	eax, 0
	call	errMessage3
	mov	eax, 3
	jmp	.L12
.L13:
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L18
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	edx, 10
	mov	esi, 0
	mov	rdi, rax
	call	strtol@PLT
	mov	DWORD PTR -8[rbp], eax                      # DWORD PTR -8[rbp] - это int sub_size
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, Sub[rip]
	mov	rdi, rax
	call	strcpy@PLT
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 24
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -8[rbp]                      # DWORD PTR -8[rbp] - это int sub_size
	mov	rsi, rdx
	mov	edi, eax
	call	check_sub
	test	eax, eax
	je	.L19
	mov	eax, 0
	call	errMessage2
	mov	eax, 2
	jmp	.L12
.L19:
	cmp	DWORD PTR -8[rbp], 10000000                # DWORD PTR -8[rbp] - это int sub_size
	jg	.L20
	cmp	DWORD PTR -8[rbp], 0                       # DWORD PTR -8[rbp] - это int sub_size
	jg	.L21
.L20:
	mov	eax, 0
	call	errMessage3
	mov	eax, 3
	jmp	.L12
.L21:
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -4[rbp], 10000000                 # DWORD PTR -4[rbp] - это int text_size
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC7[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L22
	mov	eax, DWORD PTR -4[rbp]                      # DWORD PTR -4[rbp] - это int text_size
	mov	edi, eax
	call	GenerateRandomString
	jmp	.L17
.L22:
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L23
	mov	eax, DWORD PTR -4[rbp]                      # DWORD PTR -4[rbp] - это int text_size
	mov	esi, eax
	lea	rax, Text[rip]
	mov	rdi, rax
	call	ReadFromConsole@PLT
	mov	DWORD PTR -4[rbp], eax                      # DWORD PTR -4[rbp] - это int text_size
	jmp	.L17
.L23:
	mov	eax, 0
	call	errMessage1
	mov	eax, 1
	jmp	.L12
.L18:
	mov	eax, 0
	call	errMessage1
	mov	eax, 1
	jmp	.L12
.L17:
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax                     # QWORD PTR -32[rbp] - это clock_t start
	mov	DWORD PTR -16[rbp], 0                       # DWORD PTR -16[rbp] - это int i
	jmp	.L24
.L25:
	mov	edx, DWORD PTR -4[rbp]                      # DWORD PTR -4[rbp] - это int text_size
	mov	eax, DWORD PTR -8[rbp]                      # DWORD PTR -8[rbp] - это int sub_size
	mov	r8d, edx
	lea	rdx, Text[rip]
	mov	rcx, rdx
	mov	edx, eax
	lea	rax, Sub[rip]
	mov	rsi, rax
	lea	rax, Index[rip]
	mov	rdi, rax
	call	BuildIndexArray@PLT
	mov	DWORD PTR -12[rbp], eax                     # DWORD PTR -12[rbp] - это int index_size
	add	DWORD PTR -16[rbp], 1
.L24:
	cmp	DWORD PTR -16[rbp], 40
	jle	.L25
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax                     # QWORD PTR -40[rbp] - это clock_t end
	mov	rax, QWORD PTR -40[rbp]
	sub	rax, QWORD PTR -32[rbp]                     # QWORD PTR -32[rbp] - это clock_t start
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC9[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -48[rbp], xmm0                # QWORD PTR -48[rbp] - это double calcTime
	mov	rax, QWORD PTR stdout[rip]
	mov	edx, DWORD PTR -12[rbp]                     # DWORD PTR -12[rbp] - это int index_size
	lea	rcx, Index[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	Output@PLT
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax                     # QWORD PTR -56[rbp] - это FILE *ofst1
	cmp	QWORD PTR -56[rbp], 0
	jne	.L26
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC11[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L12
.L26:
	mov	edx, DWORD PTR -12[rbp]                     # DWORD PTR -12[rbp] - это int index_size
	mov	rax, QWORD PTR -56[rbp]                     # QWORD PTR -56[rbp] - это FILE *ofst1
	lea	rcx, Index[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	Output@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdx, QWORD PTR -48[rbp]                     # QWORD PTR -48[rbp] - это double calcTime
	movq	xmm0, rdx
	lea	rdx, .LC12[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rdx, QWORD PTR -48[rbp]                     # QWORD PTR -48[rbp] - это double calcTime
	mov	rax, QWORD PTR -56[rbp]                     # QWORD PTR -56[rbp] - это FILE *ofst1
	movq	xmm0, rdx
	lea	rdx, .LC13[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -56[rbp]                     # QWORD PTR -56[rbp] - это FILE *ofst1
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
.L12:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC9:
	.long	0
	.long	1093567618
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
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
