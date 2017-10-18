	AREA	Divide, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
		LDR R2, = 9		; R2 = a
		LDR R3, = 3		; R3 = b
		LDR R0, = 0		; R0 = quotient
		LDR R1, = 0		; R1 = remainder
while					; while
		CMP R3, #0		; ( b =! 0 &&
		BEQ stop
		
		CMP R2, R3		; 	a >= b)
		BLT endwh		; {
		SUBS R2, R2, R3	; 	a = a - b
		ADD R0, R0, #1	;	quotient++
		
		B while			; }
endwh
		MOV R1, R2		; remainder = a
		
stop	B	stop

	END	