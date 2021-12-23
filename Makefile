CC = gcc
CFLAGS = -Wall -O2
OBJS = foo.o bar.o main.o

%.o : %.c
	$(CC) $(CFLAGS) -c $<

main : $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o main

.PHONY : clean
clean:
	rm -f $(OBJS) main

-include $(OBJS:.o=.d)
