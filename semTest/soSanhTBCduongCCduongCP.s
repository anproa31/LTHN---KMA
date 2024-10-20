    AREA RESET, DATA, READONLY
        DCD 0X20001000
        DCD MAIN
MATRIX DCD 1,2,3,4
       DCD 4,5,6,7
       DCD 7,8,21,10
       DCD 1,2,3,4
SOHANG DCD 4
SOCOT DCD 4

    AREA MYCODE, CODE, READONLY
    ENTRY
    
MAIN
    LDR R0, =MATRIX
    LDR R1, [R0]
    LDR R2, SOHANG
    LDR R3, SOCOT
    
    CMP R2, R3
    BNE STOP
    
    MOV R4, #4
    
    ADD R3, #1
    MUL R3, R4
    
    MOV R5, #0 ; TBC CHINH
    MOV R6, #0 ; TBC PHU
    
    
LOOPCHINH
    CMP R2, #0
    BEQ TIEP
    
    LDR R1, [R0]
    ADD R0, R3
    
    ADD R5, R1
        
    SUB R2, #1
    B LOOPCHINH

TIEP
    LDR R2, SOHANG
    LDR R3, SOCOT
    
    SUB R3, #1
    MUL R3, R4
    
    LDR R0, =MATRIX
    ADD R0, R3
    
LOOPPHU
    CMP R2, #0
    BEQ TBC
    
    LDR R1, [R0]
    ADD R0, R3
    
    ADD R6, R1
    
    SUB R2, #1
    B LOOPPHU
    
TBC ;; R5 LA TONG PT DCC, R6 LA TONG PT DCP
    LDR R2, SOHANG
    MOV R7, #0
    MOV R8, #0
    
    UDIV R7, R5, R2
    MOV R8, R7 ; R8 LA TBC CHINH
    MUL R7, R2
    SUB R7, R5, R7 ; R7 PHAN DU TBC CHINH
    
    MOV R9, #0
    MOV R10, #0
    
    UDIV R9, R6, R2
    MOV R10, R9 ; R10 LA TBC PHU
    MUL R9, R2
    SUB R9, R6, R9 ; R9 PHAN DU TBC PHU


SOSANH
    CMP R8, R10
    BEQ CHECKDU
    
    CMP R8, R10
    BGT LONHON
    
    CMP R8, R10
    BLT NHOHON
    
CHECKDU
    CMP R7, R9
    BEQ BANGNHAU

    CMP R7, R9
    BGT LONHON
    
    CMP R7, R9
    BLT NHOHON

LONHON
    MOV R0, #1
    B STOP
    
NHOHON
    MOV R0, #0
    B STOP
    
BANGNHAU
    MOV R0, #2
    B STOP
    
STOP B STOP

    END