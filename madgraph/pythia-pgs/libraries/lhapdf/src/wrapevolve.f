      subroutine evolvePDF(x,Q,f)
      implicit none
      integer Eorder,index,iset,iiset
      character*16 name
      integer nmem,ndef,mem,ip2
      common/NAME/name,nmem,ndef,mem
      common/SET/iiset
      real*8 x,Q,Q2fit,alfas,p2
      real*8 f(-6:6)

      save
*
c      print *,'calling evolvePDF'
      if (name.eq.'QCDNUM') call QCDNUMevolve(x,Q,f)
      if (name.eq.'QCDNUM_MRST') call QCDNUMevolve(x,Q,f)
      if (name(1:11).eq.'QCDNUM_ZEUS') call ZEUSevolve(x,Q,f)
      if (name.eq.'CTEQ5grid') call CTEQ5evolve(x,Q,f)
      if (name.eq.'CTEQ6grid') call CTEQ6evolve(x,Q,f)
      if (name.eq.'CTEQ6ABgrid') call CTEQ6evolve(x,Q,f)
      if (name.eq.'EVLCTEQ') call EVLCTEQevolve(x,Q,f)
      if (name.eq.'MRSTgrid') call MRSTevolve(x,Q,f)
      if (name.eq.'MRST98grid') call MRST98evolve(x,Q,f)
      if (name.eq.'MRSTpdf') call QCDNUMevolve(x,Q,f)
      if (name.eq.'MRST') call QCDNUMevolve(x,Q,f)
      if (name.eq.'A02') call A02evolve(x,Q,f)
      if (name.eq.'A02M') call A02Mevolve(x,Q,f)
      if (name.eq.'H12000') call H1evolve(x,Q,f)
      if (name.eq.'GRV') call GRVevolve(x,Q,f)
      if (name.eq.'OWP') call OWPevolve(x,Q,f)
      if (name.eq.'SMRSP') call SMRSPevolve(x,Q,f)
      if (name.eq.'GRVP0') call GRVP0evolve(x,Q,f)
      if (name.eq.'GRVP1') call GRVP1evolve(x,Q,f)
      if (name.eq.'ABFKWP') call ABFKWPevolve(x,Q,f)
      return
*
      entry evolvePDFp(x,Q,P2,IP2,f)
c      print *,'calling evolvePDFp',ip2
      if(name.eq.'SASG') call SASGevolvep(x,Q,P2,IP2,f)
      if(name.eq.'GRVG0') call GRVGevolvep0(x,Q,P2,IP2,f)
      if(name.eq.'GRVG1') call GRVGevolvep1(x,Q,P2,IP2,f)
      if (name.eq.'DOG0') call DOGevolvep0(x,Q,P2,IP2,f)
      if (name.eq.'DOG1') call DOGevolvep1(x,Q,P2,IP2,f)
      if (name.eq.'DGG') call DGGevolvep(x,Q,P2,IP2,f)
      if (name.eq.'LACG') call LACGevolvep(x,Q,P2,IP2,f)
      if (name.eq.'GSG0') call GSGevolvep0(x,Q,P2,IP2,f)
      if (name.eq.'GSG1') call GSGevolvep1(x,Q,P2,IP2,f)
      if (name.eq.'GSG960') call GSG96evolvep0(x,Q,P2,IP2,f)
      if (name.eq.'GSG961') call GSG96evolvep1(x,Q,P2,IP2,f)
      if (name.eq.'ACFGP') call ACFGPevolvep(x,Q,P2,IP2,f)
      if (name.eq.'WHITG') call WHITGevolvep(x,Q,P2,IP2,f)
      return
*
      entry readevolve
*
      read(1,*) name   
