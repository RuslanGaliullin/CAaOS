	.file	"addition.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.3.0-1ubuntu1~22.04) version 11.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=96 --param ggc-min-heapsize=123934
# options passed: -masm=intel -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fstack-clash-protection -fcf-protection
	.text
	.globl	BuildIndexArray
	.type	BuildIndexArray, @function
BuildIndexArray:
	endbr64	
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 48	#,
	mov	QWORD PTR -24[rbp], rdi	# answ, answ
	mov	QWORD PTR -32[rbp], rsi	# sub, sub
	mov	DWORD PTR -36[rbp], edx	# size_sub, size_sub
	mov	QWORD PTR -48[rbp], rcx	# A, A
	mov	DWORD PTR -40[rbp], r8d	# size_A, size_A
# ../../addition.c:4:   int j = 0;
	mov	DWORD PTR -4[rbp], 0	# j,
# ../../addition.c:5:   for (int i = 0; i < size_A - size_sub + 1; ++i) {
	mov	DWORD PTR -8[rbp], 0	# i,
# ../../addition.c:5:   for (int i = 0; i < size_A - size_sub + 1; ++i) {
	jmp	.L2	#
.L4:
# ../../addition.c:6:     if (strncmp(sub, &A[i], size_sub) == 0) {
	mov	eax, DWORD PTR -36[rbp]	# tmp92, size_sub
	movsx	rdx, eax	# _1, tmp92
	mov	eax, DWORD PTR -8[rbp]	# tmp93, i
	movsx	rcx, eax	# _2, tmp93
# ../../addition.c:6:     if (strncmp(sub, &A[i], size_sub) == 0) {
	mov	rax, QWORD PTR -48[rbp]	# tmp94, A
	add	rcx, rax	# _3, tmp94
# ../../addition.c:6:     if (strncmp(sub, &A[i], size_sub) == 0) {
	mov	rax, QWORD PTR -32[rbp]	# tmp95, sub
	mov	rsi, rcx	#, _3
	mov	rdi, rax	#, tmp95
	call	strncmp@PLT	#
# ../../addition.c:6:     if (strncmp(sub, &A[i], size_sub) == 0) {
	test	eax, eax	# _4
	jne	.L3	#,
# ../../addition.c:7:       answ[j] = i;
	mov	eax, DWORD PTR -4[rbp]	# tmp96, j
	cdqe
	lea	rdx, 0[0+rax*4]	# _6,
	mov	rax, QWORD PTR -24[rbp]	# tmp97, answ
	add	rdx, rax	# _7, tmp97
# ../../addition.c:7:       answ[j] = i;
	mov	eax, DWORD PTR -8[rbp]	# tmp98, i
	mov	DWORD PTR [rdx], eax	# *_7, tmp98
# ../../addition.c:8:       ++j;
	add	DWORD PTR -4[rbp], 1	# j,
.L3:
# ../../addition.c:5:   for (int i = 0; i < size_A - size_sub + 1; ++i) {
	add	DWORD PTR -8[rbp], 1	# i,
.L2:
# ../../addition.c:5:   for (int i = 0; i < size_A - size_sub + 1; ++i) {
	mov	eax, DWORD PTR -40[rbp]	# tmp99, size_A
	sub	eax, DWORD PTR -36[rbp]	# _8, size_sub
# ../../addition.c:5:   for (int i = 0; i < size_A - size_sub + 1; ++i) {
	cmp	DWORD PTR -8[rbp], eax	# i, _8
	jle	.L4	#,
# ../../addition.c:11:   return j;
	mov	eax, DWORD PTR -4[rbp]	# _19, j
# ../../addition.c:12: }
	leave	
	ret	
	.size	BuildIndexArray, .-BuildIndexArray
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	Output
	.type	Output, @function
Output:
	endbr64	
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 48	#,
	mov	QWORD PTR -24[rbp], rdi	# ofst, ofst
	mov	QWORD PTR -32[rbp], rsi	# array, array
	mov	DWORD PTR -36[rbp], edx	# size, size
# ../../addition.c:14:   for (int i = 0; i < size; i++) {
	mov	DWORD PTR -4[rbp], 0	# i,
# ../../addition.c:14:   for (int i = 0; i < size; i++) {
	jmp	.L7	#
.L8:
# ../../addition.c:15:     fprintf(ofst, "%d ", array[i]);
	mov	eax, DWORD PTR -4[rbp]	# tmp86, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _2,
	mov	rax, QWORD PTR -32[rbp]	# tmp87, array
	add	rax, rdx	# _3, _2
# ../../addition.c:15:     fprintf(ofst, "%d ", array[i]);
	mov	edx, DWORD PTR [rax]	# _4, *_3
	mov	rax, QWORD PTR -24[rbp]	# tmp88, ofst
	lea	rcx, .LC0[rip]	# tmp89,
	mov	rsi, rcx	#, tmp89
	mov	rdi, rax	#, tmp88
	mov	eax, 0	#,
	call	fprintf@PLT	#
