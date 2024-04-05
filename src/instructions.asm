global movq_ins
extern instruction_end

movq_ins:
    mov rdi, qword[rdi]
    mov qword[rsi], rdi
    jmp instruction_end