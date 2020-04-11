; string print helpers
%include "prn.asm"

section .data
header      db    "sum of 1 to ", 00h
torso       db    " is ", 00h
tail        db    0Ah, 00h

section .bss
input       resw    1

section .text
global _start

_start:
      mov   rcx, 1      ; always assume argc>=1

_prnarg:
      mov   rsi, [rsp+8*rcx]
      call  _strlen
      call  _print
      cmp   rcx, [rsp]
      je    _exit
      inc   rcx
      jmp   _prnarg

_exit:
      mov   rax, 60
      mov   rdi, 0
      syscall
