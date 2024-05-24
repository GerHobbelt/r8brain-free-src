AR = $(HOME)/arm-rpi-linux-gnueabihf/bin/arm-rpi-linux-gnueabihf-ar
CC = $(HOME)/arm-rpi-linux-gnueabihf/bin/arm-rpi-linux-gnueabihf-gcc
CPP = $(HOME)/arm-rpi-linux-gnueabihf/bin/arm-rpi-linux-gnueabihf-g++

CFLAGS = -std=c17 -O3 -fstrict-aliasing -pedantic -Wall -Wextra \
--sysroot="$(HOME)/arm-rpi-linux-gnueabihf/arm-rpi-linux-gnueabihf/sysroot" \
-B"$(HOME)/arm-rpi-linux-gnueabihf/bin/arm-rpi-linux-gnueabihf-"

CPPFLAGS = -std=c++17 -O3 -fstrict-aliasing -pedantic -Wall -Wextra \
--sysroot="$(HOME)/arm-rpi-linux-gnueabihf/arm-rpi-linux-gnueabihf/sysroot" \
-B"$(HOME)/arm-rpi-linux-gnueabihf/bin/arm-rpi-linux-gnueabihf-"

TARGET = libr8brain-rpi.a
SRCSC = pffft_double/pffft_double.c
SRCSCPP = r8bbase.cpp
OBJS = $(subst .c,.o,$(SRCSC)) $(subst .cpp,.o,$(SRCSCPP))

all: $(TARGET)

$(TARGET): $(OBJS)
	$(AR) rcs $@ $(OBJS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

.cpp.o:
	$(CPP) $(CPPFLAGS) -c $< -o $@

clean:
	rm -f $(subst src,obj,$(OBJS))
