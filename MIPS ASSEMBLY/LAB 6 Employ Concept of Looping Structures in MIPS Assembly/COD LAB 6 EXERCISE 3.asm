.data
    msg1: .asciiz "PRIME NUMBER CHECKER\nENTER A POSITIVE INTEGER: "  # Prompt for user to enter a positive integer
    msg2: .asciiz "THE NUMBER IS PRIME"
    msg3: .asciiz "THE NUMBER IS COMPOSITE"
    error_1: .asciiz "ERROR: 1 IS NEITHER PRIME NOR COMPOSITE!\n\n"    # Error message for input 1
    error_2: .asciiz "ERROR: PLEASE ENTER A NUMBER GREATER THAN 0!\n\n"  # Error message for out-of-range input

.text
.globl main
.ent main

main:
    # Prompt the user to enter a positive integer
    li $v0, 4           
    la $a0, msg1        
    syscall             

    # Get integer input from the user
    li $v0, 5           
    syscall             
    move $s0, $v0       

    # Check if the input is 1 and display appropriate error message
    addi $t0, $0, 1          # Load immediate value 1 to $t0
    beq $s0, $t0, ERROR_1    # Branch if input is 1
    slti $t0, $s0, 1         # Check if input is less than 1
    bne $t0, $0, ERROR_2     # Branch if input is less than 1

    # Initialize variables for prime checking
    addi $s1, $0, 2     # Initialize index variable to 2
    addi $s2, $0, 0     # Initialize factor count to 0
    add $s4, $s0, $0    # Initialize loop terminator with the input number

    # Loop to check factors
    LOOP:
        div $s0, $s1                                # input num / index
        mfhi $s3                                    # remainder is moved in $s3
        beq $s3, $0, INCREMENT_FACTOR_COUNT         # if remainder = 0 -> factor count += 1
        j INCREMENT_INDEX_VARIABLE                  # else go to INCREMENT_INDEX_VARIABLE without incrementing factor count
        INCREMENT_FACTOR_COUNT: addi $s2, $s2, 1
        INCREMENT_INDEX_VARIABLE: addi $s1, $s1, 1
        beq $s1, $s4, EXIT                          # if index = loop terminator -> The number is Prime
        j LOOP
    
    EXIT: 
        beq $s2, $0, PRIME   # If factor count is 0, the number is prime
    
    # If factor count is not 0, the number is composite
    COMPOSITE:
        li $v0, 4               
        la $a0, msg3            
        syscall                 
        j END
    
    # Display error message for input 1
    ERROR_1:
        li $v0, 4               
        la $a0, error_1        
        syscall                 
        j main

    # Display error message for input less than 1
    ERROR_2:
        li $v0, 4               
        la $a0, error_2        
        syscall                 
        j main

    # Display message for prime number
    PRIME:
        li $v0, 4               
        la $a0, msg2            
        syscall                 
    
    # End of the program
    END: 
        jr $ra                  
        .end main
