; NOI 2 XAU
	AREA RESET, DATA, READONLY
		DCD 0X20002000
		DCD start
CHUOI1 DCB "Nguyen Van",0
CHUOI2 DCB "Minh",0
	AREA KETQUA, DATA, READWRITE
KQ DCB 0
	AREA mycode, CODE, READONLY
	ENTRY
start
	LDR R0, =CHUOI1
	LDR R1, =KQ
LOOP
	LDRB R2, [R0], #1 ;LAY PHAN TU DAU TIEN
	CMP R2, #0	; KIEM TRA XEM PHAI PHAN TU KET THUC HAY K
	BEQ ADDCHUOI	; NEU LA PHAN TU KET THUC THI DEN KIEM TRA CHUOI2
	STRB R2, [R1], #1	;LUU GIA TRI R2 VAO KET QUA TA DC 0xR1 - 0X
	B LOOP
ADDCHUOI
	MOV R2, #32; THEM DAU CACH DE NOI CHUOI
	STRB R2, [R1], #1	;LUU NO VAO KQ
	LDR R0, =CHUOI2	;GAN CHUOI2 VAO R0 DE TINH TIEP
	B LOOP2
LOOP2
	LDRB R2, [R0], #1	; LAY GIA TRI CUA DI CHI R0 RA
	STRB R2, [R1], #1	; SAU DO LUU NO VAO R1
	CMP R2, #0	;KIEM TRA DEN 0 THI KET THUC
	BEQ STOP
	B LOOP2
STOP B STOP
	END