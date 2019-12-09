
.386
.model flat,stdcall

includelib Irvine32.lib
WriteString PROTO
WriteInt PROTO

.code
;[ebp +20] = arraySize
;[ebp +16] = i
;[ebp +12] = offset arr
;[ebp + 8] = offset space
output_arr PROC
	push ebp
	mov ebp,esp
	mov esi,0 
	mov esi,[ebp +12]                                   ;arr起始位置
forb:                                                   ;輸出的迴圈
	mov ebx,[ebp +20]
	cmp [ebp +16],ebx
	je fin                                              ;迴圈到arraySize結束

	mov eax,[esi]
	call WriteInt                                       ;印arr[esi]
	add esi,4                                           ;位置+4

	mov edx,[ebp + 8]
	call WriteString
	mov edx,1
	add [ebp +16],edx									;計數+1
	jmp forb
fin:
	mov esp,ebp
	pop ebp
	ret
output_arr endp
end