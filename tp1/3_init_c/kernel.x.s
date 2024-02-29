
kernel.x:     file format elf32-littlemips


Disassembly of section .boot:

bfc00000 <boot>:
bfc00000:	3c1d8040 	lui	sp,0x8040
bfc00004:	27bd0000 	addiu	sp,sp,0
bfc00008:	3c1a8000 	lui	k0,0x8000
bfc0000c:	275a0000 	addiu	k0,k0,0
bfc00010:	03400008 	jr	k0
bfc00014:	00000000 	nop

Disassembly of section .ktext:

80000000 <kinit>:
80000000:	3c028002 	lui	v0,0x8002
80000004:	80430000 	lb	v1,0(v0)
80000008:	10600008 	beqz	v1,8000002c <kinit+0x2c>
8000000c:	00000000 	nop
80000010:	24420000 	addiu	v0,v0,0
80000014:	3c04d020 	lui	a0,0xd020
80000018:	24420001 	addiu	v0,v0,1
8000001c:	ac830000 	sw	v1,0(a0)
80000020:	80430000 	lb	v1,0(v0)
80000024:	1460fffc 	bnez	v1,80000018 <kinit+0x18>
80000028:	00000000 	nop
8000002c:	1000ffff 	b	8000002c <kinit+0x2c>
80000030:	00000000 	nop

Disassembly of section .MIPS.abiflags:

80000038 <.MIPS.abiflags>:
80000038:	02200000 	0x2200000
8000003c:	01000101 	0x1000101
	...
80000048:	00000001 	movf	zero,zero,$fcc0
8000004c:	00000000 	nop

Disassembly of section .kdata:

80020000 <hello>:
80020000:	6c6c6548 	0x6c6c6548
80020004:	6f57206f 	0x6f57206f
80020008:	21646c72 	addi	a0,t3,27762
8002000c:	Adresse 0xffffffff8002000c hors intervalle.


Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	24000000 	li	zero,0
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	80000000 	lb	zero,0(zero)
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <__kdata_length+0x57b9c00>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	madd.s	$f0,$f18,$f5,$f7
   8:	37202955 	ori	zero,t9,0x2955
   c:	302e312e 	andi	t6,at,0x312e
	...
