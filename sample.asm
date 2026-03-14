/* * ARMv7 Assembly Demo: Leaf vs Non-Leaf Procedures
 * Function: Calculates (a^2 + b^2)
 *
 * Designed for CPulator
 */

.global _start

.text
_start:
    @ -------------------------------------------------------
    @ 1. MAIN PROGRAM SETUP
    @ -------------------------------------------------------
    @ Initialize Stack Pointer (SP) to a high memory address
    LDR SP, =0x1000  
    
    @ Load test values into argument registers
    MOV R0, #3       @ Argument 'a' = 3
    MOV R1, #4       @ Argument 'b' = 4
    
    @ Call the Non-Leaf procedure
    @ BL (Branch with Link) jumps to label and saves next address in LR
    BL SumOfSquares  
    
    @ R0 now contains the result (3^2 + 4^2 = 9 + 16 = 25)
    
_stop:
    B _stop          @ Infinite loop to end program

@ -------------------------------------------------------
@ 2. LEAF PROCEDURE: Square
@ Signature: int Square(int x)
@ Input:  R0 (x)
@ Output: R0 (x * x)
@ -------------------------------------------------------
Square:
    @ A "Leaf" procedure calls no other functions.
    @ We do NOT need to touch the Stack or push LR,
    @ provided we don't overwrite preserved registers.
    
    MUL R0, R0, R0   @ R0 = R0 * R0
    
    BX LR            @ Return to caller using address in Link Register

@ -------------------------------------------------------
@ 3. NON-LEAF PROCEDURE: SumOfSquares
@ Signature: int SumOfSquares(int a, int b)
@ Input:  R0 (a), R1 (b)
@ Output: R0 (a^2 + b^2)
@ -------------------------------------------------------
SumOfSquares:
    @ A "Non-Leaf" procedure calls other functions (Square).
    @ IMPORTANT: Calling another function with 'BL' overwrites LR.
    @ We MUST save the current LR to the stack to return later.
    
    @ We also need to save R4 and R5 (Callee-Saved registers)
    @ because we need safe places to hold 'a' and 'b' while calling Square.
    PUSH {R4, R5, LR} 
    
    @ -- Step 1: Calculate Square(a) --
    MOV R4, R0       @ Copy 'a' to R4 (Safe register)
    MOV R5, R1       @ Copy 'b' to R5 (Safe register)
    
    MOV R0, R4       @ Put 'a' back in R0 as argument
    BL Square        @ Call Leaf procedure
    MOV R4, R0       @ Store result (a^2) safely in R4
    
    @ -- Step 2: Calculate Square(b) --
    MOV R0, R5       @ Move 'b' (saved in R5) to argument R0
    BL Square        @ Call Leaf procedure
    @ R0 now holds b^2
    
    @ -- Step 3: Sum the results --
    ADD R0, R4, R0   @ R0 = R4 (a^2) + R0 (b^2)
    
    @ -- Step 4: Epilogue (Clean up) --
    @ Restore registers and PC (Program Counter)
    @ Popping into PC is functionally the same as popping LR then BX LR
    POP {R4, R5, PC}
