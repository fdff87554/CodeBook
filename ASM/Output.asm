.386
.model flat, stdcall
INCLUDE includes.inc
INCLUDE Irvine32.inc
.data
	space DWORD " "
.code
output PROC C
	PUSH EBP										;�NEBP���i���| �O�@��EBP
	MOV EBP, ESP									;��ESP���VEBP
	MOV EDX, [EBP + 12]								;�o�wArray��l��m
_SetCounter :	
	MOV ECX, [EBP + 8]								;�]�w�j��counter
	MOV ESI, 0										;��l�����q		
_PrintArray :
	MOV EAX, [EDX + ESI]							;EDX��Array��l��mESI�������q
	CALL WriteInt									;��XArray(Sorted)
	MOV EAX, space									;��X�Ů�
	CALL WriteChar								
	ADD ESI, 4										;�]����DWORD �GESI + 4
	LOOP _PrintArray								;LOOP _PrintArray ����ECX��0
_Finish :
	CALL Crlf										;�������ڭ̰��U�@������J�ɸ����M��
	MOV ESP, EBP									;�NESP ���^�h EBP(Stack Base)
	POP EBP											;�N�@�}�lPOP�i�h��EBP POP�X��
	RET 8											;�M��STACK�̪�Arguments
output ENDP
END