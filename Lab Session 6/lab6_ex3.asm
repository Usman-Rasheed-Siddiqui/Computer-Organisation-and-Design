
.data
	n: .string "Enter some integer "
	composite: .string "The number is composite"
	prime: .string "The number is prime"
	neither: .string "The number is neither prime nor composite"
	
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
	mv t0, a0	# factorial condition

	li t1, 2	# Initiate for loop and check
	blt t0, t1, IS_NEITHER
	
LOOP:
	mul t2, t1, t1		# t2 = i * i
	bgt t2, t0, IS_PRIME	# t2 > n = PRIME
	
	rem t3, t0, t1		# t3 = n % i
	beq t3, zero, IS_COMPOSITE
	
	addi t1, t1, 1 		# i++
	j LOOP

IS_PRIME:
	li, a7, 4
	la a0, prime
	ecall
	j EXIT

IS_COMPOSITE:
	li, a7, 4
	la a0, composite
	ecall
	j EXIT
				
IS_NEITHER:
	li, a7, 4
	la a0, neither
	ecall

EXIT:
	li a7, 10
    	ecall
