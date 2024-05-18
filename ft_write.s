section .text
global _ft_write

_ft_write:
    mov rax, 0x2000004          ; Mac write 시스템 콜 번호
    syscall             ; 커널로 진입
    ret                 ; 호출자로 복귀