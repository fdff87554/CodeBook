INCLUDE headers.inc
.code
StringtoInteger PROC C
_Start :
	PUSH EBP
	MOV EBP, ESP
	SUB ESP, 12
	MOV [EBP - 4],SDWORD PTR 10					;�]��IMUL���O���i�H���� * IMM �G��J local
	MOV [EBP - 8],SDWORD PTR 1					;negative �P�_�O�_���t
	MOV [EBP - 12],SDWORD PTR 0					;sum
	MOV EDX, [EBP + 12]							;EDX ���V string����}
	MOV ECX, [EBP + 8]							;ECX ��stringLength
_GetNumbers :	
	PUSH ECX
	PUSH EDX
	MOVSX EAX, BYTE PTR [EDX]					;��EDX���V����m ��@��BYTE ��EAX
	CMP EAX, 45									;ASCII 45(-) �N���t��
	JNE _IsaDigit								
	MOV [EBP - 8],SDWORD PTR -1					;�Y�t�� negative �]�� -1
_IsaDigit :	
	CALL IsDigit
	JNZ _SetEDX									;��ZF set�٬O clear JZ���set�ɸ�
	SUB EAX, 48									;ASCII��Ʀr (�]��0��ASCII��48)
	MOV ECX, EAX								;�Ȧs�@�U EAX����
	MOV EAX, [EBP - 12]							;��sum ���� EAX
	IMUL DWORD PTR [EBP - 4]					;sum * 10
	MOV [EBP - 12], EAX							;�A��^sum
	ADD [EBP - 12], ECX							;�[�^�쥻�Ȫ���
_SetEDX :
	POP EDX
	POP ECX
	INC EDX										;�[1BYTE �hcheck�U�@��character
	LOOP _GetNumbers
_Finish :
	MOV EAX, [EBP - 12]							;��sum ��J EAX
	IMUL DWORD PTR [EBP - 8]					; * negative
	MOV ESP, EBP
	POP EBP
	RET 8
StringtoInteger ENDP
END