section .text
global _ft_strlen

_ft_strlen:
    xor rax, rax        ; rax 레지스터 초기화 (길이 카운터)
    mov rbx, rdi        ; rbx에 문자열 포인터 저장

strlen_loop:
    cmp byte [rbx], 0   ; 현재 문자가 NULL 문자인지 비교, 참이면 ZERO FLAG에 1 세팅
    je strlen_end       ; NULL 문자이면(ZERO FLAG가 1이면) 루프 탈출
    inc rax             ; 길이 카운터 증가
    inc rbx             ; 문자열 포인터 증가
    jmp strlen_loop     ; 루프 반복

strlen_end:
    ret   