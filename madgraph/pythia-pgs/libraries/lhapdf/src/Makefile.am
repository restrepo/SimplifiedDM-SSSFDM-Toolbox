lib_LIBRARIES = libLHAPDFlocal.a
bin_SCRIPTS = lhapdf-config
EXTRA_DIST = parmsetup.f

LHAPDFCODE = LHpdflib.f description.f evolution.f alphas.f parameter.f inputPDF.f QCDparams.f
CUSTOMCODE = wrapevolve.f wrapmrst.f wrapmrst98.f wrapa02.f wrapcteq6.f wrapcteq5.f wrapzeus.f wraph1.f wrapgrv.f \
			 wrapsasg.f wrapgrvg.f wrapdog.f wrapdgg.f wraplacg.f wrapgsg.f wrapgsg96.f wrapacfgpg.f wrapwhitg.f \
			 wrapowpi.f wrapsmrspi.f wrapgrvpi.f wrapabfkwpi.f wrapa02m.f
QCDNUMCODE = wrapQCDNUM.f QCDNUM.f Sqcdnum.f
EVLCTEQCODE = wrapEVLCTEQ.f EVLCTEQ.f
LHAGLUECODE = lhaglue.f

libLHAPDF_a_SOURCES = $(LHAGLUECODE) $(LHAPDFCODE) $(EVLCTEQCODE) $(CUSTOMCODE) $(QCDNUMCODE)
