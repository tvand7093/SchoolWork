SYMFORMAT=dwarf
FORMAT=elf

main: main.o 
	gcc -m32 -g -nostartfiles -o main main.o

main.o: main.asm
	nasm -f $(FORMAT) -g -F $(SYMFORMAT) main.asm

clean:
	rm *.o *~ main

all: main

gcd.o: gcd.c
	gcc -c99 -g -Wall -pedantic gcd.c -o gcd.o
gcd: gcd.o
	gcc -g -Wall -pedantic gcd.o -o gcd
build: 
	clear; make clean; make all;
