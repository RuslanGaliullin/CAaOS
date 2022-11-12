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
	call	puts@PLT                # в puts передается строка char* .LC0 через rdi, возвращаемое значение сохраняется в eax, но не используется
	nop
	pop	rbp
	ret                             # нет возвращаемого значения
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
	call	puts@PLT                # в puts передается строка char* .LC1 через rdi, возвращаемое значение сохраняется в eax, но не используется
	nop
	pop	rbp
	ret                             # нет возвращаемого значения
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
	call	printf@PLT                  # в printf передается строка char* .LC2 через rdi и 10000000 через rsi, возвращаемое значение сохраняется в eax, но оно не используется
	nop
	pop	rbp
	ret                                 # нет возвращаемого значения
	.size	errMessage3, .-errMessage3
	.globl	check_sub
	.type	check_sub, @function
check_sub:                              # параметр int real_size(DWORD PTR -4[rbp]) передается через edi
                                        # char* str(DWORD PTR -16[rbp]) передается через rsi
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], edi          # DWORD PTR -4[rbp]  - это int real_size
	mov	QWORD PTR -16[rbp], rsi         # QWORD PTR -16[rbp] - это char *str
	mov	rdi, QWORD PTR -16[rbp]
	call	strlen@PLT                  # в strlen передается строка char* str из QWORD PTR -16[rbp] через rdi
	mov	edx, DWORD PTR -4[rbp]          # DWORD PTR -4[rbp]  - это int real_size
	movsx	rdx, edx
	cmp	rax, rdx
	setne	al
	movzx	eax, al
	leave
	ret                                 # возвращается результат сравнения strlen(str) != real_size через eax
	.size	check_sub, .-check_sub
	.globl	GenerateRandomString
	.type	GenerateRandomString, @function
GenerateRandomString:                       # параметр int text_size(DWORD PTR -20[rbp]) передается через edi
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi             # DWORD PTR -20[rbp] - int text_size локальная в функции GenerateRandomString
	mov	r15d, 0                             # r15d - это переменная int i = 0
	jmp	.L7
.L8:
	call	rand@PLT                        # аргументы в rand() не передаются, возвращаемое значение сохраняется в eax
	cdq
	shr	edx, 25
	add	eax, edx
	and	eax, 127
	sub	eax, edx
	mov	ecx, eax
	mov	eax, r15d                           # r15d - это переменная int i
	cdqe
	lea	rdx, Text[rip]
	mov	BYTE PTR [rax+rdx], cl
	add	r15d, 1                             # r15d - это переменная int i
.L7:
	mov	eax, r15d                           # r15d - это переменная int i
	cmp	eax, DWORD PTR -20[rbp]             # DWORD PTR -20[rbp] - int text_size локальная в функции GenerateRandomString
	jl	.L8
	nop
	nop
	leave
	ret                                     # нет возвращаемого значения
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
main:                                              # параметра int argc(DWORD PTR -68[rbp]) передается через edi
                                                   # параметра char* argv[](QWORD PTR -80[rbp]) передается через rsi
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
	call	errMessage1                            # вызов функции errMessage1 без аргументов, у функции нет возвращаемого значения
	mov	eax, 1
	jmp	.L12
.L11:
	mov	rax, QWORD PTR -80[rbp]                    # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 8
	mov	rdi, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	call	strcmp@PLT                             # В функцию strcmp передается char* argv[1] через rdi и char* строка .LC3 через rsi
	test	eax, eax                               # Возвращаемое значение сохранено в eax
	jne	.L13
	mov	rax, QWORD PTR -80[rbp]                    # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 32
	mov	rdi, QWORD PTR [rax]
	lea	rdx, .LC4[rip]
	mov	rsi, rdx
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax                    # QWORD PTR -24[rbp] - это FILE *ifst
	cmp	QWORD PTR -24[rbp], 0
	jne	.L14
	lea	rdi, .LC5[rip]
	call	puts@PLT                               # в puts передается строка char* .LC5 через rdi, возвращаемое значение сохраняется в eax, но не используется
	mov	eax, 3
	jmp	.L12
