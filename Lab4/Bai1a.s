	AREA RESET,DATA,READONLY
		DCD 0x20000000
		DCD MAIN
SUM_BAI1A DCD 0
N_BAI1B DCD 15
M_BAI1B DCD 25
KQ_BAI1B DCD 0
MAX_BAI1C DCD 0
MIN_BAI1C DCD 0
TBC_BAI1D DCD 0
SUM_BAI1E DCD 0
SO_PHAN_TU_DUONG_BAI1F DCD 0
SO_PHAN_TU_AM_BAI1F DCD 0
max_in_main DCD 0
min_in_main DCD 0
max_in_sub DCD 0
min_in_sub DCD 0
SO_PHAN_TU_LE_BAI1H DCD 0
SO_PHAN_TU_CHAN_BAI1H DCD 0
SUM_BAI1I DCD 0
KQ_BAI1J DCD 0
AA 	DCD 1,2,3,4,5
	DCD 5,6,7,8,9
A DCD 6,2,4,3,5
M DCD 2
N DCD 5
A1 	DCD 1,2,3
	DCD 2,3,4
	DCD 4,5,6
	AREA MYCODE,CODE,READONLY
		ENTRY
;Bai1a
Bai1a PROC
	MOV R0,#0
	LDR R1,N
	LDR R3,=A
Loop1a
	LDR R2,[R3],#4
	ADD R0,R2
	SUB R1,#1
	CMP R1,#0
	BGT Loop1a
	LDR R4,=SUM_BAI1A
	STR R0,[R4]
	BX LR
	ENDP
;Bai1b
Bai1b PROC
	LDR R0,N_BAI1B
	LDR R1,M_BAI1B
	MOV R2,#0
Loop1b
	CMP R0,R1
	BGT Great
	BLT Less
	BEQ Final
Great 
	SUB R0,R1
	B Loop1b
Less
	SUB R1,R0
	B Loop1b
Final
	LDR R3,=KQ_BAI1B
	STR R0,[R3]
	BX LR
	ENDP
;Bai1c
Bai1c PROC
	LDR R0,A;Gia tri nho nhat 
	LDR R1,A;Gia tri lon nhat
	LDR R2,=A
	MOV R4,#5
TimMin
	LDR R3,[R2],#4
	SUB R4,#1
	CMP R3,R0
	BLE GanMin
	CMP R4,#0
	BGT TimMin
	MOV R4,#5
	LDR R2,=A
	B TimMax
GanMin
	MOV R0,R3
	B TimMin
TimMax
	LDR R3,[R2],#4
	SUB R4,#1
	CMP R3,R1
	BGE GanMax
	CMP R4,#0
	BGT TimMax
	B Xong
GanMax
	MOV R1,R3
	B TimMax
Xong
	LDR R5,=MAX_BAI1C
	STR R1,[R5]
	LDR R5,=MIN_BAI1C
	STR R0,[R5]
	BX LR
	ENDP
;Bai1d
Bai1d PROC
	MOV R0,#0
	LDR R1,=A
	LDR R2,N
LoopBai1d
	CMP R2,#0
	BLE TinhTBC
	LDR R3,[R1],#4
	ADD R0,R3
	SUB R2,#1
	B LoopBai1d
TinhTBC
	LDR R2,N
	SDIV R0,R2
	LDR R4,=TBC_BAI1D
	STR R0,[R4]
	BX LR
	ENDP
;Bai1e
Bai1e PROC
	MOV R0,#0
	LDR R1,=AA
	LDR R2,M
DuyetHang
	CMP R2,#0
	BLE Done
	LDR R3,N
DuyetCot
	CMP R3,#0
	BLE DuyetHangTiep
	LDR R4,[R1],#4
	ADD R0,R4
	SUB R3,#1
	B DuyetCot
DuyetHangTiep
	SUB R2,#1
	B DuyetHang
Done
	LDR R5,=SUM_BAI1E
	STR R0,[R5]
	BX LR
	ENDP
