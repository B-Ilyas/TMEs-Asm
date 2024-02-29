.data 
	m1: .word -1
	m2 : .word 0xFF
.text
	lui $8, 0x1001
	lw $4, 0($8)
	
	addi $4, $4 , 1
	ori $2, $0, 1
	syscall
	
	ori $9 , $8, 4
	lw $4, 0($9)
	
	addi $4, $4 , 1
	ori $2, $0, 1
	syscall
	