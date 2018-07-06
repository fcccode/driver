
main.ko:     file format elf32-littlearm

Disassembly of section .text:

00000000 <lddic_read>:
   0:	e1a0c00d 	mov	ip, sp
   4:	e92dd800 	push	{fp, ip, lr, pc}
   8:	e24cb004 	sub	fp, ip, #4	; 0x4
   c:	e59f0008 	ldr	r0, [pc, #8]	; 1c <lddic_read+0x1c>
  10:	ebfffffe 	bl	0 <printk>
			10: R_ARM_CALL	printk
  14:	e3a00000 	mov	r0, #0	; 0x0
  18:	e89da800 	ldm	sp, {fp, sp, pc}
  1c:	00000017 	.word	0x00000017
			1c: R_ARM_ABS32	.rodata.str1.1

00000020 <lddic_close>:
  20:	e1a0c00d 	mov	ip, sp
  24:	e92dd800 	push	{fp, ip, lr, pc}
  28:	e24cb004 	sub	fp, ip, #4	; 0x4
  2c:	e59f0008 	ldr	r0, [pc, #8]	; 3c <lddic_close+0x1c>
  30:	ebfffffe 	bl	0 <printk>
			30: R_ARM_CALL	printk
  34:	e3a00000 	mov	r0, #0	; 0x0
  38:	e89da800 	ldm	sp, {fp, sp, pc}
  3c:	00000024 	.word	0x00000024
			3c: R_ARM_ABS32	.rodata.str1.1

00000040 <lddic_open>:
  40:	e1a0c00d 	mov	ip, sp
  44:	e92dd800 	push	{fp, ip, lr, pc}
  48:	e24cb004 	sub	fp, ip, #4	; 0x4
  4c:	e59f0008 	ldr	r0, [pc, #8]	; 5c <lddic_open+0x1c>
  50:	ebfffffe 	bl	0 <printk>
			50: R_ARM_CALL	printk
  54:	e3a00000 	mov	r0, #0	; 0x0
  58:	e89da800 	ldm	sp, {fp, sp, pc}
  5c:	00000032 	.word	0x00000032
			5c: R_ARM_ABS32	.rodata.str1.1

00000060 <lddic_write>:
  60:	e1a0c00d 	mov	ip, sp
  64:	e92dd870 	push	{r4, r5, r6, fp, ip, lr, pc}
  68:	e24cb004 	sub	fp, ip, #4	; 0x4
  6c:	e24ddf41 	sub	sp, sp, #260	; 0x104
  70:	e24b4f46 	sub	r4, fp, #280	; 0x118
  74:	e2444003 	sub	r4, r4, #3	; 0x3
  78:	e1a06002 	mov	r6, r2
  7c:	e1a05001 	mov	r5, r1
  80:	e1a00004 	mov	r0, r4
  84:	e3a01000 	mov	r1, #0	; 0x0
  88:	e3a020ff 	mov	r2, #255	; 0xff
  8c:	ebfffffe 	bl	0 <memset>
			8c: R_ARM_CALL	memset
  90:	e1a01005 	mov	r1, r5
  94:	e1a02006 	mov	r2, r6
  98:	e1a00004 	mov	r0, r4
  9c:	ebfffffe 	bl	0 <memcpy>
			9c: R_ARM_CALL	memcpy
  a0:	e1a01004 	mov	r1, r4
  a4:	e59f000c 	ldr	r0, [pc, #12]	; b8 <lddic_write+0x58>
  a8:	ebfffffe 	bl	0 <printk>
			a8: R_ARM_CALL	printk
  ac:	e1a00006 	mov	r0, r6
  b0:	e24bd018 	sub	sp, fp, #24	; 0x18
  b4:	e89da870 	ldm	sp, {r4, r5, r6, fp, sp, pc}
  b8:	00000081 	.word	0x00000081
			b8: R_ARM_ABS32	.rodata.str1.1
Disassembly of section .exit.text:

00000000 <cleanup_module>:
   0:	e1a0c00d 	mov	ip, sp
   4:	e92dd830 	push	{r4, r5, fp, ip, lr, pc}
   8:	e24cb004 	sub	fp, ip, #4	; 0x4
   c:	e59f401c 	ldr	r4, [pc, #28]	; 30 <cleanup_module+0x30>
  10:	e5940000 	ldr	r0, [r4]
  14:	ebfffffe 	bl	0 <cdev_del>
			14: R_ARM_CALL	cdev_del
  18:	e5940004 	ldr	r0, [r4, #4]
  1c:	e3a01001 	mov	r1, #1	; 0x1
  20:	ebfffffe 	bl	0 <unregister_chrdev_region>
			20: R_ARM_CALL	unregister_chrdev_region
  24:	e59f0008 	ldr	r0, [pc, #8]	; 34 <cleanup_module+0x34>
  28:	ebfffffe 	bl	0 <printk>
			28: R_ARM_CALL	printk
  2c:	e89da830 	ldm	sp, {r4, r5, fp, sp, pc}
	...
			30: R_ARM_ABS32	.bss
			34: R_ARM_ABS32	.rodata.str1.1
Disassembly of section .init.text:

00000000 <init_module>:
   0:	e1a0c00d 	mov	ip, sp
   4:	e92dd830 	push	{r4, r5, fp, ip, lr, pc}
   8:	e24cb004 	sub	fp, ip, #4	; 0x4
   c:	e59f4070 	ldr	r4, [pc, #112]	; 84 <init_module+0x84>
  10:	e59f0070 	ldr	r0, [pc, #112]	; 88 <init_module+0x88>
  14:	ebfffffe 	bl	0 <printk>
			14: R_ARM_CALL	printk
  18:	e59f306c 	ldr	r3, [pc, #108]	; 8c <init_module+0x8c>
  1c:	e3a01000 	mov	r1, #0	; 0x0
  20:	e3a02001 	mov	r2, #1	; 0x1
  24:	e2840004 	add	r0, r4, #4	; 0x4
  28:	ebfffffe 	bl	0 <alloc_chrdev_region>
			28: R_ARM_CALL	alloc_chrdev_region
  2c:	ebfffffe 	bl	0 <cdev_alloc>
			2c: R_ARM_CALL	cdev_alloc
  30:	e59f5058 	ldr	r5, [pc, #88]	; 90 <init_module+0x90>
  34:	e59f3058 	ldr	r3, [pc, #88]	; 94 <init_module+0x94>
  38:	e3a02001 	mov	r2, #1	; 0x1
  3c:	e5840000 	str	r0, [r4]
  40:	e5805028 	str	r5, [r0, #40]
  44:	e5941000 	ldr	r1, [r4]
  48:	e5813024 	str	r3, [r1, #36]
  4c:	e8940003 	ldm	r4, {r0, r1}
  50:	ebfffffe 	bl	0 <cdev_add>
			50: R_ARM_CALL	cdev_add
  54:	e5941004 	ldr	r1, [r4, #4]
  58:	e59f0038 	ldr	r0, [pc, #56]	; 98 <init_module+0x98>
  5c:	e1a01a21 	lsr	r1, r1, #20
  60:	e585106c 	str	r1, [r5, #108]
  64:	ebfffffe 	bl	0 <printk>
			64: R_ARM_CALL	printk
  68:	e3a0103c 	mov	r1, #60	; 0x3c
  6c:	e3a02024 	mov	r2, #36	; 0x24
  70:	e3a03008 	mov	r3, #8	; 0x8
  74:	e59f0020 	ldr	r0, [pc, #32]	; 9c <init_module+0x9c>
  78:	ebfffffe 	bl	0 <printk>
			78: R_ARM_CALL	printk
  7c:	e3a00000 	mov	r0, #0	; 0x0
  80:	e89da830 	ldm	sp, {r4, r5, fp, sp, pc}
  84:	00000000 	.word	0x00000000
			84: R_ARM_ABS32	.bss
  88:	0000003f 	.word	0x0000003f
			88: R_ARM_ABS32	.rodata.str1.1
  8c:	00000054 	.word	0x00000054
			8c: R_ARM_ABS32	.rodata.str1.1
	...
			90: R_ARM_ABS32	.data
			94: R_ARM_ABS32	__this_module
  98:	0000005a 	.word	0x0000005a
			98: R_ARM_ABS32	.rodata.str1.1
  9c:	00000075 	.word	0x00000075
			9c: R_ARM_ABS32	.rodata.str1.1
