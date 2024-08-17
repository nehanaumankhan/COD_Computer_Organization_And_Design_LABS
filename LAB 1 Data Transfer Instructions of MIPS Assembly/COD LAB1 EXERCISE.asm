.data
.word 7
.word 3

.text
.globl main
.ent main

main:
    lui $s0, 0x1001
    lw $s1, 0($s0)
    lw $s2, 4($s0)
    sw $s2, 0($s0)
    sw $s1, 4($s0)
    jr $ra

.end main