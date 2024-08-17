# comments are delimited by hash marks
# This program adds two numbers which are stored in memory

.data 				# data section
				# (Initialize memory variable here)

value: .word 10, 20, 0		# data for addition

.text 				# text section

.globl main 			# call main by SPIM.
				# Note that it is not global

.ent main 			# entering into main

main:

	la $t0, value 		# load address ‘value’ into $t0
	lw $t1, 0($t0) 		# load word 0(value) into $t1
	lw $t2, 4($t0) 		# load word 4(value) into $t2
	add $t3, $t1, $t2 	# add two numbers into $t3
	sw $t3, 8($t0) 		# store word $t3 into 8($t0)
	jr $ra 			# helps in returning from
				# the calling point

.end main 			# main ends here