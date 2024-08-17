.data

    msg1: .asciiz "FACTORIAL CALCULATOR\nENTER A POSITIVE INTEGER: "  # Prompt for user to enter a positive integer
    msg2: .asciiz "FACTORIAL :"                                       # Message indicating the output is the factorial
    error_msg: .asciiz "ERROR: PLEASE ENTER ANY NUMBER FROM 0 TO 12!\n\n"  # Error message for out of range input

.text
.globl main
.ent main

main:
    li $v0, 4               # Load syscall code for string display into $v0
    la $a0, msg1            # Load address of msg1 into $a0
    syscall                 # Display msg1

    li $v0, 5               # Load syscall code for integer input into $v0
    syscall                 # Get integer input, result in $v0
    move $a1, $v0           # Move the input integer to $a1

    slti $s2, $a1, 0        # Check if input is less than 0, result in $s2
    slti $s3, $a1, 13       # Check if input is less than 13, result in $s3

    xor $s4, $s2, $s3       # Check if input is within the range (0-12), result in $s4
    bne $s4, $0, FACT       # If input is valid, branch to FACT

    # Input is invalid
    li $v0, 4               # Load syscall code for string display into $v0
    la $a0, error_msg       # Load address of error_msg into $a0
    syscall                 # Display error_msg
    j main                  # Jump back to the beginning of main to re-run the program

FACT:
    jal fact                # Jump to the factorial calculation function

    li $v0, 4               # Load syscall code for string display into $v0
    la $a0, msg2            # Load address of msg2 into $a0
    syscall                 # Display msg2

    li $v0, 1               # Load syscall code for integer output into $v0
    move $a0, $v1           # Move the factorial result to $a0
    syscall                 # Display the factorial result

    li $v0, 10              # Load syscall code for program exit into $v0
    syscall                 # Exit the program
    jr $ra                  # Return from main

    .end main 

fact:
    beq $a1, $0, BASECASE   # If n == 0, jump to BASECASE

    addi $sp, $sp, -8       # Make room on stack for 2 registers
    sw $a1, 0($sp)          # Push $a1 onto stack
    sw $ra, 4($sp)          # Push $ra onto stack

    addi $a1, $a1, -1       # n = n - 1
    jal fact                # Recursive call to fact(n-1)

    lw $a1, 0($sp)          # Pop $a1 from stack
    lw $ra, 4($sp)          # Pop $ra from stack
    addi $sp, $sp, 8        # Restore stack pointer

    mult $a1, $v1           # Multiply n with fact(n-1)
    mflo $v1                # Move the result to $v1

    j END                   # Jump to END

BASECASE:
    addi $v1, $0, 1         # If n == 0, factorial is 1

END:
    jr $ra                  # Return from fact
