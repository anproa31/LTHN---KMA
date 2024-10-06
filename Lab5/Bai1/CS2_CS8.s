	AREA MYCODE1,CODE,READONLY
H2_H8 PROC
	LDRB R0,SPT28 ;spt cua chuoi bit
	LDR R1,=CoSo2_CS8 ; Dia chi dau tien cua chuoi bit
	LDR R2,=Coso28	;dia chi de luu gia tri
	ADD R2,R0
	;ADD R1,#8
LOOP6
	CMP R0, #0
	BEQ EXIT5
	MOV R5,#0 ;KET QUA
	MOV R6,#4
	LDRB R3,[R1],#1 ;R3 = R1 TANG DIA CHI R1 LEN 1
	MUL R3,R6 ; R4 = R3 X 2^2
	ADD R5,R3
	LDRB R3,[R1],#1
	MOV R6,#2
	MUL R3,R6
	ADD	R5,R3
	LDRB R3,[R1],#1
	ADD R5,R3
	STRB R5,[R2],#1
	SUB R0,#1
	B LOOP6	
EXIT5
	B THOAT
	BX LR
	ENDP
;================================================================================================
H8_H16 PROC
	;LDRB R0, SPT816 ; R0 = 4
	;SUB R0, #1 ; R0 = R0 -1
	;LDR R1, =DULIEU816 ;DIA CHI DT CUA DULIEU
	;LDR R2, =KQ816 ;DIA CHI CUA RESULT
	;ADD R2,#10 ;add 10 dia chi o nho
	;MOV R3, #8	;dung de chia
	;MOV R4, #0; KQ O HE 10
;LOOP1
	;CMP R0, #0 ;kiem tra
	;BEQ TG	; lay phan tu cuoi cùng
	;LDRB R5, [R1], #1
	;MOV R6, #1; I
;NHAN
	;MUL R5, R3
	;ADD R6, #1
	;CMP R6, R0
	;BLE NHAN
	;ADD R4, R5
	;SUB R0, #1
	;B LOOP1
;TG; LAY PHAN TU CUOI CUNG RA
	;LDRB R5, [R1]
	;ADD R4, R5
	;STR R4, [R2]
	;LDR R3, =RESULT2
	;MOV R4, 0XF; MASK
;LOOP2;
	;LDRB R5, [R2], #1
	;CMP R5, #0
	;BEQ STOP
	;MOV R6, R5, LSR #0X4
	;MOV R6, R6, LSL #0X8
	;AND R5, R5, R4
	;ADD R6, R5
	;STRH R6, [R3], #2
	;B LOOP2
;STOP
	
	BX LR
	ENDP
;================================================================================================
	END