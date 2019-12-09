.386
.model flat, stdcall
INCLUDE includes.inc
INCLUDE Irvine32.inc
.code
SelectionSort PROC C
_SetCounter :
	PUSH EBP										;�NEBP���i���| �O�@��EBP
	MOV EBP, ESP									;��ESP���VEBP
	MOV ECX, [EBP + 8]								;�]�m�~�hfor�j�骺counter
	DEC ECX											;�]���~�h�u�|�]ArraySize - 1��
	MOV EDX, [EBP + 12]								;�]�wArray��l��m
	MOV EBX, 0										;Select��̤p�Ȫ�OFFSET��(�����q)
	MOV ESI, 0										;�~�hfor��Array OFFSET��
	MOV EDI, 4										;���hfor��Array OFFSET��
_Loop1 :
	PUSH ECX										;�O�@��~�h��ECX
	MOV EBX, ESI									;���N�̤p�ȳ]��Array�����Ĥ@�ӭ�
	ADD EDI, ESI									;�]�mEDI �� ESI + 4(�]���n�qESI���U�@�Ӷ}�l��̤p)
_Loop2 :
	MOV EAX, [EDX + EBX]							
	CMP EAX, [EDX + EDI]							;�Y����[Array + EBX]�p����
	JLE _RoutineLoop2								;�Y�S����[Array + EBX]��p���� ����_RoutineLoop2
	MOV EBX, EDI									;�NEBX�����̤p�Ȫ���m
_RoutineLoop2 :	
	ADD EDI, 4										;�N���h�j��++(�]���ODWORD �GEDI + 4)
	LOOP _Loop2										;Loop _Loop2
	MOV EAX, [EDX + ESI]							;Swap(start)
	MOV ECX, [EDX + EBX]
	MOV [EDX + ESI], ECX
	MOV [EDX + EBX], EAX							;Swap(end)
	MOV EDI, 4										;EDI�A���]�^ 4 (�]���ڭ̪��D���h�j��C�����O�q �~�h���U�@�ӧ�_ �G�ڥ����L4)		
	ADD ESI, 4										;�N�~�h�j��++(�]���ODWORD �GESI + 4)			
	POP ECX											;�N�~�h��Counter POP�^��
	LOOP _Loop1										;Loop _Loop1
_Finish :
	MOV ESP, EBP									;�NESP ���^�h EBP(Stack Base)
	POP EBP											;�N�@�}�lPOP�i�h��EBP POP�X��
	RET 8											;�M��STACK�̪�Arguments
SelectionSort ENDP
END