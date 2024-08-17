.data

    msg1: .asciiz "FACTORIAL CALCULATOR\nENTER A POSITIVE INTEGER: "  # Prompt for user to enter a positive integer
    msg2: .asciiz "FACTORIAL :"                                          # Message indicating the output is the factorial
    error_msg: .asciiz "ERROR: PLEASE ENTER ANY NUMBER FROM 0 TO 12!\n\n"  # Error message for out of range input

.text
.globl main
.ent main

main:

    li $v0, 4               # Load immediate value 4 to $v0 (system call code for string display)
    la $a0, msg1            # Load address of msg1 to $a0 (string to be displayed)
    syscall                 # Perform system call to display msg1

    li $v0, 5               # Load immediate value 5 to $v0 (system call code for integer input)
    syscall                 # Perform system call to get integer input, stored in $v0
    move $s0, $v0           # Move the input integer to $s0

    addi $t0,$s0,0          # Initialize index variable $t0 with the input value
    addi $t1,$0,1           # Initialize factorial variable $t1 with 1

    slti $t2, $s0, 0        # Check if input number is less than 0
    slti $t3, $s0, 13       # Check if input number is less than 13

    xor $t4, $t2, $t3       # Check if the input is within the valid range (0-12)
    bne $t4, $0, fact       # Branch to LOOP if the input is within the valid range, else display error message

    li $v0, 4               # Load immediate value 4 to $v0 (system call code for string display)
    la $a0, error_msg       # Load address of error_msg to $a0 (error message)
    syscall                 # Perform system call to display error_msg
    j main                  # Jump back to the beginning of main to re-run the program
fact:  
        
        beq $t0,$0, EXIT    # Branch to EXIT if $t0 (index) is 0
        mult $t1,$t0        # Multiply $t1 (factorial) by $t0 (index)
        mflo $t1            # Move the result of multiplication to $t1 (factorial)
        addi $t0,$t0,-1     # Decrement $t0 (index) by 1
        jal fact              # Jump back to the beginning of LOOP

    EXIT:
        li $v0, 4           # Load immediate value 4 to $v0 (system call code for string display)
        la $a0, msg2        # Load address of msg2 to $a0 (message indicating the output is the factorial)
        syscall             # Perform system call to display msg2

        li $v0, 1           # Load immediate value 1 to $v0 (system call code for integer output)
        move $a0, $t1       # Move the result (factorial) to $a0 (output register)
        syscall             # Perform system call to display the result (factorial)

    jr $ra                  # Jump back to the return address
    .end main    