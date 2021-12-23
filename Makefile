foo.o : foo.h foo.c
	gcc -c foo.c

bar.o : bar.h bar.c
	gcc -c bar.c

main.o : main.c foo.h bar.h
	gcc -c main.c

main : foo.o bar.o main.o
	gcc foo.o bar.o main.o -o main
