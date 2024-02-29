.data 
	o: .byte 0xFF
.text
	lui $9, 0x1001
	lb $4, 0($9)
	ori $2, $0, 1
	syscall
	
	lui $10, 0x1001
	lbu $4, 0($10)
	ori $2, $0, 1
	syscall

	