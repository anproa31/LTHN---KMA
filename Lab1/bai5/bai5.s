	AREA RESET, DATA, READONLY
		DCD 0X20001000
		DCD MAIN
X DCD 5
N DCD 2
	AREA A, CODE, READONLY
	ENTRY
MAIN
	MOV R0, #1    ; Khoi tao bien dem
	LDR R1, X     
	LDR R2, N     
	MOV R3, #1    ;tong x mu n

LOOP
	MUL R3, R1
	ADD R0, #1
	CMP R0, R2
	BHI STOP
	B LOOP
	

STOP
END

;CTC PROC 
;LOOP
;	MUL R3, R1    
;	ADD R0, R0, #1  ; Tang bien dem lên 1
;	CMP R0, R2
;	BLE LOOP       ; Neu bien dem <= n thì quay lai vòng lap
;	BX LR          
;	ENDP
;	END