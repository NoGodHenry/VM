global read
global write
global open
global print 

open:
  mov eax, 5 
  mov ebx, edi
  mov rcx, rsi
  mov edx, edx
  int 0x80
  ret  

write:
  mov eax, 4 
  mov ebx, edi ; fd
  mov rcx, rsi ; char*
  mov edx, edx ; size_t
  int 0x80
  ret

read:
  mov eax, 3 
  mov ebx, edi ; FileDescriptor
  mov rcx, rsi ; char* buffer
  mov edx, edx ; size_t
  int 0x80
  ret

; arg1 string rdi
; arg2 len esi
print:
  mov edx, esi
  mov rsi, rdi
  mov edi, 1 ; stdout
  call write
  ret