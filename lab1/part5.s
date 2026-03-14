.global _start
_start:
	@-- Start with factorial(5)
	mov r0, #5
	
	@-- Call factorial function
	bl fact
	
end:
	b end

fact:
	@-- Store r4 and link register on the stack
	push {r4, lr}
	mov r4, r0
	cmp r4, #1
	ble base
	
	@-- n - 1 
	sub r0, r0, #1

	@-- recursive call to factorial function
	bl fact

	@-- multiply n * result of factorial(n - 1)
	mul r0, r4, r0
	
	@-- restore values stored on the stack
	pop {r4, pc}
	bx lr
	

base:
	@-- base case of the recursive function return 1
	pop {r4, pc}
	mov r0, #1
	bx lr
