.data

msg1: .asciiz "Enter any number: "
msg2: .asciiz "The 2s complement of the number is: "
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

nor $s0,$s0,$s0
addi, $s0, $s0, 1

li $v0, 4           # preparing for string display
la $a0, msg2
syscall             # msg2 will be displayed on console

li $v0, 1           # preparing for integer output
move $a0, $s0       # result is moved to $a0
syscall             # result is displayed on console

jr $ra
.end main