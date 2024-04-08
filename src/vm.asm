extern open
extern read_header
extern print
extern read
extern movq_ins
global main
global instruction_end

section .data
file: DB "test.vm", 0
registers: times 80 db 0 ; 10 64-bit registers 

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

  mov rdi, registers
  mov rsi, registers
  add dil, byte[rbp-4-1-4-7]
  add sil, byte[rbp-4-1-4-6]
  jmp movq_ins

instruction_end:
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

  mov edi, dword[rbp-4]
  mov esi, dword[rbp-4-10]
  call main_loop
  
  ;mov rdi, reg0
  ;mov esi, 4 ; size_t
  ;call print

  leave
  ret
