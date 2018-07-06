obj-m += ldd.o
ldd-objs:= main.o
all:
	as -o main.o main.S
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
