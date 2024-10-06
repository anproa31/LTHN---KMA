; Khai báo vùng du lieu
	AREA RESET, DATA, readonly
		DCD 0x20001000 ;khoi tao gia tri con tro ngan xep (SP - R13)
		DCD main
		
		
; khai báo du lieu			
	

; khai bao vung ma lenh
	AREA mycode, CODE, READONLY
	ENTRY
	
main
;=============
N EQU 5
	
	MOV R1,#0 ;Gan R1=0
	LDR R2,=N 
	
TinhTong	
	ADD R1,R2 ;R1 =R1+R2
	SUBS R2,#1 ;R2 = R2 - 1
	CMP R2,#0 ;So sanh R2 voi 0
	BGT TinhTong
stop
	B stop
	
	END