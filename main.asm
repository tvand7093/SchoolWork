	SECTION .data
prompt:		db	"Enter a positive integer: "
promptLen:	equ	$-prompt
badPrompt:	db	"Bad Number.", 10
badLength:	equ	$-badPrompt	
STDIN:		equ	0
STDOUT:		equ	1

newline:	equ	10
space:	 	equ	32
zero:		equ	48
nine:	 	equ	57
multiplier	equ	10
	
	SECTION .bss
maxInput:	equ	20
input1:		resb	maxInput+1
input2:		resb	maxInput+1
	
	SECTION .text

	global _start

_start:
	push 	ebp
	mov	ebp, esp
	sub	esp, 6

	mov	dword [ebp-4], 0
	mov	dword [ebp-8], 0
	mov	dword [ebp-12], 0

	push	input1
	call 	readNumber
	mov 	[ebp-4], eax

	push 	input2
	call 	readNumber
	mov	[ebp-8], eax

	mov	ebx, [ebp-4]
	mov	ecx, [ebp-8]
	
	add	esp, 6
	mov	esp, ebp
	pop	ebp
	jmp 	terminate

readNumber:
	;; Reads a string from stdin and then tries to
	;; convert it to an integer.
	;; RETURNS: <int> the integer value of the string.
	;; If fails, then it will exit the program.

	;; setup stack
	push	ebp
	mov	ebp, esp
	
	;; Print the prompt message
	push	promptLen	;length to print
	push    prompt		;the string to print
	call 	print

	mov	eax, [ebp+8]
	;; Read the string
	push 	eax
	call 	read

	;; now process the string into an integer.

	push	eax
	call	getInt

	mov	esp, ebp
	pop	ebp
	ret			;return to caller.

getInt:
	;; Converts a string into an integer value.
	;; RETURNS: <int> the integer equivilent of the string.

	;; setup stack
	push	ebp
	mov	ebp, esp
	push 	ebx
	push	ecx
	push 	edx
	
	sub	esp, 4

	nop
	cld			;clear search direction of strings
	mov	dword [ebp-4], 1	;multiplier (digitValue)
	mov	dword [ebp-8], 0	;return value
	mov	ebx, [ebp+8] 	;set first char to string's first char

	mov	edx, 0		;set return value
	
getLength:
	;; loop for getting length of the input string.
	mov	ecx, [ebx]	;set edx to char value.
	cmp 	ecx, newline	;see if current char is newline
	jne 	continue	;if newline, go to next step.

	;; end of first loop. remove newline index
	sub	ebx, 1
	
convert:
	;; second loop for converting from string to int.

	;; while condition 

	xor	ecx, ecx
	xor	eax, eax

	cmp 	ebx, [ebp+8]	;digit >= string
	jl	exitInt		;exit procedure.

	;; first if condition

	mov	ch, [ebx]	;set to char int value
	cmp	ch, space	;check if it is a space
	je	exitInt		;space char, so exit loop and procedure
	
	;; second if statement, condition 1
	cmp 	ch, zero	;is it less than zero?
	jl	badNumber	;bad number, so exit

	;; second if, condition 2
	cmp	ch, nine	;greater than 9?
	jg	badNumber	;greater than 9, so bad number.

	;; good number, so finish loop
	sub	ch, zero	;exc = (*digit - '0')

	
	;; (*digit - '0')*digitValue
	;; mov	al, ch

	mov	eax, 0
	
	add	al, ch

	;; mov	eax, ecx	
	
	mov	ecx, [ebp-4]
	mul	ecx

	;; multiply result is in ax
	add	[ebp-8], eax
	
	;; digitValue *= 10
	mov	eax, multiplier
	mov	ecx, [ebp-4]
	mul	ecx
	
	mov	[ebp-4], eax 	;move new digitValue into place

	sub	ebx, 1		;digit--;
	jmp 	convert
badNumber:
	;; print error message
	push 	badLength
	push	badPrompt
	call	print
	
	;; exit program
	jmp 	terminate
	
continue:			;Continue statement for getLength loop.
	inc 	ebx		;increment char position.
	jmp	getLength	;redo loop.
	
exitInt:	
	;; restore stack
	
	mov 	eax, [ebp-8]	;move the results from the loop to the return register.
	add	esp, 4
	pop	edx
	pop 	ecx
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret
	
read:
	;; Reads a string in from stdin
	;; RETURNS: <char*> The string that was read in.
	
	;; save stack
	push 	ebp
	mov	ebp, esp
	push	ebx
	push	ecx
	push	edx

	;; read input!
	mov	eax, 3		;set to read
	mov	ebx, STDIN	;read from stdin
	mov	ecx, [ebp+8]	;set the buffer to hold our string
	mov	edx, maxInput	;set length to read
	int	80H		;do the reading.

	mov	eax, ecx

	;; restore stack
	pop 	edx
	pop	ecx
	pop	ebx
	mov	esp, ebp
	pop 	ebp
	ret
	
print:
	;; Prints a string to stdout
	;; RETURNS: <nothing>
	push	ebp
	mov	ebp, esp

	push	ebx
	push	ecx
	push	edx
	
	nop	
	cld			;clear direction
	;; print the string!
	mov 	eax, 4		;write
	mov 	ebx, STDOUT	;to prefered stread
	mov	ecx, [ebp+8]	;the string to print
 	mov	edx, [ebp+12]	;the length to print
	
	int	80H		;print the string

	pop	edx
	pop	ecx
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret

terminate:
	mov	eax, 1
	mov	ebx, 0
	int 	80H		;terminate program
