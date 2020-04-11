section .data
one   db    'b', 0xa
two   db    0x01

section .text

      global _start

_start:
;      mov   bl, [one]
;      add   bl, byte [two]
;      mov   [one], bl

      mov   ah, [two]
      add   [one], ah
      mov   rdi, 1
      mov   rsi, one
      mov   rdx, 2
      mov   rax, 1
      syscall

      mov   rdi, 0
      mov   rax, 60
      syscall
