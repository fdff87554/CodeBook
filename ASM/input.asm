INCLUDE headers.inc
.code
input PROC C
_Start :	
	PUSH EBP								;初始化
	MOV EBP, ESP							;初始化
	MOV EDX, [EBP + 12]						;EDX 指向 string的位址
	MOV ECX, 51								;ECX設成50讓ReadString最多只能輸入50個字元(+1留給 '\0')
	CALL ReadString
	MOV ECX, [EBP + 8]						;ECX 指向 stringLength的住址
	MOV [ECX], EAX							;[ECX] 讓我們直接對 stringLength做改值 EAX內存放著ReadString完有多少Character被輸入
_Finish :
	MOV ESP, EBP							
	POP EBP
	RET 8
input ENDP
END