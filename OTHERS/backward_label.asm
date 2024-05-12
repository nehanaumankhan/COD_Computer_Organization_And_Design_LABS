.data

msg1: .asciiz "THIS PROGRAMS CHECKS FOR BACKWARD MOVEMENT OF CONDITIONAL INSTRUCTIONS\n"
msg2: .asciiz "LET $t0 = 0 AND $t1 = 1\nbne $t0, $t1, GO_BACK\n\nGoing back to print msg1:  "


.text
.globl main
.ent main

main:

li $t0, 0
li $t1, 1
li $t2, 0

GO_BACK:    
        li $v0, 4           # preparing for string display
        la $a0, msg1
        syscall             # msg1 will be displayed on console
        bne $t2, $0, END

li $v0, 4           # preparing for string display
la $a0, msg2
syscall             # msg1 will be displayed on console

li $t2, 2
bne	$t0, $t1, GO_BACK	# if$t0 != $t1 GO_BACK

END: jr $ra
.end main
