extern _ft_strlen
extern _ft_write
extern _ft_strcpy

section .text
global _main

_main:
    ; msg 길이를 계산하여 출력
    mov rdi, msg
    call _ft_strlen          ; _ft_strlen 호출
    mov rdi, rax             ; strlen 반환값을 rdi에 저장

    ; 정수를 문자열로 변환
    add rdi, '0'             ; 정수를 문자로 변환 (ASCII 코드 조정)
    mov [rel result], dil    ; 변환된 문자를 result에 저장

    mov rdi, 1               ; 파일 디스크립터 1 (stdout)
    mov rsi, result          ; 출력할 문자열 주소
    mov rdx, 1               ; 출력할 바이트 수 (1바이트 문자)
    call _ft_write           ; strlen 반환값 출력

    mov rdi, 1               ; 파일 디스크립터 1 (stdout)
    mov rsi, newline         ; 개행 문자 주소
    mov rdx, 1               ; 출력할 바이트 수 (1바이트 문자)
    call _ft_write           ; 개행 문자 출력

    ; msg를 dest로 복사
    mov rdi, dest            ; 대상 주소를 rdi에 설정
    mov rsi, msg             ; 원본 주소를 rsi에 설정
    call _ft_strcpy          ; _ft_strcpy 호출

    ; ; 복사된 dest 문자열 출력
    ; mov rdi, 1               ; 파일 디스크립터 1 (stdout)
    ; mov rsi, dest            ; 출력할 문자열 주소
    ; mov rdx, 6               ; 출력할 바이트 수 (문자열 "abcde\0")
    ; call _ft_write           ; 복사된 문자열 출력

    ; ; 개행 문자 출력
    ; mov rdi, 1               ; 파일 디스크립터 1 (stdout)
    ; mov rsi, newline         ; 개행 문자 주소
    ; mov rdx, 1               ; 출력할 바이트 수 (1바이트 문자)
    ; call _ft_write           ; 개행 문자 출력

    ; 프로그램 종료
    mov rax, 0x2000001       ; exit 시스템 호출 번호 
    xor rdi, rdi             ; 종료 상태 0
    syscall                  ; exit 호출

section .data
    msg: db "abcde", 0
    newline: db 10

section .bss
    result resb 1            ; 결과 문자를 저장할 1바이트 공간
    dest resb 7              ; 복사된 문자열을 저장할 6바이트 공간
