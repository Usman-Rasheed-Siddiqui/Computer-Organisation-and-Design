
.data

	LIST: .word 7, 8, 9, 10, 11, 12, 13, 14, 15

.text
.globl main
.ent main
main:
	li $v0, 4
	la $a0, LIST
	syscall
	
	li $v0, 10
	syscall
.end main