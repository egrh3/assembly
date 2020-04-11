section .text
      bits 16
      global _start

_start:
      . = _start + 510
      db    0x55
      db    0xAA
