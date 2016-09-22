#
# main StdHep makefile
#
MAKE=make

ifdef DEBUG
  DMAKE = "DEBUG=$(DEBUG)"
endif

STDHEP_DIR = .
#------------------------------------------

all: binlib mcfio stdhep

binlib:
	-test -d $(STDHEP_DIR)/bin || mkdir -p $(STDHEP_DIR)/bin
	-test -d $(STDHEP_DIR)/lib || mkdir -p $(STDHEP_DIR)/lib

mcfio:
	(cd mcfio/src; $(MAKE) $(DMAKE) all) > log.mcfio 2>&1

stdhep:
	(cd src/stdhep; $(MAKE) $(DMAKE) all) > log.stdhep 2>&1

cleanobjs:
	rm -f log.*
	cd mcfio/src; $(MAKE) cleanobjs
	cd src/stdhep; $(MAKE) $(DMAKE) cleanobjs

clean:
	rm -f log.*
	cd mcfio/src; $(MAKE) clean
	cd src/stdhep; $(MAKE) clean

#------------------------------------------

.PHONY: all clean stdhep mcfio
