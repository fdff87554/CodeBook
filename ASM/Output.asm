.386
.model flat, stdcall
INCLUDE includes.inc
INCLUDE Irvine32.inc
.data
	space DWORD " "
.code
output PROC C
	PUSH EBP										;將EBP推進堆疊 保護住EBP
	MOV EBP, ESP									;讓ESP指向EBP
	MOV EDX, [EBP + 12]								;這定Array初始位置
_SetCounter :	
	MOV ECX, [EBP + 8]								;設定迴圈counter
	MOV ESI, 0										;初始偏移量		
_PrintArray :
	MOV EAX, [EDX + ESI]							;EDX為Array初始位置ESI為偏移量
	CALL WriteInt									;輸出Array(Sorted)
	MOV EAX, space									;輸出空格
	CALL WriteChar								
	ADD ESI, 4										;因為為DWORD 故ESI + 4
	LOOP _PrintArray								;LOOP _PrintArray 直到ECX為0
_Finish :
	CALL Crlf										;換行讓我們做下一次的輸入時較為清晰
	MOV ESP, EBP									;將ESP 移回去 EBP(Stack Base)
	POP EBP											;將一開始POP進去的EBP POP出來
	RET 8											;清空STACK裡的Arguments
output ENDP
END