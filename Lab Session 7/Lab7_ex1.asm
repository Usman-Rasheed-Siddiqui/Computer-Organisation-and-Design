.data
    msg1: .asciz "Enter your roll number: "
    msg2: .asciz "Enter your friend's roll number: "
    result: .asciz "The approximate average is: "

.text
.globl main

main:
    # Get your roll number
    li a7, 4
    la a0, msg1
    ecall
    
    li a7, 5
    ecall
    mv s0, a0  

    # Get friend's roll number
    li a7, 4
    la a0, msg2
    ecall
    
    li a7, 5
    ecall
    mv s1, a0       

    mv a0, s0            # Parameter 1: Your roll number
    mv a1, s1            # Parameter 2: Friend's roll number
    li a2, 3             # Parameter 3: The number 3
    
    #AVERAGE procedure call
    jal AVERAGE     
    
    #Store returned result
    mv s2, a0          

    # 6. Display result
    li a7, 4
    la a0, result
    ecall
    
    mv a0, s2            
    li a7, 1             
    ecall

    # 7. Exit
    li a7, 10
    ecall

AVERAGE:
    # Sum the three parameters
    add t0, a0, a1       
    add t0, t0, a2       
    
    div a0, t0, a2       
    
    ret                  