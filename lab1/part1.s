.global _start
_start:
	
	MOV R0, #25
	MOV R1, #17
	
	ADD R2, R0, R1
	SUB R3, R0, R1
	
_stop:
	B _stop
