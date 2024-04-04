global read
global write
global open

; rdi - nullterminated char*
; esi - int flags
; edx - mode 
open:
  mov eax, 2 
  syscall
  ret  

; edi - fd 
; rsi - char* 
; edx - len 
write:
  mov rax, 1
  syscall
  ret

; edi - fd 
; rsi - char* 
; edx - len 
read:
  mov rax, 0 
  syscall
  ret