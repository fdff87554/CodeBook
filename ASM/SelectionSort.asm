.386
.model flat, stdcall
INCLUDE includes.inc
INCLUDE Irvine32.inc
.code
SelectionSort PROC C
_SetCounter :
	PUSH EBP										;將EBP推進堆疊 保護住EBP
	MOV EBP, ESP									;讓ESP指向EBP
	MOV ECX, [EBP + 8]								;設置外層for迴圈的counter
	DEC ECX											;因為外層只會跑ArraySize - 1次
	MOV EDX, [EBP + 12]								;設定Array初始位置
	MOV EBX, 0										;Select到最小值的OFFSET值(偏移量)
	MOV ESI, 0										;外層for的Array OFFSET值
	MOV EDI, 4										;內層for的Array OFFSET值
_Loop1 :
	PUSH ECX										;保護住外層的ECX
	MOV EBX, ESI									;先將最小值設為Array中的第一個值
	ADD EDI, ESI									;設置EDI 為 ESI + 4(因為要從ESI的下一個開始選最小)
_Loop2 :
	MOV EAX, [EDX + EBX]							
	CMP EAX, [EDX + EDI]							;若有比[Array + EBX]小的值
	JLE _RoutineLoop2								;若沒有比[Array + EBX]更小的值 跳至_RoutineLoop2
	MOV EBX, EDI									;將EBX紀錄最小值的位置
_RoutineLoop2 :	
	ADD EDI, 4										;將內層迴圈++(因為是DWORD 故EDI + 4)
	LOOP _Loop2										;Loop _Loop2
	MOV EAX, [EDX + ESI]							;Swap(start)
	MOV ECX, [EDX + EBX]
	MOV [EDX + ESI], ECX
	MOV [EDX + EBX], EAX							;Swap(end)
	MOV EDI, 4										;EDI再次設回 4 (因為我們知道內層迴圈每次都是從 外層的下一個找起 故我先給他4)		
	ADD ESI, 4										;將外層迴圈++(因為是DWORD 故ESI + 4)			
	POP ECX											;將外層的Counter POP回來
	LOOP _Loop1										;Loop _Loop1
_Finish :
	MOV ESP, EBP									;將ESP 移回去 EBP(Stack Base)
	POP EBP											;將一開始POP進去的EBP POP出來
	RET 8											;清空STACK裡的Arguments
SelectionSort ENDP
END