.386
.model flat, stdcall
.stack 4096

includelib Irvine32.lib
includelib legacy_stdio_definitions.lib
includelib ucrt.lib
include allinclude.inc

.code
insertionSort PROC
	push ebp
	mov ebp, esp			; base of stack frame
	mov esi, [ebp + 12]		; get the offset of array
	mov ebx, [ebp + 8]		; get the caseNumber of input
	
	sub esp, 12
	key EQU sdword PTR [ebp - 4]
	i EQU dword PTR [ebp - 8]
	j EQU dword PTR [ebp - 12]
	mov i, 0
	iforloop:
		inc i
		cmp i, ebx
		jge getRet

		mov ecx, i
		mov j, ecx
		mov eax, [esi + ecx * 4]
		mov key, eax
		jforloop:
			dec j
			cmp j, 0
			jl elsePart

			mov ecx, j
			mov eax, [esi + ecx * 4]
			cmp key, eax
			jg elsePart

			ifPart:
				mov ecx, j
				mov eax, [esi + ecx * 4]
				inc ecx
				mov [esi + ecx * 4], eax
		jmp jforloop

		elsePart:
			mov ecx, j
			inc ecx
			mov eax, key
			mov [esi + ecx * 4], eax
		jmp iforloop

getRet:
	mov esp, ebp
	pop ebp
	ret

insertionSort ENDP
END