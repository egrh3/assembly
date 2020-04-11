section .data

filename    db    "output.txt", 0x00
filesize    db    "read: 
open_er     db    "unable to open file: 0", 0x0A, 0x00
open_ok     db    "file opened..", 0x0A, 0x00
fd          db    0x00
nl          db    0x0A
stdout      db    0x01

section .bss

buffer      resb  30
lenght      resb  1

section .text

      global _start

_start:
      ; open file for writing, append mode
      mov   rsi, 0000o        ; O_RDONLY
      mov   rdx, 0600o        ; u+rw
      mov   rdi, filename
      mov   rax, 2
      syscall

      cmp   rax, 0
      jg    opened

unopened:
      ; syscall returns a negative encoded error open_er.
      neg   rax
      add   [open_er+21], rax
      mov   rsi, open_er
      mov   rdx, 24
      jmp   inform

opened:
      ; copy the file descriptor
      mov   [fd], rax
      mov   rsi, open_ok
      mov   rdx, 15

inform:
      mov   rdi, 1
      mov   rax, 1
      syscall

read:
      mov   rdi, [fd]
      mov   rsi, buffer
      mov   rdx, 30
      mov   rax, 0
      syscall

close:
      mov   rax, 3
      syscall

print:
      mov   rdi, 1
      mov   rdx, 30
      mov   rax, 1
      syscall

exit:
      mov   rdi, 0
      mov   rax, 60
      syscall