# ../../addition.c:14:   for (int i = 0; i < size; i++) {
	add	DWORD PTR -4[rbp], 1	# i,
.L7:
# ../../addition.c:14:   for (int i = 0; i < size; i++) {
	mov	eax, DWORD PTR -4[rbp]	# tmp90, i
	cmp	eax, DWORD PTR -36[rbp]	# tmp90, size
	jl	.L8	#,
# ../../addition.c:17:   fprintf(ofst, "\n");
	mov	rax, QWORD PTR -24[rbp]	# tmp91, ofst
	mov	rsi, rax	#, tmp91
	mov	edi, 10	#,
	call	fputc@PLT	#
# ../../addition.c:18: }
	nop	
	leave	
	ret	
	.size	Output, .-Output
	.globl	ReadFromFile
	.type	ReadFromFile, @function
ReadFromFile:
	endbr64	
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 48	#,
	mov	QWORD PTR -24[rbp], rdi	# fin, fin
	mov	QWORD PTR -32[rbp], rsi	# A, A
	mov	DWORD PTR -36[rbp], edx	# max_size, max_size
# ../../addition.c:20:   int i = 0;
	mov	DWORD PTR -4[rbp], 0	# i,
.L12:
# ../../addition.c:23:     if (i == max_size) {
	mov	eax, DWORD PTR -4[rbp]	# tmp94, i
	cmp	eax, DWORD PTR -36[rbp]	# tmp94, max_size
	je	.L15	#,
# ../../addition.c:26:     ch = fgetc(fin);
	mov	rax, QWORD PTR -24[rbp]	# tmp95, fin
	mov	rdi, rax	#, tmp95
	call	fgetc@PLT	#
	mov	DWORD PTR -8[rbp], eax	# ch, tmp96
# ../../addition.c:27:     A[i] = ch;
	mov	eax, DWORD PTR -4[rbp]	# tmp97, i
	movsx	rdx, eax	# _1, tmp97
	mov	rax, QWORD PTR -32[rbp]	# tmp98, A
	add	rax, rdx	# _2, _1
# ../../addition.c:27:     A[i] = ch;
	mov	edx, DWORD PTR -8[rbp]	# tmp99, ch
	mov	BYTE PTR [rax], dl	# *_2, _3
# ../../addition.c:28:     ++i;
	add	DWORD PTR -4[rbp], 1	# i,
# ../../addition.c:29:   } while (ch != -1);
	cmp	DWORD PTR -8[rbp], -1	# ch,
	jne	.L12	#,
	jmp	.L11	#
.L15:
# ../../addition.c:24:       break;
	nop	
.L11:
# ../../addition.c:30:   if (A[i - 1] == -1) {
	mov	eax, DWORD PTR -4[rbp]	# tmp100, i
	cdqe
	lea	rdx, -1[rax]	# _5,
	mov	rax, QWORD PTR -32[rbp]	# tmp101, A
	add	rax, rdx	# _6, _5
	movzx	eax, BYTE PTR [rax]	# _7, *_6
# ../../addition.c:30:   if (A[i - 1] == -1) {
	cmp	al, -1	# _7,
	jne	.L13	#,
# ../../addition.c:31:     A[i - 1] = '\0';
	mov	eax, DWORD PTR -4[rbp]	# tmp102, i
	cdqe
	lea	rdx, -1[rax]	# _9,
	mov	rax, QWORD PTR -32[rbp]	# tmp103, A
	add	rax, rdx	# _10, _9
# ../../addition.c:31:     A[i - 1] = '\0';
	mov	BYTE PTR [rax], 0	# *_10,
.L13:
# ../../addition.c:33:   return i;
	mov	eax, DWORD PTR -4[rbp]	# _26, i
# ../../addition.c:34: }
	leave	
	ret	
	.size	ReadFromFile, .-ReadFromFile
	.globl	ReadFromConsole
	.type	ReadFromConsole, @function
ReadFromConsole:
	endbr64	
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 16	#,
	mov	QWORD PTR -8[rbp], rdi	# A, A
	mov	DWORD PTR -12[rbp], esi	# max_size, max_size
# ../../addition.c:37:   return ReadFromFile(stdin, A, max_size);
	mov	rax, QWORD PTR stdin[rip]	# stdin.0_1, stdin
	mov	edx, DWORD PTR -12[rbp]	# tmp85, max_size
	mov	rcx, QWORD PTR -8[rbp]	# tmp86, A
	mov	rsi, rcx	#, tmp86
	mov	rdi, rax	#, stdin.0_1
	call	ReadFromFile	#
# ../../addition.c:38: }
	leave	
	ret	
	.size	ReadFromConsole, .-ReadFromConsole
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
