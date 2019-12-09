.386
.model flat, stdcall
.stack 4096

includelib Irvine32.lib
includelib legacy_stdio_definitions.lib
includelib ucrt.lib
include header.inc

.data
space DWORD ' '

.code
output PROC
	push ebp
	mov ebp, esp
	
	mov esi, [ebp + 16]				; the offset of inputString
	mov ebx, [ebp + 12]				; the offset of stringLength
	mov ecx, [ebp + 8]				; the offset of outputInt

	;the way to output string by using WriteString 
	;mov edx, esi		; mov the offset of string to edx
	;call WriteString	; call WriteString
	;call Crlf
	;mov eax, [ebx]		; mov the string length ot eax
	;call WriteDec		; call WriteDec
	;call Crlf

	mov eax, [ecx]		; mov the outputInt to eax
	ifCheck:			; if eax >= 0, use WriteDec
		cmp eax, 0
		jl negative
		call WriteDec
		jmp getOut

	negative:			; else use WriteInt
		call WriteInt

	getOut:
		mov eax, space
		call WriteChar
		mov esp, ebp
		pop ebp
		ret
output ENDP
END