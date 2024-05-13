section .data
    counter dq 1
    equal_msg db 'The values are equal', 0x0A ; 21?
    nequal_msg db 'The values are NOT equal', 0x0A ; 25?
    exit_msg db 'Exitting Program...', 0x0A ; 20?
    equal_msg_len equ $ - equal_msg
    nequal_msg_len equ $ - nequal_msg
    exit_msg_len equ $ - exit_msg

section .text
    global _start

_start:
    mov rax, [counter]
    cmp rax, 0
    je equal ; Jump to 'equal' if RAX is 0

not_equal:
    mov rax, 1 ; syscall for writing to terminal
    mov rdi, 1
    mov rsi, nequal_msg
    mov rdx, 25
    syscall
    jmp exit ; forgot to add jump exit

equal:
    mov rax, 1
    mov rdi, 1
    mov rsi, equal_msg
    mov rdx, 21
    syscall
    jmp exit

exit:
    mov rax, 1
    mov rdi, 1
    mov rsi, exit_msg
    mov rdx, 20
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall