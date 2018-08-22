	AREA RESET, DATA, READONLY
		DCD 0X20001000
		DCD START
		
MATRAN	DCD 1,-2,3,-4,5
		DCD 2,-3,4,-2,-5
		DCD 1,4,2,-2,-4

	AREA MYCODE, CODE, READONLY
	
	ENTRY
	
START

SOPT	EQU	15
	
	MOV R0,#0
	MOV R1,#0
	LDR R2,=MATRAN
	LDR R3,=SOPT
	MOV R5,#0
	
LOOP
	ADD R5,#1
	CMP R5,R3
	BGT KT
	LDR R4,[R2]
	CMP R4,#0
	BGE DUONG
	BLT	AM
	

DUONG
	ADD R0,#1
	ADD R2,#4
	B LOOP
AM
	ADD R1,#1
	ADD R2,#4
	B LOOP

KT
	
	END