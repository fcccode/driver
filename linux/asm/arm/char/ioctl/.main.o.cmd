cmd_/home/steward/Downloads/gh_linux_driver/asm/arm/char/ioctl/main.o := gcc -Wp,-MD,/home/steward/Downloads/gh_linux_driver/asm/arm/char/ioctl/.main.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/4.9/include -I/home/steward/Downloads/pandora-kernel/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /home/steward/Downloads/pandora-kernel/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables  -D__LINUX_ARM_ARCH__=7 -march=armv7-a -mtune=cortex-a8 -include asm/unified.h -msoft-float      -DMODULE  -c -o /home/steward/Downloads/gh_linux_driver/asm/arm/char/ioctl/main.o /home/steward/Downloads/gh_linux_driver/asm/arm/char/ioctl/main.S

source_/home/steward/Downloads/gh_linux_driver/asm/arm/char/ioctl/main.o := /home/steward/Downloads/gh_linux_driver/asm/arm/char/ioctl/main.S

deps_/home/steward/Downloads/gh_linux_driver/asm/arm/char/ioctl/main.o := \
  /home/steward/Downloads/pandora-kernel/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \

/home/steward/Downloads/gh_linux_driver/asm/arm/char/ioctl/main.o: $(deps_/home/steward/Downloads/gh_linux_driver/asm/arm/char/ioctl/main.o)

$(deps_/home/steward/Downloads/gh_linux_driver/asm/arm/char/ioctl/main.o):
