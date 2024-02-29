#BENYAHIA Ilyas 21118889
.data

	str: .asciiz "abba"
	ok: .asciiz "oui"
	ko: .asciiz "non"

.text

	addiu $29, $29, -16 #nv =2, na = 2
	
	lui $8, 0x1001 #@str
	lw $9 , 0($29) #n
	lw $10, 4($29) #res
	
	ori $4, $8, 0
	jal len #len(str)
	
	ori $9, $2, 0
	
	ori $4, $8, 0
	addiu $5, $9, -1
	jal palin  #est_palin(str, n-1)
	
	ori $10, $2, 0
	
	bne $10, $1 , suite
	addiu $4, $8, 10
	ori $2, $0, 4
	syscall
	j end
	
	suite:	
	addiu $4, $8, 6
	ori $2, $0, 4
	syscall
	
	end:
	
	addiu $29, $29, 16
	ori $2, $0, 10
	syscall
	
len:
	addiu $29, $29, -12 #nr = 2 + 1 ($31)
	sw $16, 0($29) #variable c
	sw $17, 4($29) #@str(c)
	sw $31, 8($29) #adresse de retour au main
	
	while:
	addu $17 , $8 , $16
	lb $17 , 0($17)
	beq $17, $0 , endwhile
		addiu $16, $16, 1
	j while
	
	endwhile:
	ori $2, $16, 0
	
	lw $16, 0($29) 
	lw $17, 4($29)
	lw $31, 8($29)
	addiu $29, $29, 12 
	jr $31
	
palin:
	addiu $29, $29, -24 #nr = 5 + 1 ($31)
	sw $16, 0($29) #idx_deb
	sw $17, 4($29) #idx_fin
	sw $18, 8($29) #resultat comparaison
	sw $19, 12($29) #@str[idx_deb]
	sw $20, 16($29) #@str[idx_fin]
	sw $31, 20($29) #adresse de retour au main
	
	addu $17, $0, $5
	while2:
	slt $18, $17, $16
	bne $18, $0 , endwhile2
		addu $19, $8, $16
		addu $20, $8, $17
		lb $19 , 0($19)
		lb $20 , 0($20)
		xor $18, $19, $20
		bne $18, $0, suite2
			ori $2, $0, 0
			j endwhile2
		suite2:
		addiu $16, $16, 1
		addiu $17, $17, -1
		j while2
	
	
	ori $2, $0, 1
	endwhile2:
	sw $16, 0($29) 
	sw $17, 4($29) 
	sw $18, 8($29) 
	sw $19, 12($29)
	sw $20, 16($29)
	sw $31, 20($29)
	addiu $29, $29, 16 
	jr $31
