# Part 4

## 1.)

   ```
.global _start
_start:
 @-- Load values into argument registers
 mov r0, #7
 mov r1, #6
 
 @-- Call multiply procedure 
  @-- This uses bl to branch and link to the label mul that 
  @-- will then run the procedure to multiply r0 and r1 together
 bl mul
exit:
 b exit
 
mul:
 @-- store values on the stack
 push {lr, r4, r5}
 mov r5, #1
 mov r4, r0
 
 @-- add value of r0 r1 number of times
while:
 cmp r5, r1
 beq done
 add r0, r0, r4
 add r5, r5, #1
 
 b while
done:
 @--restore values saved on the stack
 pop {pc, r4, r5}
  bx lr

    ```

