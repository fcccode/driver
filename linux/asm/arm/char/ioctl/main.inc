#=======================================================================
# Linux Device Driver for ARM in Assembly
# This file can be distributed or modified under GPL license.
# http://steward-fu.github.io/website/index.htm
# Steward 2016/02/17
#=======================================================================
# 24 -> 2.4
# 26 -> 2.6
.equiv _use_kernel,             26

# parameter for open() function
.equiv O_RDONLY,                0
.equiv O_WRONLY,                1
.equiv O_RDWR,                  2

# file operations definition
.equiv _fops_owner,             0
.equiv _fops_llseek,            1
.equiv _fops_read,              2
.equiv _fops_write,             3
.equiv _fops_aio_read,          4
.equiv _fops_aio_write,         5
.equiv _fops_readdir,           6
.equiv _fops_poll,              7
.equiv _fops_ioctl,             8
.equiv _fops_unlocked_ioctl,    9
.equiv _fops_compat_ioctl,      10
.equiv _fops_mmap,              11
.equiv _fops_open,              12
.equiv _fops_flush,             13
.equiv _fops_release,           14
.equiv _fops_fsync,             15
.equiv _fops_aio_fsync,         16
.equiv _fops_fasync,            17
.equiv _fops_lock,              18
.equiv _fops_sendpage,          19
.equiv _fops_get_unmapped_area, 20
.equiv _fops_check_flags,       21
.equiv _fops_dir_notify,        22
.equiv _fops_flock,             23
.equiv _fops_splice_write,      24
.equiv _fops_splice_read,       25
.equiv _fops_setlease,          26
.equiv _fops_index,             27
.equiv _fops_size,              (_fops_index << 2)

# cdev definition
.equiv _cdev_owner,     9
.equiv _cdev_fops,      10
.equiv _cdev_size,      (_kobj_size + 4 + 4 + _list_head_size + 4 + 4)
.equiv _kobj_size,      36
.equiv _list_head_size, 8

# parameter for _push macro
.equiv _r0, 0  @ r0 register
.equiv _r1, 1  @ r1 register
.equiv _r2, 2  @ r2 register
.equiv _r3, 3  @ r3 register
.equiv _sp, 4  @ sp register
.equiv _sz, 5  @ string with zero char
.equiv _dw, 6  @ data word
.equiv _db, 7  @ data byte
.equiv _va, 8  @ variable address
.equiv _vv, 9  @ variable value
.equiv _rv, 10 @ register value

# retrive from linux header file
# please keep original name
.equiv MINORBITS,      20
.equiv MINORMASK,      ((1 << MINORBITS) - 1)
.equiv _IOC_NRBITS,    8
.equiv _IOC_TYPEBITS,  8
.equiv _IOC_SIZEBITS,  14
.equiv _IOC_DIRBITS,   2
.equiv _IOC_NRMASK,    ((1 << _IOC_NRBITS) - 1)
.equiv _IOC_TYPEMASK,  ((1 << _IOC_TYPEBITS) - 1)
.equiv _IOC_SIZEMASK,  ((1 << _IOC_SIZEBITS) - 1)
.equiv _IOC_DIRMASK,   ((1 << _IOC_DIRBITS) - 1)
.equiv _IOC_NRSHIFT,   0
.equiv _IOC_TYPESHIFT, (_IOC_NRSHIFT + _IOC_NRBITS)
.equiv _IOC_SIZESHIFT, (_IOC_TYPESHIFT + _IOC_TYPEBITS)
.equiv _IOC_DIRSHIFT,  (_IOC_SIZESHIFT + _IOC_SIZEBITS)
.equiv _IOC_NONE,      0
.equiv _IOC_WRITE,     1
.equiv _IOC_READ,      2

# #define MAJOR(dev) ((unsigned int) ((dev) >> MINORBITS))
.macro MAJOR arg:req
  ldr r0, =\arg
  ldr r0, [r0]
  lsr r0, r0, #MINORBITS 
.endm

# #define MINOR(dev) ((unsigned int) ((dev) & MINORMASK))
.macro MINOR arg:req
  ldr r0, =\arg
  ldr r0, [r0]
  and r0, r0, #MINORMASK
.endm

# #define MKDEV(ma,mi) (((ma) << MINORBITS) | (mi))
.macro MKDEV ma:req, mi:req
  mov r1, #mi
  mov r0, #ma
  lsl r0, #MINORBITS
  or r0, r0, r1
.endm

