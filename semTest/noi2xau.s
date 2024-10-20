    AREA RESET, DATA, READONLY
        DCD 0X20001000
        DCD MAIN
XAU1 DCB "Toi", 0
XAU2 DCB " yeu KMA", 0

    AREA KETQUA, DATA, READWRITE
KQ DCB 0    

    AREA MYCODE, CODE, READONLY
    ENTRY

MAIN
    LDR R0, =XAU1
    LDR R1, [R0]
    LDR R2, =XAU2
    LDR R3, [R2]
    
    LDR R4, =KQ
    
LOOP1
    LDRB R1, [R0], #1
    
    CMP R1, #0
    BEQ LOOP2
    
    STRB R1, [R4], #1
    
    B LOOP1
    
LOOP2
    LDRB R3, [R2], #1
    
    CMP R3, #0
    BEQ STOP

    STRB R3, [R4], #1
    
    B LOOP2

STOP B STOP
    
    END