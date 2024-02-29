
kernel.x:     file format elf32-littlemips


Disassembly of section .boot:

bfc00000 <boot>:
bfc00000:	3c1a8000 	lui	k0,0x8000
bfc00004:	275a0000 	addiu	k0,k0,0
bfc00008:	03400008 	jr	k0
bfc0000c:	00000000 	nop

Disassembly of section .ktext:

80000000 <kinit>:
80000000:	3c048002 	lui	a0,0x8002
80000004:	24840000 	addiu	a0,a0,0
80000008:	3c05d020 	lui	a1,0xd020
8000000c:	24a50000 	addiu	a1,a1,0

80000010 <print>:
80000010:	80880000 	lb	t0,0(a0)
80000014:	a0a80000 	sb	t0,0(a1)
80000018:	1500fffd 	bnez	t0,80000010 <print>
8000001c:	24840001 	addiu	a0,a0,1

80000020 <exit>:
80000020:	08000008 	j	80000020 <exit>
80000024:	00000000 	nop

Disassembly of section .MIPS.abiflags:

80000028 <.MIPS.abiflags>:
80000028:	02200000 	0x2200000
8000002c:	01000101 	0x1000101
	...
80000038:	00000001 	movf	zero,zero,$fcc0
8000003c:	00000000 	nop

Disassembly of section .kdata:

80020000 <hello>:
80020000:	6c6c6548 	0x6c6c6548
80020004:	6f57206f 	0x6f57206f
80020008:	21646c72 	addi	a0,t3,27762
8002000c:	Adresse 0xffffffff8002000c hors intervalle.


Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	04000000 	bltz	zero,4 <__boot_length-0xffc>
   4:	00000000 	nop
	...

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <__kdata_length+0x57b9c00>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000
