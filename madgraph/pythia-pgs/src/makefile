STDHEP_DIR = ../libraries/PGS4
PYDIR = ../libraries/pylib
PGS = ../libraries/PGS4
LHAPDF = ../libraries/lhapdf
THISDIR = ${PWD}

include make_opts
UNAME = $(shell uname)
SUNAME = $(shell uname | sed s/[_-].*//)
ifeq "$(SUNAME)" "CYGWIN"
    XLIBS1 = -Wl,-u,_WinMain@16
    XLIBS2 = -lrpc -lg2c -lm
endif
ifeq "$(UNAME)" "Darwin"
    XLIBS2 = $(DARWINLIBS)
endif

FF = $(FC)
ifeq "$(FF)" ""
    FF = g77
endif
FFLAGS = -O -fno-automatic -I$(PGS)/src

LDIRS = -L${STDHEP_DIR}/lib -L${PYDIR}/lib -L${LHAPDF}/lib 
LIBS1 = ${XLIBS1} -ltauola -lpythiaext -lstdhep -lFmcfio \
	-lLHAPDFlocal ${XLIBS2}

OBJS = 	ME2pythia.o getjet.o ktclusdble.o pgs_ranmar.o pydata.o
LIBS = 	libstdhep libpythia libLHAPDFlocal libtauola libFmcfio
LINKS = mass_width_2004.mc pgs clean_output PDFsets pydata.f

.f.o:
	${FF} ${FFLAGS} -c $<

all: ${LINKS} pythia hep2lhe

cleanall: clean cleanlibs

clean:
	rm -f pythia hep2lhe *.o ${LINKS}

cleanlibs:
	cd ${PGS}; make clean; rm -v lib/*; cd ..; \
	cd ${PYDIR}; make clean; rm -v lib/*; cd ..; \
	cd ${LHAPDF}; make clean; rm -v lib/*; cd ..;

pythia: pythia.o ${OBJS} ${LIBS}
	${FF} ${FFLAGS} -o $@ $< ${OBJS} ${LDIRS} ${LIBS1}

hep2lhe: hep2lhe.o ${OBJS} ${LIBS}
	${FF} ${FFLAGS} -o $@ $< ${OBJS} ${LDIRS} ${LIBS1}

pgs:    $(PGS)/examples/olympics
	ln -sf $(PGS)/examples/olympics pgs

clean_output:  $(PGS)/examples/clean_output
	ln -sf $(PGS)/examples/clean_output

libstdhep:
	cd ${STDHEP_DIR}; mkdir -p lib; make stdhep; make mcfio

libFmcfio:
	cd ${STDHEP_DIR}; mkdir -p lib; make mcfio

libtauola:
	cd ${STDHEP_DIR}; mkdir -p lib; make tauola

libpythia:
	cd ${PYDIR}; mkdir -p lib; make all

libpgs:
	cd ${PGS}; mkdir -p lib; make all

libLHAPDFlocal:
	cd ${LHAPDF}; mkdir -p lib; export FC=${FC};./configure --prefix=`pwd` --datadir=${THISDIR}; \
	make; make install

mass_width_2004.mc:
	ln -sf ${STDHEP_DIR}/examples/mass_width_2004.mc  .        

PDFsets:
	ln -sf lhapdf/PDFsets

pydata.f:
	ln -sf ${PYDIR}/src/pydata.f

$(PGS)/examples/olympics: libpythia libpgs libstdhep
	cd $(PGS);make examples

$(PGS)/examples/clean_output: libpythia libpgs libstdhep
	cd $(PGS);make examples
