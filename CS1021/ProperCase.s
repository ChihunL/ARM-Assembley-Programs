	AREA	ProperCase, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR	R1, =testStr
	LDRB R2, [R1]		;load char
	
	CMP R2, #0x61 		;if (firstChar==lowerCase)
	BLO endfirst		;{
	SUB R2, R2, #0x20	;	convert char into uppercase
	STRB R2, [R1]		;	store result in Memory
	ADD R1, R1, #1		;	address ++
						;}
endfirst				
		
	LDRB R2, [R1] 		;load char
	CMP R2, #0			;while(char!=null)
	BEQ stop			;{
	CMP R2, #0x20		;	if(char!=space
	BEQ ifspace			;	&&
	CMP R2, #0x61		;	char is uppercase)
	BHS endnospace		;	{
	ADD R2, R2, #0x20	;		convert to lowercase
	STRB R2, [R1]		;		store char in memory
endnospace					
	ADD R1, R1, #1		;		address++
	B endfirst			;	}
	
ifspace					;	else if (char == space) {
	ADD R1, R1, #1		;		address++
	LDRB R2, [R1]		;		load char
	CMP R2, #0x61		;		if (char is uppercase)
	BLO endifspace		;			{
	SUB R2, R2, #0x20	;				convert to lowercase
	STRB R2, [R1]		;				store char in memory}
endifspace				;	}	
	ADD R1, R1, #1		;	address++
	B endfirst			;}

stop	B	stop



	AREA	TestData, DATA, READWRITE

testStr	DCB	"hello WORLD",0

	END
