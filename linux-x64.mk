AR = ar
CC = gcc
CPP = g++

CFLAGS = -std=c17 -O3 -fstrict-aliasing -pedantic -Wall -Wextra
CPPFLAGS = -std=c++17 -O3 -fstrict-aliasing -pedantic -Wall -Wextra

TARGET = libr8brain-linux-x64.a
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
