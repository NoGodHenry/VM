global main

section .text
main_loop:
  enter 16, 0
  mov dword[rbp-4], 
  leave
  ret

main:
  enter 16, 0

  mov eax, 23
  leave
  ret
