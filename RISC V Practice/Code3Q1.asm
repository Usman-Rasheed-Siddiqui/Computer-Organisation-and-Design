.text
main:	
    	# Load values
    	li x18, 10
    	li x19, 20
    	li x20, 15
    	
    	# Main code
	slt x5, x18, x19
	beq x5, x0, ELSE
	
	beq x19, x20, ELSE
	
IF:	addi x18, x18, 5
	j END
	
ELSE:	addi x19, x19, -5

END:	add x28, x18, x19