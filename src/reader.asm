extern read
global read_header
global read_instruction

// Header struct
// 0-4 Length
// 4-8 


section .text
read_header:
  enter 16, 0
  mov dword[rbp-4], edi ; FileDescriptor
  call read
  leave
  ret
