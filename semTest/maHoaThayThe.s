    AREA RESET, DATA, READONLY
        DCD 0X20001000
        DCD MAIN
XAURO DCB "K Ma dao ", 0
K DCB "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    AREA KETQUA, DATA, READWRITE
KQ DCB 0

    AREA MYCODE, CODE, READONLY
    ENTRY

MAHOA PROC
    CMP R3, #" "
    BEQ DUNGMH
    
    CMP R3, #'Z'
    BLE MH_UP
    
    B MH_LOW
    

MH_UP
    SUB R3, #'A'
    LDRB R3, [R1, R3]
    B DUNGMH
    
MH_LOW
    SUB R3, #'a'
    ADD R3, #26
    LDRB R3, [R1, R3]
    B DUNGMH
    
DUNGMH
    STRB R3, [R2], #1
    BX LR
    ENDP

MAIN

    LDR R0, =XAURO
    LDR R1, =K
    LDR R2, =KQ
    
LOOP
    LDRB R3, [R0], #1
    CMP R3, #0
    BEQ STOP
    
    BL MAHOA
    B LOOP
        
STOP B STOP

    END