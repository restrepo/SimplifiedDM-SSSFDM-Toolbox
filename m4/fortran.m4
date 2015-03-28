dnl fortran.m4 -- Fortran compiler checks beyond Autoconf built-ins
dnl

dnl The standard Fortran compiler test is AC_PROG_FC.
dnl At the end FC, FCFLAGS and FCFLAGS_f90 are set, if successful.

AC_DEFUN([CS_FORTRAN_WORKS],[
   AC_MSG_CHECKING([whether the FORTRAN compiler can produce executables])
   AC_LANG([Fortran])
   AC_RUN_IFELSE([
      program test
      implicit none
      end program test
   ],[],[FC=""])
   if test -n "$FC"; then
      AC_MSG_RESULT([yes])
   else
      AC_MSG_RESULT([no])
   fi
])

### Determine vendor and version string.
AC_DEFUN([WO_FC_GET_VENDOR_AND_VERSION],
[dnl
AC_REQUIRE([AC_PROG_FC])

AC_CACHE_CHECK([the compiler ID string],
[wo_cv_fc_id_string],
[dnl
$FC -V >conftest.log 2>&1
$FC -version >>conftest.log 2>&1
$FC --version >>conftest.log 2>&1

wo_fc_grep_GFORTRAN=`$GREP -i 'GNU Fortran' conftest.log | head -1`
wo_fc_grep_G95=`$GREP -i 'g95' conftest.log | $GREP -i 'gcc' | head -1`
wo_fc_grep_NAG=`$GREP 'NAG' conftest.log | head -1`
wo_fc_grep_Intel=`$GREP 'IFORT' conftest.log | head -1`
wo_fc_grep_Sun=`$GREP 'Sun' conftest.log | head -1`
wo_fc_grep_Lahey=`$GREP 'Lahey' conftest.log | head -1`
wo_fc_grep_PGF90=`$GREP 'pgf90' conftest.log | head -1`
wo_fc_grep_PGF95=`$GREP 'pgf95' conftest.log | head -1`
wo_fc_grep_PGHPF=`$GREP 'pghpf' conftest.log | head -1`
wo_fc_grep_default=`cat conftest.log | head -1`

if test -n "$wo_fc_grep_GFORTRAN"; then
  wo_cv_fc_id_string=$wo_fc_grep_GFORTRAN
elif test -n "$wo_fc_grep_G95"; then
  wo_cv_fc_id_string=$wo_fc_grep_G95
elif test -n "$wo_fc_grep_NAG"; then
  wo_cv_fc_id_string=$wo_fc_grep_NAG
elif test -n "$wo_fc_grep_Intel"; then
  wo_cv_fc_id_string=$wo_fc_grep_Intel
elif test -n "$wo_fc_grep_Sun"; then
  wo_cv_fc_id_string=$wo_fc_grep_Sun
elif test -n "$wo_fc_grep_Lahey"; then
  wo_cv_fc_id_string=$wo_fc_grep_Lahey
elif test -n "$wo_fc_grep_PGF90"; then
  wo_cv_fc_id_string=$wo_fc_grep_PGF90
elif test -n "$wo_fc_grep_PGF95"; then
  wo_cv_fc_id_string=$wo_fc_grep_PGF95
elif test -n "$wo_fc_grep_PGHPF"; then
  wo_cv_fc_id_string=$wo_fc_grep_PGHPF
else
  wo_cv_fc_id_string=$wo_fc_grep_default
fi

rm -f conftest.log
])
FC_ID_STRING="$wo_cv_fc_id_string"
AC_SUBST([FC_ID_STRING])

AC_CACHE_CHECK([the compiler vendor],
[wo_cv_fc_vendor],
[dnl
if test -n "$wo_fc_grep_GFORTRAN"; then
  wo_cv_fc_vendor="gfortran"
elif test -n "$wo_fc_grep_G95"; then
  wo_cv_fc_vendor="g95"
elif test -n "$wo_fc_grep_NAG"; then
  wo_cv_fc_vendor="NAG"
elif test -n "$wo_fc_grep_Intel"; then
  wo_cv_fc_vendor="Intel"
elif test -n "$wo_fc_grep_Sun"; then
  wo_cv_fc_vendor="Sun"
elif test -n "$wo_fc_grep_Lahey"; then
  wo_cv_fc_vendor="Lahey"
elif test -n "$wo_fc_grep_PGF90"; then
  wo_cv_fc_vendor="PGI"
elif test -n "$wo_fc_grep_PGF95"; then
  wo_cv_fc_vendor="PGI"
elif test -n "$wo_fc_grep_PGHPF"; then
  wo_cv_fc_vendor="PGI"
else
  wo_cv_fc_vendor="unknown"
fi
])
FC_VENDOR="$wo_cv_fc_vendor"


AC_SUBST([FC_VENDOR])

AC_CACHE_CHECK([the compiler version],
[wo_cv_fc_version],
[dnl
case $FC_VENDOR in
gfortran)
  wo_cv_fc_version=[`echo $FC_ID_STRING | $SED -e 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/'`]
  ;;
g95)
  wo_cv_fc_version=[`echo $FC_ID_STRING | $SED -e 's/.*g95 \([0-9][0-9]*\.[0-9][0-9]*\).*$/\1/'`]
  ;;
NAG)
  wo_cv_fc_version=[`echo $FC_ID_STRING | $SED -e 's/.* Release \([0-9][0-9]*\.[0-9][0-9]*.*$\)/\1/'`]
  ;;
Intel)
  wo_cv_fc_version=[`echo $FC_ID_STRING | $SED -e 's/[a-zA-Z\(\)]//g;s/[0-9]\{8\}$//g'`]
  ;;
Sun)
  wo_cv_fc_version=[`echo $FC_ID_STRING | $SED -e 's/.* Fortran 95 \([0-9][0-9]*\.[0-9][0-9]*\) .*/\1/'`]
  ;;
PGI)
  wo_cv_fc_version=[`echo $FC_ID_STRING | $SED -e 's/[a-zA-Z\(\)]//g;s/^[0-9]\{2\}//g;s/32.*\|64.*//g'`]
  ;;
*)
  wo_cv_fc_version="unknown"
  ;;
esac
])
FC_VERSION="$wo_cv_fc_version"
AC_SUBST([FC_VERSION])
 
AC_CACHE_CHECK([the major version],
[wo_cv_fc_major_version],
[wo_cv_fc_major_version=[`echo $wo_cv_fc_version | $SED -e 's/\([0-9][0-9]*\)\..*/\1/'`]
])
FC_MAJOR_VERSION="$wo_cv_fc_major_version"
AC_SUBST([FC_MAJOR_VERSION])
])
### end WO_FC_GET_VENDOR_AND_VERSION
