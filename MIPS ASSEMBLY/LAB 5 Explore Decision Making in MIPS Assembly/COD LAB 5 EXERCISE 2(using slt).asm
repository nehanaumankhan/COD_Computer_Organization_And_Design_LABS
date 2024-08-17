
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
syscall                         # first integer was put in $v0
move $s0, $v0                   # first integer is moved to $s0; $s0 input temperature

li $s1, 30
slt $s2, $s0, $s1               # if temp < 30, s2 = 1
beq $s0, $s1, PLEASANT          # if temp == 30 => PLEASANT

beq $s2, $0, IF_HOT 

# Now we check for 20 since temp < 30
li $s1, 20
slt $s2, $s0, $s1               # if temp < 20, s2 = 1
beq $s0, $s1, ELSE_COLD         # if temp == 20

bne $s2, $0, ELSE_COLD 

PLEASANT:
li $v0, 4                       # preparing for string display
la $a0, msg3
syscall                         # msg3 will be displayed on console

j JUMP

ELSE_COLD: 
li $v0, 4                       # preparing for string display
la $a0, msg4
syscall                         # msg4 will be displayed on console

j JUMP

IF_HOT: 
li $v0, 4                       # preparing for string display
la $a0, msg2
syscall                         # msg2 will be displayed on console

JUMP:

jr $ra
.end main