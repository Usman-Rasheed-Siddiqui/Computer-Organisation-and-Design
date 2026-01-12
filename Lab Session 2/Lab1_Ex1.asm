
.data
	msg1:	.asciiz "\nEnter your name: "
	msg2:	.asciiz "\nEnter your age: "
	name:	.space 20
	msg3:	.asciiz "\n***Welcome "
	msg4:	.asciiz " ! You are "
	msg5:	.asciiz " years old now. Stay Blessed***"

.text
.globl main
.ent main
main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 8
	la $a0, name
	syscall
	

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 5
	syscall

	move $t0, $v0
	
	li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 4
	la $a0, name
	syscall

	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, msg5
	syscall

	jr $ra
	li $v0, 10
	syscall

.end main
	
	