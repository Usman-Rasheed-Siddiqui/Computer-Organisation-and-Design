
.data
	msg1: .asciiz "Enter uppercase alphabet followed by enter: "
	msg2: .asciiz "\nYou entered "

.text
.globl main
.ent main

main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 12
	syscall
	move $t0, $v0
	
	# Convert to lowercase
	addi $t1, $t0, 32
	
	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 11
	move $a0, $t1
	syscall
	
	li $v0, 10
	syscall

.end main

	