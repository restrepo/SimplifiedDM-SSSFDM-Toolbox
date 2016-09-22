SRCS := $(wildcard *.f)
OBJS = ${SRCS:.f=.o}

include ../../../src/make_opts

FF = $(FC)
ifeq "$(FC)" ""
	FF = g77
endif

FFOPTS = -O1 -fno-automatic 


.f.o:
	$(FF) $(FFOPTS) -c $<

all: ../lib/libpythiaext.a

../lib/libpythiaext.a: ${OBJS}
	ar rcu ../lib/libpythiaext.a ${OBJS}
	ranlib ../lib/libpythiaext.a 

clean:
	rm -rf ../lib/libpythiaext.a *.o

# DO NOT DELETE
