	AREA	Expressions, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR	R1, =5	; x = 5
	LDR	R2, =6	; y = 6
	LDR R3, =3		
	LDR R4, =5
	MUL R5, R3, R1	; R5 = 3x
	MUL R0, R5, R1	; R0 = 3x^2
	MUL R6, R4, R1	; R6 = 5x
	ADD R0, R0, R6 ; Result of (a) stored in R0, 3x^2 + 5
	
	LDR R3, =2
	LDR R4, =6
	LDR R5, =3
	MUL R6, R1, R1	; R6 = x^2
	MUL R0, R6, R3	; R0 = 2x^2
	MUL R6, R1, R2	; R6 = xy
	MUL R3, R6, R4	; R3 = 6xy
	ADD R0, R0, R3	; R0 = 2x^2 + 6xy
	MUL R6, R2, R2	; R6 = y^2
	MUL R3, R6, R5	; R3 = 3y^2
	ADD R0, R0, R3 ; Result of (b) stored in R0, 2x^2 + 6xy + 3y^2
	
	LDR R3, =4
	LDR R4, =3
	LDR R0, =8
	MUL R5, R1, R1	; R5 = x^2
	MUL R6, R5, R1	; R6 = x^3
	ADD R0, R0, R6	; R0 = x^3 + 8
	MUL R6, R5, R3	; R6 = 4x^2
	SUB R0, R0, R6	; R0 = x^3 - 4x^2 + 8
	MUL R5, R1, R4	; R5 = 3x
	ADD R0, R0, R5 ; Result of (c) stored in R0, x^3 - 4x^2 + 3x + 8
	
	
stop	B	stop

	END	