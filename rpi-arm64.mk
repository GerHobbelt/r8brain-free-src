AR = $(HOME)/aarch64-rpi4-linux-gnu/bin/aarch64-rpi4-linux-gnu-ar
CC = $(HOME)/aarch64-rpi4-linux-gnu/bin/aarch64-rpi4-linux-gnu-gcc
CPP = $(HOME)/aarch64-rpi4-linux-gnu/bin/aarch64-rpi4-linux-gnu-g++

CFLAGS = -std=c17 -O3 -fstrict-aliasing -pedantic -Wall -Wextra \
--sysroot="$(HOME)/aarch64-rpi4-linux-gnu/aarch64-rpi4-linux-gnu/sysroot" \
-B"$(HOME)/aarch64-rpi4-linux-gnu/bin/aarch64-rpi4-linux-gnu-"

CPPFLAGS = -std=c++17 -O3 -fstrict-aliasing -pedantic -Wall -Wextra \
--sysroot="$(HOME)/aarch64-rpi4-linux-gnu/aarch64-rpi4-linux-gnu/sysroot" \
-B"$(HOME)/aarch64-rpi4-linux-gnu/bin/aarch64-rpi4-linux-gnu-"

TARGET = libr8brain-rpi-arm64.a
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
