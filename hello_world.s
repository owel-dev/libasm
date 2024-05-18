section .text
global hello_world

hello_world:
    mov     rax, 0x2000004
    mov     rdi, 1
    lea     rsi, [rel message]
    mov     rdx, message_len
    syscall

    mov     rax, 0x2000001
    xor     rdi, rdi
    syscall

section .data
    message:    db      "Hello, World!", 10
    message_len equ     $ - messagea