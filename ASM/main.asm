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
	PUSH OFFSET string						;推入string 的住址					
	PUSH OFFSET stringLength				;推入stringLength的住址
	CALL input
_StringtoInteger :
	PUSH OFFSET string						;推入string 的住址
	PUSH stringLength						;推入stringLength (CALL BY VALUE)
	CALL StringtoInteger
	MOV sum, EAX							;副程式的sum放在EAX 故回來主程式放回sum
_Output	:
	PUSH sum								;推入sum
	CALL output								
	JMP _Input								;無限輸入
	RET
main ENDP
END main