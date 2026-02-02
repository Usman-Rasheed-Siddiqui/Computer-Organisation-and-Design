.data
	msg: .asciiz "Enter your roll number: "
	evenMsg: .asciiz "The number is even"
	oddMsg: .asciiz "The number is odd"

.text
.globl main
.ent main

main:
	li $v0, 4
	la $a0, msg
	syscall

	li $v0, 5
	syscall
	move $t0, $v0
	
	# Dividing by 2	
	li $t1, 2
	div $t0, $t1
	mfhi $t2

	beq $t2, $0, even

odd:
	li $v0, 4
	la $a0, oddMsg
	syscall
	j exit

even:
	li $v0, 4
	la $a0, evenMsg
	syscall
	j exit


exit:
	li $v0, 10
	syscall

.end main

