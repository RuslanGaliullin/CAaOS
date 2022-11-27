	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	X
	.bss
	.align 32
	.type	X, @object
	.size	X, 32
X:
	.zero	32                      # Массив X из 4 double, равных 0
	.globl	Y
	.align 32
	.type	Y, @object
	.size	Y, 32
Y:
	.zero	32                      # Массив Y из 4 double, равных 0
	.section	.rodata
	.align 8
.LC0:
	.string	"incorrect command line!\n  Waited:\n     command -c outfile     in console: x0 y0 x1 y1 x2 y2 x3 y4  Or:\n     command -r outfile  Or:\n     command -f infile outfile"
	.text
	.globl	errMessage1
	.type	errMessage1, @function
errMessage1:                                     # У функции нет формальных параметров
	endbr64
	push	rbp
	mov	rbp, rsp
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT                           # Через регистр rdi передается строка .LC0
	nop                                          # возвращаемое значение в eax, но оно не используется
	pop	rbp
	ret
	.size	errMessage1, .-errMessage1           # Функция ничего не возвращает
	.section	.rodata
	.align 8
.LC1:
	.string	"incorrect data in the input file or in console!\n  Waited:\n     x0 y0 x1 y1 x2 y2 x3 y4"
	.text
	.globl	errMessage2
	.type	errMessage2, @function
errMessage2:                                     # У функции нет формальных параметров
	endbr64
	push	rbp
	mov	rbp, rsp
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT                           # Через регистр rdi передается строка .LC1
	nop                                          # возвращаемое значение в eax, но оно не используется
	pop	rbp
	ret
	.size	errMessage2, .-errMessage2           # Функция ничего не возвращает
	.globl	GenerateRandomCoordinates
	.type	GenerateRandomCoordinates, @function
GenerateRandomCoordinates:                              # У функции нет формальных параметров
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], 0                            # DWORD PTR -4[rbp] - это int i
	jmp	.L4
.L5:
	call	rand@PLT                                    # Не передаются аргументы
	movsx	rdx, eax                                    # возвращаемое значение в eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	sar	edx, 5
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 100
	sub	eax, ecx
	mov	edx, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, edx
	mov	eax, DWORD PTR -4[rbp]                          # DWORD PTR -4[rbp] - это int i
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, X[rip]                                    # X[rip] - указатель на начало массива X
	movsd	QWORD PTR [rdx+rax], xmm0                  # QWORD PTR [rdx+rax] обращение к X[i]
	call	rand@PLT                                   # Не передаются аргументы
	movsx	rdx, eax                                   # возвращаемое значение в eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	sar	edx, 5
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 100
	sub	eax, ecx
	mov	edx, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, edx
	mov	eax, DWORD PTR -4[rbp]                          # DWORD PTR -4[rbp] - это int i
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, Y[rip]                                     # Y[rip] - указатель на начало массива Y
	movsd	QWORD PTR [rdx+rax], xmm0                   # QWORD PTR [rdx+rax] обращение к Y[i]
	add	DWORD PTR -4[rbp], 1                            # DWORD PTR -4[rbp] - это int i
.L4:
	cmp	DWORD PTR -4[rbp], 3                            # DWORD PTR -4[rbp] - это int i
	jle	.L5
	nop
	nop
	leave
	ret
	.size	GenerateRandomCoordinates, .-GenerateRandomCoordinates      # Функция ничего не возвращает
	.section	.rodata
.LC2:
	.string	"-f"
.LC3:
	.string	"r"
.LC4:
	.string	"Cannot open input file %s\n"
.LC5:
	.string	"-c"
.LC6:
	.string	"-r"
.LC8:
	.string	"w"
.LC9:
	.string	"Cannot open %s to write\n"
.LC10:
	.string	"\nCalculation time = %g\n"
	.text
	.globl	
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64                                              # Формальные параметры: int argc, char *argv[]
	mov	DWORD PTR -52[rbp], edi                              # DWORD PTR -52[rbp] - это int argc, который передается в функцию через регистр edi
	mov	QWORD PTR -64[rbp], rsi                              # QWORD PTR -64[rbp] - это char *argv[], который передается в функцию через регистр rsi
	cmp	DWORD PTR -52[rbp], 3                                # DWORD PTR -52[rbp] - это int argc
	je	.L7
	cmp	DWORD PTR -52[rbp], 4                                # DWORD PTR -52[rbp] - это int argc
	je	.L7
	mov	eax, 0
	call	errMessage1                                          # Не передаются аргументы
	mov	eax, 1                                               # нет возвращаемого значения
	jmp	.L8
