CC = powerpc-eabivle-gcc

CFLAGS = -mpc = e200z7 -msoft-float -Wall -nostlib -nostartfiles -I./Bootloader
LDFILE = linker/Bootloader.ld

SRC = Startup/C_RunTime.s \
	  Bootloader/bl_main.c

all: Bootloader.elf

Bootloader.elf: $(SRC)
	$(CC) $(CFLAGS) -T$(LDFILE) -o Bootloader.elf

Clean:
	rm -f Bootloader.elf