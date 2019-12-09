;Program : Number output

.386
.MODEL FLAT, STDCALL

INCLUDE Header.inc

;[ EBP + 12 ] Ans
;[ EBP + 8 ] Sd

.code

Nou PROC

	Start:
		PUSH EBP
		MOV EBP, ESP
		MOV EBX, [ EBP + 12 ]
		MOV EDX, [ EBP + 8 ]

		CMP EDX, 1																				;EDX = Sd，如果Sd為1，則其數字為正數，否則為負數
		JNE Negative

		MOV EAX, EBX
		CALL WriteDec
		JMP Stop

	Negative:
		MOV EAX, EBX
		NEG EAX
		CALL WriteInt

	Stop:
		MOV ESP, EBP
		POP EBP
		RET

Nou ENDP
END