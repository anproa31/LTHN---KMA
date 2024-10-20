    AREA RESET, DATA, READONLY
        DCD 0X20001000
        DCD MAIN
XAURO DCB "K ma dao", 0
K DCB 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25

    AREA KETQUA, DATA, READWRITE
XAUMA DCB 0

    AREA MYCODE, CODE, READONLY
    ENTRY

MAHOA PROC
    CMP R3, #' '
    BEQ DUNGMH
    
    CMP R3, #'Z'
    BLE MH_UP
    
    B MH_LOW
    
MH_UP
    SUB R3, #'A'
    LDRB R3, [R1, R3]
    ADD R3, #'A'
    B DUNGMH

MH_LOW
    SUB R3, #'a'
    LDRB R3, [R1, R3]
    ADD R3, #'a'
    B DUNGMH
    
DUNGMH
    STRB R3, [R2], #1
    BX LR
    ENDP

MAIN
    LDR R0, =XAURO
    LDR R1, =K
    LDR R2, =XAUMA
    
LOOP
    LDRB R3, [R0], #1
    CMP R3, #0
    BEQ STOP
    
    BL MAHOA
    B LOOP

STOP B STOP

    END