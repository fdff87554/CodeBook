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
	Sd SDWORD 1																			;�P�_���t�ƥ�
	Space BYTE " ", 0

.code

TestMain PROC

	Read:
		MOV Now, 0																			;�O�ثe�����m
		PUSH OFFSET TestStr
		PUSH OFFSET StrCount
		CALL Sin
		;ADD ESP, 8

	Change:
		MOV ESI, OFFSET TestStr													;�C���J��Ů�A���XStoN�Ƶ{���A�ðO�����
		ADD ESI, Now																		;�A���i�Ƶ{���ɡA�q�W���O����m�}�l��

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

		MOV ECX, Now																	;������쪺��m�O�_�w�O�r����A���O�h�A���i��Ƶ{��
		CMP ECX, StrCount																;�O�h�����è�Read�A����Ū�J
		JNE Clear
		CALL Crlf
		CALL Crlf
		JMP Read

	Clear:
		MOV Ans, 0																			;�]���I��Ů�A�ҥH��X���ȥH�Υ��t���P�_���n��s
		MOV Sd, 1
		JMP Change

	Over:
		RET

TestMain ENDP
END TestMain