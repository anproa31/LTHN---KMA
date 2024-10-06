	AREA RESET,DATA,READONLY
		DCD 0x20001000
		DCD start
	ALIGN
chuoi DCD 1,2,3,4,5
	AREA KQ,DATA ,READWRITE
tong DCD 0
	AREA mycode,CODE, READONLY
	EXPORT start
	ENTRY

start
;===================
pt EQU 5
	MOV R0,#0
	LDR R1, =chuoi ;lay dia chi
	LDR R2, chuoi	; lay gia tri
	MOV R3,#1
	LDR R4, =pt
loop	
	CMP R3,R4
	BHI thoat ;BHI ap dung cho so khong dau
	LDR R2,[R1],#4 ; gan Gia tri cua Dia chi R1 cho R2 sau do do tang thang R1 + 4 0x20001000 0x20001004
	ADD R0,R2 ;R0 = R0 + R2
	ADD R3,#1
	B loop
thoat
	LDR R5, =tong
	STR R0,[R5] ; luu tru gia tri  R0 vao dia chi R5
	SWI &11 ; ngat thong bao ket thuc chuong trinh
;===================
	END