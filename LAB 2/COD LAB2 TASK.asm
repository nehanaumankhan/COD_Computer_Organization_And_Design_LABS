# This program takes two integers as input from user,
# calculates & displays the sum
.data
# data section includes strings to be output to the console
msg1: .asciiz "Enter the first number followed by enter: "
msg2: .asciiz "\nEnter the second number followed by enter: "
msg3: .asciiz "\nThe result of addition is: "

.text
.globl main
.ent main
main:
li $v0,4 # preparing for string display
la $a0,msg1
syscall # msg1 will be displayed on console

li $v0,5 # preparing for integer input
syscall # first integer was input in $vo
move $t1,$v0 # first integer is moved to $t1

li $v0,4 # preparing for string display
la $a0,msg2
syscall # msg2 will be displayed on console
li $v0,5 # preparing for integer input
syscall # second integer was input in $vo
move $t2,$v0 # second integer is moved to $t2

add $t3,$t1,$t2 # both integers are added. Sum is in $t3
li $v0,4 # preparing for string display
la $a0,msg3
syscall # msg3 will be displayed on console

li $v0,1 # preparing for integer output
move $a0,$t3 # sum is moved to $a0
syscall # sum is displayed on the console

jr $ra
.end main