.data
	p: .word 6
.text
	main:
		addiu $29, $29, -4 #na =1
		lui $8, 0x1001 #@p
		lw $4, 0($8) #p
		jal fact
		#printf("%d", fact(n));
		ori $4, $2,0
		ori $2,$0, 1
		syscall
		#exit()
		addiu $29, $29, 4
		ori $2,$0, 10
		syscall
		
	fact:
		addiu $29, $29, -8 #  nr =1 ---> $31 + na =1
		sw $31, 4($29)
		sw $4, 8($29) #save n
		
		#bne $4, $0, fin0
		
		beq $4, $0, fin0 # if(n==0)
		addiu $4, $4, -1 #n--
		jal fact
		
		lw $8, 8($29) #relecture de n
		mult $8, $2 #fact(n-1)*n
		mflo $2
		
		j end
		
		fin0:
		ori $2, $0, 1	#cas de base n=0
		
		end:
		lw $31, 4($29)
		addiu $29, $29, 8
		jr $31
		