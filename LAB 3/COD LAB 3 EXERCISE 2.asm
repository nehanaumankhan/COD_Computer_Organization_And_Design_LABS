.data

.text
.globl main
.ent main

main:

add $s1,$0,$0	# OR sub $s1, $s1, $s1

addi $s2, $0, 5

and $s3, $s3, 0 

ori $s4, $0, 15

li $s5, 1565
ori $s5, $s5, 15

li $s6, 1234
andi $s6, $s6,0xffc3 # OR andi $s6, $s6,65475

li $s7, 10
sub $s7, $s7, 5
 
sll $s8, $s1,4

jr $ra
.end main