
.386
.model flat,stdcall

includelib Irvine32.lib
scanf PROTO C,
	format: PTR BYTE, args: VARARG

.data
num SDWORD 0
input BYTE "%d",0

.code
;[ebp +12] = arraySize
;[ebp +8] = offset arr
input_arraySize PROC
	push ebp
	mov ebp,esp
	mov esi,0
	mov esi,[ebp +8]
fora:                                                   ;輸入幾次的迴圈
	mov ebx,[ebp +12]
	cmp ebx,1
	jb fin                                              ;判斷迴圈結束

	INVOKE scanf,ADDR input, ADDR num
	mov eax,num
	mov [esi],eax
	add esi,4

	dec dword ptr[ebp +12]                              ;arraySize - 1
	jmp fora
fin:
	mov esp,ebp
	pop ebp
	ret
input_arraySize endp
end