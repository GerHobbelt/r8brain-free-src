UNAME := $(shell uname)

ifeq ($(UNAME),Linux)
	TOOLCHAIN = $(ANDROID_NDK_HOME)/toolchains/llvm/prebuilt/linux-x86_64
endif
ifeq ($(UNAME),Darwin)
	TOOLCHAIN = $(ANDROID_NDK_HOME)/toolchains/llvm/prebuilt/darwin-x86_64
endif

CC = $(TOOLCHAIN)/bin/aarch64-linux-android30-clang
CPP = $(TOOLCHAIN)/bin/aarch64-linux-android30-clang
AR = $(TOOLCHAIN)/bin/llvm-ar
CFLAGS = -std=c17 -O3 -fstrict-aliasing -pedantic -Wall -Wextra
CPPFLAGS = -std=c++17 -O3 -fstrict-aliasing -pedantic -Wall -Wextra

TARGET = libr8brain-android30.a
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
