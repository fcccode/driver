#=======================================================================
# Linux Application for ARM in Assembly
# This file can be distributed or modified under GPL license.
# http://steward-fu.github.io/website/index.htm
# Steward 2016/02/17
#=======================================================================
.include "main.inc"
.equiv _APP_BASE, 0

.section .data
fd: .zero 4; .align

.section .text
dev_name: .asciz "/dev/lddia"; .align

.section .text
.global main
#=======================================================================
# description:
#   main entry point
#
# parameter:
#   r0: argc
#   r1: argv
#
# return:
#   errno
#=======================================================================
main:
  push {lr}
  # printf()
  _push _r0, _sz, "app, run it!\n"
  _call printf

  # fd = open("lddia", O_RDWR)
  _push _r1, _dw, O_RDWR
  _push _r0, _va, dev_name
  _call open
  ldr r1, =fd
  str r0, [r1]

  # if fd == -1 then exit
  cmp r0, #-1
  bne do_ioctl

  # printf()
  _push _r0, _sz, "app, failed to open lddia\n"
  _call printf

  # exit(1)
  _push _r0, _dw, 1
  _call exit

do_ioctl:
  #define _APP_IOCTL_CMD _IO(_APP_BASE, 0)
  _IO _APP_BASE, 0
  push {r0}

  # ioctl(fd, _APP_IOCTL_CMD, 0)
  mov r1, r0
  _push _r2, _dw, 0
  _push _r0, _vv, fd
  _call ioctl

  # printf()
  pop {r1}
  _push _r0, _sz, "app, ioctl _APP_IOCTL_CMD(0x%X)\n"
  _call printf

  #define _APP_IOCTL_SET _IOR(_APP_BASE, 1, int)
  _IOR _APP_BASE, 1, 4
  push {r0}

  # ioctl(fd, _APP_IOCTL_SET, 1)
  mov r1, r0
  _push _r2, _dw, 1
  _push _r0, _vv, fd
  _call ioctl

  # printf()
  pop {r1}
  _push _r0, _sz, "app, ioctl _APP_IOCTL_SET(0x%X)\n"
  _call printf

  #define _APP_IOCTL_GET _IOW(_APP_BASE, 2, int)
  _IOW _APP_BASE, 2, 4
  push {r0}

  # ioctl(fd, _APP_IOCTL_GET, 2)
  mov r1, r0
  _push _r2, _dw, 2
  _push _r0, _vv, fd
  _call ioctl

  # printf()
  pop {r1}
  _push _r0, _sz, "app, ioctl _APP_IOCTL_GET(0x%X)\n"
  _call printf

  #define _APP_IOCTL_BID _IOWR(_APP_BASE, 3, int)
  _IOWR _APP_BASE, 3, 4
  push {r0}

  # ioctl(fd, _APP_IOCTL_BID, 3)
  mov r1, r0
  _push _r2, _dw, 3
  _push _r0, _vv, fd
  _call ioctl

  # printf()
  pop {r1}
  _push _r0, _sz, "app, ioctl _APP_IOCTL_BID(0x%X)\n"
  _call printf

  # close
  _push _r0, _vv, fd
  _call close

  # printf
  _push _r0, _sz, "app, exit!\n"
  _call printf

  # return 0
  mov r0, #0
  pop {pc}
 .end
