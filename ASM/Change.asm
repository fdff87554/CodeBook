;Program : Function for String to Number

.386
.MODEL FLAT, STDCALL

INCLUDE Header.inc

;[ EBP + 24 ] OFFSET Now
;[ EBP + 20 ] OFFSET TestStr = ESI
;[ EBP + 16 ]  StrCount
;[ EBP + 12 ] OFFSET Ans
;[ EBP + 8 ] OFFSET Sd

;[ EBP - 4 ] = Count = StrCount
;[ EBP - 8 ] = Result = Ans
;[ EBP - 12 ] = Decide = Sd

.code

Count EQU DWORD PTR [ EBP - 4 ]
Result EQU SDWORD PTR [ EBP - 8 ]
Decide EQU SDWORD PTR [ EBP - 12 ]
Position EQU DWORD PTR [ EBP - 16 ]

StoN PROC

	Start:
		PUSH EBP
		MOV EBP, ESP
		SUB ESP, 16
		MOV ESI, [ EBP + 20 ]															;ESI �s�r��}�C����m
		MOV ECX, [ EBP + 16 ]														;Count �O StrCount
		MOV Count, ECX
		MOV EDX, [ EBP + 24 ]
		MOV ECX, [ EDX ]
		MOV Position, ECX																;Position = Now �����{�b�����m
		MOV ECX, 0																			;ECX �j��P�_
		ADD ECX, Position
		MOV Result, 0
		MOV Decide, 1

	Change:																					    ;�}�l�r����Ʀr
		CMP ECX, Count
		JE Stop

		MOV BL, [ ESI ]
		MOV AL, BL
		CALL IsDigit																			;�P�_AL����ASCII�ȬO�_��(0~9)�A�O�hZF = 1
		JNZ Check																				;ZF != 1

		MOV BL, [ ESI ]
		SUB BL, 48																				;48 = ' 0 '
		MOV EAX, Result																	;Ans = Ans * 10 + �U�@�Ӽ�
		IMUL EAX, 10
		MOV Result, EAX
		MOVZX EAX, BL
		ADD Result, EAX
		ADD ESI, TYPE BYTE
		INC ECX
		INC Position
		JMP Change

	Check:																						 ;�P�_�r�ꤺ�e�O�_���t��
		INC ECX
		ADD ESI, TYPE BYTE
		INC Position
		CMP AL, 45																			 ;45 = ' - ' �t��
		JE Negative

		CMP AL, 32																			 ;32 = '    ' �Ů�
		JE Stop
		JMP Change																			;��l�D�Ʀr�Ÿ�����

	Negative:																					 ;�P�_���t��
		NEG Decide
		JMP Change
		
	Stop:																							;�N�D�{����Ans�BSd�BNow���ȧ���
		MOV EBX, [ EBP + 12 ]														;EBX = Ans �A��n���Ʀr
		MOV ECX, Result
		MOV [ EBX ], ECX
		MOV EDX, [ EBP + 8 ]															;EDX = Sd �A�@�����t�ƪ��P�_
		MOV ECX, Decide
		MOV [ EDX ], ECX
		MOV EAX, [ EBP + 24 ]														;EAX = Now�A�O��ثe�����
		MOV ECX, Position
		MOV [ EAX ], ECX

		MOV ESP, EBP
		POP EBP
		RET

StoN ENDP
END