.data
.word 7      
.word 3      

.text
.globl main
.ent main

main:
	lui $s0, 0x1001      

        lw $t0, 0($s0)        # load first word
        lw $t1, 4($s0)        # load second word
        sw $t1, 0($s0)        # store second word at first word's address
        sw $t0, 4($s0)        # store first word at second word's address

        jr $ra

	li $v0, 10
	syscall                

.end main
