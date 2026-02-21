CC = gcc
CFLAGS = -g -Wall

all: hello

hello.o: hello.c
	$(CC) -c hello.c -o hello.o
hello: hello.o
	$(CC) hello.o $(CFLAGS) -o hello

clean:
	rm -f hello.o
	rm -f hello
