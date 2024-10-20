    AREA RESET, DATA, READONLY
        DCD 0X20001000
        DCD MAIN
XAURO DCB "Sinh Vien KMA", 0
K DCB 3

    AREA KETQUA, DATA, READWRITE
XAUMA DCB 0

    AREA MYCODE, CODE, READONLY
    ENTRY
    
MAHOA PROC
    CMP R5, #' '
    BEQ DUNGMH
    
    ADD R5, R1
    
    CMP R5, #'Z'
    BLE DUNGMH
    
    CMP R5, #'a'
    BLE MH_UP
    
    CMP R5, #'z'
    BLE DUNGMH
    
    B MH_LOW

MH_UP
    SUB R5, #'Z'
    ADD R5, #'A'
    B DUNGMH

MH_LOW
    SUB R5, #'z'
    ADD R5, #'a'
    B DUNGMH

DUNGMH
    STRB R5, [R2], #1
    BX LR
ENDP
    
MAIN
    LDR R0, =XAURO
    LDRB R1, K
    LDR R2, =XAUMA
    
    MOV R3, #26
    UDIV R4, R1, R3 
    MUL R4, R3
    SUB R1, R4

LOOP
    LDRB R5, [R0], #1
    CMP R5, #0
    BEQ STOP
    
    BL MAHOA
    B LOOP
    
STOP B STOP

    END