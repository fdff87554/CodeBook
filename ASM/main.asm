;407262079 資工二乙 李承翰
;Exercise - 5: Selection Sort
;Input an integer array , and sorted.
;SelectionSort PROTO C
INCLUDE Irvine32.inc
INCLUDE includes.inc
INCLUDElib legacy_stdio_definitions.lib
INCLUDElib ucrt.lib
.data
	scanfM BYTE "%d", 0
	ArraySize DWORD ?
	Array SDWORD 1000 DUP(?)
.code
main PROC C
_Input :
	PUSH OFFSET Array								;將Array的住址Push進堆疊
	PUSH OFFSET ArraySize							;將ArraySize的住址Push進堆疊(這樣我才能直接存入ArraySize)
	CALL input										;呼叫 input
	MOV EAX, ArraySize								;把ArraySize放進EAX
	CMP EAX, 0										;若EAX <= 0 跳至_Finish
	JBE _Finish
	CMP EAX, 1										;若EAX == 1 跳至_Output
	JE _Output
_Sort:
	PUSH OFFSET Array								;將Array的位置推進堆疊
	PUSH Arraysize									;將ArraySize推進堆疊
	CALL SelectionSort								;呼叫SelectionSort
_Output :
	PUSH OFFSET Array								;將Array的位置推進堆疊
	PUSH ArraySize									;將ArraySize推進堆疊
	CALL output										;呼叫 output
	JMP _Input										;重複輸入(若ArraySize == 0時才會使整個程式結束)
_Finish :	
	RET
main ENDP
END main

