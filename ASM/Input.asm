.386
.model flat, stdcall
INCLUDE includes.inc
INCLUDE Irvine32.inc
.code
input PROC C
	PUSH EBP										;�NEBP���i���| �O�@��EBP
	MOV EBP, ESP									;��ESP���VEBP
	MOV EDX, [EBP + 8]								;�NEDX�O��ArraySize����m
_InputSize :
	CALL ReadInt									;��J
	MOV [EDX], EAX									;�N��J���ȩ�J[EDX]�Y�N���JArraySize
	CMP EAX, 0										;�YEAX <= 0 ����_Finish
	JBE _Finish
	MOV ESI, 0										;Array��OFFSET��(�����q)����l��0
	MOV ECX, [EDX]									;�]�wfor�j�骺counter
	MOV EDX, [EBP + 12]								;����Array���_�l��m��EDX
_InputArray :
	CALL ReadInt									;��J
	MOV [EDX + ESI], EAX							;EDX��ArraySize����l��m ESI�������q
	ADD ESI, 4										;ESI�C��+4(BYTE) �]����DWORD
	LOOP _InputArray								;lOOP _InputArray ����ECX ��0
_Finish :
	MOV ESP, EBP									;�NESP ���^�h EBP(Stack Base)
	POP EBP											;�N�@�}�lPOP�i�h��EBP POP�X��
	RET 8											;�M��STACK�̪�Arguments
input ENDP
END