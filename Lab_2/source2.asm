.586
.model flat

;EXTRN _K:dword
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
	
	; ����������� ����� �������� ���� �� ������� esp ������� +16 ����
	mov eax, [ebp+16]; D
	div Two

	sub ebx, eax
	
	; ����������� ������ �������� ���� �� ������� esp ������� +12 ����
	mov eax, [ebp+12]; B
	cbw
	cwd
	mul Four

	add ebx, eax
	mov eax, ebx

	pop ebp
	ret
_calc endp
end