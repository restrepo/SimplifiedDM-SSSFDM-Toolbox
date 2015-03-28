dnl ###########################################################################

AC_DEFUN([CS_DOWNLOAD],[
   AC_MSG_NOTICE([downloading $2...])
   download_cmd=""
   test -n "$curl_path" && download_cmd="$curl_path \"$1\" -o \"$2\""
   test -n "$wget_path" && download_cmd="$wget_path \"$1\" -O \"$2\""
   if test -n "$download_cmd"; then
      echo
      if eval "$download_cmd"; then true; else
         test -e "$2" && rm -f "$2"
         AC_MSG_ERROR([

Automatic download failed. Please download

   $1

manually and rename it to

   $2

Rerun configure afterwards. Please inform the authors if the above link appears
to be dead for a prolonged period of time.
         ])
      fi
   else
      AC_MSG_NOTICE([

Neither wget nor curl are available, unable to download automatically.
Please download

   $1

and rename it to

   $2

Rerun configure afterwards.
      ])
      exit
   fi
])

dnl ###########################################################################

AC_DEFUN([CS_MD5_CHECK],[
   if test -n "$md5sum_path"; then
      AC_MSG_CHECKING([ $1])
      md5sum=`$md5sum_path "$1" | $SED 's/ .*//'`
      if test "$2" = $md5sum; then
         AC_MSG_RESULT([checksum OK])
      else
         AC_MSG_RESULT([checksum failed!])
         AC_MSG_ERROR([

File $1 : md5 checksum mismatch:
expected $2, but got $md5sum.
Please remove the file and rerun configure to redownload it. Please contact
the authors if this error persists.]
         )
      fi
   else
      AC_MSG_WARN([md5 not found; unable to validate checksum for $1])
   fi
])

dnl ###########################################################################

AC_DEFUN([CS_PROVIDE_FILE],[
   if test ! -e "$2"; then
      CS_DOWNLOAD($1,$2)
   fi
   if test -n "$3"; then
      CS_MD5_CHECK($2,$3)
   fi
])

dnl ###########################################################################

AC_DEFUN([CS_UNTAR],[
   destdir="`pwd`/$2"
   test -n "$3" && destlink="`pwd`/$3"
   if test -e "$destdir"; then
      if test ! -d "$destdir"; then
         AC_MSG_ERROR(
            [working direcory messed up: $destdir exists and is not a directory])
      fi
      AC_MSG_NOTICE([$destdir already exists, untarring $1 skipped])
   else 
      AC_MSG_NOTICE([Untarring $1...])
      tar -xzf "$1" || exit 1
   fi
   if test -n "$3"; then
      if test -e "$destlink"; then
         if test ! -L $destlink; then
            AC_MSG_ERROR(
               [working directory messed up: $destlink exists and is not a symlink])
         fi
         rm -f "$destlink" || exit 1
      fi
      if test -n "$4"; then
         linkdir="$destdir/$4"
      else
         linkdir="$destdir"
      fi
      AC_MSG_NOTICE([Symlinking $linkdir to $destlink...])
      ln -s "$linkdir" "$destlink" || exit 1
   fi
])
