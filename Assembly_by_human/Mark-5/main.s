	.file	"main.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.3.0-1ubuntu1~22.04) version 11.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=96 --param ggc-min-heapsize=123934
# options passed: -masm=intel -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fstack-clash-protection -fcf-protection
	.text
	.globl	Text
	.bss
	.align 32
	.type	Text, @object
	.size	Text, 10000000
Text:
	.zero	10000000
	.globl	Sub
	.align 32
	.type	Sub, @object
	.size	Sub, 10000000
Sub:
	.zero	10000000
	.globl	Index
	.align 32
	.type	Index, @object
	.size	Index, 40000000
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
	push	rbp	#
	mov	rbp, rsp	#,
# ../../main.c:12:   printf("incorrect command line!\n"
	lea	rax, .LC0[rip]	# tmp82,
	mov	rdi, rax	#, tmp82
	call	puts@PLT	#
# ../../main.c:17: }
	nop	
	pop	rbp	#
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
	push	rbp	#
	mov	rbp, rsp	#,
# ../../main.c:19:   printf("the specified length of the substring does not correspond to reality\n");
	lea	rax, .LC1[rip]	# tmp82,
	mov	rdi, rax	#, tmp82
	call	puts@PLT	#
# ../../main.c:20: }
	nop	
	pop	rbp	#
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
	push	rbp	#
	mov	rbp, rsp	#,
# ../../main.c:22:   printf("incorrect size of substring!\n"
	mov	esi, 10000000	#,
	lea	rax, .LC2[rip]	# tmp82,
	mov	rdi, rax	#, tmp82
	mov	eax, 0	#,
	call	printf@PLT	#
# ../../main.c:25: }
	nop	
	pop	rbp	#
	ret	
	.size	errMessage3, .-errMessage3
	.globl	check_sub
	.type	check_sub, @function
check_sub:
	endbr64	
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 16	#,
	mov	DWORD PTR -4[rbp], edi	# real_size, real_size
	mov	QWORD PTR -16[rbp], rsi	# str, str
# ../../main.c:27:   return strlen(str) != real_size;
	mov	rax, QWORD PTR -16[rbp]	# tmp87, str
	mov	rdi, rax	#, tmp87
	call	strlen@PLT	#
# ../../main.c:27:   return strlen(str) != real_size;
	mov	edx, DWORD PTR -4[rbp]	# tmp88, real_size
	movsx	rdx, edx	# _2, tmp88
	cmp	rax, rdx	# _1, _2
	setne	al	#, _3
	movzx	eax, al	# _7, _3
# ../../main.c:28: }
	leave	
	ret	
	.size	check_sub, .-check_sub
	.globl	GenerateRandomString
	.type	GenerateRandomString, @function
GenerateRandomString:
	endbr64	
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 32	#,
	mov	DWORD PTR -20[rbp], edi	# text_size, text_size
# ../../main.c:30:   for (int i = 0; i < text_size; i++) {
	mov	DWORD PTR -4[rbp], 0	# i,
# ../../main.c:30:   for (int i = 0; i < text_size; i++) {
	jmp	.L7	#
.L8:
# ../../main.c:31:     Text[i] = rand() % 128;
	call	rand@PLT	#
# ../../main.c:31:     Text[i] = rand() % 128;
	cdq
	shr	edx, 25	# tmp86,
	add	eax, edx	# tmp87, tmp86
	and	eax, 127	# tmp88,
	sub	eax, edx	# tmp89, tmp86
# ../../main.c:31:     Text[i] = rand() % 128;
	mov	ecx, eax	# _3, _2
	mov	eax, DWORD PTR -4[rbp]	# tmp91, i
	cdqe
	lea	rdx, Text[rip]	# tmp92,
	mov	BYTE PTR [rax+rdx], cl	# Text[i_4], _3
# ../../main.c:30:   for (int i = 0; i < text_size; i++) {
	add	DWORD PTR -4[rbp], 1	# i,
.L7:
# ../../main.c:30:   for (int i = 0; i < text_size; i++) {
	mov	eax, DWORD PTR -4[rbp]	# tmp93, i
	cmp	eax, DWORD PTR -20[rbp]	# tmp93, text_size
	jl	.L8	#,
# ../../main.c:33: }
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
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 80	#,
	mov	DWORD PTR -68[rbp], edi	# argc, argc
	mov	QWORD PTR -80[rbp], rsi	# argv, argv
# ../../main.c:35:   if (argc < 5 || argc > 6) {
	cmp	DWORD PTR -68[rbp], 4	# argc,
	jle	.L10	#,
