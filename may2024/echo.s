section .data
    msg db 'Enter message: ', 0 
    msg_len equ $ - msg             ; calculate length of the message
    size dw 256

section .bss
    buffer resb 256                 ; reserve 256 bytes for input buffer

section .text
    global _start

_start: 
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg_len
    syscall

    ; read input
    mov rax, 0
    mov rdi, 0  ; std input
    mov rsi, buffer
    mov rdx, size ; number of bytes to read?
    syscall

    ; rax now contains the number of bytes read
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
   
    syscall

    mov rax, 60
    xor rdi, rdi ; clear rdi
    syscall