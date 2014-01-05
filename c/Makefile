CFLAGS=-O3 -Wall -I./include
OBJS=include/euler.o \
		 include/sieve.o

test_sieve : test_sieve.c $(OBJS)
	$(CC) $(CFLAGS) -o sieve $< $(OBJS)

problem_% : problem_%.c $(OBJS)
	$(CC) $(CFLAGS) -o $@ $< $(OBJS)

clean :
	rm -f problem_???
	find ./ -iname '*.o' | xargs rm -f
