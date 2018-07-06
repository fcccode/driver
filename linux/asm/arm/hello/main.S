 .section .modinfo
 .align
__mod_kernel_version:
 .asciz "kernel_version=2.6.28"

 .align
__mod_license:
 .asciz "license=GPL"

 .align
__mod_author:
 .asciz "author=Steward_Fu"

 .align
__mod_description:
 .asciz "description=Linux Device Driver in Assembly"

 .text
 .align
msg_load:
 .asciz "Steward Linux Driver Tutorial(Assembly), Hello, world!\n"
 
 .align
msg_unload:
 .asciz "Unload it!\n"

 .align
msg_ptr:
 .word msg_load
 .word msg_unload

 .align
 .global init_module
 .global cleanup_module
 .extern printk

cleanup_module:
 push	{lr}
 ldr	r0, msg_ptr + 4
 bl	printk
 pop	{pc}

init_module:
 push	{lr}
 ldr	r0, msg_ptr + 0
 bl	printk
 mov	r0, #0
 pop	{pc}
 .end

