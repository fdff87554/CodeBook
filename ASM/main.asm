INCLUDE headers.inc
.data
sum SDWORD 0
multiple DWORD 10
string BYTE 50 DUP (?)
stringLength SDWORD ?
negative SDWORD 1
.code
main PROC C
_Input :
	MOV sum, 0									
	MOV negative, 1								
	PUSH OFFSET string						;���Jstring ����}					
	PUSH OFFSET stringLength				;���JstringLength����}
	CALL input
_StringtoInteger :
	PUSH OFFSET string						;���Jstring ����}
	PUSH stringLength						;���JstringLength (CALL BY VALUE)
	CALL StringtoInteger
	MOV sum, EAX							;�Ƶ{����sum��bEAX �G�^�ӥD�{����^sum
_Output	:
	PUSH sum								;���Jsum
	CALL output								
	JMP _Input								;�L����J
	RET
main ENDP
END main