.L7:
	mov	DWORD PTR -4[rbp], 0                                 # DWORD PTR -4[rbp] - int result
	mov	rax, QWORD PTR -64[rbp]                              # QWORD PTR -64[rbp] - это char *argv[]
	add	rax, 8                                               # argv[1]
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT                                           # Аргументы char* argv[1], char* .LC2 передаются через регистры rdi, rsi
	test	eax, eax                                             # возвращаемое значения в eax
	jne	.L9
	mov	rax, QWORD PTR -64[rbp]                              # QWORD PTR -64[rbp] - это char *argv[]
	add	rax, 16                                              # argv[2]
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT                                           # Аргументы char* argv[2], char* .LC3 передаются через регистры rdi, rsi. Возвращаемое значение в eax
	mov	QWORD PTR -16[rbp], rax                             # QWORD PTR -16[rbp] - FILE *ifst
	cmp	QWORD PTR -16[rbp], 0
	jne	.L10
	mov	rax, QWORD PTR -64[rbp]                              # QWORD PTR -64[rbp] - это char *argv[]
	add	rax, 16                                              # argv[2]
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT                                      # Аргумент char* .LC4 передается через регистр rdi
	mov	eax, 3                                              # Возвращаемое значение в eax
	jmp	.L8
.L10:
	mov	rax, QWORD PTR -16[rbp]                             # QWORD PTR -16[rbp] - FILE *ifst
	lea	rdx, Y[rip]
	lea	rcx, X[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	ReadFromFile@PLT                                # Аргументы FILE *ifst, double X[], double Y[] передаются через регистры rdi, rsi, rdx
	test	eax, eax                                        # Возвращаемое значение в eax
	je	.L11
	mov	eax, 0
	call	errMessage2                                     # Не передаются аргументы
	mov	eax, 2                                              # нет возвращаемого значения
	jmp	.L8
.L11:
	mov	rax, QWORD PTR -16[rbp]                             # QWORD PTR -16[rbp] - FILE *ifst
	mov	rdi, rax
	call	fclose@PLT                                      # Аргумент FILE *ifst передается через регистр rdi
	jmp	.L12                                                # Возвращаемое значение в eax, но оно не используется
.L9:
	mov	rax, QWORD PTR -64[rbp]                              # QWORD PTR -64[rbp] - это char *argv[]
	add	rax, 8                                               # argv[1]
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT                                      # Аргументы char* argv[1], char* .LC5 передаются через регистры rdi, rsi
	test	eax, eax                                        # Возвращаемое значение в eax
	jne	.L13
	mov	rax, QWORD PTR stdin[rip]
	lea	rdx, Y[rip]
	lea	rcx, X[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	ReadFromFile@PLT                                # Аргументы stdin, double X[], double Y[] передаются через регистры rdi, rsi, rdx
    test	eax, eax                                        # Возвращаемое значение в eax
	je	.L12
	mov	eax, 0
	call	errMessage2                                     # Не передаются аргументы
    mov	eax, 2                                              # нет возвращаемого значения
	jmp	.L8
.L13:
	mov	rax, QWORD PTR -64[rbp]                             # QWORD PTR -64[rbp] - это char *argv[]
	add	rax, 8                                              # argv[1]
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT                                      # Аргументы char* argv[1], char* .LC6 передаются через регистры rdi, rsi
    test	eax, eax                                        # Возвращаемое значение в eax
	jne	.L14
	mov	edi, 0
	call	time@PLT                                        # Аргумент 0 передается через регистр edi
	mov	edi, eax                                            # Возвращаемое значение в eax
	call	srand@PLT                                       # Аргумент из time передается через регистр edi
	mov	eax, 0                                              # Возвращаемого значения нет
	call	GenerateRandomCoordinates                       # Не принимает аргументов
	jmp	.L12                                                # Возвращаемого значения нет
.L14:
	mov	eax, 0
	call	errMessage1                                     # Не принимает аргументов
	mov	eax, 1                                              # Возвращаемого значения нет
	jmp	.L8
.L12:
	call	clock@PLT                                       # Не принимает аргументов. Возвращаемое значение в rax
	mov	QWORD PTR -24[rbp], rax                             # QWORD PTR -24[rbp] - clock_t start
	mov	DWORD PTR -8[rbp], 0                                # DWORD PTR -8[rbp] - int i
	jmp	.L15
.L16:
	lea	rax, Y[rip]
	mov	rsi, rax
	lea	rax, X[rip]
	mov	rdi, rax
	call	CheckCircle@PLT                                 # Аргументы double X[], double Y[] передаются через регистры rdi, rsi. Возвращаемое значение в eax
	mov	DWORD PTR -4[rbp], eax                              # DWORD PTR -4[rbp] - int result
	add	DWORD PTR -8[rbp], 1                                # DWORD PTR -8[rbp] - int i
.L15:
	cmp	DWORD PTR -8[rbp], 59999999
	jle	.L16
	mov	edi, 10
	call	putchar@PLT                                     # Аргумент 10 передается через регистры edi. Возвращаемое значение в eax
	call	clock@PLT                                       # Не принимает аргументов. Возвращаемое значение в rax
	mov	QWORD PTR -32[rbp], rax                             # QWORD PTR -32[rbp] - clock_t end
	mov	rax, QWORD PTR -32[rbp]
	sub	rax, QWORD PTR -24[rbp]                             # QWORD PTR -24[rbp] - clock_t start
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC7[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0                        # QWORD PTR -40[rbp] - double calcTime
	mov	rax, QWORD PTR stdout[rip]
	mov	ecx, DWORD PTR -4[rbp]                              # DWORD PTR -4[rbp] - int result
	lea	rdx, Y[rip]
	lea	rsi, X[rip]
	mov	rdi, rax
	call	Output@PLT                                      # Аргументы stdout, double X[], double Y[], int result передаются через регистры rdi, rsi, rdx, ecx. Возвращаемого значения нет
	mov	eax, DWORD PTR -52[rbp]                             # DWORD PTR -52[rbp] - это int argc
	cdqe
	sal	rax, 3
	lea	rdx, -8[rax]
	mov	rax, QWORD PTR -64[rbp]                             # QWORD PTR -64[rbp] - это char *argv[]
	add	rax, rdx                                            # argv[argc - 1]
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT                                       # Аргументы char* argv[argc - 1], char* .LC8 передаются через регистры rdi, rsi. Возвращаемое значение в eax
	mov	QWORD PTR -48[rbp], rax                             # QWORD PTR -48[rbp] - FILE *ofst
	cmp	QWORD PTR -48[rbp], 0
	jne	.L17
	mov	eax, DWORD PTR -52[rbp]                             # DWORD PTR -52[rbp] - это int argc
	cdqe
	sal	rax, 3
	lea	rdx, -8[rax]
	mov	rax, QWORD PTR -64[rbp]                             # QWORD PTR -64[rbp] - это char *argv[]
	add	rax, rdx                                            # argv[argc - 1]
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT                                      # Аргумент char* .LC9 передается через регистр rdi
	mov	eax, 1                                              # Возвращаемое значение в eax
	jmp	.L8
.L17:
	mov	rax, QWORD PTR stdout[rip]
	mov	rdx, QWORD PTR -40[rbp]                             # QWORD PTR -40[rbp] - double calcTime
	movq	xmm0, rdx
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT                                    # Аргументы stdout, char* .LC10, double calcTime передаются через регистр rdi, rsi, xmm0
                                                           # Возвращаемое значение в eax
	mov	edx, DWORD PTR -4[rbp]                             # DWORD PTR -4[rbp] - int result
	mov	rax, QWORD PTR -48[rbp]                            # QWORD PTR -48[rbp] - FILE *ofst
	mov	ecx, edx
	lea	rdx, Y[rip]
	lea	rsi, X[rip]
	mov	rdi, rax
	call	Output@PLT                                      # Аргументы FILE *ofst, double X[], double Y[], int result передаются через регистры rdi, rsi, rdx, ecx. Возвращаемого значения нет
	mov	rdx, QWORD PTR -40[rbp]                             # QWORD PTR -40[rbp] - double calcTime
	mov	rax, QWORD PTR -48[rbp]                             # QWORD PTR -48[rbp] - FILE *ofst
	movq	xmm0, rdx
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT                                     # Аргументы FILE *ofst, char* .LC10, double calcTime передаются через регистр rdi, rsi, xmm0
                                                            # Возвращаемое значение в eax
	mov	rax, QWORD PTR -48[rbp]                             # QWORD PTR -48[rbp] - FILE *ofst
	mov	rdi, rax
	call	fclose@PLT                                      # Аргумент FILE *ofst передается через регистр rdi
	mov	eax, 0                                              # Возвращаемое значение в eax¬
.L8:
	leave
	ret
	.size	main, .-main                                    # Возвращает код возврата
	.section	.rodata
	.align 8
.LC7:
	.long	0
	.long	1093567618