# ../../main.c:35:   if (argc < 5 || argc > 6) {
	cmp	DWORD PTR -68[rbp], 6	# argc,
	jle	.L11	#,
.L10:
# ../../main.c:36:     errMessage1();
	mov	eax, 0	#,
	call	errMessage1	#
# ../../main.c:37:     return 1;
	mov	eax, 1	# _45,
	jmp	.L12	#
.L11:
# ../../main.c:41:   if (!strcmp(argv[1], "-f")) {
	mov	rax, QWORD PTR -80[rbp]	# tmp124, argv
	add	rax, 8	# _1,
# ../../main.c:41:   if (!strcmp(argv[1], "-f")) {
	mov	rax, QWORD PTR [rax]	# _2, *_1
	lea	rdx, .LC3[rip]	# tmp125,
	mov	rsi, rdx	#, tmp125
	mov	rdi, rax	#, _2
	call	strcmp@PLT	#
# ../../main.c:41:   if (!strcmp(argv[1], "-f")) {
	test	eax, eax	# _3
	jne	.L13	#,
# ../../main.c:42:     FILE *ifst = fopen(argv[4], "r");
	mov	rax, QWORD PTR -80[rbp]	# tmp126, argv
	add	rax, 32	# _4,
# ../../main.c:42:     FILE *ifst = fopen(argv[4], "r");
	mov	rax, QWORD PTR [rax]	# _5, *_4
	lea	rdx, .LC4[rip]	# tmp127,
	mov	rsi, rdx	#, tmp127
	mov	rdi, rax	#, _5
	call	fopen@PLT	#
	mov	QWORD PTR -24[rbp], rax	# ifst, tmp128
# ../../main.c:43:     if (ifst == NULL) {
	cmp	QWORD PTR -24[rbp], 0	# ifst,
	jne	.L14	#,
# ../../main.c:44:       printf("Cannot open input file.\n");
	lea	rax, .LC5[rip]	# tmp129,
	mov	rdi, rax	#, tmp129
	call	puts@PLT	#
# ../../main.c:45:       return 3;
	mov	eax, 3	# _45,
	jmp	.L12	#
.L14:
# ../../main.c:47:     text_size = ReadFromFile(ifst, Text, SIZE_ARRAY);
	mov	rax, QWORD PTR -24[rbp]	# tmp130, ifst
	mov	edx, 10000000	#,
	lea	rcx, Text[rip]	# tmp131,
	mov	rsi, rcx	#, tmp131
	mov	rdi, rax	#, tmp130
	call	ReadFromFile@PLT	#
	mov	DWORD PTR -4[rbp], eax	# text_size, tmp132
# ../../main.c:48:     fclose(ifst);
	mov	rax, QWORD PTR -24[rbp]	# tmp133, ifst
	mov	rdi, rax	#, tmp133
	call	fclose@PLT	#
# ../../main.c:49:     sub_size = strtol(argv[2], NULL, 10);
	mov	rax, QWORD PTR -80[rbp]	# tmp134, argv
	add	rax, 16	# _6,
# ../../main.c:49:     sub_size = strtol(argv[2], NULL, 10);
	mov	rax, QWORD PTR [rax]	# _7, *_6
	mov	edx, 10	#,
	mov	esi, 0	#,
	mov	rdi, rax	#, _7
	call	strtol@PLT	#
# ../../main.c:49:     sub_size = strtol(argv[2], NULL, 10);
	mov	DWORD PTR -8[rbp], eax	# sub_size, _8
# ../../main.c:50:     stpcpy(Sub, argv[3]);
	mov	rax, QWORD PTR -80[rbp]	# tmp135, argv
	add	rax, 24	# _9,
# ../../main.c:50:     stpcpy(Sub, argv[3]);
	mov	rax, QWORD PTR [rax]	# _10, *_9
	mov	rsi, rax	#, _10
	lea	rax, Sub[rip]	# tmp136,
	mov	rdi, rax	#, tmp136
	call	strcpy@PLT	#
# ../../main.c:51:     if (check_sub(sub_size, argv[3])) {
	mov	rax, QWORD PTR -80[rbp]	# tmp137, argv
	add	rax, 24	# _11,
# ../../main.c:51:     if (check_sub(sub_size, argv[3])) {
	mov	rdx, QWORD PTR [rax]	# _12, *_11
	mov	eax, DWORD PTR -8[rbp]	# tmp138, sub_size
	mov	rsi, rdx	#, _12
	mov	edi, eax	#, tmp138
	call	check_sub	#
