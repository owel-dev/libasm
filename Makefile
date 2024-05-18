# 컴파일러 및 링커 설정
AS = nasm
LD = ld

# 소스 파일 목록
SOURCES = main.s ft_write.s ft_strlen.s

# 오브젝트 파일 목록 (소스 파일에서 .s를 .o로 변경)
OBJECTS = $(SOURCES:.s=.o)

# 실행 파일 이름
TARGET = program

# 컴파일 플래그
ASFLAGS = -f macho64

# # 링크 플래그
LDFLAGS = -lSystem

# 기본 목표 (실행 파일)
$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^
	./program

# 오브젝트 파일 생성 규칙
%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

# 클린 규칙
clean:
	rm -f $(OBJECTS) $(TARGET)
