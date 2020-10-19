.586
.model flat

;EXTRN _K:dword
PUBLIC _calc

.data
K dd 614h

Two db 2
Four db 4
.code

; Процедура _calc має 3 параметри і використовує узгодження мови С
_calc PROC 

	; в стеку на даний момент є 32-ох розрядна ближня адреса пвернення з процедури
	; збережемо в стек 32-ох розрядне значення ebp
    push ebp
	mov ebp, esp

	; завантажити перший параметр який має відносно esp зміщення +8 байт
	mov ebx, [ebp+8]; A
	
	; завантажити другий параметр який має відносно esp зміщення +12 байт
	mov al, [ebp+12]; B
	cbw
	cwd
	sub ebx, eax

	sub ebx, K
	
	; завантажити третій параметр який має відносно esp зміщення +16 байт
	mov eax, [ebp+16]; D
	div Two

	sub ebx, eax
	
	; завантажити другий параметр який має відносно esp зміщення +12 байт
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