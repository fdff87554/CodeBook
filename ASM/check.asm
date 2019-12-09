.386
.model flat, stdcall
.stack 4096

INCLUDE Irvine32.inc
INCLUDE head.inc
INCLUDELIB ucrt.lib
INCLUDELIB legacy_stdio_definitions.lib

.code
check PROC
	push ebp
	mov ebp, esp
	sub esp, 16
	mov DWORD PTR [ebp-4], 0
	mov DWORD PTR [ebp-8], 0
	mov DWORD PTR [ebp-16], 0
	mov ecx, [ebp+12]
whileloop:
	mov eax, DWORD PTR [ebp-4]
	cmp eax, [ecx]
	je over
	mov esi, [ebp+16]
	mov eax, DWORD PTR [ebp-4]
	add esi, eax
	mov al, 0
	mov al, [esi]

	call IsDigit
	jne get_check
	mov esi, [ebp+16]
	mov eax, DWORD PTR [ebp-4]
	add esi, eax
	mov al, 0
	mov al, [esi]
	sub al, 48
	mov ebx, DWORD PTR [ebp-16]
	imul ebx, 10
	mov DWORD PTR [ebp-16], ebx
	add DWORD PTR [ebp-16], eax
get_check:
	cmp eax, 32
	je over
	cmp eax, 45
	je reminderChange
	inc DWORD PTR [ebp-4]
	jmp whileloop

	reminderChange:
		inc DWORD PTR [ebp-8]
		inc DWORD PTR [ebp-4]
		jmp whileloop
over:
	cmp DWORD PTR [ebp-8], 1
	jne finish
	mov eax, DWORD PTR [ebp-16]
	neg eax
	mov DWORD PTR [ebp-16], eax 
finish:
	mov eax, DWORD PTR [ebp-16]
	mov ebx, [ebp+8]
	mov [ebx], eax
	mov ecx, DWORD PTR [ebp-4]
	inc ecx
	mov esi, [ebp+16]
	add esi, ecx
	mov [ebp+16], esi
	mov edx, [ebp+12]
	sub [edx], ecx
	mov esp, ebp
	pop ebp
	ret
check ENDP
END
