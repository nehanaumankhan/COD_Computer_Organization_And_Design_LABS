.data

msg1: .asciiz "Enter some integer value:  "
msg2: .asciiz "The number is Even"
msg3: .asciiz "The number is Odd"


.text
.globl main
.ent main

main:

li $v0, 4           # preparing for string display
la $a0, msg1
syscall             # msg1 will be displayed on console

li $v0, 5           # preparing for integer input
syscall             # first integer was put in $v0
move $s0, $v0       # first integer is moved to $s0

addi $s1, $0, 2
div $s0, $s1
mfhi $s2            # $s2 = remainder
beq $s2, $0, else

li $v0, 4           # preparing for string display
la $a0, msg3
syscall             # msg2 will be displayed on console

j end

else: 
li $v0, 4           # preparing for string display
la $a0, msg2
syscall             # msg2 will be displayed on console

end: 
jr $ra
.end main
