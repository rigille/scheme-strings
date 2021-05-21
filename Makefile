CC=clang
CXX=c++
CFLAGS=-g -Wall -O3
BINS=libistring.so

all: $(BINS)

libistring.so: istring.cpp
	$(CXX) $(CFLAGS) -fPIC -shared -o $@ istring.cpp

clean:
	rm *.so
