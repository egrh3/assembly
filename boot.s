.code16
.text
      .globl _start;

_start:
      jmp _boot

welcome:
      .asciz "boots and pants\n\r"
      .macro mwrite str
            leaw \str, %si
            call .stream
       .endm

.stream:
      lodsb
      orb   %al, %al
      jz    .owrite
      movb  $0x0E, %ah
      int   $0x10
      jmp   .stream
.owrite:
      ret

_boot:
      mwrite welcome

      . = _start + 510
      .byte 0x55
      .byte 0xAA
