; Програма виводить в зворотному порядку за допомогою
; відлагоджувача масив 4 байтних значень
.586
; використати плоску модель пам'яті і узгодження імен stdcall
.model flat, stdcall
option casemap: none

; оголошення службових процедур, макросів, змінних, констант
include masm32\include\windows.inc
include masm32\include\kernel32.inc
include masm32\include\masm32.inc
include masm32\include\debug.inc
include masm32\include\user32.inc

; підключення службових бібліотек
includelib masm32\lib\kernel32.lib
includelib masm32\lib\masm32.lib
includelib masm32\lib\debug.lib
includelib masm32\lib\user32.lib

; оголошення масиву даних
.data
Arr dd 1,2,3,4,5

.code
start:
	mov ecx,5
      mov ebx, 0
prnt:
	mov eax, [Arr+ecx*4-5]	
	dec ecx
	cmp ecx, 0
	je exnt
	cmp eax, 0
	jnz prnt
	inc ebx
	jmp prnt

exnt:
	PrintDec ebx
	invoke ExitProcess, NULL	; виклик процедури завершення процесу
end start
