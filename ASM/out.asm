
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
	mov esi,[ebp +12]                                   ;arr�_�l��m
forb:                                                   ;��X���j��
	mov ebx,[ebp +20]
	cmp [ebp +16],ebx
	je fin                                              ;�j���arraySize����

	mov eax,[esi]
	call WriteInt                                       ;�Larr[esi]
	add esi,4                                           ;��m+4

	mov edx,[ebp + 8]
	call WriteString
	mov edx,1
	add [ebp +16],edx									;�p��+1
	jmp forb
fin:
	mov esp,ebp
	pop ebp
	ret
output_arr endp
end