.data

msg1: .asciiz "Enter some integer value for x followed by enter: "
msg2: .asciiz "Enter some integer value for y followed by enter: "
msg3: .asciiz "Enter some integer value for z followed by enter: "
msg4: .asciiz "Result of x - y + z - 24 is "

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

li $v0, 4           # preparing for string display
la $a0, msg2
syscall             # msg2 will be displayed on console

li $v0, 5           # preparing for integer input
syscall             # first integer was put in $v0
move $s1, $v0       # first integer is moved to $s1

li $v0, 4           # preparing for string display
la $a0, msg3
syscall             # msg3 will be displayed on console

li $v0, 5           # preparing for integer input
syscall             # first integer was put in $v0
move $s2, $v0       # first integer is moved to $s2

sub $s3, $s0, $s1  # x and y are subtracted and result is stored in $s3
add $s3, $s3, $s2  # the result of x-y is added to z and the result is again stored in $s3
addi $s3, $s3, -24  # the result of x-y+z is subtracted from 24 and the result is again stored in $s3

li $v0, 4           # preparing for string display
la $a0, msg4
syscall             # msg4 will be displayed on console

li $v0, 1           # preparing for integer output
move $a0, $s3       # result is moved to $a0
syscall             # result is displayed on console

jr $ra
.end main