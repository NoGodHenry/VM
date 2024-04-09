global movq_ins
global movb_ins
extern instruction_end

movb_ins:
    mov dil, byte[rdi]
    mov byte[rsi], dil
    jmp instruction_end

movq_ins:
    mov rdi, qword[rdi]
    mov qword[rsi], rdi
    jmp instruction_end