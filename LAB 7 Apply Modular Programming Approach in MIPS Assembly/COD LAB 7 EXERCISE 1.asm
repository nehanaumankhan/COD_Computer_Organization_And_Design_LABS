.data
    NUM1: .asciiz "THIS PROGRAM PRINTS THE AVERAGE OF THREE NUMBERS📝\nENTER FIRST NUMBER: "
    NUM2: .asciiz "ENTER SECOND NUMBER: "
    NUM3: .asciiz "ENTER THIRD NUMBER: "
    RESULT: .asciiz "THE AVERAGE OF THE THREE NUMBERS IS: "
.text
.globl main
.ent main
main:   
#_____________________________CALLER_BEGINS_____________________________#
    li $v0, 4       # Print NUM1
    la $a0, NUM1
    syscall

    li $v0, 5       # Read NUM1
    syscall
    move $a1, $v0   # num1 is moved to $a1(Argument Register)

    li $v0, 4       # Print NUM2
    la $a0, NUM2
    syscall

    li $v0, 5       # Read NUM2
    syscall
    move $a2, $v0   # num2 is moved to $a2(Argument Register)

    li $v0, 4       # Print NUM3
    la $a0, NUM3
    syscall

    li $v0, 5       # Read NUM3
    syscall
    move $a3, $v0   # num3 is moved to $a3(Argument Register)

    jal AVERAGE

    li $v0, 4       # Print RESULT
    la $a0, RESULT
    syscall

    li $v0, 1       # Print Result
    move $a0, $v1   # The result is moved from $v1(Return Value Register) to $a0
    syscall

    li $v0, 10      # For explicit exit from main
    syscall
    jr $ra

.end main
#_____________________________CALLER_ENDS_______________________________#

#_____________________________CALLEE_BEGINS_____________________________#
AVERAGE:
    add $t0, $a1, $a2       # $t0 = num1 + num2
    add $t0, $t0, $a3       # $t0 = num1 + num2 + num3
    
    slti $t2, $t0, 0        # If $t0 < 0 => add -1 else add +1
    bne $t2, $0, ADD_NEG_ONE
    addi $t0, $t0, 1        # $t0 = num1 + num2 + num3 + 1
    j ENDIF

    ADD_NEG_ONE:
        addi $t0, $t0, -1 
    
    ENDIF:
        addi $t1, $0, 3     # $t1 = 3
        div $t0, $t1        # $t0 / $t1
        mflo $v1
        jr $ra
#_____________________________CALLEE_ENDS_______________________________#
