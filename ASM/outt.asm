.386
.model flat, stdcall
.stack 4096

INCLUDE Irvine32.inc
INCLUDE head.inc
INCLUDELIB ucrt.lib
INCLUDELIB legacy_stdio_definitions.lib

.code
outt PROC
	push ebp
	mov ebp, esp

	mov ecx, [ebp+8]

get_output:			; if outNum >= 0, use WriteDec
	mov eax, [ecx]
	cmp eax, 0
	jl negative
	mov eax, [ecx]
	call WriteDec
	call Crlf
	jmp finish
negative:			; else use WriteInt
	mov eax, [ecx]
	call WriteInt
	call Crlf
finish:
	mov esp, ebp
	pop ebp
	ret
outt ENDP
END