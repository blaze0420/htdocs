INCLUDE Irvine32.inc

;Name: Colin Christie
;Student ID: 101746234
:Assignment 1
:Submitted: Oct 23, 2011

;this program takes the values of signed integers stored in the array inputs and evaluates the following expression
;Result = -inputs[0] � (inputs[1] + inputs[2]) + inputs[3]
;the final result is displayed on the screen

.data
inputs SDWORD -12, 42, 77, -39
Result SDWORD 0

.code
main PROC

	mov esi, OFFSET inputs		;mov esi to the start of inputs
	mov eax, [esi]				;copy the value of index[0] into eax
	neg eax						;negate the value
	mov [esi], eax				;put the negated value into eax effectively negating index[0]
	mov eax, [esi]				;copy the value of index[0] into eax
	add Result, eax				;add the value to Result
								;value in Result is now -inputs[0]

	add esi, TYPE inputs		;move esi to inputs[1]
	mov eax, [esi]				;move the value of inputs[1] into eax
	add esi, TYPE inputs		;move esi to inputs[2]
	mov ebx, [esi]				;mov the value of inputs[2] into ebx
	add eax, ebx				;add inputs[1] and inputs[2] and store sum in eax
	sub Result, eax				;subtract the sum from Result
								;value in Result is now: -inputs[0] - (inputs[1] + inputs[2])

	add esi, TYPE inputs		;move esi to inputs[3]
	mov eax, [esi]				;copy value of inputs[3] into eax
	add Result, eax				;add the value of eax to Result
								;value in Result is now: -inputs[0] - (inputs[1] + inputs[2]) + inputs[3]

	mov eax, Result				;move the final result into eax
	call WriteInt				;display the value of eax on the screen

	mov eax, 5000
	call Delay					;wait 5 secs
	call ClrScr					;clear the screen

	exit

main ENDP

END main