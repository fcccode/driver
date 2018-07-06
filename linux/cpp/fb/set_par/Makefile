obj-m += main.o
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	gcc app.cpp -o app `sdl-config --cflags --libs`
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
	rm -f app.o app
