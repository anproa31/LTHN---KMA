	AREA RESET,DATA,READONLY
		DCD 0X20001000
		DCD start

N DCD 17		
	AREA MYCODE, CODE,READONLY
	ENTRY
	
start
;=====================

	MOV R0,#0
	LDR R1,N
	MOV R2,#5
chiahet	
	CMP R2,R1
	BHI thoat
	ADD R0,R2 ;R0 =R0 + R2 = 5
	ADD R2,#5
	B chiahet
	
thoat

stop B stop

	END