; dem so phan tu la so nguyen to nho hon N
	AREA RESET, DATA, READONLY
		DCD 0X20001000
		DCD MAIN
N DCD 100;
	AREA mycode, CODE, READONLY
	ENTRY
MAIN
	MOV R0, #0; SO PHAN TU LA SO NGUYEN TO
	LDR R1, N	; R1 = 100
	BL CT
	B STOP ;THOAT
CT PROC
	MOV R2, #1; gan r2 = 1 cho chay den 100 de kiem tra xem co bao nhieu sntI
LOOP
	CMP R2, R1 ;kim tra R2,R1 NEU > THI DUNG LAI
	BGT STOP
	CMP R2, #1 ;KIEM TRA R2 = 1 THI TANG LEN 1 VI N� K PHAI LA SNT
	BEQ NEXT	;CHAY DEN NOI DE R2 TANG LEN 1
	CMP R2, #3	;KIEM TRA R2 VA 3 
	BLE SNT	;NEU R2 <= 3 THI SNT + 1 = R0 + 1
	MOV R3, R2; C�N >  THI SAO CHEP R3 = R2 DE TINH
	MOV R4, #2; R4 =2 DE SU DUNG CHO PHEP CHIA 2
KIEMTRA2	
	UDIV R5, R3, R4; R5=R3/R4
	MUL R6, R5, R4; 
	CMP R6, R2; SO SANH R6 VOI R2 KIEM TRA NEU = NHAU THI LA CHIA DC 
	BEQ NEXT	; NEU = THI KP LA SNT
	MOV R4, #3	; KO = THI GAN R4 = 3 DE KT VOI 3 
KIEMTRA3
	UDIV R5, R3, R4; R5=R3/R4
	MUL R6, R5, R4; 
	CMP R6, R2; SO SANH R6 VOI R2 KIEM TRA NEU = NHAU THI LA CHIA DC
	BEQ NEXT ; NEU = THI KP LA SNT
	CMP R2, #5	;KIEM TRA VOI 5 VI 5 CUNG LA SNT
	BEQ SNT	; R2 = 5 THI LA SNT
	MOV R4, #5 ; KO = THI GAN R4 = 5 DE KT VOI 5
KIEMTRA5
	UDIV R5, R3, R4; R5=R3/R4
	MUL R6, R5, R4; 
	CMP R6, R2; SO SANH VOI SO BAN DAU
	BEQ NEXT
	CMP R2, #7;KIEM TRA VOI 7 VI 7 CUNG LA SNT
	BEQ SNT	;R2 = 7 THI LA SNT
	MOV R4, #7; KO = THI GAN R4 = 7 DE KT VOI 7 
KIEMTRA7
	UDIV R5, R3, R4; R5=R3/R4
	MUL R6, R5, R4; 
	CMP R6, R2; SO SANH VOI SO BAN DAU
	BEQ NEXT
	B SNT
SNT
	ADD R0, #1
	B NEXT
NEXT
	ADD R2, #1; TANG I
	B LOOP
	ENDP
STOP
	SWI &11
	END