# ../../main.c:51:     if (check_sub(sub_size, argv[3])) {
	test	eax, eax	# _13
	je	.L15	#,
# ../../main.c:52:       errMessage2();
	mov	eax, 0	#,
	call	errMessage2	#
# ../../main.c:53:       return 2;
	mov	eax, 2	# _45,
	jmp	.L12	#
.L15:
# ../../main.c:55:     if (sub_size > SIZE_ARRAY || sub_size <= 0) {
	cmp	DWORD PTR -8[rbp], 10000000	# sub_size,
	jg	.L16	#,
# ../../main.c:55:     if (sub_size > SIZE_ARRAY || sub_size <= 0) {
	cmp	DWORD PTR -8[rbp], 0	# sub_size,
	jg	.L17	#,
.L16:
# ../../main.c:56:       errMessage3();
	mov	eax, 0	#,
	call	errMessage3	#
# ../../main.c:57:       return 3;
	mov	eax, 3	# _45,
	jmp	.L12	#
.L13:
# ../../main.c:59:   } else if (!strcmp(argv[1], "-n")) {
	mov	rax, QWORD PTR -80[rbp]	# tmp139, argv
	add	rax, 8	# _14,
# ../../main.c:59:   } else if (!strcmp(argv[1], "-n")) {
	mov	rax, QWORD PTR [rax]	# _15, *_14
	lea	rdx, .LC6[rip]	# tmp140,
	mov	rsi, rdx	#, tmp140
	mov	rdi, rax	#, _15
	call	strcmp@PLT	#
# ../../main.c:59:   } else if (!strcmp(argv[1], "-n")) {
	test	eax, eax	# _16
	jne	.L18	#,
# ../../main.c:60:     sub_size = strtol(argv[2], NULL, 10);
	mov	rax, QWORD PTR -80[rbp]	# tmp141, argv
	add	rax, 16	# _17,
# ../../main.c:60:     sub_size = strtol(argv[2], NULL, 10);
	mov	rax, QWORD PTR [rax]	# _18, *_17
	mov	edx, 10	#,
	mov	esi, 0	#,
	mov	rdi, rax	#, _18
	call	strtol@PLT	#
# ../../main.c:60:     sub_size = strtol(argv[2], NULL, 10);
	mov	DWORD PTR -8[rbp], eax	# sub_size, _19
# ../../main.c:61:     stpcpy(Sub, argv[3]);
	mov	rax, QWORD PTR -80[rbp]	# tmp142, argv
	add	rax, 24	# _20,
# ../../main.c:61:     stpcpy(Sub, argv[3]);
	mov	rax, QWORD PTR [rax]	# _21, *_20
	mov	rsi, rax	#, _21
	lea	rax, Sub[rip]	# tmp143,
	mov	rdi, rax	#, tmp143
	call	strcpy@PLT	#
# ../../main.c:62:     if (check_sub(sub_size, argv[3])) {
	mov	rax, QWORD PTR -80[rbp]	# tmp144, argv
	add	rax, 24	# _22,
# ../../main.c:62:     if (check_sub(sub_size, argv[3])) {
	mov	rdx, QWORD PTR [rax]	# _23, *_22
	mov	eax, DWORD PTR -8[rbp]	# tmp145, sub_size
	mov	rsi, rdx	#, _23
	mov	edi, eax	#, tmp145
	call	check_sub	#
# ../../main.c:62:     if (check_sub(sub_size, argv[3])) {
	test	eax, eax	# _24
	je	.L19	#,
# ../../main.c:63:       errMessage2();
	mov	eax, 0	#,
	call	errMessage2	#
# ../../main.c:64:       return 2;
	mov	eax, 2	# _45,
	jmp	.L12	#
.L19:
# ../../main.c:66:     if (sub_size > SIZE_ARRAY || sub_size <= 0) {
	cmp	DWORD PTR -8[rbp], 10000000	# sub_size,
	jg	.L20	#,
# ../../main.c:66:     if (sub_size > SIZE_ARRAY || sub_size <= 0) {
	cmp	DWORD PTR -8[rbp], 0	# sub_size,
	jg	.L21	#,
.L20:
# ../../main.c:67:       errMessage3();
	mov	eax, 0	#,
	call	errMessage3	#
# ../../main.c:68:       return 3;
	mov	eax, 3	# _45,
	jmp	.L12	#
.L21:
# ../../main.c:70:     srand((unsigned int) (time(0)));
	mov	edi, 0	#,
	call	time@PLT	#
# ../../main.c:70:     srand((unsigned int) (time(0)));
	mov	edi, eax	#, _26
	call	srand@PLT	#
