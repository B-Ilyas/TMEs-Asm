ori $8, $0, 0x00FF     # $8 = 0x00FF
ori $9, $0, 0xFFF0     # $9 = 0xFFF0
and $10, $9, $8        # $10 = 0x00F0
xor $11, $9, $8        # $11 = 0xFF0F
xor $11, $11, $11      # $11 = 0x0000

# Decalages
ori $9, $0, 25          # $9 = 25
sll $10, $9, 1          # $10 = 50
sll $11, $9, 2          # $11 = 100
sll $12, $9, 3          # $12 = 200
srl $10, $9, 1          # $10 = 12
srl $10, $9, 2          # $10 = 6
srl $10, $9, 3          # $10 = 3
addi $9, $0, -25        # $9 = -25
srl $10, $9, 1          # $10 = -13
srl $11, $9, 2          # $11 = -7
sra $12, $9, 1          # $12 = -13
sra $13, $9, 2          # $13 = -7
sra $14, $9, 3          # $14 = -4

# Comparaisons
ori $9, $0, 2           # $9 = 2
ori $8, $0, 4           # $8 = 4
slt $11, $8, $9         # $11 = 1 (true)
slt $12, $9, $8         # $12 = 0 (false)
ori $2, $0, 10          # $2 = 10
syscall