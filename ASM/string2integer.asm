INCLUDE headers.inc
.code
StringtoInteger PROC C
_Start :
	PUSH EBP
	MOV EBP, ESP
	SUB ESP, 12
	MOV [EBP - 4],SDWORD PTR 10					;因為IMUL指令不可以直接 * IMM 故放入 local
	MOV [EBP - 8],SDWORD PTR 1					;negative 判斷是否為負
	MOV [EBP - 12],SDWORD PTR 0					;sum
	MOV EDX, [EBP + 12]							;EDX 指向 string的住址
	MOV ECX, [EBP + 8]							;ECX 為stringLength
_GetNumbers :	
	PUSH ECX
	PUSH EDX
	MOVSX EAX, BYTE PTR [EDX]					;把EDX指向的位置 放一個BYTE 到EAX
	CMP EAX, 45									;ASCII 45(-) 代表為負的
	JNE _IsaDigit								
	MOV [EBP - 8],SDWORD PTR -1					;若負的 negative 設為 -1
_IsaDigit :	
	CALL IsDigit
	JNZ _SetEDX									;看ZF set還是 clear JZ表示set時跳
	SUB EAX, 48									;ASCII轉數字 (因為0的ASCII為48)
	MOV ECX, EAX								;暫存一下 EAX的值
	MOV EAX, [EBP - 12]							;把sum 移至 EAX
	IMUL DWORD PTR [EBP - 4]					;sum * 10
	MOV [EBP - 12], EAX							;再放回sum
	ADD [EBP - 12], ECX							;加回原本暫的值
_SetEDX :
	POP EDX
	POP ECX
	INC EDX										;加1BYTE 去check下一個character
	LOOP _GetNumbers
_Finish :
	MOV EAX, [EBP - 12]							;把sum 放入 EAX
	IMUL DWORD PTR [EBP - 8]					; * negative
	MOV ESP, EBP
	POP EBP
	RET 8
StringtoInteger ENDP
END