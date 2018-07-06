/*======================================================================
 Linux Application in C/CPP.
 This file can be distributed or modified under GPL license.
 http://steward-fu.github.io/website/index.htm
 Steward 2016/02/17
======================================================================*/
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <linux/ioctl.h>

#define _APP_BASE      0x00
#define _APP_IOCTL_CMD _IO(_APP_BASE, 0)
#define _APP_IOCTL_SET _IOR(_APP_BASE, 1, int)
#define _APP_IOCTL_GET _IOW(_APP_BASE, 2, int)
#define _APP_IOCTL_BID _IOWR(_APP_BASE, 3, int)

/*======================================================================
description:
 main entry point

parameter:
 argc: arg number
 argv: arg data

return:
 errno
======================================================================*/
int main(int argc, char** argv)
{
  int fd=-1;

  printf("%d %d\n", _IOC_READ, _IOC_WRITE);

  printf("app, run it!\n");
  fd = open("/dev/lddic", O_RDWR);
  if(fd == -1){
    printf("app, failed to open lddic!\n");
    return -1;
  }
  // command only
  printf("app, ioctl _APP_IOCTL_CMD(0x%X): 0\n", _APP_IOCTL_CMD);
  ioctl(fd, _APP_IOCTL_CMD, 0);

  // read from kernel
  printf("app, ioctl _APP_IOCTL_GET(0x%X): 1\n", _APP_IOCTL_GET);
  ioctl(fd, _APP_IOCTL_GET, 1);

  // write to kernel
  printf("app, ioctl _APP_IOCTL_SET(0x%X): 2\n", _APP_IOCTL_SET);
  ioctl(fd, _APP_IOCTL_SET, 2);

  // read and write with kernel
  printf("app, ioctl _APP_IOCTL_BID(0x%X): 3\n", _APP_IOCTL_BID);
  ioctl(fd, _APP_IOCTL_BID, 3);

  close(fd);
  printf("app, exit!\n");
  return 0;
}
