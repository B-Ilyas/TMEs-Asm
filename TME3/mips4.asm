.data 
	ch: .asciiz "coucou"

.text
	lui $8, 0x1001
	or $4, $0, $8
	ori $2, $0, 4
	syscall
	
	ori $9, $0, 0x6F
	sb $9, 0($8)
	ori $10, $0, 0x63
	sb $10, 1($8)
	ori $2, $0, 4
	syscall
	