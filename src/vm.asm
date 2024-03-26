extern open
extern read_header
global main

section .data
file: DB "test.vm", 0

section .text
main_loop:
  enter 16, 0
  mov dword[rbp-4], edi 
  call read_header
  leave
  ret

main:
  enter 16, 0
  mov rdi, file
  mov esi, 0
  mov edx, 0 
  call open
  mov dword[rbp-4], eax
  mov edi, eax
  call main_loop
  leave
  ret
