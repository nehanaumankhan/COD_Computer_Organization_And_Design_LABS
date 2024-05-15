.data
    msg1: .asciiz "THIS PROGRAM PRINTS THE SUM OF N INTEGERS\nENTER THE VALUE OF N: "  # Prompt for user to enter the value of N
    msg2: .asciiz "SUM TILL N (1+2+3+...+n) = "  # Message for displaying the sum till N
    error_msg: .asciiz "ERROR: PLEASE ENTER A POSITIVE INTEGER!\n\n"  # Error message for negative integer input

.text
.globl main
.ent main

main:
    # Display prompt to enter the value of N
    li $v0, 4                   
    la $a0, msg1               
    syscall                     

    # Get integer input for N
    li $v0, 5                  
    syscall                     
    move $s0, $v0               

    # Check if N is negative
    slti $t0, $s0, 0			
    bne $t0, $0, ERROR

    # Initialize loop variables
    addi $t0, $0, 1             # Index variable for the loop (t0 = 1)
    addi $t1, $0, 0             # Variable to store the sum of integers (t1)

    # Increment N by 1 for the loop termination condition
    addi $s0, $s0, 1           

    # Loop to calculate the sum of integers from 1 to N
    LOOP:
        beq $t0, $s0, EXIT      # Exit the loop when t0 == N
        add $t1, $t1, $t0       # Add t0 to the sum
        addi $t0, $t0, 1        # Increment t0 by 1 for the next iteration
        j LOOP                  # Jump back to LOOP

    # Display the sum of integers
    EXIT:
        li $v0, 4               
        la $a0, msg2            
        syscall                 

        li $v0, 1               
        move $a0, $t1           
        syscall                 
        j END

    # Display error message for negative input
    ERROR:
        li $v0, 4               
        la $a0, error_msg      
        syscall                 
        j main                  

    # End of the program
    END:
        jr $ra                  
        .end main
