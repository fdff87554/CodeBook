.386
.model flat, stdcall
.stack 4096

includelib Irvine32.lib
includelib legacy_stdio_definitions.lib
includelib ucrt.lib
include includeing.inc

.code
selectionSort PROC
	push ebp
	mov ebp, esp			; base of stack frame
	mov esi, [ebp + 12]		; get the offset of array
	mov ebx, [ebp + 8]		; get the caseNumber of input
	
	sub esp, 16
	min EQU sdword PTR [ebp - 4]
	place EQU dword PTR [ebp - 8]
	i EQU dword PTR [ebp - 12]
	j EQU dword PTR [ebp - 16]
	mov i, -1
	iforloop:
		mov min, 7FFFFFFFh
		
		inc i
		cmp i, ebx
		jge getRet

		mov ecx, i
		mov j, ecx
		dec j
		jforloop:
			inc j
			cmp j, ebx
			jge switch

			ifPart:
				mov eax, j
				mov ecx, [esi + eax * 4]
				cmp min, ecx
				jl jforloop
				change:
					mov ecx, [esi + eax * 4]
					mov min, ecx
					mov ecx, j
					mov place, ecx

		jmp jforloop

		switch:
			mov eax, i
			mov ecx, [esi + eax * 4]
			mov edx, place
			mov [esi + edx * 4], ecx
			mov ecx, min
			mov [esi + eax * 4], ecx

	jmp iforloop

getRet:
	mov esp, ebp
	pop ebp
	ret

selectionSort ENDP
END