# ../../main.c:71:     text_size = SIZE_ARRAY;
	mov	DWORD PTR -4[rbp], 10000000	# text_size,
# ../../main.c:72:     if (!strcmp(argv[4], "-r")) {
	mov	rax, QWORD PTR -80[rbp]	# tmp146, argv
	add	rax, 32	# _27,
# ../../main.c:72:     if (!strcmp(argv[4], "-r")) {
	mov	rax, QWORD PTR [rax]	# _28, *_27
	lea	rdx, .LC7[rip]	# tmp147,
	mov	rsi, rdx	#, tmp147
	mov	rdi, rax	#, _28
	call	strcmp@PLT	#
# ../../main.c:72:     if (!strcmp(argv[4], "-r")) {
	test	eax, eax	# _29
	jne	.L22	#,
# ../../main.c:73:       GenerateRandomString(text_size);
	mov	eax, DWORD PTR -4[rbp]	# tmp148, text_size
	mov	edi, eax	#, tmp148
	call	GenerateRandomString	#
	jmp	.L17	#
.L22:
# ../../main.c:74:     } else if (!strcmp(argv[4], "-c")) {
	mov	rax, QWORD PTR -80[rbp]	# tmp149, argv
	add	rax, 32	# _30,
# ../../main.c:74:     } else if (!strcmp(argv[4], "-c")) {
	mov	rax, QWORD PTR [rax]	# _31, *_30
	lea	rdx, .LC8[rip]	# tmp150,
	mov	rsi, rdx	#, tmp150
	mov	rdi, rax	#, _31
	call	strcmp@PLT	#
# ../../main.c:74:     } else if (!strcmp(argv[4], "-c")) {
	test	eax, eax	# _32
	jne	.L23	#,
# ../../main.c:75:       text_size = ReadFromConsole(Text, text_size);
	mov	eax, DWORD PTR -4[rbp]	# tmp151, text_size
	mov	esi, eax	#, tmp151
	lea	rax, Text[rip]	# tmp152,
	mov	rdi, rax	#, tmp152
	call	ReadFromConsole@PLT	#
	mov	DWORD PTR -4[rbp], eax	# text_size, tmp153
	jmp	.L17	#
.L23:
# ../../main.c:77:       errMessage1();
	mov	eax, 0	#,
	call	errMessage1	#
# ../../main.c:78:       return 1;
	mov	eax, 1	# _45,
	jmp	.L12	#
.L18:
# ../../main.c:81:     errMessage1();
	mov	eax, 0	#,
	call	errMessage1	#
# ../../main.c:82:     return 1;
	mov	eax, 1	# _45,
	jmp	.L12	#
.L17:
# ../../main.c:84:   clock_t start = clock();
	call	clock@PLT	#
	mov	QWORD PTR -32[rbp], rax	# start, tmp154
# ../../main.c:85:   for (int i = 0; i < 20; ++i) {
	mov	DWORD PTR -16[rbp], 0	# i,
# ../../main.c:85:   for (int i = 0; i < 20; ++i) {
	jmp	.L24	#
.L25:
# ../../main.c:86:     index_size = BuildIndexArray(Index, Sub, sub_size, Text, text_size);
	mov	edx, DWORD PTR -4[rbp]	# tmp155, text_size
	mov	eax, DWORD PTR -8[rbp]	# tmp156, sub_size
	mov	r8d, edx	#, tmp155
	lea	rdx, Text[rip]	# tmp157,
	mov	rcx, rdx	#, tmp157
	mov	edx, eax	#, tmp156
	lea	rax, Sub[rip]	# tmp158,
	mov	rsi, rax	#, tmp158
	lea	rax, Index[rip]	# tmp159,
	mov	rdi, rax	#, tmp159
	call	BuildIndexArray@PLT	#
	mov	DWORD PTR -12[rbp], eax	# index_size, tmp160
# ../../main.c:85:   for (int i = 0; i < 20; ++i) {
	add	DWORD PTR -16[rbp], 1	# i,
.L24:
# ../../main.c:85:   for (int i = 0; i < 20; ++i) {
	cmp	DWORD PTR -16[rbp], 19	# i,
	jle	.L25	#,
# ../../main.c:88:   clock_t end = clock();
	call	clock@PLT	#
	mov	QWORD PTR -40[rbp], rax	# end, tmp161
# ../../main.c:89:   double calcTime = ((double) (end - start)) / (CLOCKS_PER_SEC + 1.0);
	mov	rax, QWORD PTR -40[rbp]	# tmp162, end
	sub	rax, QWORD PTR -32[rbp]	# _33, start
