//========================================================================================================
//  Basically, all of files downloaded from my website can be modified or redistributed for any purpose.
//  It is my honor to share my interesting to everybody.
//  If you find any illeage content out from my website, please contact me firstly.
//  I will remove all of the illeage parts.
//  Thanks :)
//  
//  Steward Fu
//  steward.fu@gmail.com
//  https://steward-fu.github.io/website/index.htm
//========================================================================================================*/
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fb.h>
#include <linux/init.h>

MODULE_AUTHOR("Steward_Fu");
MODULE_DESCRIPTION("Linux Device Driver");
MODULE_LICENSE("GPL");

static void* vram_virt[320*240*4]={0};
static uint32_t lddic_palette[16]={0};
static unsigned long vram_size;
static struct fb_info fb_info;
static struct fb_var_screeninfo lddic_info;
static struct fb_fix_screeninfo lddic_fix = {
	.id = "lddic_fb",
	.type = FB_TYPE_PACKED_PIXELS,
	.xpanstep =	1,
	.ypanstep =	1,
	.ywrapstep = 1,
	.accel = FB_ACCEL_NONE,
};

static struct fb_ops lddic_ops = {
	.fb_fillrect	= cfb_fillrect,
	.fb_copyarea	= cfb_copyarea,
	.fb_imageblit	= cfb_imageblit,
};

int __init lddic_init(void)
{
  int ret=-1;

  printk("%s++\n", __func__);
	lddic_info.xres = 320;
	lddic_info.yres = 240;
	lddic_info.xres_virtual = lddic_info.xres;
	lddic_info.yres_virtual = lddic_info.yres;
	lddic_info.bits_per_pixel = 32;
	vram_size = (lddic_info.xres * lddic_info.yres * lddic_info.bits_per_pixel) / 8;

	fb_info.screen_base = (void*)vram_virt;
	fb_info.fbops = &lddic_ops;
	fb_info.var = lddic_info;
	fb_info.fix = lddic_fix;
	fb_info.fix.smem_start = vram_virt;
	fb_info.fix.smem_len = vram_size;
	fb_info.fix.line_length = (lddic_info.xres * lddic_info.bits_per_pixel) / 8;
	fb_info.fix.visual = FB_VISUAL_TRUECOLOR;
	fb_info.pseudo_palette = &lddic_palette;
	fb_info.flags = FBINFO_DEFAULT;
	fb_alloc_cmap(&fb_info.cmap, 256, 0);
	ret = register_framebuffer(&fb_info);
  printk("%s--(ret=%d)\n", __func__, ret);
	return 0;
}

static void __exit lddic_cleanup(void)
{
  printk("%s++\n", __func__);
	unregister_framebuffer(&fb_info);
  printk("%s--\n", __func__);
}

module_init(lddic_init);
module_exit(lddic_cleanup);

