CXX = clang++
ZIG = zig

all: driver

# Build static library with Zig, defaults to output `libadd.a`
zig: add.cpp
	$(ZIG) build-lib add.cpp -static -target x86_64-macos.12.0 -lc -lc++

# Build static library with Clang++, defaults to output `add.o`
add.o: add.cpp
	$(CXX) -static -c add.cpp

clang: add.o
	ar rcs libadd.a add.o

# Build driver using the Zig-built library
driver: main.cpp libadd.a
	$(CXX) main.cpp libadd.a -o driver

clean:
	rm -f add.o libadd.a driver
