.386
.model flat, stdcall
.stack 4096

includelib Irvine32.lib
includelib legacy_stdio_definitions.lib
includelib ucrt.lib
include header.inc

.data

.code
input PROC
	push ebp
	mov ebp, esp

	mov esi, [ebp + 12]				; the offset of inputString
	mov ebx, [ebp + 8]				; the offset of stringLength

	mov edx, esi					; set the inputplace
	mov ecx, 4000					; set the max input length (1000) * 4

	call ReadString
	mov [ebx], eax					; get the input length

	mov esp, ebp
	pop ebp
	ret
input ENDP
END