.386
.model flat, stdcall
.stack 4096
option casemap : none						; this is telling computer the small letters and big letters are different

includelib Irvine32.lib						; using Irvine32 library
includelib legacy_stdio_definitions.lib
includelib ucrt.lib
include header.inc							; calling the declare inc we create

.data
inputString DWORD 1000 DUP(?)				; get the give string
stringLength DWORD 0						; the input string length
outputInt SDWORD 0							; output the change int

.code
main PROC
	push ebp								; set the return place ebp
	mov ebp, esp							; mov ebp to the stack work place

	; try to use pass-by-pointer to work on the string to int change
	whileLoop:
		push offset inputString				; give the input's offset
		push offset stringLength			; give the stringLength by pass-by-pointer
		call input

		push offset outputInt				; give the outputInt by pass-by-pointer
		call typeChange

		call output
		cmp outputInt, 0
		je getOut

		add esp, 12							; clear the used stack
	jmp whileLoop

	getOut:
		mov esp, ebp
		pop ebp
		ret
main ENDP
END main