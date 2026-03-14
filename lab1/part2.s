.global _start
_start:
	
	ldr r0, =0xABCD1234
	
	@ using r1 to hold the count
	mov r1, #0

loop:
	cmp r0, #0
	beq cont
	
	@ and the lsb of input and 1
	and r3, r0, #1
	
	@ add result of AND to the count
	add r1, r1, r3
	
	@ left shift the bits down 1
	lsr r0, r0, #1
	b loop

cont:
	
	b cont