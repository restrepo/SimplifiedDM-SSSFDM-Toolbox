AC_INIT([SUSY Phenomenology framework],[0.1])

dnl optional packages
dnl #################################################################

AC_ARG_ENABLE(
   [calchep],
   [AS_HELP_STRING([--disable-calchep],[don't build CalcHEP])], dnl'
   [],
   [enable_calchep=yes])
AC_ARG_ENABLE(
   [madgraph],
   [AS_HELP_STRING([--disable-madgraph],[don't build MadGraph])], dnl'
   [],
   [enable_madgraph=yes])
AC_ARG_ENABLE(
   [micromegas],
   [AS_HELP_STRING([--disable-micromegas],[don't build Micromegas])], dnl'
   [],
   [enable_micromegas=yes])
AC_ARG_ENABLE(
   [spheno],
   [AS_HELP_STRING([--disable-spheno],[don't build SPHENO])], dnl'
   [],[enable_spheno=yes])
AC_ARG_ENABLE(
   [whizard],
   [AS_HELP_STRING([--disable-whizard],[don't build WHIZARD])], dnl'
   [],
   [enable_whizard=yes])
AC_ARG_ENABLE(
   [higgsbounds],
   [AS_HELP_STRING([--disable-higgsbounds],[don't build HiggsBounds])], dnl'
   [],
   [enable_higgsbounds=yes])
AC_ARG_ENABLE(
   [higgssignals],
   [AS_HELP_STRING([--disable-higgssignals],[don't build HiggsSignals])], dnl'
   [],
   [enable_higgssignals=yes])
AC_SUBST([enable_calchep])
AC_SUBST([enable_micromegas])
AC_SUBST([enable_spheno])
AC_SUBST([enable_higgsbounds])
AC_SUBST([enable_higgssignals])
AC_SUBST([enable_madgraph])
AC_SUBST([enable_whizard])
AC_SUBST([enable_ssp])

dnl #################################################################
dnl general stuff
dnl #################################################################

CS_SECTION([Looking for auxilliary programs])

AC_PROG_GREP()
AC_PROG_SED()

SRCDIR=`cd $srcdir; pwd`
TARBALLS=${SRCDIR}/tarballs
PKGROOT=`pwd`

AC_SUBST([PKGROOT])

subdirs=""
subdirs_install=""
subdirs_clean=""

AC_SUBST([subdirs])
AC_SUBST([subdirs_install])
AC_SUBST([subdirs_clean])

dnl #################################################################
dnl wget and curl
dnl #################################################################

CS_SECTION([Checking whether we can download package sources on-the-fly])

AC_PATH_PROG([wget_path],[wget])
AC_PATH_PROG([curl_path],[curl])
AC_PATH_PROG([md5sum_path],[md5sum])

dnl #################################################################
dnl Compilers
dnl #################################################################

CS_SECTION([Checking for compilers])

if test "$enable_calchep" = yes || test "$enable_micromegas" = yes; then
   AC_PROG_CC()
fi

if test "$enable_spheno" = yes || test "$enable_whizard" = yes || \
      test "$enable_higgsbounds" = yes; then
   AC_PROG_FC()
   CS_FORTRAN_WORKS()
   if test -n "$FC"; then
      WO_FC_GET_VENDOR_AND_VERSION()
   fi
fi

AC_PATH_PROG([ocamlopt_path],[ocamlopt])

dnl #################################################################
dnl Mathematica
dnl #################################################################

CS_SECTION([Checking for Mathematica])

CS_PROG_MATH()

dnl #################################################################
dnl SARAH
dnl #################################################################

CS_SECTION([Configuring SARAH])

tarball_sarah_prefix=SARAH-4.5.1
tarball_sarah="${tarball_sarah_prefix}.tar.gz"
tarball_sarah_path="$TARBALLS/$tarball_sarah"

if test "$MATH_NUMVERSION" -lt 7000; then
   AC_MSG_ERROR([SARAH requires Mathematica 7.0 or higher])
fi

CS_PROVIDE_FILE(
   [http://www.hepforge.org/archive/sarah/$tarball_sarah],
   [$tarball_sarah_path],
   [ec5bd3ff2ee95611c3573e884ffec605])
CS_UNTAR([$tarball_sarah_path],[$tarball_sarah_prefix],[SARAH])

dnl #################################################################
dnl SSP
dnl #################################################################

CS_SECTION([Configuring SARAH scan and plot (SSP)])

tarball_ssp_prefix=SSP-1.2.2
tarball_ssp="${tarball_ssp_prefix}.tar.gz"
tarball_ssp_path="$TARBALLS/$tarball_ssp"

if test "$MATH_NUMVERSION" -lt 7000; then
   AC_MSG_WARN([SSP requires Mathematica 7.0 or higher; SSP disabled])
   enable_ssp="no (missing prerequisites)"
else
   CS_PROVIDE_FILE(
      [http://www.hepforge.org/archive/sarah/$tarball_ssp],
      [$tarball_ssp_path],
      [16fbfffb84cacf38ae00b3205a584fc3])
   CS_UNTAR([$tarball_ssp_path],[$tarball_ssp_prefix],[SSP])
   enable_ssp="yes"
   sed -i 's/math7/'$MATH'/g' SSP/MakeScan.sh
fi

dnl #################################################################
dnl SPHENO
dnl #################################################################

CS_SECTION([Configuring SPHENO])

tarball_spheno_prefix=SPheno-3.3.6
tarball_spheno="${tarball_spheno_prefix}.tar.gz"
tarball_spheno_path="$TARBALLS/$tarball_spheno"

if test "$enable_spheno" = "yes" && test -z "$FC"; then
   AC_MSG_WARN([SPHENO requires a FORTRAN compiler; SPHENO disabled.])
   enable_spheno="no (missing prerequisites)"
fi

if test "$enable_spheno" = "yes" && test "$FC_VENDOR" = gfortran; then
   fc_numversion=`echo $FC_VERSION | $SED 's/\.//g'`
   if test "$fc_numversion" -lt 440; then
      AC_MSG_WARN([Your gfortran is too old, SPHENO requires gfortran 4.4.0 or higher.])
      AC_MSG_WARN([SPHENO disabled])
      enable_spheno="no (missing prerequisites)"
   fi
fi

if test "$enable_spheno" = yes; then
   CS_PROVIDE_FILE(
      [http://www.hepforge.org/archive/spheno/$tarball_spheno],
      [$tarball_spheno_path],
      [800f9a9d1f8510f34f528475a9bf22eb])
   CS_UNTAR([$tarball_spheno_path],[$tarball_spheno_prefix],[SPHENO])
   AC_MSG_NOTICE([Configuring SPHENO...])
   cp -f ./SPHENO/Makefile ./SPHENO/Makefile.old || exit 1
   $SED "s/^ *F90 *=.*/F90 = $FC/" < ./SPHENO/Makefile.old > ./SPHENO/Makefile || exit 1
   subdirs="$subdirs \"`pwd`/SPHENO\""
   subdirs_clean="$subdirs_clean \"`pwd`/SPHENO\""
else
   AC_MSG_NOTICE([SPHENO disabled, skipping section...])
fi

dnl #################################################################
dnl CalcHEP
dnl #################################################################

CS_SECTION([Configuring CalcHEP])

tarball_calchep_prefix="calchep_3.6.23"
tarball_calchep="${tarball_calchep_prefix}.tgz"
tarball_calchep_path="$TARBALLS/$tarball_calchep"

if test "$enable_calchep" = yes; then
   CS_PROVIDE_FILE(
      [http://theory.sinp.msu.ru/~pukhov/CALCHEP/$tarball_calchep],
      [$tarball_calchep_path],
      [1115c2b3977fffac882393650b7fa205])
   CS_UNTAR([$tarball_calchep_path],[$tarball_calchep_prefix],[calchep])
   subdirs="$subdirs \"`pwd`/calchep\""
   subdirs_clean="$subdirs_clean \"`pwd`/calchep\""
else
   AC_MSG_NOTICE([CalcHEP disabled, skipping section...])
fi

dnl #################################################################
dnl Micromegas
dnl #################################################################

CS_SECTION([Configuring MicrOMEGAs])

tarball_micromegas_prefix="micromegas_4.1.7"
tarball_micromegas="${tarball_micromegas_prefix}.tgz"
tarball_micromegas_path="$TARBALLS/$tarball_micromegas"

if test "$enable_micromegas" = yes; then
   CS_PROVIDE_FILE(
      [http://lapth.cnrs.fr/micromegas/downloadarea/code/$tarball_micromegas],
      [$tarball_micromegas_path],
      [a67da1edcc3ed381562ce8f5dc5ab5f2])
   CS_UNTAR([$tarball_micromegas_path],[$tarball_micromegas_prefix],[micromegas])
   subdirs="$subdirs \"`pwd`/micromegas\""
   subdirs_clean="$subdirs_clean \"`pwd`/micromegas\""
else
   AC_MSG_NOTICE([MicrOMEGAs disabled, skipping section...])
fi

dnl #################################################################
dnl WHIZARD
dnl #################################################################

CS_SECTION([Configuring WHIZARD])

tarball_whizard_prefix="whizard-2.2.5"
tarball_whizard="${tarball_whizard_prefix}.tar.gz"
tarball_whizard_path="$TARBALLS/$tarball_whizard"

whizard_builddir="`pwd`/${tarball_whizard_prefix}/build"
whizard_instdir="`pwd`/whizard"

if test "$enable_whizard" = yes && test -z "$FC"; then
   AC_MSG_WARN([WHIZARD requires a FORTRAN compiler; WHIZARD disabled.])
   enable_whizard="no (missing prerequisites)"
fi

if test "$enable_whizard" = yes && test -z "$ocamlopt_path"; then
   AC_MSG_WARN([WHIZARD requires the O'Caml compiler; WHIZARD disabled.])
   dnl'
   enable_whizard="no (missing prerequisites)"
fi

if test "$enable_whizard" = yes; then
   CS_PROVIDE_FILE(
      [http://www.hepforge.org/archive/whizard/$tarball_whizard],
      [$tarball_whizard_path],
      [47d426ea39d6cfec006c3c1f880f10a0])
   CS_UNTAR([$tarball_whizard_path],[$tarball_whizard_prefix])
   if test -e "$whizard_builddir"; then
      if test ! -d "$whizard_builddir"; then
         AC_MSG_ERROR(
            [working directory messed up: $whizard_builddir exists and is no directory])
      fi
      AC_MSG_NOTICE([$whizard_builddir already exists])
   else
      AC_MSG_NOTICE([Creating $whizard_builddir...])
      mkdir "$whizard_builddir" || exit 1
   fi
   if test -e "$whizard_instdir"; then
      if test ! -d "$whizard_instdir"; then
         AC_MSG_ERROR(
            [working directory messed up: $whizard_instdir exists and is no directory])
      fi
      AC_MSG_NOTICE([$whizard_instdir already exists])
   else
      AC_MSG_NOTICE([Creating $whizard_instdir...])
      mkdir "$whizard_instdir" || exit 1
   fi
   CS_SUBCONFIG([Running WHIZARD configure...])
   whizard_confopts="--disable-lhapdf --disable-stdhep --disable-hepmc"
   whizard_confopts="$whizard_confopts --prefix=\"$whizard_instdir\" FC=\"$FC\""
   whizard_confipts="$whizard_confopts FCFLAGS=\"$FCFLAGS\""
   oldpwd=`pwd`
   cd $whizard_builddir
   eval "../configure $whizard_confopts" || exit 1
   cd "$oldpwd"
   CS_SUBCONFIG([WHIZARD configure finished])
   subdirs="$subdirs \"$whizard_builddir\""
   subdirs_install="$subdirs_install \"$whizard_builddir\""
   subdirs_clean="$subdirs_clean \"$whizard_builddir\""
else
   AC_MSG_NOTICE([WHIZARD disabled, skipping section...])
fi

dnl #################################################################
dnl HiggsBounds
dnl #################################################################

CS_SECTION([Configuring HiggsBounds])

tarball_higgsbounds_prefix="HiggsBounds-4.2.0"
tarball_higgsbounds="${tarball_higgsbounds_prefix}.tar.gz"
tarball_higgsbounds_path="$TARBALLS/$tarball_higgsbounds"

if test "$enable_higgsbounds" = yes && test -z "$FC"; then
   AC_MSG_WARN([HiggsBounds requires a FORTRAN compiler; HiggsBounds disabled.])
   enable_higgsbounds="no (missing prerequisites)"
fi

if test "$enable_higgsbounds" = yes; then
   CS_PROVIDE_FILE(
      [http://www.hepforge.org/archive/higgsbounds/$tarball_higgsbounds],
      [$tarball_higgsbounds_path],
      [9d76eefecea870d941a6fe8c0ee7a6ae])
   CS_UNTAR([$tarball_higgsbounds_path],[$tarball_higgsbounds_prefix],
      [HiggsBounds])
   subdirs="$subdirs `pwd`/HiggsBounds"
   subdirs_clean="$subdirs_clean `pwd`/HiggsBounds"
   CS_SUBCONFIG([Running HiggsBounds configure...])
   oldpwd=`pwd`
   cd HiggsBounds || exit 1
   ./configure || exit 1
   cd "$oldpwd"
   CS_SUBCONFIG([HiggsBounds configure finished...])
   AC_MSG_NOTICE([Configuring HiggsBounds...])
   cp -f ./HiggsBounds/makefile ./HiggsBounds/Makefile.old || exit 1
   $SED "s/^F90C =.*/F90C = $FC/;s/^F77C =.*/F77C = $FC/;s/^F90FLAGS =.*/F90FLAGS = $FCFLAGS/;s/^default:.*/default: HiggsBounds libHB/" \
      < ./HiggsBounds/Makefile.old > ./HiggsBounds/makefile || exit 1
else
   AC_MSG_NOTICE([HiggsBounds disabled, skipping section...])
fi


dnl #################################################################
dnl HiggsSignals
dnl #################################################################

CS_SECTION([Configuring HiggsSignals])

tarball_higgssignals_prefix="HiggsSignals-1.3.2"
tarball_higgssignals="${tarball_higgssignals_prefix}.tar.gz"
tarball_higgssignals_path="$TARBALLS/$tarball_higgssignals"

if test "$enable_higgssignals" = yes && test -z "$FC"; then
   AC_MSG_WARN([HiggsSignals requires a FORTRAN compiler; HiggsSignals disabled.])
   enable_higgssignals="no (missing prerequisites)"
fi

if test "$enable_higgssignals" = yes; then
   CS_PROVIDE_FILE(
      [http://www.hepforge.org/archive/higgsbounds/$tarball_higgssignals],
      [$tarball_higgssignals_path],
      [2e300a3784eb5d3a9e1dd905d2af7676])
   CS_UNTAR([$tarball_higgssignals_path],[$tarball_higgssignals_prefix],
      [HiggsSignals])
   subdirs="$subdirs `pwd`/HiggsSignals"
   subdirs_clean="$subdirs_clean `pwd`/HiggsSignals"
   CS_SUBCONFIG([Running HiggsSignals configure...])
   oldpwd=`pwd`
   cd HiggsSignals || exit 1
   ./configure || exit 1
   cd "$oldpwd"
   CS_SUBCONFIG([HiggsSignals configure finished...])
   AC_MSG_NOTICE([Configuring HiggsSignals...])
   cp -f ./HiggsSignals/makefile ./HiggsSignals/Makefile.old || exit 1
   $SED "s/^F90C =.*/F90C = $FC/;s/^F77C =.*/F77C = $FC/;s/^F90FLAGS =.*/F90FLAGS = $FCFLAGS/;s/^default:.*/default: HiggsSignals/" \
      < ./HiggsSignals/Makefile.old > ./HiggsSignals/makefile || exit 1
else
   AC_MSG_NOTICE([HiggsSignals disabled, skipping section...])
fi


dnl #################################################################
dnl MadGraph
dnl #################################################################

CS_SECTION([Configuring MadGraph])

tarball_madgraph_prefix="MG5_aMC_v2.2.3"
tarball_madgraph="${tarball_madgraph_prefix}.tar.gz"
tarball_madgraph_path="$TARBALLS/$tarball_madgraph"
if test "$enable_madgraph" = yes; then
   CS_PROVIDE_FILE(
      [https://launchpad.net/mg5amcnlo/2.0/2.2.0/+download/$tarball_madgraph],
      [$tarball_madgraph_path],
      [3413b0f0c3dffcee0a27434e9e8092c8])
   CS_UNTAR([$tarball_madgraph_path],["MG5_aMC_v2_2_3"],
      [madgraph])
else
   AC_MSG_NOTICE([MadGraph disabled, skipping section...])
fi



dnl #################################################################
dnl Create output files and summary
dnl #################################################################

CS_SECTION([Finalizing...])

AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([butler])
AC_OUTPUT
chmod +x ./butler

cat << EOI


===============================================================================
Configuration summary:
===============================================================================

SARAH                      : yes
SARAH scan and plot (SSP)  : $enable_ssp
SPHENO                     : $enable_spheno
CalcHEP                    : $enable_calchep
MicrOMEGAs                 : $enable_micromegas
WHIZARD                    : $enable_whizard
MadGraph                   : $enable_madgraph
HiggsBounds                : $enable_higgsbounds
HiggsSignals               : $enable_higgssignals

===============================================================================

All packages configured succesfully. Now run make in order to build the code
and finalize the setup.
EOI