# ../../main.c:89:   double calcTime = ((double) (end - start)) / (CLOCKS_PER_SEC + 1.0);
	pxor	xmm0, xmm0	# _34
	cvtsi2sd	xmm0, rax	# _34, _33
# ../../main.c:89:   double calcTime = ((double) (end - start)) / (CLOCKS_PER_SEC + 1.0);
	movsd	xmm1, QWORD PTR .LC9[rip]	# tmp164,
	divsd	xmm0, xmm1	# tmp163, tmp164
	movsd	QWORD PTR -48[rbp], xmm0	# calcTime, tmp163
# ../../main.c:90:   Output(stdout, Index, index_size);
	mov	rax, QWORD PTR stdout[rip]	# stdout.0_35, stdout
	mov	edx, DWORD PTR -12[rbp]	# tmp165, index_size
	lea	rcx, Index[rip]	# tmp166,
	mov	rsi, rcx	#, tmp166
	mov	rdi, rax	#, stdout.0_35
	call	Output@PLT	#
# ../../main.c:91:   FILE *ofst1 = fopen(argv[5], "w");
	mov	rax, QWORD PTR -80[rbp]	# tmp167, argv
	add	rax, 40	# _36,
# ../../main.c:91:   FILE *ofst1 = fopen(argv[5], "w");
	mov	rax, QWORD PTR [rax]	# _37, *_36
	lea	rdx, .LC10[rip]	# tmp168,
	mov	rsi, rdx	#, tmp168
	mov	rdi, rax	#, _37
	call	fopen@PLT	#
	mov	QWORD PTR -56[rbp], rax	# ofst1, tmp169
# ../../main.c:92:   if (ofst1 == NULL) {
	cmp	QWORD PTR -56[rbp], 0	# ofst1,
	jne	.L26	#,
# ../../main.c:93:     printf("Cannot open %s to write\n", argv[5]);
	mov	rax, QWORD PTR -80[rbp]	# tmp170, argv
	add	rax, 40	# _38,
# ../../main.c:93:     printf("Cannot open %s to write\n", argv[5]);
	mov	rax, QWORD PTR [rax]	# _39, *_38
	mov	rsi, rax	#, _39
	lea	rax, .LC11[rip]	# tmp171,
	mov	rdi, rax	#, tmp171
	mov	eax, 0	#,
	call	printf@PLT	#
# ../../main.c:94:     return 1;
	mov	eax, 1	# _45,
	jmp	.L12	#
.L26:
# ../../main.c:96:   Output(ofst1, Index, index_size);
	mov	edx, DWORD PTR -12[rbp]	# tmp172, index_size
	mov	rax, QWORD PTR -56[rbp]	# tmp173, ofst1
	lea	rcx, Index[rip]	# tmp174,
	mov	rsi, rcx	#, tmp174
	mov	rdi, rax	#, tmp173
	call	Output@PLT	#
# ../../main.c:97:   fprintf(stdout, "Calculation time = %g\n", calcTime);
	mov	rax, QWORD PTR stdout[rip]	# stdout.1_40, stdout
	mov	rdx, QWORD PTR -48[rbp]	# tmp175, calcTime
	movq	xmm0, rdx	#, tmp175
	lea	rdx, .LC12[rip]	# tmp176,
	mov	rsi, rdx	#, tmp176
	mov	rdi, rax	#, stdout.1_40
	mov	eax, 1	#,
	call	fprintf@PLT	#
# ../../main.c:98:   fprintf(ofst1, "\nCalculation time = %g\n", calcTime);
	mov	rdx, QWORD PTR -48[rbp]	# tmp177, calcTime
	mov	rax, QWORD PTR -56[rbp]	# tmp178, ofst1
	movq	xmm0, rdx	#, tmp177
	lea	rdx, .LC13[rip]	# tmp179,
	mov	rsi, rdx	#, tmp179
	mov	rdi, rax	#, tmp178
	mov	eax, 1	#,
	call	fprintf@PLT	#
# ../../main.c:99:   fclose(ofst1);
	mov	rax, QWORD PTR -56[rbp]	# tmp180, ofst1
	mov	rdi, rax	#, tmp180
	call	fclose@PLT	#
# ../../main.c:100:   return 0;
	mov	eax, 0	# _45,
.L12:
# ../../main.c:101: }
	leave	
	ret	
	.size	main, .-main
	.section	.rodata
	.align 8
.LC9:
	.long	0
	.long	1093567618
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
