.file "main.c"
  .intel_syntax noprefix
  .text
  .globl  A
  .bss
  .align 32
  .type A, @object
  .size A, 400000
A:
  .zero 400000
  .globl  B
  .align 32
  .type B, @object
  .size B, 400000
B:
  .zero 400000
  .section  .rodata
  .align 8
.LC0:
  .string "incorrect command line!\n  Waited:\n     command -f infile outfile01 outfile02\n  Or:\n     command -n number outfile01 outfile02"
  .text
  .globl  errMessage1
  .type errMessage1, @function
errMessage1:
  endbr64
  push  rbp
  mov rbp, rsp
  lea rax, .LC0[rip]
  mov rdi, rax
  call  puts@PLT
  nop
  pop rbp
  ret
  .size errMessage1, .-errMessage1
  .section  .rodata
  .align 8
.LC1:
  .string "incorrect qualifier value!\n  Waited:\n     command -f number infile outfile01 outfile02\n  Or:\n     command -n number outfile01 outfile02"
  .text
  .globl  errMessage2
  .type errMessage2, @function
errMessage2:
  endbr64
  push  rbp
  mov rbp, rsp
  lea rax, .LC1[rip]
  mov rdi, rax
  call  puts@PLT
  nop
  pop rbp
  ret
  .size errMessage2, .-errMessage2
  .section  .rodata
  .align 8
.LC2:
  .string "incorrect qualifier in file value!\n  Waited:\n     number\n     A[0] A[1] ... A[number - 1]"
  .string "incorrect qualifier in file value!\n  Waited:\n     number\n     A[0] A[1] ... A[number - 1]"
  .text
  .globl  errMessage3
  .type errMessage3, @function
errMessage3:
  endbr64
  push  rbp
  mov rbp, rsp
  lea rax, .LC2[rip]
  mov rdi, rax
  call  puts@PLT
  nop
  pop rbp
  ret
  .size errMessage3, .-errMessage3
  .globl  GenerateRandomArray
  .type GenerateRandomArray, @function
GenerateRandomArray:
  endbr64
  push  rbp
  mov rbp, rsp
  sub rsp, 32
  mov QWORD PTR -24[rbp], rdi
  mov DWORD PTR -4[rbp], 0
  jmp .L5
.L6:
  call  rand@PLT
  movsx rdx, eax
  imul  rdx, rdx, 274877907
  shr rdx, 32
  sar edx, 6
  mov ecx, eax
  sar ecx, 31
  sub edx, ecx
  imul  ecx, edx, 1000
  sub eax, ecx
  mov edx, eax
  mov eax, DWORD PTR -4[rbp]
  cdqe
  lea rcx, 0[0+rax*4]
  lea rax, A[rip]
  mov DWORD PTR [rcx+rax], edx
  add DWORD PTR -4[rbp], 1
.L5:
  mov eax, DWORD PTR -4[rbp]
  cdqe
  cmp QWORD PTR -24[rbp], rax
  ja  .L6
  nop
  nop
  leave
  ret
  .size GenerateRandomArray, .-GenerateRandomArray
  .section  .rodata
.LC3:
  .string "-f"
.LC4:
  .string "r"
.LC5:
  .string "Cannot open infile. To read"
  .align 8
.LC6:
  .string "incorrect numer of figures = %ld. Set 0 < number <= 10000\n"
.LC7:
  .string "-n"
.LC8:
  .string "Filled array A:\n"
.LC10:
  .string "Built array B:\n"
.LC11:
  .string "w"
  .align 8
.LC12:
  .string "Cannot open outfile01. To write"
.LC13:
  .string "Calculation time = %g\n"
  .text
  .globl  main
  .type main, @function
main:
  endbr64
  push  rbp
  mov rbp, rsp
  sub rsp, 80
  mov DWORD PTR -68[rbp], edi
  mov QWORD PTR -80[rbp], rsi
  cmp DWORD PTR -68[rbp], 4
  jg  .L8
  mov eax, 0
  call  errMessage1
  mov eax, 1
  jmp .L9
.L8:
  mov QWORD PTR -8[rbp], 0
  mov rax, QWORD PTR -80[rbp]
  add rax, 8
  mov rax, QWORD PTR [rax]
  lea rdx, .LC3[rip]
  mov rsi, rdx
  mov rdi, rax
  call  strcmp@PLT
  test  eax, eax
  jne .L10
  mov rax, QWORD PTR -80[rbp]
  add rax, 24
  mov rax, QWORD PTR [rax]
  lea rdx, .LC4[rip]
  mov rsi, rdx
  mov rdi, rax
  call  fopen@PLT
  mov QWORD PTR -16[rbp], rax
 cmp QWORD PTR -16[rbp], 0
  jne .L11
  lea rax, .LC5[rip]
  mov rdi, rax
  call  puts@PLT
  mov eax, 3
  jmp .L9
.L11:
  mov rax, QWORD PTR -16[rbp]
  lea rdx, A[rip]
  mov rsi, rdx
  mov rdi, rax
  call  ReadFromFile@PLT
  cdqe
  mov QWORD PTR -8[rbp], rax
  cmp QWORD PTR -8[rbp], -2
  jne .L12
  mov rax, QWORD PTR -8[rbp]
  mov rsi, rax
  lea rax, .LC6[rip]
  mov rdi, rax
  mov eax, 0
  call  printf@PLT
  mov eax, 3
  jmp .L9
.L12:
  cmp QWORD PTR -8[rbp], -1
  jne .L13
  mov eax, 0
  call  errMessage3
  mov eax, 3
  jmp .L9
