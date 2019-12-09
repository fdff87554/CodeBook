.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

INCLUDE Irvine32.inc
INCLUDE head.inc
INCLUDELIB ucrt.lib
INCLUDELIB legacy_stdio_definitions.lib

.data
array DWORD 30 DUP(?)
N DWORD 0
S_lenght DWORD 120
outNum SDWORD 0
output_space BYTE " ",0

.code
main PROC
start:
	push offset array
	push S_lenght
	push offset N
	call inn

	mov eax, N
	call WriteInt
	call Crlf

	push offset array
	push offset N
	push offset outNum

outloop:
	call check
	call outt

	mov edx, offset output_space
	call WriteString
	
	cmp N,0
	jg outloop
	call Crlf
	
	cmp outNum, 0
	je fun_end
	add esp, 12
	jmp start

fun_end:
	ret
main ENDP
END main