#this is make file
hello:max.o min.o hello.c
	gcc max.o min.o hello.c -o hello
max.o:max.c
	gcc -c max.c
min.o:min.c
	gcc -c min.c
