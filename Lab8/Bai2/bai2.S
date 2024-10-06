;; ma hoa dichj vong
	area reset,data,readonly
		dcd 0x20002000
		dcd main
chuoi dcb "AHIEN MENH",0
	area data2,data,readonly
subtitution dcb "QWERTYUIOPASDFGHJKLZXCVBNM",0
	area data1, data, readwrite
result dcb 0
	area huu, code, readonly
	entry
main
	ldr r0, =subtitution
	ldr r1, =chuoi
	ldr r2, =result
loop
	ldrb r3, [r1], #1; doc du lieu
	cmp r3, #0
	beq stop
	cmp r3, #32
	mov r4, r3
	beq tiep_tuc
	sub r3, #65; de biet thu tu cua ki tu trong bang chu cai
	ldrb r4, [r0, r3]
tiep_tuc	
	strb r4, [r2], #1
	b loop
stop
	end