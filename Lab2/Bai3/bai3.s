
	
	
	
	; Khai bao doan du lieu
	AREA RESET, DATA, READONLY
		DCD  0x20001000     ; stack pointer value when stack is empty
		DCD  Reset_Handler  ; reset vector

	;ALIGN

	
arr DCD 1,2,3,4,5,6

; Khai bao doan ma lenh
	AREA MYCODE, CODE, READONLY
 
	ENTRY ;Khai bao diem vao chuong trinh
	EXPORT Reset_Handler
	  
Reset_Handler

;===================


nums EQU 6
	MOV R0, #0 ; Thanh ghi tong
	LDR R1, =arr ; Lay dia chi dau tien cua arr
	MOV R2, #1 ; Thanh ghi dem
	LDR R3, =nums; Lay gia tri so phan tu
	
sum	
	CMP R2,R3
	BHI avg
	LDR R4,[R1],#4
	ADD R0,R4 ;
	ADD R2,#1
	B sum
	
avg
	UDIV R5, R0, R3 ; So nguyen
	MUL R6, R5, R3 ; R5 * R3 -> R6
	SUB R6, R0, R6 ; So du = R0 - R5 * R3
	
stop B stop
;===================
	END