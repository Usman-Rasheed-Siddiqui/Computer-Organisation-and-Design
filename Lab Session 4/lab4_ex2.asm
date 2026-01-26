
.data
	msg1: .asciiz "Enter your roll number: "
	msg2: .asciiz "Enter Divisor: "
	msg3: .asciiz "Quotient is "
	msg4: .asciiz " and Remainder is "

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

	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0

	div $t0, $t1
	mflo $t2
	mfhi $t3

	li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, msg4
	syscall

	li $v0, 1
	move $a0, $t3
	syscall

	li $v0, 10
	syscall

.end main

	
	
	