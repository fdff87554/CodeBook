;insertion_sort
.386
.model flat,stdcall

.code
;[ebp +12] = offset arr
;[ebp + 8] = arraySize
i EQU DWORD PTR [ebp - 4]						        ;for�j��
key EQU SDWORD PTR [ebp - 8]							;���X�ӭɩ񪺪Ŷ�
j EQU SDWORD PTR [ebp - 12]						        ;while�j��

sorting PROC
	push ebp
	mov ebp,esp
	sub esp,12											;��ϰ��ܼ�
	mov i,1
	mov key,0
	mov j,0
myfor:
	mov ecx,[ebp + 8]
	cmp i,ecx
	jae fin                                             ;�P�_ i >= arraySize ����
	mov esi,[ebp + 12]									;esi�Oarr��m
	mov eax,i
	mov edx,4
	mul edx                                             ;i*4
	add esi,eax
	mov edx,[esi]
	mov key,edx 									    ;key = arr[i]
	mov ecx,i
	sub ecx,1
	mov j,ecx											;j = i-1
mywhile:
	cmp j,0
	jl keyback
	mov esi,[ebp + 12]
	mov eax,j
	mov edx,4
	mul edx                                             ;j*4
	add esi,eax
	mov ebx,key
	cmp [esi],ebx
	jle keyback
	mov ebx,[esi]
	mov [esi + 4],ebx
	dec j
	jmp mywhile
keyback:
	add j,1
	mov esi,[ebp + 12]
	mov eax,j
	mov edx,4
	mul edx                                             ;j*4
	add esi,eax
	mov ebx,key
	mov [esi],ebx
	inc i
	jmp myfor
fin:
	mov esp,ebp
	pop ebp
	ret
sorting endp
end