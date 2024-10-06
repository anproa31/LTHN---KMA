
	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	ALIGN
matran DCD 3,4,5
		DCD 6,5,4
		DCD 3,4,5

	
	AREA RESET, DATA, READWRITE
Tong DCD 0
	
	AREA MYCODE, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY

Reset_Handler
;============================
soPhantu EQU 9
	LDR R1,=matran
	LDR R2,=soPhantu
	MOV R0,#0 ;tong
loop	
	CMP R2,#0
	BEQ Thoat
	
	LDR R3,[R1],#4
	MOV R4,#5
Chia5	
	CMP R3,R4
	BEQ ChiaHet
	BLT Khongchiahet
	ADD R4,#5
	B Chia5
ChiaHet
	ADD R0,R3
	SUB R2,#1
	B loop
Khongchiahet
	SUB R2,#1
	B loop
Thoat
	LDR R6,=Tong
	STR R0,[R6]
	SWI &11
;============================
	END