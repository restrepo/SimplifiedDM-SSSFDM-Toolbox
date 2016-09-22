      subroutine listPDF(imem,parm)
      implicit none
      include 'parmsetup.f'
      character*16 name
      integer nmem,ndef
      common/NAME/name,nmem,ndef,mem
      character*16 s1
      integer i,j,mem,imem,noe,nop,listN,listP,type
      real*8 parmL(0:noemax,nopmax),parm(nopmax)
      save listN,listP,parmL
*
       mem=imem
      if (mem.gt.listN) then
         write(*,*) 'Maximum number of PDFs in list exceeded: ',
     .              mem,' > ',listN
         write(*,*) 'Returning most likely PDF'
         mem=0
      endif
      if (mem.lt.0) then
         write(*,*) 'Negative PDF member requested: ',mem
         write(*,*) 'Returning most likely PDF'
         mem=0
      endif
      do i=1,listP
         parm(i)=parmL(mem,i)
      enddo
      return
*
      entry nopPDF(nop)
      nop=listP
      return
*
      entry numberPDF(noe)
c      print *,'name:',name,nmem
      if(NAME.eq.'MRSTgrid'
     +.or.NAME.eq.'MRST98grid'
     +.or.NAME.eq.'A02'
     +.or.NAME.eq.'A02M'
     +.or.NAME.eq.'CTEQ5grid'
     +.or.NAME.eq.'CTEQ6grid'
     +.or.NAME.eq.'CTEQ6ABgrid'		!*** added ***
     +.or.NAME.eq.'SASG'
     +.or.NAME.eq.'GRVG'
     +.or.NAME.eq.'DOG'
     +.or.NAME.eq.'DGG'
     +.or.NAME.eq.'LACG'
     +.or.NAME.eq.'GSG'
     +.or.NAME.eq.'GSG96'
     +.or.NAME.eq.'ACFGP'
     +.or.NAME.eq.'WHITG'
     +.or.NAME.eq.'OWP'
     +.or.NAME.eq.'SMRSP'
     +.or.NAME.eq.'GRVP'
     +.or.NAME.eq.'ABFKWP'
c     +.or.NAME.eq.'H12000'
c     +.or.NAME.eq.'GRV'
     +) then
        noe = nmem
      else
        noe=listN
      endif
     
      return
*
      entry InitListPDF
      type=-1
      read(1,*) s1,listN,listP
c      print *,s1,listN,listP
      if (index(s1,'list').eq.1) then
         type=1
         do i=0,listN
            read(1,*) (parmL(i,j),j=1,listP)
         enddo
c	 print *,parmL(0,1)
      endif
      if (type.lt.0) then
         write(*,*) 'File description error:'
         write(*,*) 'Unknown parameter list type ',s1
         stop
      endif
      return
*
      end
