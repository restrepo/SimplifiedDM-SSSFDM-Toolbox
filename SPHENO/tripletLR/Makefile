modname = tripletLR  # as an example  
PreDef = -DGENERATIONMIXING -DONLYDOUBLE
# setting various paths  
InDir = ../include
Mdir = ${InDir}
name = ../lib/libSPhenotripletLR.a
 
# check if SARAH module and SPheno are compatibel  
minV=330.00 
cVersion =$(shell expr $(version) \>= $(minV))
#  
# options for various compilers  
#  
# Default Compiler  
F90=gfortran
comp= -c -O -module ${Mdir} -I${InDir}  
LFlagsB= -O  
# Intels ifort,debug modus  
ifeq (${F90},ifortg)  
F90=ifort  
comp= -c -g -module ${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# gfortran  
ifeq (${F90},gfortran)  
comp= -c -g -ffree-line-length-none -J${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# g95  
ifeq (${F90},g95)  
comp= -c -O -fmod=${Mdir} -I${InDir}  
LFlagsB= -O  
endif  
# Lahey F95 compiler  
ifeq (${F90},lf95)  
comp=-c -O -M ${Mdir} -I${InDir}  
LFlagsB=-O  
endif  
# NAG f95/2003  
ifeq (${F90},nagfor)  
comp= -c -O -mdir ${Mdir} -I${InDir}  
LFlagsB= -O -DONLYDOUBLE -mdir ${MDir} -I${InDir}  
endif   
.SUFFIXES : .o .ps .f90 .F90 .a 
bin/SPhenotripletLR:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenotripletLR.o 
	 ${F90} -o SPhenotripletLR ${LFlagsB} SPhenotripletLR.o ../lib/libSPhenotripletLR.a ../lib/libSPheno.a
	 mv SPhenotripletLR ../bin
	 rm SPhenotripletLR.o  
${name}:  ${name}(Model_Data_tripletLR.o)  \
 ${name}(RGEs_tripletLR.o)   \
 ${name}(Couplings_tripletLR.o) ${name}(SusyMasses_tripletLR.o) ${name}(TadpoleEquations_tripletLR.o) \
 ${name}(LoopCouplings_tripletLR.o) ${name}(CouplingsForDecays_tripletLR.o) \
 ${name}(SusyDecays_tripletLR.o) \
 ${name}(Fu.o)  ${name}(Fe.o)  ${name}(Fd.o)  ${name}(Fv.o)  \
 ${name}(BranchingRatios_tripletLR.o) ${name}(LoopMasses_tripletLR.o) \
 ${name}(HiggsCS_tripletLR.o) ${name}(RunSM_tripletLR.o) \
 ${name}(LowEnergy_tripletLR.o) \
${name}(FlavorKit_LFV_tripletLR.o) ${name}(FlavorKit_QFV_tripletLR.o) ${name}(FlavorKit_Observables_tripletLR.o)\
${name}(InputOutput_tripletLR.o) 
else 
	 @echo -------------------------------------------------------------------  
	 @echo ERROR:  
	 @echo The installed SPheno is version not compatibel with this module 
	 @echo Please, upgrade at least to SPheno version 3.3.0.  
	 @echo The current SPheno version can be downloaded from 
	 @echo http://www.hepforge.org/downloads/spheno 
	 @echo ------------------------------------------------------------------- 
endif 
clean: 
	 rm -f *.o *~ */*.o */*~
cleanall: 
	 rm -f bin/SPheno3 lib/*.a *~ */*.o */*~ include/*
#
# Suffix rules
#
.f90.a:
	 ${F90} ${comp} $< 
	 ar -ruc $@ $*.o
	 rm -f $*.o
.F90.a:
	 ${F90} ${comp} ${PreDef} $< 
	 ar -ruc $@ $*.o
	 rm -f $*.o
.f90.o:
	 ${F90} ${comp} $<
.f90.ps:
	 a2ps -o $*.ps $<
.h.ps:
	 a2ps -o $*.ps $<