;Bai1f
Bai1f PROC
	MOV R0,#0
	MOV R1,#0
	LDR R2,=AA
	LDR R3,M
DuyetHang1f
	CMP R3,#0
	BLE Done1f
	LDR R4,N
DuyetCot1f
	CMP R4,#0
	BLE DuyetHang1fTiep
	LDR R5,[R2],#4
	CMP R5,#0
	BLT SoAm1f
	BGT SoDuong1f
	SUB R4,#1
	B DuyetCot1f
DuyetHang1fTiep
	SUB R3,#1
	B DuyetHang1f
SoAm1f
	ADD R0,#1
	SUB R4,#1
	B DuyetCot1f
SoDuong1f
	ADD R1,#1
	SUB R4,#1
	B DuyetCot1f
Done1f
	LDR R6,=SO_PHAN_TU_DUONG_BAI1F
	STR R1,[R6]
	LDR R6,=SO_PHAN_TU_AM_BAI1F
	STR R0,[R6]
	BX LR
	ENDP
;Bai1g
Bai1g PROC
N1 EQU 3
	MOV R2,#N1
	LDR R3,=A ;Luu dia chi cua ma tran	
	LDR R0,[R3] ;Luu gia tri nho nhat
	LDR R1,[R3] ;Luu gia tri lon nhat
	MOV R4,#0 ;Lap qua cac hang
	MOV R5,#0 ;Lap qua cac cot
;DCC
DuyetHangDCC
	CMP R4,R2
	BGE HoanThanhDCC
	MOV R5,#0
DuyetCotDCC
	CMP R5,R2
	BGE DuyetHangAdd
	LDR R7,[R3],#4
	CMP R4,R5
	BEQ NamTrenDCC
	ADD R5,#1	
	B DuyetCotDCC
NamTrenDCC
	CMP R0,R7
	BGT LuuGTNNDCC
	CMP R1,R7
	BLT LuuGTLNDCC
	ADD R5,#1
	B DuyetCotDCC
LuuGTNNDCC
	MOV R0,R7
	CMP R1,R7
	BLT LuuGTLNDCC
	ADD R5,#1
	B DuyetCotDCC
LuuGTLNDCC
	MOV R1,R7
	ADD R5,#1
	B DuyetCotDCC
DuyetHangAdd
	ADD R4,#1
	B DuyetHangDCC
HoanThanhDCC
	LDR R8,=max_in_main
	STR R0,[R8]
	LDR R8,=min_in_main
	STR R1,[R8]
;DCP
DCP
	LDR R3, =A         
	MOV R10, #N1      
	SUB R10,#1
	MOV R11, #4         
	MUL R10, R10, R11  
	ADD R3, R3, R10     
	MOV R4,#0
	LDR R0,[R3] ;Luu gia tri nho nhat
	LDR R1,[R3] ;Luu gia tri lon nhat
	LDR R3,=A ;Luu dia chi cua ma tran	
	MOV R9,#N1
DuyetHangDCP
	CMP R4,R2
	BGE HoanThanhDCP
	MOV R5,#0
	SUB R9,#1
DuyetCotDCP
	CMP R5,R2
	BGE DuyetHangAddDCP
	LDR R7,[R3],#4
	CMP R9,R5
	BEQ NamTrenDCP
	ADD R5,#1
	B DuyetCotDCP
NamTrenDCP
	CMP R0,R7
	BGT LuuGTNNDCP
	CMP R1,R7
	BLT LuuGTLNDCP
	ADD R5,#1
	B DuyetCotDCP
LuuGTNNDCP
	MOV R0,R7
	CMP R1,R7
	BLT LuuGTLNDCP
	ADD R5,#1
	B DuyetCotDCP
LuuGTLNDCP
	MOV R1,R7
	ADD R5,#1
	B DuyetCotDCP
DuyetHangAddDCP
	ADD R4,#1
	B DuyetHangDCP
