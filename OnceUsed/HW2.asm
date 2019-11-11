; Program 
; Program Description: a program for find max and min
; Author: CrazyFire
; Creation Date: 2019/10/08

.386
.model flat, stdcall
.stack 4096
option casemap : none
ExitProcess proto, dwExitCode:dword

INCLUDELIB ucrt.lib
INCLUDELIB legacy_stdio_definitions.lib

printf PROTO C,
    format:PTR BYTE,	args:VARARG
scanf PROTO C,
    format:PTR BYTE,	args:VARARG

.data
inputNum BYTE "%d", 0							; inputNum
outputNum BYTE "Min: %d,Max: %d ", 13,10,0		; outputNum
testNum DWORD 0 								; run-time
num SDWORD 0									; check number
Max SDWORD 80000000h
Min SDWORD 7FFFFFFFh

.code

main PROC

	INVOKE scanf, ADDR inputNum, ADDR testNum
	mov ebx, 0

L1: 
	add testNum, -1
	cmp testNum, 0
	jl next										; jump to next: if last
	
	INVOKE scanf, ADDR inputNum, ADDR num		; get check num
	mov ebx, num
	
	cmp Min, ebx
	jg min										; smaller than num then jump to min:

	cmp Max, ebx								; greater than num then jump to max:
	jl max
	
	jmp L1

max:
	mov Max, ebx								; change the new max number
	jmp L1

min:
	mov Min, ebx								; change the new min number
	cmp Max, ebx
	jl max
	jmp L1										; back L1


next:
	INVOKE printf, ADDR outputNum, Min, Max
	ret

main ENDP

END main
