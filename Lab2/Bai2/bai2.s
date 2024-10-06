	AREA RESET , DATA ,READONLY
		DCD 0x20001000 ; do dai du lieu la bao nhieu
		DCD start ; 
	ALIGN
; khai bao vung nho 

chuoi DCD 3,2,1,4,5

;khai bao vung ma lenh	
	AREA KQ, DATA ,READWRITE
max DCD 0
min DCD 0
	AREA mycode, CODE ,READONLY
	EXPORT start
	ENTRY
start
;=========================================
pt EQU 5
	LDR R2,=chuoi ;LAY DIA CHI DAU TIEN CUA CHUOI
	LDR R3,=pt ;R3 = 5
	LDR R5,[R2] ;0x00000000 + 0 => R5 = 3
	MOV R0,R5 ;max
	MOV R1,R5 ;min
loop	
	CMP R3,#0
	BEQ stop
	LDR R5,[R2], #4 ;dung de tinh cac gia tri lien tiep trong chuooi
	CMP R5,R0 ;kiem tra xem R5 Co lon hon R0 HAY K 
	BGT PMAX
	CMP R5,R1
	BLT PMIN ;kiem tra xem R5 Co NHO hon R1 HAY K
	SUB R3,#1	; khi nhay se sang phan tu tiep theo chuoi so se giam di 1	
	B loop
	
PMAX
	MOV R0,R5 ; gan R5 cho R0
	SUB R3,#1	; khi nhay se sang phan tu tiep theo chuoi so se giam di 1
	B loop
PMIN
	MOV R1,R5 ; gan R5 cho R1
	SUB R3,#1	; khi nhay se sang phan tu tiep theo chuoi so se giam di 1
	B loop

stop B stop

	
	END	