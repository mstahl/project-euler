CFLAGS=-O3 -Wall -I./include

problem_% : problem_%.c include/euler.o
	$(CC) $(CFLAGS) -o $@ $< include/euler.o

clean :
	rm problem_???
