.data
	msg1:	.asciiz "\nEnter the first number followed by enter: "
	msg2:	.asciiz "\nEnter the second number followed by enter: "

	msg3:	.asciiz "\nThe result of addition is: "

.text
.globl main
.ent main
main:
	li $v0, 4	# Print String System Call (4) (Load Immediate)
	la $a0, msg1	# Load address of msg1 to $a0
	syscall

	li $v0, 5	# Integer System Call (5)
	syscall		
	
	move $t1, $v0	# Moving integer address to $t1 (Ended for msg1)
	
	li $v0, 4	# Repeat msg1 system call steps for msg2
	la $a0, msg2
	syscall

	li $v0, 5
	syscall

	move $t2, $v0

	add $t3, $t1, $t2	# Add t1 and t2 to t3

	li $v0, 4		# Repeat msg1 steps for msg3
	la $a0, msg3
	syscall

	li $v0, 1		# Print Integer System call (1)
	move $a0, $t3
	syscall

	jr $ra
	li $v0, 10		#Exit System call (10)
	syscall

.end main