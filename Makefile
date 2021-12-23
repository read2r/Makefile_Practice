CC = gcc
CFLAGS = -Wall -O2
OBJS = foo.o bar.o main.o

foo.o : foo.h foo.c
	$(CC) $(CFLAGS) -c foo.c

bar.o : bar.h bar.c
	$(CC) $(CFLAGS) -c bar.c

main.o : main.c foo.h bar.h
	$(CC) $(CFLAGS) -c main.c

main : $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o main
