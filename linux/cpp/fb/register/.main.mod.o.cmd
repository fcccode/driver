cmd_/home/user/Data/gh_linux_driver/cpp/fb/register/main.mod.o := arm-linux-gcc -Wp,-MD,/home/user/Data/gh_linux_driver/cpp/fb/register/.main.mod.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabi/4.2.1/include -D__KERNEL__ -Iinclude  -I/usr/src/2.6.28.10-power53/arch/arm/include -include include/linux/autoconf.h -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Os -marm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls -g -Wdeclaration-after-statement -Wno-pointer-sign -fwrapv  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(main.mod)"  -D"KBUILD_MODNAME=KBUILD_STR(main)"  -DMODULE -c -o /home/user/Data/gh_linux_driver/cpp/fb/register/main.mod.o /home/user/Data/gh_linux_driver/cpp/fb/register/main.mod.c

deps_/home/user/Data/gh_linux_driver/cpp/fb/register/main.mod.o := \
  /home/user/Data/gh_linux_driver/cpp/fb/register/main.mod.c \
    $(wildcard include/config/module/unload.h) \
  include/linux/module.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/markers.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/sysfs.h) \
  include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  include/linux/stddef.h \
  include/linux/compiler.h \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/compiler-gcc4.h \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  include/linux/poison.h \
  include/linux/prefetch.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbd.h) \
    $(wildcard include/config/lsf.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
  include/linux/posix_types.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/posix_types.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/types.h \
  include/asm-generic/int-ll64.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/processor.h \
    $(wildcard include/config/mmu.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
    $(wildcard include/config/smp.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/hwcap.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/cache.h \
    $(wildcard include/config/aeabi.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/system.h \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/memory.h \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem.h) \
  include/linux/const.h \
  arch/arm/plat-omap/include/mach/memory.h \
    $(wildcard include/config/arch/omap1.h) \
    $(wildcard include/config/arch/omap2.h) \
    $(wildcard include/config/arch/omap3.h) \
    $(wildcard include/config/arch/omap15xx.h) \
    $(wildcard include/config/fb/omap/consistent/dma/size.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/sizes.h \
  include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/out/of/line/pfn/to/page.h) \
  include/linux/linkage.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/linkage.h \
  include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
    $(wildcard include/config/x86.h) \
  include/linux/typecheck.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/irqflags.h \
  include/asm-generic/cmpxchg-local.h \
  include/asm-generic/cmpxchg.h \
  include/linux/stat.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/stat.h \
  include/linux/time.h \
  include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/spinlock/sleep.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/printk/debug.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /usr/lib/gcc/arm-linux-gnueabi/4.2.1/include/stdarg.h \
  include/linux/bitops.h \
    $(wildcard include/config/generic/find/first/bit.h) \
    $(wildcard include/config/generic/find/next/bit.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/bitops.h \
  include/asm-generic/bitops/non-atomic.h \
  include/asm-generic/bitops/fls64.h \
  include/asm-generic/bitops/sched.h \
  include/asm-generic/bitops/hweight.h \
  include/asm-generic/bitops/lock.h \
  include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  include/linux/ratelimit.h \
  include/linux/param.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/param.h \
    $(wildcard include/config/hz.h) \
  include/linux/dynamic_printk.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/byteorder.h \
  include/linux/byteorder/little_endian.h \
  include/linux/byteorder/swab.h \
  include/linux/byteorder/swabb.h \
  include/linux/byteorder/generic.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  include/asm-generic/bug.h \
  include/linux/seqlock.h \
  include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
  include/linux/stringify.h \
  include/linux/bottom_half.h \
  include/linux/spinlock_types.h \
  include/linux/spinlock_types_up.h \
  include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/generic/hardirqs.h) \
    $(wildcard include/config/prove/locking.h) \
  include/linux/spinlock_up.h \
  include/linux/spinlock_api_up.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/atomic.h \
  include/asm-generic/atomic.h \
  include/linux/math64.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/div64.h \
  include/linux/kmod.h \
  include/linux/gfp.h \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/highmem.h) \
  include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/unevictable/lru.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/arch/populates/node/map.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/cgroup/mem/res/ctlr.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
  include/linux/wait.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/current.h \
  include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  include/linux/init.h \
    $(wildcard include/config/hotplug.h) \
  include/linux/nodemask.h \
  include/linux/bitmap.h \
  include/linux/string.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/string.h \
  include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  include/linux/bounds.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v3.h) \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/glue.h \
    $(wildcard include/config/cpu/arm610.h) \
    $(wildcard include/config/cpu/arm710.h) \
    $(wildcard include/config/cpu/abrt/lv4t.h) \
    $(wildcard include/config/cpu/abrt/ev4.h) \
    $(wildcard include/config/cpu/abrt/ev4t.h) \
    $(wildcard include/config/cpu/abrt/ev5tj.h) \
    $(wildcard include/config/cpu/abrt/ev5t.h) \
    $(wildcard include/config/cpu/abrt/ev6.h) \
    $(wildcard include/config/cpu/abrt/ev7.h) \
    $(wildcard include/config/cpu/pabrt/ifar.h) \
    $(wildcard include/config/cpu/pabrt/noifar.h) \
  include/asm-generic/page.h \
  include/linux/memory_hotplug.h \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/memory/hotremove.h) \
  include/linux/notifier.h \
  include/linux/errno.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/errno.h \
  include/asm-generic/errno.h \
  include/asm-generic/errno-base.h \
  include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
  include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  include/linux/rwsem-spinlock.h \
  include/linux/srcu.h \
  include/linux/topology.h \
    $(wildcard include/config/sched/smt.h) \
    $(wildcard include/config/sched/mc.h) \
  include/linux/cpumask.h \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/cpumask/offstack.h) \
  include/linux/smp.h \
    $(wildcard include/config/use/generic/smp/helpers.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/topology.h \
  include/asm-generic/topology.h \
  include/linux/elf.h \
  include/linux/elf-em.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/elf.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/user.h \
  include/linux/kobject.h \
  include/linux/sysfs.h \
  include/linux/kref.h \
  include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  include/linux/marker.h \
  include/linux/tracepoint.h \
  include/linux/rcupdate.h \
    $(wildcard include/config/classic/rcu.h) \
  include/linux/percpu.h \
  include/linux/slab.h \
    $(wildcard include/config/slab/debug.h) \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/debug/slab.h) \
  include/linux/slub_def.h \
    $(wildcard include/config/slub/stats.h) \
    $(wildcard include/config/slub/debug.h) \
  include/linux/workqueue.h \
  include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  include/linux/ktime.h \
    $(wildcard include/config/ktime/scalar.h) \
  include/linux/jiffies.h \
  include/linux/timex.h \
    $(wildcard include/config/no/hz.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/timex.h \
  arch/arm/plat-omap/include/mach/timex.h \
    $(wildcard include/config/omap/32k/timer.h) \
    $(wildcard include/config/omap/32k/timer/hz.h) \
  include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects/free.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/percpu.h \
  include/asm-generic/percpu.h \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  include/linux/completion.h \
  include/linux/rcuclassic.h \
    $(wildcard include/config/rcu/cpu/stall/detector.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/local.h \
  include/asm-generic/local.h \
  include/linux/hardirq.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/preempt/rcu.h) \
  include/linux/smp_lock.h \
    $(wildcard include/config/lock/kernel.h) \
  include/linux/sched.h \
    $(wildcard include/config/sched/debug.h) \
    $(wildcard include/config/detect/softlockup.h) \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/user/sched.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/have/unstable/sched/clock.h) \
    $(wildcard include/config/preempt/bkl.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/group/sched.h) \
    $(wildcard include/config/mm/owner.h) \
  include/linux/capability.h \
  include/linux/rbtree.h \
  include/linux/mm_types.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/mmu/notifier.h) \
  include/linux/auxvec.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/auxvec.h \
  include/linux/prio_tree.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/cputime.h \
  include/asm-generic/cputime.h \
  include/linux/sem.h \
  include/linux/ipc.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/ipcbuf.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/sembuf.h \
  include/linux/signal.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/signal.h \
  include/asm-generic/signal.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/sigcontext.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/siginfo.h \
  include/asm-generic/siginfo.h \
  include/linux/fs_struct.h \
  include/linux/path.h \
  include/linux/pid.h \
  include/linux/proportions.h \
  include/linux/percpu_counter.h \
  include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
  include/linux/rtmutex.h \
    $(wildcard include/config/debug/rt/mutexes.h) \
  include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  include/linux/resource.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/resource.h \
  include/asm-generic/resource.h \
  include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
  include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  include/linux/latencytop.h \
  include/linux/cred.h \
  include/linux/aio.h \
    $(wildcard include/config/aio.h) \
  include/linux/aio_abi.h \
  include/linux/uio.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/hardirq.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/irq.h \
  arch/arm/plat-omap/include/mach/irqs.h \
    $(wildcard include/config/mach/omap/innovator.h) \
    $(wildcard include/config/twl4030/core.h) \
    $(wildcard include/config/gpio/twl4030.h) \
  arch/arm/plat-omap/include/mach/hardware.h \
    $(wildcard include/config/reg/base.h) \
    $(wildcard include/config/mach/omap/h2.h) \
    $(wildcard include/config/mach/omap/perseus2.h) \
    $(wildcard include/config/mach/omap/fsample.h) \
    $(wildcard include/config/mach/omap/h3.h) \
    $(wildcard include/config/mach/omap/h4.h) \
    $(wildcard include/config/mach/nokia/n800.h) \
    $(wildcard include/config/mach/nokia770.h) \
    $(wildcard include/config/mach/nokia/rx51.h) \
    $(wildcard include/config/mach/nokia/rx71.h) \
    $(wildcard include/config/mach/omap/2430sdp.h) \
    $(wildcard include/config/mach/omap2evm.h) \
    $(wildcard include/config/mach/omap/3430sdp.h) \
    $(wildcard include/config/mach/omap3evm.h) \
    $(wildcard include/config/mach/omap3/beagle.h) \
    $(wildcard include/config/mach/omap/ldp.h) \
    $(wildcard include/config/mach/omap/apollon.h) \
    $(wildcard include/config/mach/omap/osk.h) \
    $(wildcard include/config/mach/voiceblue.h) \
    $(wildcard include/config/mach/omap/palmte.h) \
    $(wildcard include/config/mach/omap/palmz71.h) \
    $(wildcard include/config/mach/omap/palmtt.h) \
    $(wildcard include/config/mach/sx1.h) \
  arch/arm/plat-omap/include/mach/cpu.h \
    $(wildcard include/config/arch/omap730.h) \
    $(wildcard include/config/arch/omap16xx.h) \
    $(wildcard include/config/arch/omap24xx.h) \
    $(wildcard include/config/arch/omap34xx.h) \
    $(wildcard include/config/arch/omap2420.h) \
    $(wildcard include/config/arch/omap2430.h) \
    $(wildcard include/config/arch/omap3430.h) \
  arch/arm/plat-omap/include/mach/serial.h \
  arch/arm/plat-omap/include/mach/omap730.h \
    $(wildcard include/config/base.h) \
  arch/arm/plat-omap/include/mach/omap1510.h \
  arch/arm/plat-omap/include/mach/omap16xx.h \
  arch/arm/plat-omap/include/mach/omap24xx.h \
  arch/arm/plat-omap/include/mach/omap34xx.h \
  arch/arm/plat-omap/include/mach/board-rx51.h \
    $(wildcard include/config/usb/musb/soc.h) \
  arch/arm/plat-omap/include/mach/board-nokia.h \
  arch/arm/plat-omap/include/mach/board-rx71.h \
  include/linux/irq_cpustat.h \
  /usr/src/2.6.28.10-power53/arch/arm/include/asm/module.h \
  include/linux/vermagic.h \
  include/linux/utsrelease.h \

/home/user/Data/gh_linux_driver/cpp/fb/register/main.mod.o: $(deps_/home/user/Data/gh_linux_driver/cpp/fb/register/main.mod.o)

$(deps_/home/user/Data/gh_linux_driver/cpp/fb/register/main.mod.o):
