SYMFORMAT=dwarf
FORMAT=elf

clean:
	rm *.o *~ gcd
all: gcd

gcd.o: gcd.c
	nasm -f $(FORMAT) -g -F $(SYMFORMAT) gcd.asm
gcd: gcd.o
	gcc -m32 -g -nostartfiles -o gcd gcd.o
build: 
	clear; make clean; make all;
