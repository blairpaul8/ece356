.data
array: .word 15 , -3 , 42 , 8 , -17 , 23 , 4 , -9 , 31 , 0
length: .word 10

.text
.global _start
_start:
	
	@ --- Arrays and Memory Part 5 ---
	ldr r0, =array
	ldr r1, =length
	ldr r1, [r1]
	
	mov r2, #1000     @ min
	ldr r3, =-1000    @ max
	mov r4, #0        @ i = 0
	mov r6, #9        @ cheap work around for only iterating up to length - 1
	@ for loop to find min and max
loop:
	cmp r4, r6
	beq exit
	
	ldr r5, [r0, r4, lsl #2] @ array[i]
	
	cmp r5, r2     @ compare min and current array[i]
	movlt r2, r5
	
	cmp r5, r3		@ compare max and current array[i]
	movgt r3, r5
	
	add r4, r4, #1
	b loop
exit: