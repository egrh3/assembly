section .data

got_msg     db    "my PID was: ", 0x0A
got_len     equ   $ - got_msg
err_msg     db    "unable to get PID: 0", 0X0A
err_len     equ   $ - err_msg
ret_val     db    0x00

section .text

      global _start

_start:
      ; an attempt to get the PID of this process.
      ; not sure quite what I'm doing. a guess.
      mov   rax, 39
      syscall

      mov   [ret_val], rax
      ; check if we got an error ( neg ret value )
      cmp   rax, 0
      jg    pid

error:
      neg   rax
      add   [err_msg + ( err_len - 2 )], rax
      ; print err_msg to STDOUT
      mov   rax, 1      ; sys_write()
      mov   rdi, 0      ; STDOUT
      mov   rsi, err_msg
      mov   rdx, err_len
      syscall

      jmp   exiting

pid:
      ; this is going to be ugly. %rax is likely to have a
      ; a multiplae digit numbers that won't add well.
      ; need to figure out how to better print integers.
      add   [got_msg + ( got_len - 2)], rax
      mov   rax, 1      ; sys_write()
      mov   rdi, 0      ; STDOUT
      mov   rsi, got_msg
      mov   rdx, got_len
      syscall

exiting:
      mov   rdi, [ret_val]
      mov   rax, 60     ; sys_exit()
      syscall
