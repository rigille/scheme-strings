CC=clang
CFLAGS=-Wall -O3
BINS=libsimpleprocedure.so

all: $(BINS)

simple_procedure.o: simple_procedure.c
	$(CC) $(CFLAGS) -c simple_procedure.c

libsimpleprocedure.so: simple_procedure.c
	$(CC) $(CFLAGS) -fPIC -shared -o $@ simple_procedure.c -lc

simple_procedure: simple_procedure.c simple_procedure.o
	$(CC) $(CFLAGS) -o $@ $^
