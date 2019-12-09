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
		MOV ESI, [ EBP + 20 ]															;ESI 存字串陣列的位置
		MOV ECX, [ EBP + 16 ]														;Count 記 StrCount
		MOV Count, ECX
		MOV EDX, [ EBP + 24 ]
		MOV ECX, [ EDX ]
		MOV Position, ECX																;Position = Now 紀錄現在做到位置
		MOV ECX, 0																			;ECX 迴圈判斷
		ADD ECX, Position
		MOV Result, 0
		MOV Decide, 1

	Change:																					    ;開始字串轉數字
		CMP ECX, Count
		JE Stop

		MOV BL, [ ESI ]
		MOV AL, BL
		CALL IsDigit																			;判斷AL內的ASCII值是否為(0~9)，是則ZF = 1
		JNZ Check																				;ZF != 1

		MOV BL, [ ESI ]
		SUB BL, 48																				;48 = ' 0 '
		MOV EAX, Result																	;Ans = Ans * 10 + 下一個數
		IMUL EAX, 10
		MOV Result, EAX
		MOVZX EAX, BL
		ADD Result, EAX
		ADD ESI, TYPE BYTE
		INC ECX
		INC Position
		JMP Change

	Check:																						 ;判斷字串內容是否為負號
		INC ECX
		ADD ESI, TYPE BYTE
		INC Position
		CMP AL, 45																			 ;45 = ' - ' 負號
		JE Negative

		CMP AL, 32																			 ;32 = '    ' 空格
		JE Stop
		JMP Change																			;其餘非數字符號不管

	Negative:																					 ;判斷正負數
		NEG Decide
		JMP Change
		
	Stop:																							;將主程式的Ans、Sd、Now的值改變
		MOV EBX, [ EBP + 12 ]														;EBX = Ans ，轉好的數字
		MOV ECX, Result
		MOV [ EBX ], ECX
		MOV EDX, [ EBP + 8 ]															;EDX = Sd ，作為正負數的判斷
		MOV ECX, Decide
		MOV [ EDX ], ECX
		MOV EAX, [ EBP + 24 ]														;EAX = Now，記住目前做到哪
		MOV ECX, Position
		MOV [ EAX ], ECX

		MOV ESP, EBP
		POP EBP
		RET

StoN ENDP
END