# emulate push instruction
# howto: _push param1, param2, param3
#  param1: where (push to register or stack)
#    _r0, _r1, _r2, _r3: push to register
#    _sp: push to stack
#  param2: param3's data type
#    _sz: string
#    _dw: word
#    _db: byte
#    _va: variable address
#    _vv: variable value
#    _rv: register value
#  param3: data
.macro _push where:req, type:req, arg:req
  .if \type == _sz
    b l_push_sz\@
    _tmp\@: .asciz "\arg"; .align
    l_push_sz\@:
      ldr r0, =_tmp\@
  .elseif \type == _dw
    b l_push_dw\@
    _tmp\@: .word \arg; .align
    l_push_dw\@:
      ldr r0, =_tmp\@
      ldr r0, [r0]
  .elseif \type == _db
    b l_push_db\@
    _tmp\@: .byte \arg; .align
    l_push_db\@:
      ldr r0, =_tmp\@
      ldr r0, [r0]
  .elseif \type == _va
    ldr r0, =\arg
  .elseif \type == _vv
    ldr r0, =\arg
    ldr r0, [r0]
  .elseif \type == _rn
    mov r0, \arg
  .else
    .exitm
  .endif
  .if \where == _r0
  .elseif \where == _r1
    mov r1, r0
  .elseif \where == _r2
    mov r2, r0
  .elseif \where == _r3
    mov r3, r0
  .elseif \where == _sp
    push {r0}
  .else
    .exitm
  .endif
.endm

# emulate call instruction
# it includes import(.extern) declaration
.macro _call fun:req
  .extern \fun
  bl \fun
.endm

# set the item of file operation structure
# howto: _set_fops_struct param1, param2, param3
#  param1: pointer to fops strcuture
#  param2: which item to set
#  param3: data
# example: _set_fops_struct fops, _fops_open, open_function
# (in c/cpp) => struct file_operations fops = {.open = open_function};
.macro _set_fops_struct base:req, index:req, addr:req
  ldr r2, =\addr
  ldr r0, =\base
  mov r1, #\index
  add r0, r0, r1, lsl #2
  str r2, [r0]
.endm

# set the item of cdev structure
# howto: _set_cdev_struct param1, param2, param3
#  param1: pointer to cdev strcuture
#  param2: which item to set
#  param3: data
# example: _set_cdev_struct kdev, _cdev_ops, ops
# (in c/cpp) => struct cdev kdev = {.ops = &ops};
.macro _set_cdev_struct base:req, index:req, addr:req
  ldr r2, =\addr
  ldr r0, =\base
  ldr r0, [r0]
  mov r1, #\index
  add r0, r0, r1, lsl #2
  str r2, [r0]
.endm

# #define _IOC(dir, type, nr, size) \
#   (((dir)  << _IOC_DIRSHIFT)  | \
#   (((type) << _IOC_TYPESHIFT) | \
#   (((nr)   << _IOC_NRSHIFT)   | \
#   (((size) << _IOC_SIZESHIFT))
.macro _IOC dir:req, type:req, nr:req, size:req
  mov r0, #\dir
  mov r1, #\type
  mov r2, #\nr
  mov r3, #\size
  lsl r0, r0, #_IOC_DIRSHIFT
  lsl r1, r1, #_IOC_TYPESHIFT
  lsl r2, r2, #_IOC_NRSHIFT
  lsl r3, r3, #_IOC_SIZESHIFT
  orr r0, r0, r1
  orr r0, r0, r2
  orr r0, r0, r3
.endm

# #define _IO(type, nr) \
#   _IOC(_IOC_NONE, (type), (nr), 0)
.macro _IO type:req, nr:req
  _IOC _IOC_NONE, \type, \nr, 0
.endm

# #define _IOR(type, nr, size) \
#   _IOC(_IOC_READ, (type), (nr), sizeof(size))
.macro _IOR type:req, nr:req, size:req
  _IOC _IOC_READ, \type, \nr, \size
.endm

# #define _IOW(type, nr, size) \
#   _IOC(_IOC_WRITE, (type), (nr), sizeof(size))
.macro _IOW type:req, nr:req, size:req
  _IOC _IOC_WRITE, \type, \nr, \size
.endm

# #define _IOWR(type, nr, size) \
#   _IOC(_IOC_READ|_IOC_WRITE, (type), (nr), sizeof(size))
.macro _IOWR type:req, nr:req, size:req
  _IOC _IOC_READ | _IOC_WRITE, \type, \nr, \size
.endm

