# -----------------------------------------------------------------
# PGS 4.0 Main Makefile
#
#                           Jesse Thaler, Natalia Toro   April 2006
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# General definitions
# -----------------------------------------------------------------
include ../../src/make_opts

MAKE=make
COMPILE=$(FC)
ifeq "$(COMPILE)" ""
	COMPILE = g77
endif
COMPILE-ARGS=  -fno-automatic -c

PGS=.
LIB=$(PGS)/lib
LOG=$(PGS)/log
SRC=$(PGS)/src
EXAMPLES=examples
STDHEP_DIR=$(SRC)/stdhep-dir
ALL_LIBS=lib $(LIB)/libpgslib.a $(LIB)/libtauola.a $(LIB)/libstdhep.a $(LIB)/libFmcfio.a $(LIB)/libexthep.a
CYGWIN_LIBS=   # blank if not using CygWin

# -----------------------------------------------------------------
# Platform specific definitions
# -----------------------------------------------------------------

UNAME = $(shell uname)
SUNAME = $(shell uname | sed s/[_-].*//)

ifeq "$(SUNAME)" "CYGWIN"
    CYGWIN_LIBS=-lrpc
endif

ifeq "$(UNAME)" "Darwin"
    CYGWIN_LIBS=$(DARWINLIBS)
endif
PYDIR = ../../libraries/pylib
ifeq "$(UNAME)" "Linux"
   CYGWIN_LIBS=-L$(PYDIR)/lib -lpythiaext
endif
# -----------------------------------------------------------------
# Makefile body
# -----------------------------------------------------------------

all: lib pgslib tauola stdhep exthep mcfio examples 

lib:
	-test -d lib || mkdir -p lib

exthep:  $(LIB)/libexthep.a

examples: $(EXAMPLES)/olympics $(EXAMPLES)/mass_width_2004.mc $(EXAMPLES)/clean_output

pgslib: lib $(LIB)/libpgslib.a

tauola: lib $(LIB)/libtauola.a

stdhep: lib $(LIB)/libstdhep.a

mcfio: lib $(LIB)/libFmcfio.a

clean: 
	-rm -f */*/*/*/*.o
	-rm $(LIB)/libpgslib.a  
	-rm $(LIB)/libtauola.a  
	-rm $(LIB)/libstdhep.a  
	-rm $(LIB)/libFmcfio.a 
	-rm $(LIB)/libexthep.a  	
	-rm $(EXAMPLES)/olympics
	-rm $(EXAMPLES)/clean_output
	-cd src/stdhep-dir;make clean;cd -


$(LIB)/libexthep.a: $(SRC)/exthep/exthep.f   $(SRC)/exthep/atoher.f \
	 $(SRC)/exthep/atopyt.f
	@echo
	@echo ----- Now compiling EXTHEP ----- 
	@echo
#	(cd src; $(MAKE) pythia) > $(LOG)/make-pythia.log
	$(COMPILE) $(COMPILE-ARGS) -o $(LIB)/exthep.o $(SRC)/exthep/exthep.f
	$(COMPILE) $(COMPILE-ARGS) -o $(LIB)/atoher.o $(SRC)/exthep/atoher.f	
	$(COMPILE) $(COMPILE-ARGS) -o $(LIB)/atopyt.o $(SRC)/exthep/atopyt.f	
	ar -cr $(LIB)/libexthep.a $(LIB)/exthep.o  $(LIB)/atoher.o \
	$(LIB)/atopyt.o
	ranlib $(LIB)/libexthep.a
	rm $(LIB)/exthep.o  $(LIB)/atoher.o $(LIB)/atopyt.o

$(LIB)/libherwig.a: $(SRC)/herwig.f
	@echo
	@echo ----- Now compiling HERWIG ----- 
	@echo
#	(cd src; $(MAKE) herwig) > $(LOG)/make-herwig.log
	$(COMPILE) $(COMPILE-ARGS) -o $(LIB)/herwig.o $(SRC)/herwig.f
	ar -cr $(LIB)/libherwig.a $(LIB)/herwig.o
	ranlib $(LIB)/libherwig.a
	rm $(LIB)/herwig.o

$(LIB)/libtauola.a: $(SRC)/tauola.f
	@echo
	@echo ----- Now compiling TAUOLA ----- 
	@echo
#	(cd src; $(MAKE) tauola) > $(LOG)/make-tauola.log
	$(COMPILE) $(COMPILE-ARGS) -o $(LIB)/tauola.o $(SRC)/tauola.f
	ar -cr $(LIB)/libtauola.a $(LIB)/tauola.o
	ranlib $(LIB)/libtauola.a
	rm $(LIB)/tauola.o

$(LIB)/libstdhep.a: 
	@echo
	@echo ----- Now compiling STDHEP -----
	@echo
#	(cd src; $(MAKE) stdhep) > $(LOG)/make-stdhep.log
	cd $(STDHEP_DIR); make binlib; make stdhep
	cp $(STDHEP_DIR)/lib/libstdhep.a $(LIB)/libstdhep.a
	ranlib $(LIB)/libstdhep.a

$(LIB)/libpgslib.a: $(SRC)/pgslib.f
	@echo
	@echo ----- Now compiling PGSLIB -----
	@echo
#	(cd src; $(MAKE) pgslib) > $(LOG)/make-pgslib.log
	$(COMPILE) $(COMPILE-ARGS) -o $(LIB)/pgslib.o $(SRC)/pgslib.f
	ar -cr $(LIB)/libpgslib.a $(LIB)/pgslib.o
	ranlib $(LIB)/libpgslib.a
	rm $(LIB)/pgslib.o

$(LIB)/libFmcfio.a:
	@echo
	@echo ----- Now compiling MCFIO ----- 
	@echo
	cd $(STDHEP_DIR); make binlib; make mcfio
	cp $(STDHEP_DIR)/lib/libFmcfio.a $(LIB)/libFmcfio.a
	ranlib $(LIB)/libFmcfio.a

$(EXAMPLES)/%: $(EXAMPLES)/pgs_%.f $(ALL_LIBS)
	@echo
	@echo ----- Now compiling $@ -----
	@echo
	$(COMPILE)  -fno-automatic -o $@ $<  \
            -L$(LIB) -lpgslib  -ltauola  \
            -lstdhep -lexthep -lFmcfio $(CYGWIN_LIBS); chmod +x $@

$(EXAMPLES)/clean_output: $(EXAMPLES)/CLEAN/clean_lhco_output.f
	cd $(EXAMPLES)/CLEAN;make

$(EXAMPLES)/mass_width_2004.mc:
	cp $(STDHEP_DIR)/mass_width_2004.mc $(EXAMPLES)/mass_width_2004.mc


olympics.sh:
	-mkdir input
	-mkdir output
	cp examples/cards/*.pyt input
	cp examples/olympics.sh olympics.sh
	chmod +x olympics.sh
