# Program to convert Celsius temperature in memory at cTemp to
# Fahrenheit equivalent in memory at fTemp

.data
	cTemp: .word 0
	fTemp: .word 0
	
	msg1: .asciiz "Enter Temperature in Celsius (Last two digits of your Roll Number): "
	res: .asciiz "The Temperature in Fahrenheit is "

.text
.globl main
.ent main

main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	# Read Celsius value
	li $v0, 5
	syscall
	sw $v0, cTemp

	li $t1, 9
	li $t2, 5

	lw $t3, cTemp
	
	# (C * 9 + 2) / 5
	mul $t0, $t1, $t3
	addi $t0, $t0, 2

	div $t0, $t2
	mflo $t0

	addi $t0, $t0, 32
	sw $t0, fTemp
	
	li $v0, 4
	la $a0, res
	syscall
	
	# Print Fahrenheit value
	lw $t3, fTemp
	li $v0, 1
	move $a0, $t3
	syscall

	li $v0, 10
	syscall

.end main