	AREA RESET , DATA ,READONLY
		DCD 0x20001000 ; do dai du lieu la bao nhieu
		DCD start ; 
	ALIGN
; khai bao vung nho 

MATRAN 	DCD 1,2,3
		DCD 3,2,1
		DCD 1,2,3

;khai bao vung ma lenh	
	AREA KQ, DATA ,READWRITE
Tong DCD 0
	AREA mycode, CODE ,READONLY
	EXPORT start
	ENTRY
start
;===================================
sopt EQU 9
	LDR R1,=MATRAN
	LDR R2,=sopt
	LDR R4,[R1]
	MOV R0,#0
loop	
	CMP R2,#0
	BEQ thoat
	LDR R4,[R1], #4
	ADD R0,R4
	SUB R2,#1
	B loop
	
thoat
	END