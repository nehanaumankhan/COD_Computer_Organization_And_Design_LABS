.data

cTemp: .word 24        # Celsius temperature variable initialized to 24
fTemp: .word 0         # Fahrenheit temperature variable initialized to 0
res: .asciiz "CELCIUS TO FAHRENHEIT TEMPERATURE CONVERTER\n\nTemperature in Celsius : 24\nThe Temperature in Fahrenheit is: "

.text
.globl main
.ent main

main:

# Load cTemp into register $s1 for calculation
la $s0, cTemp          # Load address of cTemp into $s0
lw $s1, 0($s0)         # Load contents at address stored in $s0 into $s1 (cTemp = 24)

# Calculate Fahrenheit temperature from Celsius
li $t0, 9              # Load constant 9 into $t0 (for multiplication)
mult $s1, $t0          # Multiply cTemp ($s1) by 9 and store result in $s2
mflo $s2               # Move lower 32 bits of result of multiplication into $s2 (s2 = 24 * 9 = 216)
li $t1, 5              # Load constant 5 into $t1 (for division)
div $s2, $t1           # Divide result in $s2 by 5 and store quotient in $s3
mflo $s3               # Move result of division into $s3 (s3 = 216 / 5 = 43)
addi $s3, $s3, 32      # Add 32 to quotient to convert Celsius to Fahrenheit (s3 = 43 + 32 = 75)

# Prepare conversion message for output
li $v0, 4              # Load syscall code 4 for string output
la $a0, res            # Load address of conversion message into $a0
syscall                # Print conversion message

# Print Fahrenheit temperature
li $v0, 1              # Load syscall code 1 for integer output
move $a0, $s3          # Move Fahrenheit temperature in $s3 to $a0
syscall                # Print Fahrenheit temperature

# Store Fahrenheit temperature in fTemp variable
sw $s3, 4($s0)         # Store Fahrenheit temperature ($s3) at offset 4 from address stored in $s0 (fTemp = s3)

# Return from main
jr $ra                 # Jump back to return address stored in $ra
.end main
