.data
    	var1: .word 6
    	var2: .half -24
	var3: .byte -128
	var4: .asciiz "CIS Department"
	var5: .asciiz "Welcome To Computer Organization & Design Course"
	pi: .float 3.14159
.text
.globl main
.ent main

main:
    	# Print the value of var1
    	la $t0, var1        # Load the address of var1 into $t0
    	lw $a0, 0($t0)      # Load the value of var1 into $a0
    	li $v0, 1           # Set $v0 to 1 to indicate print integer
    	syscall             # Perform the system call to print the integer

    	# Print the value of var2
    	la $t0, var2        # Load the address of var2 into $t0
    	lh $a0, 0($t0)      # Load the value of var2 into $a0 (use lh for half-word)
    	li $v0, 1           # Set $v0 to 1 to indicate print integer
    	syscall             # Perform the system call to print the integer
	
	# Print the value of var3
    	la $t0, var3        # Load the address of var3 into $t0
    	lb $a0, 0($t0)      # Load the value of var3 into $a0 (use lb for 1 byte)
    	li $v0, 1           # Set $v0 to 1 to indicate print integer
    	syscall             # Perform the system call to print the integer

	# Print the value of var4
    	la $t0, var4        # Load the address of var4 into $t0
    	la $a0, var4	    # Load the adress of var4 into $a0 
    	li $v0, 4           # Set $v0 to 4 to indicate print string
    	syscall             # Perform the system call to print the integer

	# Print the value of var5
    	la $t0, var5        # Load the address of var3 into $t0
    	la $a0, var5	    # Load the value of var3 into $a0 
    	li $v0, 4           # Set $v0 to 4 to indicate print string
    	syscall             # Perform the system call to print the integer
	
    	# Exit the program
    	li $v0, 10          # Set $v0 to 10 to indicate program exit
    	syscall             # Perform the system call to exit the program

.end main

	
	
	
	
	#TRUE = 1