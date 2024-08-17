.data

msg1: .asciiz "Enter your name: "
msg2: .asciiz "\nEnter your age: "
msg3: .asciiz "\n****Welcome "
msg4: .asciiz "! You are "
msg5: .asciiz " years old now. Stay Blessed****"
buffer: .space 30

.text
.globl main
.ent main

main:

li $v0, 4 # preparing for string display
la $a0, msg1
syscall # msg1 will be displayed on console

li $v0, 8
la $a0, buffer
li $a1, 30
syscall
move $t0, $a0

li $v0, 4 # preparing for string display
la $a0, msg2
syscall # msg2 will be displayed on console

li $v0, 5
syscall
move $t1, $v0 

li $v0, 4 # preparing for string display
la $a0, msg3
syscall # msg3 will be displayed on console

li $v0, 4 # preparing for string display
move $a0, $t0
syscall # name will be displayed on console

li $v0, 4 # preparing for string display
la $a0, msg4
syscall # msg4 will be displayed on console

li $v0, 1
move $a0, $t1
syscall

li $v0, 4 # preparing for string display
la $a0, msg5
syscall # msg5 will be displayed on console

jr $ra
.end main