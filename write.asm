section .data

filename    db    "output.txt", 0x00
message     db    "unable to open file: 0", 0x0A, 0x00
title       db    "this file has descriptor 0", 0x0A, 0x00
fd          db    0x00
nl          db    0x0A

section .text

      global _start

_start:
      ; open file for writing, append mode
      mov   rsi, 2102o        ; O_CREAT | O_APPEND | O_RDWR
      mov   rdx, 0o600         ; u+rw
      mov   rdi, filename
      mov   rax, 2
      syscall

      cmp   rax, 0
      jg    opened

unopened:
      ; syscall return a negative encoded error message.
      neg   rax
      add   [message+21], rax
      mov   rsi, message
      mov   rdx, 24
      jmp   inform

opened:
      ; copy the file descriptor
      mov   [fd], rax
      add   [title+25], rax
      mov   rsi, filename
      mov   rdx, 11

inform:
      mov   rdi, 1
      mov   rax, 1
      syscall

write_out:
      mov   rdi, [fd]
      mov   rsi, title
      mov   rdx, 28
      mov   rax, 1
      syscall

      mov   rax, 3
      syscall

      mov   rdi, 0
      mov   rax, 60
      syscall
