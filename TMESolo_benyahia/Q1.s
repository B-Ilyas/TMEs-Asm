#BENYAHIA Ilyas 21118889
.data

	str: .asciiz "abcba"
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
	addiu $4, $8, 7
	ori $2, $0, 4
	syscall
	j end
	
	suite:	
	addiu $4, $8, 7
	ori $2, $0, 4
	syscall
	
	end:
	addiu $29, $29, 16
	ori $2, $0, 10
	syscall
	
len:
jr $31
palin:
jr $31