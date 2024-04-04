global read
global write
global open
global print 

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

; arg1 string rdi
; arg2 len esi
print:
  mov edx, esi
  mov rsi, rdi 
  mov edi, 1 ; stdout
  call write
  ret