c      print *,'readevolve reads name=',name		!*** temporary ***
*
      if (name.eq.'QCDNUM') call QCDNUMread
      if (name.eq.'QCDNUM_MRST') call QCDNUMread
      if (name(1:11).eq.'QCDNUM_ZEUS') call ZEUSread
      if (name.eq.'CTEQ5grid') call CTEQ5read
      if (name.eq.'CTEQ6grid') call CTEQ6read
      if (name.eq.'CTEQ6ABgrid') call CTEQ6read
      if (name.eq.'EVLCTEQ') call EVLCTEQread
      if (name.eq.'MRSTgrid') call MRSTread
      if (name.eq.'MRST98grid') call MRST98read
      if (name.eq.'MRSTpdf') call QCDNUMread
      if (name.eq.'MRST') call QCDNUMread
      if (name.eq.'A02') call A02read
      if (name.eq.'A02M') call A02Mread
      if (name.eq.'H12000') call H1read
      if (name.eq.'GRV') call GRVread
      if (name.eq.'SASG') call SASGread
      if (name.eq.'GRVG0' .OR.
     +    name.eq.'GRVG1') call GRVGread
      if (name.eq.'DOG0' .OR.
     +    name.eq.'DOG1') call DOGread
      if (name.eq.'DGG') call DGGread
      if (name.eq.'LACG') call LACGread
      if (name.eq.'GSG0' .OR. 
     +    name.eq.'GSG1') call GSGread
      if (name.eq.'GSG960' .OR.
     +    name.eq.'GSG961') call GSG96read
      if (name.eq.'ACFGP') call ACFGPread
      if (name.eq.'WHITG') call WHITGread
      if (name.eq.'OWP') call OWPread
      if (name.eq.'SMRSP') call SMRSPread
      if (name.eq.'GRVP0' .OR. 
     +    name.eq.'GRVP1') call GRVPread
      if (name.eq.'ABFKWP') call ABFKWPread
      return
*
      entry alfasevolve(alfas,Q)
      if (name.eq.'QCDNUM') call QCDNUMalfa(alfas,Q)
      if (name.eq.'QCDNUM_MRST') call QCDNUMalfa(alfas,Q)
      if (name(1:11).eq.'QCDNUM_ZEUS') call ZEUSalfa(alfas,Q)
      if (name.eq.'CTEQ5grid') call CTEQ5alfa(alfas,Q)
      if (name.eq.'CTEQ6grid') call CTEQ6alfa(alfas,Q)
      if (name.eq.'EVLCTEQ') call EVLCTEQalfa(alfas,Q)
      if (name.eq.'MRSTgrid') call MRSTalfa(alfas,Q)
      if (name.eq.'MRST98grid') call MRST98alfa(alfas,Q)
      if (name.eq.'MRSTpdf') call QCDNUMalfa(alfas,Q)
      if (name.eq.'MRST') call QCDNUMalfa(alfas,Q)
      if (name.eq.'A02') call A02alfa(alfas,Q)
      if (name.eq.'A02M') call A02Malfa(alfas,Q)
      if (name.eq.'H12000') call H1alfa(alfas,Q)
      if (name.eq.'GRV') call GRValfa(alfas,Q)
      if (name.eq.'SASG') call SASGalfa(alfas,Q)
      if (name.eq.'GRVG0' .OR.
     +    name.eq.'GRVG1') call GRVGalfa(alfas,Q)
      if (name.eq.'DOG0' .OR.
     +    name.eq.'DOG1') call DOGalfa(alfas,Q)
      if (name.eq.'DGG') call DGGalfa(alfas,Q)
      if (name.eq.'LACG') call LACGalfa(alfas,Q)
      if (name.eq.'GSG0' .OR.
     +    name.eq.'GSG1') call GSGalfa(alfas,Q)
      if (name.eq.'GSG960' .OR.
     +    name.eq.'GSG961') call GSG96alfa(alfas,Q)
      if (name.eq.'ACFGP') call ACFGPalfa(alfas,Q)
      if (name.eq.'WHITG') call WHITGalfa(alfas,Q)
      if (name.eq.'OWP') call OWPalfa(alfas,Q)
      if (name.eq.'SMRSP') call SMRSPalfa(alfas,Q)
      if (name.eq.'GRVP0' .OR. 
     +    name.eq.'GRVP1') call GRVPalfa(alfas,Q)
      if (name.eq.'ABFKWP') call ABFKWPalfa(alfas,Q)
      return
