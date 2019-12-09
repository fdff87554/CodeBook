.386
.model flat, stdcall
.stack 4096

includelib Irvine32.lib
includelib legacy_stdio_definitions.lib
includelib ucrt.lib
include header.inc

.code
typeChange PROC
	push ebp
	mov ebp, esp

	mov esi, [ebp + 16]				; the offset of inputString
	mov ebx, [ebp + 12]				; the offset of stringLength

	sub esp, 12
	loopTime EQU DWORD PTR [ebp - 4]
	outputNum EQU SDWORD PTR [ebp - 8]
	reminder EQU DWORD PTR [ebp - 12]

	mov outputNum, 0
	mov eax, [ebx]
	mov loopTime, eax				; make loopTime the stringLength
	mov ebx, -1
	changeWork:
		inc ebx
		cmp ebx, loopTime			; use ebx and loopTime to judge for string check finish
		jge negativeCheck			; check if the interger is negative number
		
		mov eax, 0					; clean the eax ragister
		mov al, [esi + ebx]			; mov the char to al

		call IsDigit				; check if is number
		jnz checkChar				; check what char it is

		mov eax, 0
		mov al, [esi + ebx]			; mov char to al again to make sure the al is not change by work
		sub al, '0'					; change the char to integer
		mov ecx, outputNum			; outputNum is the number is going to print
		imul ecx, 10
		mov outputNum, ecx
		add outputNum, eax
	jmp changeWork

	checkChar:
		checkSpace:
			cmp eax, ' '
			je negativeCheck

		checkNegative:
			cmp eax, '-'
			je reminderChange
	jmp changeWork

	reminderChange:
		mov reminder, 1
	jmp changeWork

	negativeCheck:
		cmp reminder, 1
		jne getOut
		mov eax, outputNum
		neg eax
		mov outputNum, eax

	getOut:
		; put the output number to the offset of outputInt
		mov ecx, [ebp + 8]			; the offset of outputInt
		mov eax, outputNum
		mov [ecx], eax
		; inputString address change
		inc ebx
		add esi, ebx
		mov [ebp + 16], esi
		; sub the stringLength
		mov ecx, [ebp + 12]			; the offset of stringLength
		sub [ecx], ebx
		mov esp, ebp
		pop ebp
		ret
typeChange ENDP
END