.L14:
	mov	rdi, QWORD PTR -24[rbp]                    # QWORD PTR -24[rbp] - это FILE *ifst
	mov	edx, 10000000
	lea	rsi, Text[rip]
	call	ReadFromFile@PLT                       # в ReadFromFile передаются параметры FILE* ifst, char A[], 10000000 через rdi, rsi, edx соответственно
	                                               # возвращаемое значение сохраняется в eax, из eax в text_size
	mov	r13d, eax                                  # r13d - это int text_size
	mov	rdi, QWORD PTR -24[rbp]                    # QWORD PTR -24[rbp] - это FILE *ifst
	call	fclose@PLT                             # В функцию fclose передается FILE* ifst через rdi
	mov	rax, QWORD PTR -80[rbp]                    # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	edx, 10
	mov	esi, 0
	mov	rdi, rax
	call	strtol@PLT                             # В функцию strtol передаются char* argv[2] через rdi, 0 через esi и 10 через edx
	                                               # возвращаемое значение сохраняется в eax
	mov	DWORD PTR -8[rbp], eax                     # DWORD PTR -8[rbp] - это int sub_size
	mov	rax, QWORD PTR -80[rbp]                    # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rdi, Sub[rip]
	call	strcpy@PLT                             # В функцию strcpy передаются char Sub[], char* argv[3] через rdi, rsi соответственно
	                                               # возвращаемое значение в rax, но не используется
	mov	rax, QWORD PTR -80[rbp]                    # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 24
	mov	rsi, QWORD PTR [rax]
	mov	edi, DWORD PTR -8[rbp]                     # DWORD PTR -8[rbp] - это int sub_size
	call	check_sub                              # В функцию check_sub передаются int sub_size, char* argv[3] через edi, rsi соответственно
	test	eax, eax                               # возвращаемое значение в eax
	je	.L15
	mov	eax, 0
	call	errMessage2                            # В функцию errMessage2 не передаются аргументы + она ничего не возвращает
	mov	eax, 2
	jmp	.L12
.L15:
	cmp	DWORD PTR -8[rbp], 10000000                # DWORD PTR -8[rbp] - это int sub_size
	jg	.L16
	cmp	DWORD PTR -8[rbp], 0                       # DWORD PTR -8[rbp] - это int sub_size
	jg	.L17
.L16:
	mov	eax, 0
	call	errMessage3                            # В функцию errMessage3 не передаются аргументы + она ничего не возвращает
	mov	eax, 3
	jmp	.L12
.L13:
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 8
	mov	rdi, QWORD PTR [rax]
	lea	rsi, .LC6[rip]
	call	strcmp@PLT                             # В функцию strcmp передается char* argv[1] через rdi и char* строка .LC6 через rsi
	test	eax, eax                               # Возвращаемое значение сохранено в eax
	jne	.L18
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 16
	mov	rdi, QWORD PTR [rax]
	mov	edx, 10
	mov	esi, 0
	call	strtol@PLT                              # В функцию strtol передаются char* argv[2] через rdi, 0 через esi и 10 через edx
                                                    # возвращаемое значение сохраняется в eax
	mov	DWORD PTR -8[rbp], eax                      # DWORD PTR -8[rbp] - это int sub_size
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 24
	mov	rsi, QWORD PTR [rax]
	lea	rdi, Sub[rip]
	call	strcpy@PLT                              # В функцию strcpy передаются char Sub[], char* argv[3] через rdi, rsi соответственно
                                                    # возвращаемое значение в rax, но не используется
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 24
	mov	rsi, QWORD PTR [rax]
	mov	edi, DWORD PTR -8[rbp]                      # DWORD PTR -8[rbp] - это int sub_size
	call	check_sub                               # В функцию check_sub передаются int sub_size, char* argv[3] через edi, rsi соответственно
	test	eax, eax                                # возвращаемое значение в eax
	je	.L19
	mov	eax, 0
	call	errMessage2                             # В функцию errMessage2 не передаются аргументы + она ничего не возвращает
	mov	eax, 2
	jmp	.L12
.L19:
	cmp	DWORD PTR -8[rbp], 10000000                # DWORD PTR -8[rbp] - это int sub_size
	jg	.L20
	cmp	DWORD PTR -8[rbp], 0                       # DWORD PTR -8[rbp] - это int sub_size
	jg	.L21
.L20:
	mov	eax, 0
	call	errMessage3                            # В функцию errMessage3 не передаются аргументы + она ничего не возвращает
	mov	eax, 3
	jmp	.L12
