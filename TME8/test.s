.data
	ch: .space 11
.text 
	addi $29, $29, -16 #4 variables locales
	
	#scanf("%d",&nb);
	ori $2, $0, 5
	syscall	#saisir nombre
	sw $2 , 4($29)
	
	#chaine[10] = 0;
	lui $8, 0x1001
	ori $8, $8 , 10
	sb $0, 0($8)
	
	#for(i = 9; i >= 0 ; i--)
	ori $8 , $0 , 9
	sw $8, 0($29)
	
	for:
		lw $8, 0($29)
		bltz $8,end
		
		#r = nb%10;
		lw $8, 4($29)
		ori $9, $0, 10
		divu $8, $9
		mfhi $9
		sw $9, 8($29)
		
		#nb = nb / 10;
		lw $8, 4($29)
		ori $9, $0, 10
		divu $8, $9
		mflo $9
		sw $9, 4($29)
		
		#chaine[i] = r + 0x30;
		lui $8, 0x1001
		lw $9, 0($29)
		addu $8, $8 , $9
		lw $10, 8($29)
		addiu $10, $10, 0x30
		sb $10, 0($8)
		
		#i--
		lw $8, 0($29)
		addi $8, $8, -1
		sw $8, 0($29)
		
		j for
	end:
		lui $8, 0x1001
		ori $4, $8,0
		ori $2, $0, 4
		syscall
		
		addi $29, $29, 16
		ori $2, $0, 10
		syscall