	AREA	Unique, CODE, READONLY
	IMPORT	main
	EXPORT	start

start

	LDR	R1, =VALUES
	LDR R2, =COUNT
	LDR R2, [R2]		; stringCount = COUNT
	SUB R2, R2, #1		; stringCount = stringCount - 1
	LDR R7, =4
	MUL R2, R7, R2		; stringCount = stringCount * 4
	LDR R0, =1			; boolean unique = true
	LDR R3, =0			; counterA = 0
	LDR R4, =1			; counterB = 1
startloop				; do {
	ADD R5, R1, R3		; 	valueA = VALUES + counterA
	LDR R5, [R5]		
	ADD R6, R1, R4		; 	valueB = VALUES + counterB
	LDR R6, [R6]
	CMP R5, R6			; 	if (valueA =! valueB)
	BEQ notunique		; 	{
	ADD R4, R4, #4		;		counterB = counterB + 4 }
	CMP R4, R2			; 	if (counterB > string
	BHI increaseA		; 	{
	B  startloop
increaseA
	ADD R3, R3, #4		;		counterA = counterA + 4
	ADD R4, R3, #4		; 		counterB = counterA + 4 }
	CMP R3, R2			; } while (counterA <= stringCounter)
	BEQ stop
	B startloop

notunique
	LDR R0, =0			; if there are 2 numbers that are the same: boolean unique = false


stop	B	stop


	AREA	TestData, DATA, READWRITE

COUNT	DCD	10
VALUES	DCD	5, 2, 7, 4, 13, 30, 18, 8, 9, 9


	END
