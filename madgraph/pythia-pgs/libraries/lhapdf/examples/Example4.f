      program example4
c
c using lhaglue to do example 1
c
      implicit real*8(a-h,o-z)
      character*20 parm(20)
      double precision value(20) 
*
      parm(1)='DEFAULT'
c      parm(19)='SILENT'
      val = 40100
      do i=0,99 
      value(1)=val+i
        write(*,*) '---------------------------------------------'
        call pdfset(parm,value)
        call getdesc()
	qmz = 91.71d0
	a = alphasPDF(qmz)
	print *,a
         write(*,*) 'x*Gluon'
         write(*,*) '   x     Q2=10 GeV     Q=100 GeV    Q=1000 GeV'
         do x=0.01d0,0.095d0,0.01d0
 	    Q=10.0d0
            call structm(x,q,upv,dnv,usea,dsea,str,chm,bot,top,glu)
            g1=glu
            Q=100d0
            call structm(x,q,upv,dnv,usea,dsea,str,chm,bot,top,glu)
            g2=glu
            Q=1000d0
            call structm(x,q,upv,dnv,usea,dsea,str,chm,bot,top,glu)
            g3=glu
            write(*,*) x,g1,g2,g3
         enddo
      enddo
*
      end
