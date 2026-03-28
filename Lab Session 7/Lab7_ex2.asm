.data
    num: .asciz "Enter the base (Sum of your roll number): "
    pow: .asciz "Enter the power (0-9): "
    result: .asciz "The result of num^pow is: "

.text
.globl main

main:
    #Input for num
    li a7, 4
    la a0, num
    ecall
    li a7, 5
    ecall
    mv s0, a0

    #Input for pow
    li a7, 4
    la a0, pow
    ecall
    li a7, 5
    ecall
    mv s1, a0

    #POWER function
    mv a0, s0
    mv a1, s1
    jal POWER
    
    mv s2, a0            # Save result

    #Result
    li a7, 4
    la a0, result
    ecall
    
    mv a0, s2
    li a7, 1
    ecall

    li a7, 10
    ecall

POWER:
    li t0, 1             #result storing
    li t1, 0             #counter

POWER_LOOP:
    beq t1, a1, EXIT
    
    mul t0, t0, a0       # result = result * base
    addi t1, t1, 1       # i++
    
    j POWER_LOOP

EXIT:
    mv a0, t0           
    ret                  