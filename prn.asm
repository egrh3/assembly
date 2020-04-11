; matching syscall(1)/sys_write(), put the target
; string in RSI. _strlen will populate RDX for you.
_strlen:
      mov   rdx, 0
_strcount:
      mov   byte al, [rsi + rdx]
      cmp   rax, 0x00
      jz    _retcount
      inc   rdx
      jmp   _strcount

_retcount:
      ret

_clrprn:
      mov   rdx, 0
      mov   rdi, 0
      mov   rsi, 0
      ret

; assumes RSI has the string and RDX has the length.
; does NOT supply line-feed.
_print:
;      cmp   rdx, 0
;      jz    _strlen
      push  rcx

      mov   rax, 1
      mov   rdi, 0      ; STDOUT
      syscall

;      call  _clrprn
      pop   rcx
      ret
