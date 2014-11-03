CC=gcc
CFLAGS=-O0 -Wall -I./include --std=c99 -g
LIBS=-lgmp
OBJS=include/euler.o \
		 include/bitfield.o

test : test.c $(OBJS)
	$(CC) $(CFLAGS) -o test $< $(OBJS)

test_sieve : test_sieve.c $(OBJS)
	$(CC) $(CFLAGS) -o test_sieve $< $(OBJS)

problem_% : problem_%.c $(OBJS)
	$(CC) $(CFLAGS) -o $@ $< $(OBJS) $(LIBS)

clean :
	rm -f problem_???
	find ./ -iname '*.o' -or -iname '*.dSYM' | xargs rm -fr
