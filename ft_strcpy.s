section .text
global _ft_strcpy

_ft_strcpy:
    ; rdi = 대상 주소
    ; rsi = 원본 주소
    mov rax, rdi            ; 대상 문자열 주소 저장 (반환값으로 설정)
    
.copy_loop:
    cmp byte [rsi], 0       ; 원본 문자열이 널 종료자인지 확인
    mov al, [rsi]           ; 원본 문자열의 현재 문자를 al에 로드
    mov [rdi], al           ; 대상 문자열에 현재 문자를 저장
    inc rsi                 ; 원본 문자열 포인터 증가
    inc rdi                 ; 대상 문자열 포인터 증가
    jne .copy_loop          ; 널 종료자가 아니면 계속 복사

    ret                     ; 대상 문자열 주소 반환