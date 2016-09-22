# -----------------------------------------------------------------
include ../../../../src/make_opts

MAKE=make
COMPILE=$(FC)
ifeq "$(COMPILE)" ""
	COMPILE = g77
endif

# -----------------------------------------------------------------
# Makefile body
# -----------------------------------------------------------------

../clean_output: clean_lhco_output.f
	@echo
	@echo ----- Now compiling output cleaner -----
	@echo
	$(COMPILE) -fno-automatic clean_lhco_output.f \
	-o ../clean_output; chmod +x ../clean_output
