	AREA	ShiftAndAdd, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR R0, =0					; result = 0
	LDR	R1, =9					; number = x
	LDR	R2, =10					; multiplier = y
	LDR R3 ,=31					; amountToShift = 31 
one	
	CMP R3, #0					; while (amountToShift != 0)
	BLO stop					; {
	LDR R12, =0					; 	carryCompare = 0
	MOVS R2, R2, LSL #1			;	shift multiplier left once, set carry flag
	ADC R12, R12, #0			;	add carry flag to carryCompare
	CMP R12, #1					;	if (carryCompare == 1)
	BNE two						;	{
	ADD R0, R0, R1, LSL R3		;		result = result + number shifted left by amountToShift
two								;	}
	SUB R3, R3, #1				;	amountToShift --
	B one						; }


	
stop	B	stop


	END	
	