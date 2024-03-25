extern main
global _start

section .text
_start:
  call main
  mov edx, eax
  mov eax, 1
  mov ebx, edx
  int 0x80
