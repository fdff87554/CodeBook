;Program : String input

.386
.MODEL FLAT, STDCALL

INCLUDE Header.inc

;[ EBP + 12 ] OFFSET TestStr
;[ EBP + 8 ] OFFSET StrCount

.code

Sin PROC
	
	PUSH EBP
	MOV EBP, ESP
	MOV ESI, [ EBP + 12 ]																;OFFSET TestStr
	MOV EBX, [ EBP + 8 ]																;OFFSET StrCount

	MOV EDX, ESI
	MOV ECX, 1000
	CALL ReadString
	MOV [ EBX ], EAX																		;將 EAX 的值存入[ EBX ]，也就是 StrCount
	CALL Crlf

	MOV ESP, EBP
	POP EBP
	RET 8

Sin ENDP
END