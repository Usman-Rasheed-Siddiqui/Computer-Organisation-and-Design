.data
	msg1: .asciiz "Enter temperature of the day: "
	hotDay: .asciiz "It is hot today"
	pleasantDay: .asciiz "Pleasant weather"
	coldDay: .asciiz "It is cold today"

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
	
	li $t1, 30
	li $t3, 20

	slt $t2, $t1, $t0
	beq $t2, 1, hot

	slt $t4, $t3, $t0
	beq $t4, 1, pleasant


cold:
	li $v0, 4
	la $a0, coldDay
	syscall
	j exit

hot:
	li $v0, 4
	la $a0, hotDay
	syscall
	j exit

pleasant:
	li $v0, 4
	la $a0, pleasantDay
	syscall
	j exit	

exit:
	li $v0, 10
	syscall

.end main
	


	