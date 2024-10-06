	AREA RESET , DATA ,READONLY
		DCD 0x20001000
		DCD start
MaTran DCD 1,-1,-1
		DCD 2,-2,2
		DCD -3,3,-3
	AREA KQ,DATA ,READWRITE
SoAm DCD 0
SoDuong DCD 0
	AREA mycode ,CODE ,READONLY
	EXPORT start
	ENTRY
start
;============================
pt EQU 9
	MOV R0,#0 ;DUONG
	MOV R1,#0 ;AM
	LDR R3,=MaTran ;lay dia chi
	LDR R4,[R3] ;lay gia tri
	LDR R5,=pt
	
loop	
	CMP R5,#0 ; so sanH R5 vaf 0
	BEQ thoat ;Bang thi ket thuc
	LDR R4,[R3], #4 ; lay gia tri tu dia chi R3 + R2
	CMP R4,#0	; SO SANH R4 VOI 0
	BGT lasoduong ; > THI NHAY SANG SO DUONG
	BLT lasoam	; < THI NHAY SANG AM
	B tiep ; BANG 0 THI DEN B TIEP
	 
lasoduong
	ADD R0,#1 ;CONG R0 LEN 1
	B tiep
lasoam
	ADD R1,#1 ; + R1 LEN 1
	B tiep
tiep
	SUB R5,#1 ; phan tu xoa pt vua tinh
	B loop

thoat


;============================
	END