INCLUDE headers.inc
.code
input PROC C
_Start :	
	PUSH EBP								;��l��
	MOV EBP, ESP							;��l��
	MOV EDX, [EBP + 12]						;EDX ���V string����}
	MOV ECX, 51								;ECX�]��50��ReadString�̦h�u���J50�Ӧr��(+1�d�� '\0')
	CALL ReadString
	MOV ECX, [EBP + 8]						;ECX ���V stringLength����}
	MOV [ECX], EAX							;[ECX] ���ڭ̪����� stringLength����� EAX���s���ReadString�����h��Character�Q��J
_Finish :
	MOV ESP, EBP							
	POP EBP
	RET 8
input ENDP
END