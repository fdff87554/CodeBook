;Program : String to Numbers

.386
.MODEL FLAT, STDCALL
.STACK 4096

INCLUDE Header.inc

.data
	
	TestStr BYTE 1000 DUP(0)
	StrCount DWORD ?

	Now DWORD 0
	Ans SDWORD 0
	Sd SDWORD 1																			;判斷正負數用
	Space BYTE " ", 0

.code

TestMain PROC

	Read:
		MOV Now, 0																			;記目前做到位置
		PUSH OFFSET TestStr
		PUSH OFFSET StrCount
		CALL Sin
		;ADD ESP, 8

	Change:
		MOV ESI, OFFSET TestStr													;每次遇到空格，跳出StoN副程式，並記住做到哪
		ADD ESI, Now																		;再次進副程式時，從上次記住的位置開始做

		PUSH OFFSET Now
		PUSH ESI
		PUSH StrCount
		PUSH OFFSET Ans
		PUSH OFFSET Sd
		CALL StoN
		ADD ESP, 20

	Write:
		PUSH Ans
		PUSH Sd
		CALL Nou
		ADD ESP, 8
		MOV EDX, OFFSET Space
		CALL WriteString

		MOV ECX, Now																	;比較做到的位置是否已是字串尾，不是則再次進到副程式
		CMP ECX, StrCount																;是則結束並到Read再次做讀入
		JNE Clear
		CALL Crlf
		CALL Crlf
		JMP Read

	Clear:
		MOV Ans, 0																			;因為碰到空格，所以輸出的值以及正負號判斷都要更新
		MOV Sd, 1
		JMP Change

	Over:
		RET

TestMain ENDP
END TestMain