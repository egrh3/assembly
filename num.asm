%include    "itoa.asm"

section .data
msg   db    "your number is: ", 00h
lf    db    0Ah

section .bss
num   resw  1

section .text

      global _start

_start:
      mov   rax, 1
      mov   rdi, 0
      mov   rsi, msg
      mov   rdx, 17
      syscall

      mov   rdi, num
      mov   rax, 37      ; the digit(s) to decode
      call  itoa

_itis:
      mov   rsi, rdi
      mov   rdx, rax
      mov   rax, 1
      mov   rdi, 0
      syscall

_crlf:
      mov   rsi, lf
      mov   rax, 1
      mov   rdi, 0
      mov   rdx, 2
      syscall

_exit:
      mov   rdi, 0
      mov   rax, 60
      syscall

