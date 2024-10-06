	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
matran DCD 1,1,1,1
		DCD	1,2,1,1
		DCD	1,3,4,1
		DCD	1,1,1,5
	
	AREA RESET, DATA, READWRITE
MAXCC DCD 0
MINCC DCD 0
	
	AREA MYCODE, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
;============================
hang EQU 4
	LDR R2,=matran
	LDR R3,=hang
	LDR R4,[R2],#20
	MOV R0,R4 ;MAX
	MOV R1,R4 ;MIN
	SUB R3,#1 ;tru 1 vi da lay pt dau tien
	
loop	
	CMP R3,#0
	BEQ thoat
	LDR R4,[R2],#20
	CMP R4,R0 
	BGT	PMAX
	CMP R4,R1
	BLT PMIN
	B tiep
	
PMIN
	MOV R1,R4 ;gan gia tri R1 cho R4
	B tiep
	
PMAX
	MOV R0,R4 ;gan gia tri R0 cho R4
	B tiep
tiep
	SUB R3,#1
	B loop
thoat
	
	
;============================
	END