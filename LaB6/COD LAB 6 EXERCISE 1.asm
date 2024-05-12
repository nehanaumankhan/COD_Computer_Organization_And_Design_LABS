.data

    msg1: .asciiz "THIS PROGRAM PRINTS THE SUM OF N INTEGERS\n\nENTER THE VALUE OF N: "
    msg2: .asciiz "SUM TILL N (1+2+3+...+n) = "
    error_msg: .asciiz "\nERROR: PLEASE ENTER A POSITIVE INTEGER!\n\n"

.text
.globl main
.ent main

main:

    li $v0, 4                   # preparing for string display
    la $a0, msg1
    syscall                     # msg1 will be displayed on console

    li $v0, 5                   # preparing for integer input
    syscall                     # integer n was put in $v0
    move $s0, $v0               # integer n is moved to $s0

    slti $t0, $s0, 0			# $t0 = ($s0 < 0) ? 1 : 0
    bne $t0, $0, ERROR

    addi $t0, $0, 1             # index variable of the loop -> t0 = 1
    addi $t1, $0, 0             # t1 stores the result of addition in each iteration
    addi $s0, $s0, 1
    LOOP:
        beq $t0, $s0, EXIT      # When t0 == n -> the loop will terminate
        add $t1, $t1, $t0 
        addi $t0, $t0, 1
        j LOOP
    EXIT:
        li $v0, 4                   # preparing for string display
        la $a0, msg2
        syscall                     # msg1 will be displayed on console

        li $v0, 1           # preparing for integer output
        move $a0, $t1       # result is moved to $a0
        syscall             # result is displayed on console
        j END
    ERROR:
        li $v0, 4                   # preparing for string display
        la $a0, error_msg
        syscall                     # msg1 will be displayed on console
        j main
    END:
        jr $ra
        .end main
