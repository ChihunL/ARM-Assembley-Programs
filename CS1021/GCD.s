	AREA	GCD, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
		LDR R2, =0x02345678	; R2 = a
		LDR R3, =0x04567890	; R3 = b

while						; while
		CMP R2, R3			; (a != b)
		BEQ endwhile		; {
whileif 					; if
		CMP	R2, R3			; (a > b)
		BLS whileelse		; {
		SUB R2, R2, R3		; a = a - b	
		B   while			; }
		
whileelse					; else
							; {
		sub R3, R3, R2		; b = b - a
		B   while			; }

endwhile					; }
		MOV R0, R2			; R0 = a
	
stop	B	stop

	END	