*
      entry initevolution(Eorder,Q2fit)
      if (name.eq.'QCDNUM') call QCDNUMinit(Eorder,Q2fit)
      if (name(1:11).eq.'QCDNUM_ZEUS') call ZEUSinit(Eorder,Q2fit)
      if (name.eq.'CTEQ5grid') call CTEQ5init(Eorder,Q2fit)
      if (name.eq.'CTEQ6grid') call CTEQ6init(Eorder,Q2fit)		!*** appears to be unnecessary (jcp) ***
      if (name.eq.'EVLCTEQ') call EVLCTEQinit(Eorder,Q2fit)
      if (name.eq.'MRSTgrid') call MRSTinit(Eorder,Q2fit)
      if (name.eq.'MRST98grid') call MRST98init(Eorder,Q2fit)
      if (name.eq.'QCDNUM_MRST') then 
        call QCDNUMinit(Eorder,Q2fit)
	call QNLSET('BMARK',.TRUE.)
      endif 
      if (name.eq.'A02') call A02init(Eorder,Q2fit)
      if (name.eq.'A02M') call A02Minit(Eorder,Q2fit)
      if (name.eq.'H12000') call H1init(Eorder,Q2fit)
      if (name.eq.'GRV') call GRVinit(Eorder,Q2fit)
      if (name.eq.'SASG') call SASGinit(Eorder,Q2fit)
      if (name.eq.'GRVG0' .OR.
     +    name.eq.'GRVG1') call GRVGinit(Eorder,Q2fit)
      if (name.eq.'DOG0' .OR.
     +    name.eq.'DOG1') call DOGinit(Eorder,Q2fit)
      if (name.eq.'DGG') call DGGinit(Eorder,Q2fit)
      if (name.eq.'LACG') call LACGinit(Eorder,Q2fit)
      if (name.eq.'GSG0' .OR.
     +    name.eq.'GSG1') call GSGinit(Eorder,Q2fit)
      if (name.eq.'GSG960' .OR.
     +    name.eq.'GSG961') call GSG96init(Eorder,Q2fit)
      if (name.eq.'ACFGP') call ACFGPinit(Eorder,Q2fit)
      if (name.eq.'WHITG') call WHITGinit(Eorder,Q2fit)
      if (name.eq.'OWP') call OWPinit(Eorder,Q2fit)
      if (name.eq.'SMRSP') call SMRSPinit(Eorder,Q2fit)
      if (name.eq.'GRVP0' .OR. 
     +    name.eq.'GRVP1') call GRVPinit(Eorder,Q2fit)
      if (name.eq.'ABFKWP') call ABFKWPinit(Eorder,Q2fit)
      return
*
      entry initPDF(iset)
c      print *,'initPDF(',iset,') called -- name=',name  	!*** temporary ***
      iiset = iset
      if (name.eq.'QCDNUM') then
         call InitEvolvePDF(iset)
         call QCDNUMpdf(iset)
      endif
      if (name.eq.'QCDNUM_MRST') then
         call InitEvolvePDF(iset)
         call QCDNUMpdf(iset)
      endif
      if (name(1:11).eq.'QCDNUM_ZEUS') then
         call InitEvolvePDF(iset)
         call ZEUSpdf(iset)
      endif
      if (name.eq.'MRST') then
         call InitEvolvePDF(iset)
         call QCDNUMpdf(iset)
      endif
      if (name.eq.'MRSTpdf') then
         call InitEvolvePDF(iset)
         call QCDNUMpdf(iset)
      endif
      if (name.eq.'EVLCTEQ') then
         call InitEvolvePDF(iset)
         call EVLCTEQpdf(iset)
      endif
      if (name.eq.'CTEQ6ABgrid') then
         call CTEQ6NewAlpha(iset)
         call CTEQ6pdf(iset)
      endif
      if (name.eq.'H12000') then
         call InitEvolvePDF(iset)
         call H1pdf(iset)
      endif
      if (name.eq.'CTEQ5grid') call CTEQ5pdf(iset)
      if (name.eq.'CTEQ6grid') call CTEQ6pdf(iset)
      if (name.eq.'CTEQ6ABgrid') call CTEQ6pdf(iset)
      if (name.eq.'MRSTgrid') call MRSTpdf(iset)
      if (name.eq.'MRST98grid') call MRST98pdf(iset)
      if (name.eq.'A02') call A02pdf(iset)
      if (name.eq.'A02M') call A02Mpdf(iset)
      if (name.eq.'GRV0' .OR.
     +    name.eq.'GRV1') call GRVpdf(iset)
      if (name.eq.'SASG') call SASGpdf(iset)
      if (name.eq.'GRVG') call GRVGpdf(iset)
      if (name.eq.'DOG0' .OR.
     +    name.eq.'DOG1') call DOGpdf(iset)
      if (name.eq.'DGG') call DGGpdf(iset)
      if (name.eq.'LACG') call LACGpdf(iset)
      if (name.eq.'GSG0' .OR.
     +    name.eq.'GSG1') call GSGpdf(iset)
      if (name.eq.'GSG960' .OR.
     +    name.eq.'GSG961') call GSG96pdf(iset)
      if (name.eq.'ACFGP') call ACFGPpdf(iset)
      if (name.eq.'WHITG') call WHITGpdf(iset)
      if (name.eq.'OWP') call OWPpdf(iset)
      if (name.eq.'SMRSP') call SMRSPpdf(iset)
      if (name.eq.'GRVP0' .OR.
     +    name.eq.'GRVP1') call GRVPpdf(iset) 
      if (name.eq.'ABFKWP') call ABFKWPpdf(iset)
      return
*
      end
