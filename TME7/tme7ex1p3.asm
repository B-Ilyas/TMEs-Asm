.data
	ch: .asciiz "1 exemple d'exemple"
.text
	addiu $29, $29, -8
	
	lui $9, 0x1001 #@ ch
	lw $8, 0($29) # i
	
	ori $4,$9,0
	ori $2,$0,4
	syscall #print ch
	
	while:
	addu $10, $9, $8 #@ch[i]
	lb $4, 0($10) #ch[i]
	beq $4 , $0 , endwhile
	
	jal min_to_maj_c
	sb $2,0($10)
		
	addiu $8, $8, 1
	j while
	
	endwhile:
	
	ori $4, $9,0
	ori $2,$0,4
	syscall
	
	addiu $29, $29, 8
	ori $2,$0,10
	syscall
	
min_to_maj_c:
	addiu $29, $29, -8
	sw $31, 4($29)
	sw $16, 0($29)

	sltiu $16, $4, 0x61
	bne $16, $0, suite
	sltiu $16, $4, 0x7b
	beq $16, $0, suite
	
	addiu $4, $4, -0x20
	
	suite:
	ori $2, $4,0

	lw $31, 4($29)
	lw $16 , 16($29)
	addiu $29, $29, 8
	jr $31