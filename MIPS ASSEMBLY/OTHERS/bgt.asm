.data
msg1: .asciiz "Enter integer 1: "
msg2: .asciiz "Enter integer 2: "
msg3: .asciiz " is greater than "

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

    # Compare integers
    bgt $s0, $s1, second_is_greater

    # If integer 1 is not greater
    li $v0, 1
    move $a0, $s1
    syscall
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $s0
    syscall
    j END

second_is_greater:
    # If integer 2 is greater
    li $v0, 1
    move $a0, $s0
    syscall
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $s1
    syscall

END:
    jr $ra
    .end main
