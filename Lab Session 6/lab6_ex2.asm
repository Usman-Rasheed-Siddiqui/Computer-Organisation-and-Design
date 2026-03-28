
.data
	n: .string "Enter sum of your roll number (n): "
	ans: .string "The factorial is: "
	
.text
.globl main

main:
	# Display input message
	li a7, 4
	la a0, n
	ecall
	
	# Input integer
	li a7, 5
	ecall
	mv t1, a0	# factorial condition
	
	# t1 is our counter
	li t2, 1	# Answer storing
	li t3, 1
	
LOOP:
	blt t1, t3, EXIT
	
	mul t2, t2, t1
	addi t1, t1, -1
	
	j LOOP
	
EXIT:
	li, a7, 4
	la a0, ans
	ecall 
	
	mv a0, t2
	li a7, 1
	ecall
	
	li a7, 10
    	ecall
	
	