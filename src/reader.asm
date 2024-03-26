extern read
extern print
global read_header
global read_instruction

; Header struct
; 0-4 Length
; 4-8 

section .data
text: db "asdaskjkjkjkjkjkjkjkjkkjkjkjkjkjkjkjkjjkjkjkkjkjkjkjkkjkjkjkjkjkjd", 0

section .text
read_header:
  enter 32, 0
  mov byte[rbp-10], 10
  mov byte[rbp-9], 10
  mov byte[rbp-8], 10
  mov byte[rbp-7], 10
  mov byte[rbp-6], 10
  mov byte[rbp-5], 10
  mov byte[rbp-4], 10
  mov byte[rbp-3], 10
  mov byte[rbp-2], 10
  mov byte[rbp-1], 0
  mov eax, 4 
  mov ebx, 1 ; fd
  lea rcx, [text]; char*
  mov edx, 10 ; size_t
  int 0x80

  leave
  ret
