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

	li $v0, 5
	syscall
	sw $v0, cTemp

	sw 9, $t1
	sw 5, $t2
	
	mul $t0, $t1, cTemp
	addi $t0, $t0, 2

	div $t0, $t2
	mflo $t0

	addi $t0, $t0, 32
	
	sw $t0, fTemp
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, fTemp
	syscall

	li $v0, 10
	syscall

.end main
	
	
	
	