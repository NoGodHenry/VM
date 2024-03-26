extern read
global read_header
global read_instruction

// Header struct
// 0-4 Length
// 4-8 


section .text
read_header:
  enter 32, 0
  mov dword[rbp-4], edi ; FileDescriptor
  mov rsi, [rbp-5]
  mov edx, 10 
  call read
  
  leave
  ret
