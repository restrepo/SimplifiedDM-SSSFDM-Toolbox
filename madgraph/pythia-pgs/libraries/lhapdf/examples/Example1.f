      program example1
      implicit real*8(a-h,o-z)
      character name*50
      real*8 f(-6:6)
*
c      name='../PDFsets/ZEUS2005_ZJ.LHpdf'
c      name='../PDFsets/a02m_nlo.LHgrid'
      name='../PDFsets/cteq6AB.LHgrid'
      call InitPDFset(name)
*
      QMZ=91.18d0
      write(*,*)
      call numberPDF(N)
      print *,N
       do i=0,N
         write(*,*) '---------------------------------------------'
         call InitPDF(i)
         write(*,*) 'PDF set ',i
         write(*,*)
         a=alphasPDF(QMZ)
         write(*,*) 'alpha_S(M_Z) = ',a
         write(*,*)
         write(*,*) 'x*upv'
         write(*,*) '   x     Q=1 GeV     Q=10 GeV    Q=100 GeV'
         do x=0.1d0,0.95d0,0.1d0
            Q=1d0
            call evolvePDF(x,Q,f)
            u1=f(2)
            Q=10d0
            call evolvePDF(x,Q,f)
            u2=f(2)
            Q=100d0
            call evolvePDF(x,Q,f)
            u3=f(2)
            write(*,*) x,u1,u2,u3
         enddo
      enddo
*
      end
