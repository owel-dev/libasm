extern _ft_write
extern _ft_strlen

section .text
global _main

_main:
    ; ft_write 테스트
    mov rdi, 1              ; 첫 번째 인자: 파일 디스크립터 (1: stdout)
    mov rsi, msg            ; 두 번째 인자: 버퍼 포인터
    mov rdx, 13             ; 세 번째 인자: 버퍼 길이
    call _ft_write
    
    ; ft_strlen 테스트
    mov rdi, msg            ; 첫 번째 인자: 
    call _ft_strlen         ; ft_strlen 호출
    mov rbx, rax            ; ft_strlen 반환값을 rbx에 저장

    mov rdi, 1              ; 첫 번째 인자: 파일 디스크립터 (1: stdout)
    mov rsi, rax            ; 두 번째 인자: ft_strlen의 반환값
    mov rdx, 1             ; 세 번째 인자: 버퍼 길이
    call _ft_write          ; ft_write 호출

    ; 프로그램 종료
    mov rax, 0x2000001      ; exit 시스템 호출 번호 
    xor rdi, rdi            ; 종료 상태 0
    syscall                 ; exit 호출

section .data
    msg: db "hello world", 10, 0 ; ft_write가 출력할 메시지, 10은 개행 문자, 0은 null 문자