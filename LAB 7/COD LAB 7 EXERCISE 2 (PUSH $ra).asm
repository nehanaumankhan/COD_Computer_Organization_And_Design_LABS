.data
    msg1: .asciiz "THIS PROGRAM CALCULATES (NUMBER ^ POWER)\nENTER NUMBER: "
    msg2: .asciiz "ENTER POWER: "
    msg3: .asciiz "RESULT: "

.text
.globl main
.ent main

main:   li $v0, 4           # Print msg1
        la $a0, msg1
        syscall

        li $v0, 5           # Read NUMBER
        syscall
        move $a1, $v0       # NUMBER is moved in $a1

        li $v0, 4           # Print msg2
        la $a0, msg2
        syscall

        li $v0, 5           # Read POWER
        syscall
        move $a2, $v0       # POWER is moved in $a2

        # We haven't used any temporary registers in main -> We do not have to push any register before function call
        
        addi $sp, $sp, -4    # Push $ra
        sw $ra, 0($sp)

        jal power_calculator    # Fucntion Call

        lw $ra, 0($sp)      # Pop $ra
        addi $sp, $sp, 4

        li $v0, 4           # Print msg3
        la $a0, msg3
        syscall

        li $v0, 1          # Print Result
        move $a0, $v1
        syscall

        li $v0, 10  # For explicit exit from main
        syscall

        power_calculator:   addi $sp, $sp, -8   # Making room for 4 registers
                            sw $s0, 4($sp)      # Push $s0
                            sw $s1, 0($sp)      # Push $s1

                            addi $s0, $0, 1             # $s0 (Result) = 1
                            addi $s1, $s1, 0            # $s1 (Iterator) = 0
                            LOOP:   mult $s0, $a1       # $s0 * $a1
                                    mflo $s0            # $s0 = $s0 * $a1
                                    addi $s1, $s1, 1    # $s1 += 1
                                    bne $s1, $a2, LOOP  # If $s1 != $a2 -> Jump To Loop

                            move $v1, $s0       # Move $s0 in $v0

                            lw $s1, 0($sp)      # Pop $s1
                            lw $s0, 4($sp)      # Pop $s0
                            addi $sp, $sp, 8    # Adust SP        
                            jr $ra              # Return back
                            
        jr $ra
        .end main