
.data
	msg1: .asciiz "Enter a number to calculate it's 2's Complement: "
	msg2: .asciiz "\nThe 2's Complement of "
	msg3: .asciiz " is "

.text
.globl main
.ent main

main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Inverting
	not $t1, $t0
	
	# Adding 1 to make 2's Complement
	addi $t1, $t1, 1
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 1
	move $a0, $t1
	syscall
	
	li, $v0, 10
	syscall

.end main

	
	
	