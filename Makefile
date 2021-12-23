CC = gcc
CFLAGS = -Wall -O2
OBJS = foo.o bar.o main.o

%.o : %.c %.h
	$(CC) $(CFLAGS) -c $<

main.o : main.c foo.h bar.h
	$(CC) $(CFLAGS) -c main.c

main : $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o main

.PHONY : clean
clean:
	rm -f $(OBJS) main
