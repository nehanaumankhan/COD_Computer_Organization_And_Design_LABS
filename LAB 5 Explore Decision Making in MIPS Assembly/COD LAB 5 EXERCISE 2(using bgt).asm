
.data

msg1: .asciiz "Enter temperature of the day:  "
msg2: .asciiz "It is hot today"
msg3: .asciiz "Pleasant weather"
msg4: .asciiz "It is cold today"

.text
.globl main
.ent main

main:

li $v0, 4                       # preparing for string display
la $a0, msg1
syscall                         # msg1 will be displayed on console

li $v0, 5                       # preparing for integer input
syscall                         # Temperature was put in $v0
move $s0, $v0                   # Temperature is moved to $s0

li $s1, 30
bgt $s0, $s1, HOT               # if temp > 30 -> go to HOT

slti $t0, $s0, 30
bne $t0, $0, COLD

li $v0, 4                       # preparing for string display
la $a0, msg3
syscall                         # msg3 will be displayed on console

j JUMP_END

COLD: 
li $v0, 4                       # preparing for string display
la $a0, msg4
syscall                         # msg4 will be displayed on console

j JUMP_END

HOT: 
li $v0, 4                       # preparing for string display
la $a0, msg2
syscall                         # msg2 will be displayed on console

JUMP_END:

jr $ra
.end main