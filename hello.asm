section .data
msg \
	db    "deelo", 0xA
len \
	equ   $ - msg

section .text
	global _start

_start:
	mov   rdi, 1
	mov   rsi, msg
	mov   rdx, len
	mov   rax, 1
	syscall

	mov   rdi, 0
	mov   rax, 60
	syscall
