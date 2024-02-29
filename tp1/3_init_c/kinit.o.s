
kinit.o:     file format elf32-littlemips


Disassembly of section .text:

00000000 <kinit>:
   0:	3c020000 	lui	v0,0x0
   4:	80430000 	lb	v1,0(v0)
   8:	10600008 	beqz	v1,2c <kinit+0x2c>
   c:	00000000 	nop
  10:	24420000 	addiu	v0,v0,0
  14:	3c040000 	lui	a0,0x0
  18:	24420001 	addiu	v0,v0,1
  1c:	ac830000 	sw	v1,0(a0)
  20:	80430000 	lb	v1,0(v0)
  24:	1460fffc 	bnez	v1,18 <kinit+0x18>
  28:	00000000 	nop
  2c:	1000ffff 	b	2c <kinit+0x2c>
  30:	00000000 	nop

Disassembly of section .data:

00000000 <hello>:
   0:	6c6c6548 	0x6c6c6548
   4:	6f57206f 	0x6f57206f
   8:	21646c72 	addi	a0,t3,27762
   c:	Adresse 0x000000000000000c hors intervalle.


Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	0000001c 	0x1c
	...

Disassembly of section .MIPS.abiflags:

00000000 <.MIPS.abiflags>:
   0:	02200000 	0x2200000
   4:	01000101 	0x1000101
	...
  10:	00000001 	movf	zero,zero,$fcc0
  14:	00000000 	nop

Disassembly of section .pdr:

00000000 <.pdr>:
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f

Disassembly of section .comment:

00000000 <.comment>:
   0:	43434700 	c0	0x1434700
   4:	4728203a 	bz.h	$w8,80f0 <kinit+0x80f0>
   8:	2029554e 	addi	t1,at,21838
   c:	2e312e37 	sltiu	s1,s1,11831
  10:	Adresse 0x0000000000000010 hors intervalle.


Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <kinit+0x5b99c00>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000
