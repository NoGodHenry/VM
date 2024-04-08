extern main
global _start

section .text
_start:
  call main
  mov rdi, rax
  mov rax, 60
  syscall