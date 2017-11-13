#this is make file
hellol.out:max.o min.o hello.c
	gcc max.o min.o hello.c 
max.o:max.c
	gcc -c max.c
min.o:min.c
	gcc -c min.c