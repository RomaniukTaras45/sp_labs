.586
.model flat

;EXTRN _K:dword
EXTRN _print:PROC  
PUBLIC _calc

.data

K dd 614h


Two db 2
Four db 4

.code

; ��������� _calc �� 3 ��������� � ����������� ���������� ���� �
_calc PROC

	; � ����� �� ����� ������ � 32-�� �������� ������ ������ ��������� � ���������
	; ��������� � ���� 32-�� �������� �������� ebp	
    push ebp
	mov ebp, esp

	; ����������� ������ �������� ���� �� ������� esp ������� +8 ����
	mov ebx, [ebp+8]; A
	
	; ����������� ������ �������� ���� �� ������� esp ������� +12 ����
	mov al, [ebp+12]; B
	cbw
	cwd
	sub ebx, eax

	sub ebx, K
	
	; ����������� ����� �������� ���� �� ������� esp ������� +8 ����
	mov eax, [ebp+16]; D
	div Two

	sub ebx, eax
	
	; ����������� ������ �������� ���� �� ������� esp ������� +8 ����
	mov eax, [ebp+12]; B
	cbw
	cwd
	mul Four

	add ebx, eax
	mov eax, ebx
	
	; ������� ��������� ������� � ���� (arg1)
	push eax
	; ��������� � ������� print
	call _print
	; �������� ��������� print � ����� ���������� �� esp ����� 4
	add esp,4

	pop ebp
	ret
_calc endp
end