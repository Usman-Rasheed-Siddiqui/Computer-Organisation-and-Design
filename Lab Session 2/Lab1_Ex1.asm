
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
	li  $a1, 20	# buffer size
	syscall
	
#---- FOR LOOP to remove New Line Char from name ---
	la $t1, name	# point to start of string: name
	
remove_nl:
	lb $t2, 0($t1)	# load current char
	beq $t2, $zero, done_nl	# stop at end of string
	beq $t2, 10, replace_nl	# if newline ('\n')
	addi $t1, $t1, 1	# move to next character
	j remove_nl				

replace_nl:
	sb $zero, 0($t1)	# replace '\n' with null terminator

done_nl:
	
	# Print "Enter your age"
	li $v0, 4
	la $a0, msg2
	syscall
	
	# Read age
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Print welcome message
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
	
	# End program
	jr $ra
	li $v0, 10
	syscall
	
.end main
	
	