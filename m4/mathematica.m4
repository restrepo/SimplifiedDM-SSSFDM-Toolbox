dnl ###########################################################################

AC_DEFUN([CS_PROG_MATH],[
   AC_ARG_VAR([MATH],[Mathematica kernel command])
   if test -z "$MATH"; then
      AC_PATH_PROGS([MATH],[math Math],[])
   else
      AC_MSG_CHECKING([whether Mathematica kernel $MATH is executable])
      if test ! -x "`which "$MATH" 2>&1`"; then
         AC_MSG_RESULT([no])
         AC_MSG_ERROR([This package requires Mathematica])
      fi
      AC_MSG_RESULT([yes])
   fi
   if test -z "$MATH"; then
      AC_MSG_ERROR([This package requires Mathematica])
   fi
    AC_MSG_CHECKING([for Mathematica version])
   [$MATH << "EOI" > conftest.log
      Print["MATHV " <> $Version];
      Print["MATHVN " <> ToString[Floor[$VersionNumber * 1000]]];
EOI
   ]
   if $GREP -si wolfram conftest.log; then true; else
      AC_MSG_ERROR(["$MATH" seems not to be a mathematica kernel])
   fi
   MATH_VERSION=`cat conftest.log | $GREP "MATHV " | sed 's/.*MATHV //'`
   MATH_NUMVERSION=`cat conftest.log | $GREP "MATHVN " | sed 's/.*MATHVN //'`
   AC_MSG_RESULT([$MATH_VERSION])
   AC_SUBST([MATH_VERSION])
   AC_SUBST([MATH_NUMVERSION])
])