.L10:
  mov rax, QWORD PTR -80[rbp]
  add rax, 8
  mov rax, QWORD PTR [rax]
  lea rdx, .LC7[rip]
  mov rsi, rdx
  mov rdi, rax
  call  strcmp@PLT
  test  eax, eax
  jne .L14
  mov rax, QWORD PTR -80[rbp]
  add rax, 16
  mov rax, QWORD PTR [rax]
  mov edx, 10
  mov esi, 0
  mov rdi, rax
  call  strtol@PLT
  mov QWORD PTR -8[rbp], rax
  cmp QWORD PTR -8[rbp], 0
  jle .L15
  cmp QWORD PTR -8[rbp], 100000
  jle .L16
.L15:
  mov rax, QWORD PTR -8[rbp]
  mov rsi, rax
  lea rax, .LC6[rip]
  mov rdi, rax
  mov eax, 0
  call  printf@PLT
  mov eax, 3
  jmp .L9
.L16:
  mov edi, 0
  call  time@PLT
  mov edi, eax
  call  srand@PLT
  mov rax, QWORD PTR -8[rbp]
  mov rdi, rax
  call  GenerateRandomArray
  mov rax, QWORD PTR stdout[rip]
  mov rcx, rax
  mov edx, 16
  mov esi, 1
  lea rax, .LC8[rip]
  mov rdi, rax
  call  fwrite@PLT
  mov rdx, QWORD PTR -8[rbp]
  mov rax, QWORD PTR stdout[rip]
  lea rcx, A[rip]
  mov rsi, rcx
  mov rdi, rax
  call  Output@PLT
  jmp .L13
.L14:
  mov eax, 0
  call  errMessage2
  mov eax, 2
  jmp .L9
.L13:
  call  clock@PLT
  mov QWORD PTR -24[rbp], rax
  mov rax, QWORD PTR -8[rbp]
  mov rdx, rax
  lea rax, A[rip]
  mov rsi, rax
  lea rax, B[rip]
  mov rdi, rax
  call  BuildBArray@PLT
  call  clock@PLT
  mov QWORD PTR -32[rbp], rax
  mov rax, QWORD PTR -32[rbp]
  sub rax, QWORD PTR -24[rbp]
  pxor  xmm0, xmm0
  cvtsi2sd  xmm0, rax
  movsd xmm1, QWORD PTR .LC9[rip]
  divsd xmm0, xmm1
  movsd QWORD PTR -40[rbp], xmm0
  mov rax, QWORD PTR stdout[rip]
  mov rcx, rax
  mov edx, 15
  mov esi, 1
  lea rax, .LC10[rip]
  mov rdi, rax
  call  fwrite@PLT
  mov rdx, QWORD PTR -8[rbp]
  mov rax, QWORD PTR stdout[rip]
  lea rcx, B[rip]
  mov rsi, rcx
  mov rdi, rax
  call  Output@PLT
  mov rax, QWORD PTR -80[rbp]
  add rax, 24
  mov rax, QWORD PTR [rax]
  lea rdx, .LC11[rip]
  mov rsi, rdx
  mov rdi, rax
  call  fopen@PLT
  mov QWORD PTR -48[rbp], rax
  cmp QWORD PTR -48[rbp], 0
  jne .L17
  lea rax, .LC12[rip]
  mov rdi, rax
  call  puts@PLT
  mov eax, 1
  jmp .L9
.L17:
  mov rax, QWORD PTR -48[rbp]
  mov rcx, rax
  mov edx, 15
  mov esi, 1
  lea rax, .LC10[rip]
  mov rdi, rax
  call  fwrite@PLT
  mov rdx, QWORD PTR -8[rbp]
  mov rax, QWORD PTR -48[rbp]
  lea rcx, B[rip]
  mov rsi, rcx
  mov rdi, rax
  call  Output@PLT
  mov rax, QWORD PTR -48[rbp]
  mov rdi, rax
  call  fclose@PLT
  mov rax, QWORD PTR stdout[rip]
  mov rdx, QWORD PTR -40[rbp]
  movq  xmm0, rdx
  lea rdx, .LC13[rip]
  mov rsi, rdx
  mov rdi, rax
  mov eax, 1
  call  fprintf@PLT
  mov rax, QWORD PTR -80[rbp]
  add rax, 32
  mov rax, QWORD PTR [rax]
  lea rdx, .LC11[rip]
  mov rsi, rdx
  mov rdi, rax
  call  fopen@PLT
  mov QWORD PTR -56[rbp], rax
  cmp QWORD PTR -56[rbp], 0
  jne .L18
  lea rax, .LC12[rip]
  mov rdi, rax
  call  puts@PLT
  mov eax, 1
  jmp .L9
.L18:
  mov rdx, QWORD PTR -40[rbp]
  mov rax, QWORD PTR -56[rbp]
  movq  xmm0, rdx
  lea rdx, .LC13[rip]
  mov rsi, rdx
  mov rdi, rax
  mov eax, 1
  call  fprintf@PLT
  mov rax, QWORD PTR -48[rbp]
  mov rdi, rax
  call  fclose@PLT
  mov eax, 0
.L9:
  leave
  ret
  .size main, .-main
  .section  .rodata
  .align 8
.LC9:
  .long 0
  .long 1093567618
  .ident  "GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
  .section  .note.GNU-stack,"",@progbits
  .section  .note.gnu.property,"a"
  .align 8
  .long 1f - 0f
  .long 4f - 1f
  .long 5
0:
  .string "GNU"
1:
  .align 8
  .long 0xc0000002
  .long 3f - 2f
2:
  .long 0x3
3:
  .align 8
4:
