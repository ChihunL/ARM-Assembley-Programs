	AREA	Shift64, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR R12, =0x10000000	; largeCarryOver = 0x10000000
	LDR	R0, =0x13131313		; numberPartA = x
	LDR	R1, =0x13131313		; numberPartB = y
	LDR	R2, =-4				; amountToShift = z
		
	CMP R2, #0				; if (amountToShift != 0)	
	BEQ stop				; {	
	CMP R2, #0				;	if (amountToShift > 0)
	BLT shiftLeft			;	{
shiftRight					
	CMP R2, #0				; 		while (amountToShift != 0)
	BEQ stop				;		{
	LSR R1, #1				;			shift numberPartB right by one
	ASR R0, #1				;			shift numberPartA right by one arithmetically
	CMP R0, R12				;			if (numberPartA > largeCarryOver)
	BLE noCarry				;			{
	ADD R1, R1, R12			;				numberPartB += largeCarryOver
noCarry						;			}
	SUB R2, R2, #1			;			amountToShift --
	B shiftRight			;		}
							;	}
		
shiftLeft					;	else {
	CMP R2, #0				;		while (amountToShift != 0)
	BEQ stop				;		{
	LSL R0, #1				;			shift numberPartA left by one
	MOVS R1, R1, LSL #1		;			shift numberPartB left by one, setting the carry flag
	ADC R0, R0, #0			;			numberpartA += carryFlag
	ADD R2, R2, #1			;			amountTOShift -= 1
	B shiftLeft				;		}
							;	}
							; }
stop	B	stop


	END
		