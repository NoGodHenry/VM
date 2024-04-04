extern write
global print

section .text
; arg1 string rdi
; arg2 len esi
print:
  mov edx, esi
  mov rsi, rdi 
  mov edi, 1 ; stdout
  call write
  ret