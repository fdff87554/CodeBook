;407262079 ��u�G�A ���ӿ�
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
	PUSH OFFSET Array								;�NArray����}Push�i���|
	PUSH OFFSET ArraySize							;�NArraySize����}Push�i���|(�o�˧ڤ~�ઽ���s�JArraySize)
	CALL input										;�I�s input
	MOV EAX, ArraySize								;��ArraySize��iEAX
	CMP EAX, 0										;�YEAX <= 0 ����_Finish
	JBE _Finish
	CMP EAX, 1										;�YEAX == 1 ����_Output
	JE _Output
_Sort:
	PUSH OFFSET Array								;�NArray����m���i���|
	PUSH Arraysize									;�NArraySize���i���|
	CALL SelectionSort								;�I�sSelectionSort
_Output :
	PUSH OFFSET Array								;�NArray����m���i���|
	PUSH ArraySize									;�NArraySize���i���|
	CALL output										;�I�s output
	JMP _Input										;���ƿ�J(�YArraySize == 0�ɤ~�|�Ͼ�ӵ{������)
_Finish :	
	RET
main ENDP
END main

