
hcpua.o:     file format elf32-littlemips


Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	24000000 	li	zero,0
	...

Disassembly of section .MIPS.abiflags:

00000000 <.MIPS.abiflags>:
   0:	02200000 	0x2200000
   4:	01000101 	0x1000101
	...
  10:	00000001 	movf	zero,zero,$fcc0
  14:	00000000 	nop

Disassembly of section .boot:

00000000 <boot>:
   0:	3c1d0000 	lui	sp,0x0
   4:	27bd0000 	addiu	sp,sp,0
   8:	3c1a0000 	lui	k0,0x0
   c:	275a0000 	addiu	k0,k0,0
  10:	03400008 	jr	k0
  14:	00000000 	nop

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <boot+0x5b99c00>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000
