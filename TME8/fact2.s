.data
	p: .word 5
	
.text
	main:
		addiu $29, $29, -8
		lui $8, 0x1001
		lw $8, 0($8)
		sw $8, 0($29)
		
		lw $4, 0($29)
		jal fact
		
		ori $4,$2,0
		ori $2, $0,1
		syscall
		
		ori $2, $0,10
		syscall
		
	fact:
		addiu $29,$29,-8
		sw $31, 4($29)
		sw $4, 8($29)
		
		bne $4, $0, else
		ori $2, $0, 1
		j fin_if
		
		else:
			addiu $4, $4, -1
			jal fact
			
			lw $8, 8($29)
			mult $8,$2
			mflo $2
			
		fin_if:
			lw $31, 4($29)
			addiu $29, $29, 8
			jr $31
			