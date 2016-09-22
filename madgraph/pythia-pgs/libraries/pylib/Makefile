SRCS := $(wildcard src/*.f)
OBJS = ${SRCS:.f=.o}

all: 
	cd src;make all; cd ..

clean:
	rm lib/libpythiaext.a; rm src/*.o
