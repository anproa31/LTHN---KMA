	AREA RESET, DATA, READONLY
		DCD 0X20001000
		DCD MAIN
		
	AREA MYCODE, CODE, READONLY
	ENTRY


GIAITHUA PROC
	MOV R12, #1 ; LUU KQ GIAI THUA TAM THOI

LOOPGT	
	CMP R3, #1
	BEQ ENDGIAITHUA

	MUL R12, R3
	
	SUB R3, #1
	B LOOPGT

ENDGIAITHUA
	MOV R3, R12
	MOV R12, #0
	
	BX LR
	
ENDP


MAIN

N EQU 5
K EQU 2

	MOV R0, #1
	MOV R1, #N
	MOV R2, #K
	
	CMP R1, R2
	BEQ STOP
	

CACH1 ;; N!/(N-K)!

	MOV R3, #N
	BL GIAITHUA
	MOV R4, R3
	
	SUB R3, R1, R2
	BL GIAITHUA
	
	UDIV R0, R4, R3

CACH2 ;; (N - (K-1)) * (N - (K - 2)) * ... * (N - 1) * N || K-1 ---> 0
	MOV R5, #1
	
	MOV R3, #K
	SUB R3, #1 ;; K-1
	
LOOP
	CMP R3, #0
	BLT STOP
	
	MOV R4, #N
	SUB R4, R3 ;; N - (K - 1)
	MUL R5, R4 ;; KQ = KQ * (N - (K - 1))

	SUB R3, #1

	B LOOP

STOP B STOP


	END