.L21:
	mov	edi, 0
	call	time@PLT                               # В функцию time передается 0 через edi
	mov	edi, eax                                   # Возвращаемое значение в eax
	call	srand@PLT                              # В функцию scrand передается значение time(0) через edi
	                                               # scrand ничего не возвращает
	mov r13d, 10000000                               # r13d - это int text_size
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC7[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT                              # В функцию strcmp передаются 2 аргумента через rdi, rsi: char* argv[4], char* .LC7
                                                    # Результат функции strcmp в eax
	test	eax, eax
	jne	.L22
	mov	edi, r13d                                   # r13d - это int text_size
	call	GenerateRandomString                    # В функцию GenerateRandomString передается аргумент text_size(DWORD PTR -4[rbp]) через edi
	                                                # функция ничего не возвращает
	jmp	.L17
.L22:
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 32
	mov	rdi, QWORD PTR [rax]
	lea	rsi, .LC8[rip]
	call	strcmp@PLT                              # В функцию strcmp передаются 2 аргумента через rdi, rsi: char* argv[4], char* .LC8
                                                    # Результат функции strcmp в eax
	test	eax, eax
	jne	.L23
	mov	eax, r13d                                   # r13d - это int text_size
	mov	esi, eax
	lea	rdi, Text[rip]
	call	ReadFromConsole@PLT                     # В функцию ReadFromConsole передаются char Text[], int text_size через rdi, esi соответственно
	mov	r13d, eax                                   # r13d - это int text_size
	jmp	.L17
.L23:
	mov	eax, 0
	call	errMessage1                             # В функцию errMessage1 не передаются аргументы + она ничего не возвращает
	mov	eax, 1
	jmp	.L12
.L18:
	mov	eax, 0
	call	errMessage1                             # В функцию errMessage1 не передаются аргументы + она ничего не возвращает
	mov	eax, 1
	jmp	.L12
.L17:
	call	clock@PLT                               # В функцию clock не передаются никакие аргументы
	                                                # Возвращаемое значение сохраняется в rax
	mov	QWORD PTR -32[rbp], rax                     # QWORD PTR -32[rbp] - это clock_t start
	mov	r9d, 0                                      # r9d - это int i
	jmp	.L24
.L25:
	mov	edx, r13d                                   # r13d - это int text_size
	mov	eax, DWORD PTR -8[rbp]                      # DWORD PTR -8[rbp] - это int sub_size
	mov	r8d, edx
	lea	rdx, Text[rip]
	mov	rcx, rdx
	mov	edx, eax
	lea	rsi, Sub[rip]
	lea	rdi, Index[rip]
	call	BuildIndexArray@PLT                     # В функцию BuildIndexArray передаются аргументы int Index[], char Sub[], int sub_size, char Text[], int text_size
	                                                # возвращаемое значение сохраняется в eax
	mov	r12d, eax                                   # r12d - это int index_size
	add	r9d, 1                                      # r9d - это int i
.L24:
	cmp	r9d, 79                                     # r9d - это int i
	jle	.L25
	call	clock@PLT                               # В функцию clock не передаются никакие аргументы
                     	                            # Возвращаемое значение сохраняется в rax
	mov	QWORD PTR -40[rbp], rax                     # QWORD PTR -40[rbp] - это clock_t end
	mov	rax, QWORD PTR -40[rbp]
	sub	rax, QWORD PTR -32[rbp]                     # QWORD PTR -32[rbp] - это clock_t start
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC9[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -48[rbp], xmm0                # QWORD PTR -48[rbp] - это double calcTime
	mov	rax, QWORD PTR stdout[rip]
	mov	edx, r12d                                   # r12d - это int index_size
	lea	rcx, Index[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	Output@PLT                              # В функцию Output передаются stdout, int Index[], int index_size через rdi, rsi, edx
	                                                # функция ничего не возвращает
	mov	rax, QWORD PTR -80[rbp]                     # QWORD PTR -80[rbp] - это char *argv[]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT                               # В функцию fopen передаются char* argv[5], char* .LC10 через rdi и rsi соответственно
                                                    # Возвращаемое значение сохранено в rax
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
	call	printf@PLT                              # в printf передаются строка char* .LC11 через rdi и char* argv[5] через rsi, возвращаемое значение сохраняется в eax, но оно не используется
	mov	eax, 1
	jmp	.L12
.L26:
	mov	edx, r12d                                   # r12d - это int index_size
	mov	rdi, QWORD PTR -56[rbp]                     # QWORD PTR -56[rbp] - это FILE *ofst1
	lea	rsi, Index[rip]
	call	Output@PLT                              # В функцию Output передаются FILE* ofst1, int Index[], int index_size через rdi, rsi, edx
                                                    # функция ничего не возвращает
	mov	rax, QWORD PTR stdout[rip]
	mov	rdx, QWORD PTR -48[rbp]                     # QWORD PTR -48[rbp] - это double calcTime
	movq	xmm0, rdx
	lea	rdx, .LC12[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT                             # в fprintf передаются stdout, char* .LC12, double calcTime через rdi, rsi и xmm0, возвращаемое значение сохраняется в eax, но оно не используется
	mov	rdx, QWORD PTR -48[rbp]                     # QWORD PTR -48[rbp] - это double calcTime
	mov	rax, QWORD PTR -56[rbp]                     # QWORD PTR -56[rbp] - это FILE *ofst1
	movq	xmm0, rdx
	lea	rdx, .LC13[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT                             # в fprintf передаются FILE* ofst1, char* .LC13, double calcTime через rdi, rsi и xmm0, возвращаемое значение сохраняется в eax, но оно не используется
	mov	rdi, QWORD PTR -56[rbp]                     # QWORD PTR -56[rbp] - это FILE *ofst1
	call	fclose@PLT                              # В функцию fclose передается FILE* ofst1 через rdi
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