HoanThanhDCP
	LDR R8,=max_in_sub
	STR R0,[R8]
	LDR R8,=min_in_sub
	STR R1,[R8]
	BX LR
	ENDP
;Bai1h
Bai1h PROC
	MOV R0,#0
	MOV R1,#0
	LDR R2,=AA
	LDR R3,M
DuyetHang1h
	CMP R3,#0
	BLE Done1h
	LDR R4,N
DuyetCot1h
	CMP R4,#0
	BLE DuyetHang1hTiep
	LDR R5,[R2],#4
	MOV R6,R5
	CMP R6,#0
	BLT SoAm1h
	BGT SoDuong1h
	SUB R4,#1
	B DuyetCot1h
DuyetHang1hTiep
	SUB R3,#1
	B DuyetHang1h
SoAm1h
	CMP R6,#-2
	BLT CheckSoAm
	BGT SoAmLe
	ADD R0,#1
	SUB R4,#1
	B DuyetCot1h
CheckSoAm
	ADD R6,#2
	B SoAm1h
SoAmLe
	ADD R1,#1
	SUB R4,#1
	B DuyetCot1h
SoDuong1h
	CMP R6,#2
	BGT CheckSoDuong
	BLT SoDuongLe
	ADD R0,#1
	SUB R4,#1
	B DuyetCot1h
CheckSoDuong
	SUB R6,#2
	B SoDuong1h
SoDuongLe
	ADD R1,#1
	SUB R4,#1
	B DuyetCot1h
Done1h
	LDR R6,=SO_PHAN_TU_LE_BAI1H
	STR R1,[R6]
	LDR R6,=SO_PHAN_TU_CHAN_BAI1H
	STR R0,[R6]
	BX LR
	ENDP	
;Bai1i
Bai1i PROC
	MOV R0,#0
	LDR R1,=AA
	LDR R2,M
DuyetHang1i
	CMP R2,#0
	BLE Done1i
	LDR R3,N
DuyetCot1i
	CMP R3,#0
	BLE DuyetHangTiep1i
	LDR R4,[R1],#4
	CMP R4,#5
	BGT CheckChiaHetCho5
	BEQ ChiaHetCho5
	SUB R3,#1
	B DuyetCot1i
CheckChiaHetCho5
	CMP R4,#5
	BEQ ChiaHetCho5
	BLT DuyetCot1i
	SUB R4,#5
	B CheckChiaHetCho5
ChiaHetCho5
	ADD R0,R5
	B DuyetCot1i
DuyetHangTiep1i
	SUB R2,#1
	B DuyetHang1i
Done1i
	LDR R5,=SUM_BAI1E
	STR R0,[R5]
	BX LR
	ENDP
;Bai1j
Bai1j PROC
	MOV R0,#0;UCLN
	LDR R1,=A
	MOV R2,#0;UCHT
	LDR R3,N
	SUB R3,#1
Loop1j
	CMP R3,#0
	BLE Done1j
	LDR R4,[R1],#4
	LDR R5,[R1],#4
	B KiemTraUCLN
Loop1jlan2
	CMP R3,#0
	BLE Done1j
	MOV R4,R0
	LDR R5,[R1],#4
KiemTraUCLN
	CMP R4,R5
	BGT Great1j
	BLT Less1j
	BEQ Final1j
Great1j
	SUB R4,R5
	B KiemTraUCLN
Less1j
	SUB R5,R4
	B KiemTraUCLN
Final1j
	SUB R3,#1
	CMP R4,R0
	BGT GanLaiUCLNChuoi
	B Loop1jlan2
GanLaiUCLNChuoi
	MOV R0,R4
	B Loop1jlan2
Done1j
	LDR R7,=KQ_BAI1J
	STR R0,[R7]
	BX LR
	ENDP
MAIN PROC
	BL Bai1a
	BL Bai1b
	BL Bai1c
	BL Bai1d
	BL Bai1e
	BL Bai1f
	BL Bai1g
	BL Bai1h
	BL Bai1i
	BL Bai1j
STOP 
	B STOP
	END
	