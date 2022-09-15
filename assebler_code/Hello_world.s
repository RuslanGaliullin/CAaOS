	.global	_start

	.text
_start:
	mov	$1, %rax
	mov	$1, %rdi
	mov	$message, %rsi
	mov	msglength, %rdx 
	syscall
	mov	$60, %rax
	xor	%rdi, %rdi
	syscall

	.data

message: .ascii	"Hello, World", 10
msglength: .word 13

