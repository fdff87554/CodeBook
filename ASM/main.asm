INCLUDE Irvine32.inc
INCLUDELIB legacy_stdio_definitions.lib
INCLUDELIB ucrt.lib
.data
sum SDWORD 0
multiple DWORD 10
string BYTE 50 DUP (?)
stringLength SDWORD ?
negative SDWORD 1
.code
main PROC C
_Start :
	MOV sum, 0									;��l��
	MOV negative, 1								;��l��
	MOV EDX, OFFSET string						;EDX���Vstring����m
	MOV ECX, SIZEOF string						;����string�̰����J�h�֦r��	
	CALL ReadString
	MOV stringLength, EAX						;�r�����ƥط|��JEAX
	MOV ECX, EAX
_GetNumbers :	
	PUSH ECX
	PUSH EDX
	MOVSX EAX, BYTE PTR [EDX]					;��EDX���V����m ��@��BYTE ��EAX
	CMP EAX, 45									;ASCII 45 �N���t��
	JNE _IsaDigit
	MOV negative, -1							
_IsaDigit :	
	CALL IsDigit
	JNZ _SetEDX									;�Y�X�Эȥ�set �h����
	SUB EAX, 48									;��r���qASCII�ର�Ʀr
	MOV ECX, EAX								;�Ȯɧ��e���Ʀr�s�JECX
	MOV EAX, sum								;�N���e����JEAX
	MUL multiple								;�í�10
	MOV sum, EAX								;�A��^sum
	ADD sum, ECX								;�[�^��e�Ʀr
_SetEDX :
	POP EDX
	POP ECX
	INC EDX
	LOOP _GetNumbers
_Finish	:
	MOV EAX, sum
	IMUL negative
	CMP EAX, 0
	JGE _Postive
	CALL WriteInt
	CALL Crlf
	JMP _Start
_Postive :
	CALL WriteDec
	CALL Crlf
	JMP _Start
	RET
main ENDP
END main