subdirs =  "./SPHENO" "./calchep" "./micromegas"
subdirs_install = 
subdirs_clean =  "./SPHENO" "./calchep" "./micromegas"

all: subdirs_all

clean: subdirs_clean

subdirs_all:
	for dir in $(subdirs); do $(MAKE) -C $$dir || exit 1; done
	for dir in $(subdirs_install); do $(MAKE) -C $$dir install || exit 1; done

subdirs_clean:
	for dir in $(subdirs_clean); do $(MAKE) -C $$dir clean || exit 1; done

.PHONY: all clean subdirs_all subdirs_clean
