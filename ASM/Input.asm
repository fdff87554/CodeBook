.386
.model flat, stdcall
INCLUDE includes.inc
INCLUDE Irvine32.inc
.code
input PROC C
	PUSH EBP										;將EBP推進堆疊 保護住EBP
	MOV EBP, ESP									;讓ESP指向EBP
	MOV EDX, [EBP + 8]								;將EDX記住ArraySize的位置
_InputSize :
	CALL ReadInt									;輸入
	MOV [EDX], EAX									;將輸入的值放入[EDX]即代表放入ArraySize
	CMP EAX, 0										;若EAX <= 0 跳至_Finish
	JBE _Finish
	MOV ESI, 0										;Array的OFFSET值(偏移量)先初始為0
	MOV ECX, [EDX]									;設定for迴圈的counter
	MOV EDX, [EBP + 12]								;紀錄Array的起始位置到EDX
_InputArray :
	CALL ReadInt									;輸入
	MOV [EDX + ESI], EAX							;EDX為ArraySize的初始位置 ESI為偏移量
	ADD ESI, 4										;ESI每次+4(BYTE) 因為為DWORD
	LOOP _InputArray								;lOOP _InputArray 直到ECX 為0
_Finish :
	MOV ESP, EBP									;將ESP 移回去 EBP(Stack Base)
	POP EBP											;將一開始POP進去的EBP POP出來
	RET 8											;清空STACK裡的Arguments
input ENDP
END