global read
global write
global open

open:
  mov eax, 5 
  mov ebx, edi
  mov rcx, rsi
  mov edx, edx
  int 0x80
  ret  

write:
  mov eax, 4 
  mov ebx, edi
  mov rcx, rsi
  mov edx, edx
  int 0x80
  ret

read:
  mov eax, 3 
  mov ebx, edi
  mov rcx, rsi
  mov edx, edx
  int 0x80
  ret
