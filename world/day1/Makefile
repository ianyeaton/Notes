CC = gcc
CFLAGS = -g -Wall -Wextra -fsanitize=address -fsanitize=undefined

all: exe_day1

day1.o: day1.c
	$(CC) $(CFLAGS) -c day1.c -o day1.o

exe_day1: day1.o
	$(CC) $(CFLAGS) day1.o -o exe_day1

clean:
	rm -f day1.o exe_day1
