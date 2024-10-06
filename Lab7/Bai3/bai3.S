;; TINH CHINH HOP CHAP K CUA N
	AREA RESET, DATA, READONLY
		DCD 0X20002000
		DCD MAIN
N EQU 5
K EQU 3
	AREA KETQUA, DATA, READWRITE
KQ DCD 0
	AREA HUU, CODE, READONLY
	ENTRY
MAIN
	LDR R0, =KQ
	LDR R1, =N
	LDR R2, =K
	SUB R3, R1, R2; (N-K)
	MOV R6, R1; TRUYEN N VAO R6 DE TINH N!
	BL GIAITHUA
	MOV R1, R5; DUA N! VAO R1
	MOV R6, R3; TRUYEN (N-K) VAO R6 DE TINH GIAI THUA
	BL GIAITHUA
	MOV R2, R5
	SDIV R3,R1,R2
	B STOP
GIAITHUA PROC
	MOV R4, #1; I. 
	MOV R5, #1; KQ GIAI THUA
LOOP
	MUL R5, R4
	ADD R4, #1
	CMP R4, R6; R6 THAM SO TRUYEN VAO DE TINH GIAI THUA
	BLE LOOP
	BX LR
	ENDP
STOP
	END
;------------------
;; chinh hop
	area reset, data, readonly
		dcd 0x20001000
		dcd main
	area data1, data, readonly
N dcd 5
K dcd 3
	area data2, data, readwrite
result dcd 0
	area huu, code, readonly
	entry
main
	ldr r0, N
	ldr r1, K
	sub r2, r0, r1
	mov r3, #1; i
	mov r4, #1; tich
	bl giaithua; tinh N!
	mov r5, r4; sao chep N!
	mov r0, r2; de tinh (n-k)!
	mov r3, #1; i
	mov r4, #1; tich
	bl giaithua
	sdiv r1, r5, r4; ket qua cuoi cung
	ldr r2, =result
	str r1, [r2];
	b stop
giaithua proc
	mul r4, r3
	add r3, #1
	cmp r3, r0
	ble giaithua; nho hon thi tiep tuc
	bx lr; nhay ve ct9
	endp
stop
	end