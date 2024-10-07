;CR  EQU 0x0D; KHAI BAO KY TUC KET THUC
	AREA RESET, DATA, READONLY
		DCD 0X20000000
		DCD start
CHON DCD 2
chuoi1 DCB "ABCDE", 0; KHAI BAO DU LIEU
	AREA RESET1, DATA, READONLY
chuoi2 	DCD 5
		DCB "ABCDE"
	AREA KETQUA, DATA, READWRITE
KQCT1 DCB 0
KQCT2 DCB 0
	AREA MYCODE, CODE, READONLY
	ENTRY
start
	LDR R0,CHON
	CMP R0,#1
	BEQ CT1
	CMP R0,#2
	BEQ CT2
CT1 PROC
	LDR R0, =chuoi1
	MOV R3, R0; lUU TRU DIA CHI BAT DAU
	LDR R2, =KQCT1
LOOP
	LDRB R1, [R0], #1;LAP DE LAY DIA CHI CUOI C�NG CUA CHUOI
	CMP R1,#0	; DEN KI TU KET THUC THI DUNG
	BEQ TG	;KET THUC
	B LOOP
TG	
	SUB R0, #2; GIAM DI 2 DE LAY DU LIEU
	B LOOP1
LOOP1; THUC HIEN DAO NGUOC XAU
	LDRB R1, [R0] ; LAY GIA TRI CUOI CUNG 
	STRB R1,[R2], #1	; LUU GIA TRI CUOI CUNG CUA CUA DIA CHI R1 VAO DIA CHI DAU TIEN R2
	SUB R0, #1	;GIAM DIA CHI THANH GHI R1 DI 1
	CMP R0, R3	;KIEM TRA R0 VOI R3 KIEM T
	BLT STOP	;NHO HON THI DUNG LAI
	B LOOP1		; TIEP TUC
	BX LR
	ENDP
;==========================================================================================
CT2 PROC
	LDR R0, =chuoi2
	LDR R1, [R0], #4; LAY DO DAI CHUOI
	LDR R2, =KQCT2
	SUB R2,#1 ;DIA CHI TU 0x2000000
	SUB R1,#1; GIAM TRUOC DE TI LAY PHAN TU CUOI CUNG
LOOP2
	LDRB R3, [R0,R1]
	CMP R1,#0; = 0 THI CON PHAN TU
	BLT STOP
	STRB R3,[R2], #1	; luu vao dia chi dau tien 0x2000000
	SUB R1, #1
	B LOOP2
	BX LR
	ENDP
STOP
exit B exit
	END