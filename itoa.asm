; attempting a loose-leaf itoa() following from:
;     https://asmtutor.com/#lesson11

; as if: itoa(rax, rdi) -> stack
;     rdi: memory location to stuff bytes
;     rax: number to decode
section .data
width dw    0x00
base  dw    10    ; needs to word? byte seems to fail

section .text
itoa:
      push  rcx
      push  rdx
      ;push  rsi

      ;mov   word [width], 0
      mov   rcx, 0

divideLoop:
      mov   rdx, 0      ; clear remainder register
      idiv  word [base] ; divide contents of RAX by [base]
      add   rdx, '0'

      ; write and increment counter
      ;mov   [rdi + width], rdx
      ;inc   word [width]

      mov   [rdi + rcx], rdx
      inc   rcx

      cmp   rax, 0      ; no more divisions possible
      jnz   divideLoop

return:
      ; return width through RAX
      mov   rax, rcx
      pop   rdx
      pop   rcx
      ret
