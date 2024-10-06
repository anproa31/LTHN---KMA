;Vi?t chuong trình tính t?ng các s? ch?n, l? trong ma tr?n
	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
matran DCD 3,4,5,6
		DCD 6,5,4,3
		DCD 3,4,5,6
		DCD 6,5,4,3
	
	AREA RESET, DATA, READWRITE
TongChan DCD 0
TongLe DCD 0
	
	AREA MYCODE, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
;============================
soPhantu EQU 16
	LDR R0,=matran
	LDR R1,=soPhantu
	MOV R2,#0	;TCHAN
	MOV R3,#0	;TLE
	
loop
	CMP R1,#0 ;so sanh het thi dung
	BEQ thoat
	SUB R1,#1 ;- R1 DI 1 
	LDR R4,[R0],#4 ;R4 = 3 , TANG DIA CHI R0 + 4
	CMP R4,#0 ;kiem tra R4 CO BAN G 0 HAY K
	BEQ loop
	B KiemTra
	
	
; KIEM TRA
KiemTra
	MOV R5,#2 ;bat dau chan
add1	
	CMP R5,R4	;kiem tra R5 va r4
	ADD R5,#2
	BLT add1 ;neu nho hon thi cong tiep
	BGT le	; lon hon thi le
	BEQ Chan	; bang thi la so chan
; KIEM TRA
	
	
Chan
	ADD R2,R4 ;R2 = R2 +R4
	B loop
	
le
	ADD R3,R4 ;R3 = R3 +R4
	B loop
	
thoat
;============================
	END