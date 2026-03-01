CC = gcc
CFLAGS = -g -Wall -Wextra -fsanitize=address -fsanitize=undefined

all: day2_exe

clean: 
	rm -f day2.o day2_exe

day2.o: day2.c
	$(CC) $(CFLAGS) -c day2.c -o day2.o

day2_exe: day2.o
	$(CC) $(CFLAGS) day2.o -o day2_exe
