
kernel.x:     file format elf32-littlemips


Disassembly of section .boot:

bfc00000 <boot>:
bfc00000:	3c04bfc0 	lui	a0,0xbfc0
bfc00004:	24840028 	addiu	a0,a0,40
bfc00008:	3c05d020 	lui	a1,0xd020
bfc0000c:	24a50000 	addiu	a1,a1,0

bfc00010 <print>:
bfc00010:	80880000 	lb	t0,0(a0)
bfc00014:	a0a80000 	sb	t0,0(a1)
bfc00018:	1500fffd 	bnez	t0,bfc00010 <print>
bfc0001c:	24840001 	addiu	a0,a0,1

bfc00020 <dead>:
bfc00020:	0bf00008 	j	bfc00020 <dead>
bfc00024:	00000000 	nop

bfc00028 <hello>:
bfc00028:	6c6c6548 	0x6c6c6548
bfc0002c:	6f57206f 	0x6f57206f
bfc00030:	21646c72 	addi	a0,t3,27762
bfc00034:	2075410a 	addi	s5,v1,16650

bfc00035 <aurvr>:
bfc00035:	7541      	cmpi	a1,65
bfc00037:	7220      	cmpi	v0,32
bfc00039:	7665      	cmpi	a2,101
bfc0003b:	696f      	li	s1,111
bfc0003d:	0a72      	la	v0,bfc00204 <aurvr+0x1cf>
	...

Disassembly of section .MIPS.abiflags:

bfc00040 <.MIPS.abiflags>:
bfc00040:	02200000 	0x2200000
bfc00044:	01000101 	0x1000101
	...
bfc00050:	00000001 	movf	zero,zero,$fcc0
bfc00054:	00000000 	nop

Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	00000130 	tge	zero,zero,0x4
	...

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <__boot_length+0x5b98c00>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000
