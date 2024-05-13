section .data
    hello_message db 'Hello, World!', 0x0A ; 'Hello World!' String followed by a newline character

section .text
    global _start ; make '_start' accessible to the linker?

_start:
    ; write our string to stdout
    mov eax, 1      ; syscall number for sys_write
    mov edi, 1      ; file descriptor 1 is stdout
    mov rsi, hello_message ; address of the string to output
    mov edx, 14     ; number of bytes to write... is that one byte per char?
    syscall

    ; exit the program
    mov eax, 60     ; syscall for sys_exit
    xor edi, edi    ; why xor them?
    syscall