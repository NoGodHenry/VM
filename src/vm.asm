extern open
extern read_header
extern print
extern read
global main

section .data
file: DB "test.vm", 0

; Specifications
; Length given by header
; Every instruction is 64 bit

section .text
main_loop:
  enter 32, 0
  mov dword[rbp-4], edi
  mov dword[rbp-8], esi

instruction_loop:
  ; Read instruction
  mov edi, dword[rbp-4]
  lea rsi, [rbp-4-1-4-8]
  mov edx, 8
  call read

  sub dword[rbp-8], 8
  cmp dword[rbp-8], 0
  jle instruction_exit
  jmp instruction_loop
instruction_exit:
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

  mov eax, dword[rbp-4-10] 
  leave
  ret
  mov esi, eax
  call main_loop
  leave
  ret
