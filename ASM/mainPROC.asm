;組語第五次作業
.386
.model flat,stdcall
.stack 4096
option casemap:none
ExitProcess PROTO, dwExitCode : SDWORD

includelib Irvine32.lib
includelib ucrt.lib
includelib legacy_stdio_definitions.lib
include source.inc
Crlf PROTO
scanf PROTO C,
	format: PTR BYTE, args: VARARG

.data
	arraySize DWORD 0
	num SDWORD 0
	i DWORD 0
	arr SDWORD 1000 DUP(0)
	input BYTE "%d",0
	space BYTE " ",0
.code
asmMain PROC
bin:															;while
	INVOKE scanf,ADDR input, ADDR arraySize
	cmp arraySize,0
	jle fin														;arraySize<=0 break
inn:                                                            ;做輸入
	push arraySize
	push offset arr
	call input_arraySize
	add esp,8
sort:                                                           ;做排序
	push offset arr
	push arraySize
	call sorting
	add esp,8
outt:                                                           ;做輸出
	mov i,0
	push arraySize
	push i
	push offset arr
	push offset space
	call output_arr
	add esp,16
	call Crlf
	jmp bin
fin:
	ret
asmMain endp
end asmMain