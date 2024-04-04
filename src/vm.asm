extern open
extern read_header
extern print
global main

section .data
file: DB "test.vm", 0

; Specifications
; Length given by 

section .text
main_loop:
  enter 32, 0
  mov dword[rbp-4], edi

  leave
  ret

main:
  enter 32, 0
  mov rdi, file
  mov esi, 0
  mov edx, 0 
  call open
  mov dword[rbp-4], eax

  ; Read header from file
  mov edi, dword[rbp-4]
  lea rsi, [rbp-4-10] ; -4 offset -10 size 
  call read_header

  ; DEBUG
  lea rdi, [rbp-4-10]
  mov esi, 10 ; size_t
  call print

  mov edi, eax
  call main_loop
  leave
  ret
