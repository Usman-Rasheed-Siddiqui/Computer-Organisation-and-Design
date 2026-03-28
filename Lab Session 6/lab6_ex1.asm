
.data
	msg1: .string "Enter your roll number: "
	msg2: .string "The sum from 1 to your roll number is: "

.text
.globl main

 main:
 	# Print input statement
	li, a7, 4
	la a0, msg1
	ecall 
	
	# Save input number
	li a7, 5
	ecall
	mv t0, a0
	
	li t1, 1	# loop condition
	li t2, 0	# Answer storing
	
LOOP:
	bgt t1, t0, EXIT
	
	add t2, t2, t1	# sum = sum + i
	addi t1, t1, 1	# i = i + 1
	
	j LOOP

EXIT:
	li, a7, 4
	la a0, msg2
	ecall 
	
	mv a0, t2
	li a7, 1
	ecall
	
	li a7, 10
    	ecall