      subroutine initQCDparams()
      implicit real*8(a-h,o-z)
      include 'parmsetup.f'
      real*8 parmQCD(0:noemax,2),lam4,lam5
      save
      read(1,*)nmem,nrep
c if nrep=0, read nmem+1 lines -- one for each PDF set --, 
c with 2 parameters per line.
c for any other value of nrep, read only one line and make 
c all nmem+1 lines equal to it.
      if(nrep.eq.0) then
        do i=0,nmem
          read(1,*) (parmQCD(i,j),j=1,2)
        enddo
      else
        read(1,*) (parmQCD(0,j),j=1,2)
	do i=1,nmem
	  do j=1,2
	    parmQCD(i,j)=parmQCD(0,j)
	  enddo
        enddo
      endif
c	print *,nmem+1,' lines initialized in initQCDparams:'	!*** temporary ***
c	do i = 0,nmem						!*** temporary ***
c	   print *, i, parmQCD(i,1), parmQCD(i,2)		!*** temporary ***
c	enddo							!*** temporary ***
      return
c
      entry GetLam4(mem,lam4)
      lam4 = parmQCD(mem,1)
      return
c
      entry GetLam5(mem,lam5)
      lam5 = parmQCD(mem,2)
      return
c        
      end
      
      
      
