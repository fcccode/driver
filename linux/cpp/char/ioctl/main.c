/*======================================================================
 Linux Device Driver in C/CPP.
 This file can be distributed or modified under GPL license
 http://steward-fu.github.io/website/index.htm
 Steward 2016/02/17
======================================================================*/
#include <linux/fs.h>
#include <linux/cdev.h>
#include <linux/init.h>
#include <linux/device.h>
#include <linux/module.h>
#include <linux/kobject.h>
 
MODULE_AUTHOR("Steward");
MODULE_DESCRIPTION("Linux Driver");
MODULE_LICENSE("GPL");

#define DEV_NAME       "lddic"
#define _APP_BASE      0x00
#define _APP_IOCTL_CMD _IO(_APP_BASE, 0)
#define _APP_IOCTL_SET _IOR(_APP_BASE, 1, int)
#define _APP_IOCTL_GET _IOW(_APP_BASE, 2, int)
#define _APP_IOCTL_BID _IOWR(_APP_BASE, 3, int)

struct cdev *kdev;
dev_t dev_no;

/*======================================================================
description:
 file operation for open() function

parameter:
 inode: inode information
 filp: file infomation

return:
 errno
======================================================================*/
int lddic_open(struct inode* inode, struct file* filp)
{
  printk("lddic, open\n");
  return 0;
}

/*======================================================================
description:
 file operation for close() function

parameter:
 inode: inode information
 filp: file infomation

return:
 errno
======================================================================*/
int lddic_close(struct inode* inode, struct file* filp)
{
  printk("lddic, close\n");
  return 0;
}

/*======================================================================
description:
 file operation for ioctl() function

parameter:
 inode: inode information
 filp: file infomation
 buff: buffer back to user
 cmd: ioctl command
 arg: ioctl argument

return:
 errno
======================================================================*/
int lddic_ioctl(struct inode *inode, struct file* filp, unsigned int cmd, unsigned long arg)
{
  switch(cmd){
  case _APP_IOCTL_CMD:
    printk("lddic, ioctl _APP_IOCTL_CMD(0x%X), arg:0x%lx\n", cmd, arg);
    break;
  case _APP_IOCTL_GET:
    printk("lddic, ioctl _APP_IOCTL_GET(0x%X), arg:0x%lx\n", cmd, arg);
    break;
  case _APP_IOCTL_SET:
    printk("lddic, ioctl _APP_IOCTL_SET(0x%X), arg:0x%lx\n", cmd, arg);
    break;
  case _APP_IOCTL_BID:
    printk("lddic, ioctl _APP_IOCTL_BID(0x%X), arg:0x%lx\n", cmd, arg);
    break;
  default:
    printk("lddic, invalid ioctl 0x%X\n", cmd);
    break;
  }
  return 0;
}

// file operation forour device driver
struct file_operations lddic_ops = {
  .owner = THIS_MODULE,
  .open = lddic_open,
  .release = lddic_close,
  .ioctl = lddic_ioctl,
};
 
/*======================================================================
description:
 load driver

parameter:
 none

return:
 errno
======================================================================*/
static int __init lddic_init(void)
{
  int major=-1;
  printk("lddic, load it!\n");
  alloc_chrdev_region(&dev_no, 0, 1, DEV_NAME);
  kdev = cdev_alloc();
  kdev->ops = &lddic_ops;
  kdev->owner = THIS_MODULE;
  cdev_add(kdev, dev_no, 1);
  major = MAJOR(dev_no);
  printk("lddic, major number is %d\n", major);
  return 0;
}
 
/*======================================================================
description:
 unload driver

parameter:
 none

return:
 nothing
======================================================================*/
static void __exit lddic_exit(void)
{
  cdev_del(kdev);
  unregister_chrdev_region(dev_no, 1);
  printk("lddic, unload it!\n");
}

// define load and unload function
module_init(lddic_init);
module_exit(lddic_exit);

