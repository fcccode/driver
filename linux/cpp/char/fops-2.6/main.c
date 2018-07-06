/*======================================================================
 Linux Device Driver in C/CPP by Steward
 2016/02/15
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

#define DRIVER_NAME "lddic"

int major=-1;
struct cdev *kdev;
dev_t dev_no;

/*======================================================================
description:
 file operation for open() function

parameter:
 inode: inode information
 filep: file infomation

return:
 errno
======================================================================*/
int lddic_open(struct inode* inode, struct file* filep)
{
 printk("lddic, open\n");
 return 0;
}

/*======================================================================
description:
 file operation for close() function

parameter:
 inode: inode information
 filep: file infomation

return:
 errno
======================================================================*/
int lddic_close(struct inode* inode, struct file* filep)
{
 printk("lddic, close\n");
 return 0;
}

/*======================================================================
description:
 file operation for read() function

parameter:
 filep: file infomation
 buff: buffer back to user
 count: buffer length
 offp: offset information

return:
 errno
======================================================================*/
int lddic_read(struct file* filep, char __user *buff, size_t count, loff_t *offp)
{
 printk("lddic, read\n");
 return 0;
}

/*======================================================================
description:
 file operation for write() function

parameter:
 filep: file infomation
 buff: buffer to kernel
 count: buffer length
 offp: offset information

return:
 errno
======================================================================*/
int lddic_write(struct file* filep, const char __user *buff, size_t count, loff_t *offp)
{
 char buffer[255]={0};

 memcpy(buffer, buff, count);
 printk("lddic, write buffer: %s", buffer);
 return count;
}

// file operation forour device driver
struct file_operations lddic_ops = {
 .owner = THIS_MODULE,
 .open = lddic_open,
 .release = lddic_close,
 .read = lddic_read,
 .write = lddic_write
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
 printk("lddic, load it!\n");
 //major = register_chrdev(0, DRIVER_NAME, &lddic_ops);
 alloc_chrdev_region(&dev_no, 0, 1, DRIVER_NAME);
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
 //unregister_chrdev(major, DRIVER_NAME);
 cdev_del(kdev);
 unregister_chrdev_region(dev_no, 1);
 printk("lddic, unload it!\n");
}

// redefine load/unload function
module_init(lddic_init);
module_exit(lddic_exit);

