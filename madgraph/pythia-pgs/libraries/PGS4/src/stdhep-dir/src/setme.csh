#!/bin/csh
#
# Source this file to get necessary products for building stdhep.
# NOTE: if your copy of stdhep is a ups product, 
#       you do NOT need to source this file
#
## setup stdhep 
# setenv STDHEP_DIR `pwd` in the top directory
 setup cern
 if ( `ups list gtools | grep current | wc -l` > 0) then
   setup gtools		# for gmake
 endif
 if ( `ups list isajet v7_51a | grep isajet | wc -l` > 0) then
   setup isajet v7_51a
 else
   setup isajet v7_51
 endif
 setup herwig v6_505
 setup qq v9_2b
 setup lund v6_223
 setup mcfio v5_3
 setup histo
 
 # want to specify gcc on Linux
 #  use either gcc v2_95_2 or gcc v3_3_1
 set UNAME=`uname`
 if ($UNAME == "Linux" ) then
   setup gcc v2_95_2
 endif

exit

# no current support for these generators
# if ( `ups list dpmjet v2_4 | grep dpmjet | wc -l` > 0) then
#     setup dpmjet v2_4
# endif
# if ( `ups list phojet v1_05e | grep phojet | wc -l` > 0) then
#     setup phojet v1_05e
# endif
