/*	AREA RESET,DATA,READONLY
		DCD 0x20000000
		DCD Start
N DCD 15
ket_qua DCD 0
	AREA STACK_BAI2,DATA,READWRITE
MY_STACK DCD 0
	AREA MYCODE,CODE,READONLY
		ENTRY
Tinh_Tong PROC
	LDR R5,=MY_STACK
	LDMIA R5,{R0,R3}
Loop
	ADD R0,R3
	ADD R3,R2
	CMP R3,R1
	BLE Loop
	BX LR
	ENDP
Start PROC
	MOV R0,#0
	LDR R1,N
	MOV R2,#5
	MOV R3,#0
	LDR R5,=MY_STACK
	STMIA R5,{R0,R3}
	BL Tinh_Tong
	LDR R4,=ket_qua
	STR R0,[R4]
Stop 
	B Stop
	END*/