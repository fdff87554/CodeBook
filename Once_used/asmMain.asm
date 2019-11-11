INCLUDE Irvine32.inc
includelib legacy_stdio_definitions.lib

isPrime PROTO C, n : DWORD		; declare function isPrime
asmMain PROTO C					; declare function asmMain

.data
inputNum BYTE "%d", 0			; inputNum
outputNum BYTE "%d ", 0			; outputNum
num DWORD 0 					; runing Number

.code
asmMain PROC C
	
	INVOKE scanf, ADDR inputNum, ADDR num
	mov ebx, 2

L1: cmp ebx, num	
	jge next					; jump next: if greater or equal
	INVOKE isPrime, ebx	
	cmp eax, 1
	jne no						; smaller than 1 then jump to no:
	
	INVOKE printf, ADDR outputNum, ebx
	call crlf					; change line

no: inc ebx						; the number in ebx(all n) add 1
	jmp L1						; back to L1

next:
	ret

asmMain ENDP
END
