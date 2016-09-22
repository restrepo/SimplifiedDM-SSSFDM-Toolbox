dnl Process this file with autoconf to produce a configure script.

AC_PREREQ(2.57)
AC_INIT([LHAPDF],[4.2],[lhapdf@cedar.ac.uk],[lhapdf])
AC_CONFIG_AUX_DIR([config])
AM_INIT_AUTOMAKE
AC_LANG(Fortran 77)

#AC_CONFIG_SRCDIR([src/alphas.f])
AC_CONFIG_SRCDIR([INSTALL])
AC_CONFIG_HEADERS([config/config.h])

## Checks for programs.
AC_PROG_F77
AC_PROG_RANLIB
AC_PROG_INSTALL
AC_PROG_MAKE_SET #???
AC_PROG_LN_S
#AC_DISABLE_STATIC
#AC_LIBTOOL_DLOPEN
#
#AC_PROG_LIBTOOL

AM_CONDITIONAL(EVLCTEQ, [test ! x$EVLCTEQ = x])

##########################


#AM_FFLAGS="-Wall"
FFLAGS="-O"
# should really be specified one-by-one for each lib!
#AM_LDFLAGS="-version-info 1:0:0"
#AC_SUBST(AM_FFLAGS)
AC_SUBST(FFLAGS)
#AC_SUBST(AM_LDFLAGS)

AC_SUBST(VERSION)

AC_CONFIG_FILES([src/Makefile examples/Makefile Makefile src/lhapdf-config])
AC_OUTPUT
