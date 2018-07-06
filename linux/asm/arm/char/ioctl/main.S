#=======================================================================
# Linux Device Driver for ARM in Assembly
# This file can be distributed or modified under GPL license.
# http://steward-fu.github.io/website/index.htm
# Steward 2016/02/17
#=======================================================================
.include "/home/steward/Downloads/gh_linux_driver/asm/arm/char/ioctl/main.inc"
.global init_module
.global cleanup_module

.section .modinfo
__module_kernel_version: .asciz "kernel_version=2.6.28";    .align 
__module_license:        .asciz "license=GPL";              .align 
__module_author:         .asciz "author=Steward";           .align 
__module_description:    .asciz "description=Linux Driver"; .align

.section .data
dev_no:   .zero          4; .align
kdev:     .zero          4; .align
major:    .zero          1; .align
fops:     .zero _fops_size; .align

.section .rodata
THIS_MODULE: .word  __this_module; .align
dev_name:    .asciz "lddia";       .align

.section .text
#=======================================================================
# description:
#   open() function for file operation
#
# parameter:
#   r0: struct inode* inode
#   r1: struct file* flip
#
# return:
#   errno
#=======================================================================
lddia_open:
  push {lr}
  # printk()
  _push _r0, _sz, "lddia, open\n"
  _call printk

  # return 0
  mov r0, #0
  pop {pc}

#=======================================================================
# description:
#   close() function for file operation
#
# parameter:
#   r0: struct inode* inode
#   r1: struct file* flip
#
# return:
#   errno
#=======================================================================
lddia_close:
  push {lr}
  # printk()
  _push _r0, _sz, "lddia, close\n"
  _call printk

  # return 0
  mov r0, #0
  pop {pc}

#=======================================================================
# description:
#   ioctl() function for file operation
#
# parameter:
#   r0: struct inode* inode
#   r1: struct file* filp
#   r2: unsigned int cmd
#   r3: unsigned long arg
#
# return:
#   read length
#=======================================================================
lddia_ioctl:
  push {lr}
  # printk()
  mov r1, r2
  mov r2, r3
  _push _r0, _sz, "lddia, ioctl cmd:0x%X, arg:0x%X\n"
  _call printk

  # return 0
  mov r0, #0
  pop {pc}

#=======================================================================
# description:
#   unload driver
#
# parameter:
#   none
#
# return:
#   nothing
#=======================================================================
cleanup_module:
  push {lr}
  .if _use_kernel == 24
    # unregister(major, dev_name)
    _push _r1, _va, dev_name
    _push _r0, _vv, major
    _call unregister_chrdev
  .else
    # cdev_del(kdev)
    _push _r0, _vv, kdev
    _call cdev_del

    # unregister_chrdev_region(dev_no, 1)
    _push _r1, _dw, 1
    _push _r0, _vv, dev_no
    _call unregister_chrdev_region
  .endif
  # printk()
  _push _r0, _sz, "lddia, unload it!\n"
  _call printk
  pop {pc}

#=======================================================================
# description:
#   load driver
#
# parameter:
#   none
#
# return:
#   errno
#=======================================================================
init_module:
  push {lr}
  # printk()
  _push _r0, _sz, "lddia, load it!\n"
  _call printk

  # fops.owner = THIS_MODULE
  # fops.open  = lddia_open
  # fops.close = lddia_close
  # fopd.ioctl = lddia_ioctl
  _set_fops_struct fops, _fops_owner,   THIS_MODULE
  _set_fops_struct fops, _fops_open,    lddia_open
  _set_fops_struct fops, _fops_ioctl,   lddia_ioctl
  _set_fops_struct fops, _fops_release, lddia_close

  .if _use_kernel == 24
    # printk()
    _push _r0, _sz, "lddia, kernel 2.4\n"
    _call printk

    # major = register_chrdev(0, dev_name, &fops)
    _push _r2, _va, fops
    _push _r1, _va, dev_name
    _push _r0, _dw, 0
    _call register_chrdev
    ldr r1, =major
    str r0, [r1]
  .else 
    # printk()
    _push _r0, _sz, "lddia, kernel 2.6\n"
    _call printk

    # alloc_chrdev_region(&dev_no, 0, 1, dev_name)
    _push _r3, _va, dev_name
    _push _r2, _dw, 1
    _push _r1, _dw, 0
    _push _r0, _va, dev_no
    _call alloc_chrdev_region

    # kdev = cdev_alloc()
    _call cdev_alloc
    ldr r1, =kdev
    str r0, [r1]

    # kdev->owner = THIS_MODULE
    # kdev->ops   = &fops
    _set_cdev_struct kdev, _cdev_owner, THIS_MODULE
    _set_cdev_struct kdev, _cdev_fops, fops

    # cdev_add(kdev, dev_no, 1)
    _push _r2, _dw, 1
    _push _r1, _vv, dev_no 
    _push _r0, _vv, kdev
    _call cdev_add

    # major = MAJOR(dev_no)
    MAJOR dev_no
    ldr r1, =major
    str r0, [r1]
  .endif
  # printk()
  _push _r1, _vv, major
  _push _r0, _sz, "lddia, major number is %d\n"
  _call printk

  # return 0
  mov r0, #0
  pop {pc}
 .end
