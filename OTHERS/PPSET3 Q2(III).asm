# if (a <= b):
#       a = a + 1
# else:
#       a = a - 1

.data
msg1: .asciiz "Enter value of a: "
msg2: .asciiz "Enter value of b: "
msg3: .asciiz "The value of a is: "

.text
.globl main
.ent main

main:
    # Display message for entering integer 1
    li $v0, 4
    la $a0, msg1
    syscall

    # Read integer 1
    li $v0, 5
    syscall
    move $s0, $v0

    # Display message for entering integer 2
    li $v0, 4
    la $a0, msg2
    syscall

    # Read integer 2
    li $v0, 5
    syscall
    move $s1, $v0

    # Compare integers: if a<=b => a=a+1 else => a=a-1 
    bgt $s0, $s1, else
    addi $s0, $s0, 1
    j end
    else: addi $s0, $s0, -1
    end:

    # print the value of a 
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $s0
    syscall

END:
    jr $ra
    .end main
