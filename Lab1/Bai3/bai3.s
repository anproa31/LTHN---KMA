	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD start	
		
N DCD 5

	AREA MYCODE, CODE ,READONLY
	ENTRY
	
start
;=========================
	MOV R1,#1 ;tinh giai thua
	LDR R2,N
	MOV R3,#1
	
;5X4X3X2X1
giaithua
	CMP R3,R2
	BHI stop
	MUL R1,R3
	ADD R3,#1
	B giaithua

stop 

END