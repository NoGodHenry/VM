extern read
extern print
global read_header
global read_instruction

; Header struct
; 0-4 Length
; 4-8
; header size: 10 

section .text
read_header:
  enter 16, 0
  mov dword[rbp-4], edi
  mov qword[rbp-12], rsi
  ;rbp-14 - buffer

  ; Reads the file
  mov edi, dword[rbp-4]
  mov rsi, qword[rbp-12]
  mov rdx, 10
  call read
  leave
  ret
