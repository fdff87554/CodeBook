INCLUDE headers.inc
.code
output PROC C
_Start :
	PUSH EBP
	MOV EBP, ESP
	MOV EAX, [EBP + 8]								;EAX 為sum
	CMP EAX, 0										;若大於 0 跳至 postive
	JGE _Postive				
	CALL WriteInt
	CALL Crlf
	MOV ESP, EBP
	POP EBP
	RET 4
_Postive :
	CALL WriteDec
	CALL Crlf
	MOV ESP, EBP
	POP EBP
	RET	4
output ENDP
END