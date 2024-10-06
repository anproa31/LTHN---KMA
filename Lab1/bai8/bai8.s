
	AREA RESET, DATA,READONLY
		DCD 0X20001000
		DCD start
X DCD 20
Y DCD 12
	AREA MYCODE, CODE,READONLY
	ENTRY
	
start
;==============
	MOV R0,#0
	LDR R1,X
	LDR R2,Y
	
	
	CMP R1,#0
	BLE thoat
	CMP R2,#0
	BLE thoat
looptru	
	CMP R1,R2 ;kiem tra
	BLT hoandoi
	
tieptuc
	SUB R1,R2 
	CMP R1,#0
	BEQ ketqua
	B looptru
	
hoandoi
	MOV R4,R2
	MOV R2,R1
	MOV R1,R4
	B tieptuc
ketqua
	MOV R3,R2
;ket thuc ucln
	LDR R1,X
	LDR R2,Y
	MUL R0,R1,R2
	UDIV R4,R0,R3
	SWI &11
	
thoat
	MOV R3,#0
	MOV R4,#0
	SWI &11

	END