.386
.model flat, stdcall
.stack 4096

INCLUDE Irvine32.inc
INCLUDE head.inc
INCLUDELIB ucrt.lib
INCLUDELIB legacy_stdio_definitions.lib

.code
inn PROC
	push ebp
	mov ebp, esp

	mov esi, [ebp+16]
	mov ecx, [ebp+12]
	mov ebx, [ebp+8]
	mov edx, esi
	call ReadString
	mov [ebx], eax

	mov esp, ebp
	pop ebp
	ret
inn ENDP
END
