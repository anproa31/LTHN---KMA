/*	AREA RESET,DATA,READONLY
		DCD 0x20000000
		DCD Start
N DCD 3
X DCD 3
	AREA MYCODE,CODE,READONLY
		ENTRY
Loop PROC
	MUL R4,R2
	ADD R1,R4
	ADD R3,#1
	CMP R3,R0
	BLE Loop
	BX LR
	ENDP
Start PROC
	LDR R0,N
	CMP R0,#0
	BLT Stop
	MOV R1,#1 ;ket qua
	LDR R2,X
	MOV R3,#2 ;so phan tu
	CMP R3,R0
	BGT Stop
	LDR R4,X ;gia tri 1 phan tu
	BL Loop

Stop
	B Stop
	END*/