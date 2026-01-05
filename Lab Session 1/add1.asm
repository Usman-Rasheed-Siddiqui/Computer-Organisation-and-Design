.data		
value: .word 10, 20
result: .word 50

.text
.globl main
.ent main
main:
	la $t0, value
	lw $t1, 0($t0)
	lw $t2, 4($t0)
	add $t3, $t2, $t1
	la $t4, result
	sw $t3, 0($t4)
	jr $ra

.end main