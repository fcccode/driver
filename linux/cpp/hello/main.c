/*======================================================================
 Copyright (c) 2013 by Steward_Fu.
 All rights reserved.
 2013/3/2
======================================================================*/
#include <linux/init.h>
#include <linux/device.h>
#include <linux/module.h>
 
MODULE_AUTHOR("Steward_Fu");
MODULE_DESCRIPTION("Linux Device Driver");
MODULE_LICENSE("GPL");
 
static int __init main_init(void)
{
 printk("Steward Linux Driver Tutorial, Hello, world!\n");
 return 0;
}
 
static void __exit main_exit(void)
{
 printk("Unload it!\n");
}
 
module_init(main_init);
module_exit(main_exit);

