#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = KBUILD_MODNAME,
 .init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
 .exit = cleanup_module,
#endif
 .arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0x48efb5b, "struct_module" },
	{ 0x7c9514d3, "cfb_imageblit" },
	{ 0x7c89140a, "cfb_copyarea" },
	{ 0xaca3448e, "cfb_fillrect" },
	{ 0x53182b02, "register_framebuffer" },
	{ 0x7a890c8, "fb_alloc_cmap" },
	{ 0x9d669763, "memcpy" },
	{ 0xc5b2c550, "unregister_framebuffer" },
	{ 0xea147363, "printk" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";


MODULE_INFO(srcversion, "551ED25A67D6EA11BDC43A2");
