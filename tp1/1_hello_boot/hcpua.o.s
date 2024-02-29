
hcpua.o:     file format elf32-littlemips


Disassembly of section .text:

00000000 <boot>:
   0:	3c040000 	lui	a0,0x0
   4:	24840028 	addiu	a0,a0,40
   8:	3c050000 	lui	a1,0x0
   c:	24a50000 	addiu	a1,a1,0

00000010 <print>:
  10:	80880000 	lb	t0,0(a0)
  14:	a0a80000 	sb	t0,0(a1)
  18:	1500fffd 	bnez	t0,10 <print>
  1c:	24840001 	addiu	a0,a0,1

00000020 <dead>:
  20:	08000008 	j	20 <dead>
  24:	00000000 	nop

00000028 <hello>:
  28:	6c6c6548 	0x6c6c6548
  2c:	6f57206f 	0x6f57206f
  30:	21646c72 	addi	a0,t3,27762
  34:	2075410a 	addi	s5,v1,16650

00000035 <aurvr>:
  35:	7541      	cmpi	a1,65
  37:	7220      	cmpi	v0,32
  39:	7665      	cmpi	a2,101
  3b:	696f      	li	s1,111
  3d:	0a72      	la	v0,204 <aurvr+0x1cf>
	...

Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	00000130 	tge	zero,zero,0x4
	...

Disassembly of section .MIPS.abiflags:

00000000 <.MIPS.abiflags>:
   0:	02200000 	0x2200000
   4:	01000101 	0x1000101
	...
  10:	00000001 	movf	zero,zero,$fcc0
  14:	00000000 	nop

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <aurvr+0x5b99bcb>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000
