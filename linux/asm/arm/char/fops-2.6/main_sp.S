#=======================================================================
# Linux Device Driver for ARM in Assembly
# This file can be distributed or modified under GPL license.
# http://steward-fu.github.io/website/index.htm
# Steward 2016/02/15
#=======================================================================
.include "/home/user/Data/n900/ldd/asm/char/fops-2.6/main.inc"

.section .data
dev_no:   .zero          4; .align
kdev:     .zero          4; .align
major:    .zero          1; .align
buffer:   .zero        255; .align 
fops:     .zero _fops_size; .align

.section .text
THIS_MODULE: .word  __this_module; .align
dev_name:    .asciz "lddia";       .align

.section .text
#=======================================================================
# description:
#   open function for file operation
#
# parameter:
#   r0: struct inode*
#   r1: struct file*
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
#   close function for file operation
#
# parameter:
#   r0: struct inode*
#   r1: struct file*
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
#   read function for file operation
#
# parameter:
#   r0: struct file* filep
#   r1: char __user* buff
#   r2: size_t count
#   r3: loff_t* offp
#
# return:
#   read length
#=======================================================================
lddia_read:
  push {lr}
  # printk()
  _push _r0, _sz, "lddia, read\n"
  _call printk

  # return 0
  mov r0, #0
  pop {pc}

#=======================================================================
# description:
#   write function for file operation
#
# parameter:
#   r0: struct file* filep
#   r1: char __user* buff
#   r2: size_t count
#   r3: loff_t* offp
#
# return:
#   write length
#=======================================================================
lddia_write:
  push {r4, r5, lr}
  mov r4, r1
  mov r5, r2
  # memset(buffer, 0, sizeof(buffer))
  _push _r2, _dw, 255
  _push _r1, _dw, 0
  _push _r0, _va, buffer
  _call memset

  # memcpy(buffer, buff, count)
  # it is better to use _copy_from_user than this one
  _push _r2, _rn, r5
  _push _r1, _rn, r4
  _push _r0, _va, buffer
  _call memcpy

  # printk()
  _push _r1, _va, buffer
  _push _r0, _sz, "lddia, write buffer: %s"
  _call printk

  # return count
  mov r0, r5
  pop {r4, r5, pc}

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
  # fops.read  = lddia_read
  # fops.write = lddia_write
  # fops.close = lddia_close
  _set_fops_struct fops, _fops_owner,   THIS_MODULE
  _set_fops_struct fops, _fops_open,    lddia_open
  _set_fops_struct fops, _fops_read,    lddia_read
  _set_fops_struct fops, _fops_write,   lddia_write
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
