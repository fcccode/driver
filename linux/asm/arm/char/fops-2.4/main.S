#=======================================================================
# Linux Device Driver for ARM in Assembly
# This file can be distributed or modified under GPL license.
# http://steward-fu.github.io/website/index.htm
# Steward 2016/02/14
#=======================================================================
.equ FOPS_READ,    2
.equ FOPS_WRITE,   3
.equ FOPS_OPEN,    12
.equ FOPS_RELEASE, 14
.equ FOPS_SIZE,    (27 << 2)

.section .modinfo
__module_kernel_version: .asciz "kernel_version=2.6.28";    .align
__module_license:        .asciz "license=GPL";              .align 
__module_author:         .asciz "author=Steward";           .align 
__module_description:    .asciz "description=Linux Driver"; .align

.section .text
dev_name:   .asciz "lddia";                       .align
msg_load:   .asciz "lddia, load it!\n";           .align
msg_unload: .asciz "lddia, unload it!\n";         .align
msg_major:  .asciz "lddia, major number is %d\n"; .align 
msg_open:   .asciz "lddia, open\n";               .align 
msg_close:  .asciz "lddia, close\n";              .align 
msg_read:   .asciz "lddia, read\n";               .align 
msg_write:  .asciz "lddia, write buffer: %s";     .align

.section .data
major:  .skip         1; .align
buffer: .skip       255; .align 
fops:   .skip FOPS_SIZE; .align

.section .text
.global init_module
.global cleanup_module
.extern memset
.extern memcpy
.extern printk
.extern register_chrdev
.extern unregister_chrdev
lddia_open:
  push {lr}
  ldr r0, =msg_open
  bl printk
  mov r0, #0
  pop {pc}

lddia_close:
  push {lr}
  ldr r0, =msg_close
  bl printk
  mov r0, #0
  pop {pc}

lddia_read:
  push {lr}
  ldr r0, =msg_read
  bl printk
  mov r0, #0
  pop {pc}

lddia_write:
  push {r4, r5, lr}
  mov r4, r1
  mov r5, r2
  # memset(buffer, 0, sizeof(buffer))
  ldr r0, =buffer
  mov r1, #0
  mov r2, #255
  bl memset
  # memcpy(buffer, buff, count)
  ldr r0, =buffer
  mov r1, r4
  mov r2, r5
  bl memcpy
  # printk(msg_write, buffer)
  ldr r1, =buffer
  ldr r0, =msg_write
  bl printk
  # return count
  mov r0, r5
  pop {r4, r5, pc}

cleanup_module:
  push {lr}
  # unregister(major, dev_name)
  ldr r1, =major
  ldr r0, [r1]
  ldr r1, =dev_name
  bl unregister_chrdev
  # printk(msg_unload)
  ldr r0, =msg_unload
  bl printk
  pop {pc}

init_module:
  push {lr}
  # fops.open = lddia_open
  adr r2, lddia_open
  ldr r1, =fops
  mov r0, #FOPS_OPEN
  add r0, r1, r0, lsl #2
  str r2, [r0]
  # fops.close = lddia_close
  adr r2, lddia_close
  ldr r1, =fops
  mov r0, #FOPS_RELEASE
  add r0, r1, r0, lsl #2
  str r2, [r0]
  # fops.read = lddia_read
  adr r2, lddia_read
  ldr r1, =fops
  mov r0, #FOPS_READ
  add r0, r1, r0, lsl #2
  str r2, [r0]
  # fops.write = lddia_write
  adr r2, lddia_write
  ldr r1, =fops
  mov r0, #FOPS_WRITE
  add r0, r1, r0, lsl #2
  str r2, [r0]
  # printk(msg_load)
  ldr r0, =msg_load
  bl printk
  # register_chrdev(0, dev_name, &fops)
  ldr r2, =fops
  ldr r1, =dev_name
  mov r0, #0
  bl register_chrdev
  # printk(msg_major, major)
  ldr r2, =major
  str r0, [r2]
  mov r1, r0
  ldr r0, =msg_major
  bl printk
  # return 0
  mov r0, #0
  pop {pc}
  .end
