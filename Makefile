prefix=/usr/local
exec_prefix=$(prefix)
bindir=$(exec_prefix)/bin
datarootdir=$(prefix)/share
datadir=$(datarootdir)
CC = gcc
CFLAGS = -g

all: froot1 bin2rom rom2bin programs/apple30th.rom

froot1: fake6502.o froot1.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o froot1 froot1.o fake6502.o

bin2rom: bin2rom.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o bin2rom bin2rom.o

rom2bin: rom2bin.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o rom2bin rom2bin.o

install:
	cp froot1 bin2rom rom2bin $(bindir)
	mkdir -p $(datadir)/froot-1
	cp wozmon.rom wozbasic.rom wozaci.rom programs/apple30th.rom \
	  programs/apple30th-vector.rom $(datadir)/froot-1

clean:
	rm -f froot1 bin2rom rom2bin *.o

.c.o:
	$(CC) $(CFLAGS) $(LDFLAGS) -c $<
