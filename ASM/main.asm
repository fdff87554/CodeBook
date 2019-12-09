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
	MOV sum, 0									;初始化
	MOV negative, 1								;初始化
	MOV EDX, OFFSET string						;EDX指向string的位置
	MOV ECX, SIZEOF string						;控制string最高能輸入多少字元	
	CALL ReadString
	MOV stringLength, EAX						;字元的數目會放入EAX
	MOV ECX, EAX
_GetNumbers :	
	PUSH ECX
	PUSH EDX
	MOVSX EAX, BYTE PTR [EDX]					;把EDX指向的位置 放一個BYTE 到EAX
	CMP EAX, 45									;ASCII 45 代表為負的
	JNE _IsaDigit
	MOV negative, -1							
_IsaDigit :	
	CALL IsDigit
	JNZ _SetEDX									;若旗標值未set 則跳走
	SUB EAX, 48									;把字元從ASCII轉為數字
	MOV ECX, EAX								;暫時把當前的數字存入ECX
	MOV EAX, sum								;將之前的放入EAX
	MUL multiple								;並乘10
	MOV sum, EAX								;再放回sum
	ADD sum, ECX								;加回當前數字
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