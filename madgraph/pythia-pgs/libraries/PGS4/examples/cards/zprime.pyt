!********* Datacard for Z'->mumu production **********************
!         mcp08                PYTHIA v6.155
!
!OBTAINED OFF THE WEB FROM FERMILAB 
!http://www-hep.uta.edu/~mcfarm/mcfarm/p06/
!  hepfm/zprime-ee-1.0-PtGt5.-10000-a.cards
!
!   PROTON STRUCTURE FUNCTION SELECTION FROM PDFLIB
!
!   SET MSTP(52) = 2 FOR PDFLIB CHOICE
! MSTP(51)=4032
!  EXAMPLES:
!  MRSD-=3031 ; MRSG=3041
!  CTEQ2M=4018 ; CTEQ2PM=4024 ; CTEQ3M=4030 ; CTEQ4M=4034
!  GRVH0=5002 ; GRV94H0=5006
!
! MSTP(51)=4032
! MSTP(52)=2
!
! TOP MASS
PMAS(6,1)=175
!
! CHANGING RANDOM NUMBER GENERATOR SEED
!
!MRPY(1) = 1852878084
!
MSEL=21                 ! gamma*/Z/Z' with full interference structure 
!MSTP(44)=3             ! Z' only (use cautiously)
!
! kinematics
!
CKIN(1)=500.              ! Lower bound on the gamma*/Z/Z' mass
CKIN(2)=1000.              ! Upper bound on the gamma*/Z/Z' mass
CKIN(3)=5.000000             ! Minimum Pt for hard 2->2 process.
CKIN(4)=99999.000000            ! Maximum Pt for hard 2->2 process.
CKIN(9)=-4.2              ! Rapidity range for product with
CKIN(10)=4.2              ! largest rapidity in hard 2->2 process.
!
!MSTP(81) = 1
!MSTP(82)=4     ! varying IP (double gauss. matter distr.)
!PARP(82)=2.4   ! with smooth turn off below pT=PARP(82)
!
PMAS(32,1)=750.000000
PMAS(32,2)=19.154    ! Here: Gamma(Z')=Gamma(Z)*m(Z')/m(Z)
!
! Forcing Z' decays into dimuon or dielectron
!            
MDME(289,1)=0  !   d dbar
MDME(290,1)=0  !   u ubar
MDME(291,1)=0  !   s  sbar
MDME(292,1)=0  !   c  cbar
MDME(293,1)=0  !   b  bbar    
MDME(294,1)=0  !   t  tbar
MDME(295,1)=-1 !   b'  b'bar
MDME(296,1)=-1 !   t'  t'bar 
MDME(297,1)=1  !   e-  e+
MDME(298,1)=0  !   nu_e nu_ebar
MDME(299,1)=1  !   mu-  mu+   
MDME(300,1)=0  !   nu_mu nu_mubar
MDME(301,1)=0  !   tau-  tau+  
MDME(302,1)=0  !   nu_tau nu_taubar 
MDME(303,1)=-1 !   tau'- tau'+
MDME(304,1)=-1 !   nu'_tau nu'_taubar
MDME(305,1)=0  !   W+W-
MDME(306,1)=0  !   H+ H-
MDME(307,1)=0  !   Z0 gamma
MDME(308,1)=0  !   Z0 h0
MDME(309,1)=0  !   h0 A0
MDME(310,1)=0  !   H0 A0
!
! Setting the Z' couplings (hereafter are the default values)
!      
!PARU(121)=-0.693 ! V coupling of Z' to down type quarks
!PARU(122)=-1.    ! A coupling of Z' to down type quarks
!PARU(123)=0.387  ! V coupling of Z' to up type quarks
!PARU(124)= 1.    ! A coupling of Z' to up type quarks
!PARU(125)=-8.    ! V coupling of Z' to charged leptons
!PARU(126)=-1.    ! A coupling of Z' to charged leptons
!PARU(127)=1.     ! V coupling of Z' to neutrinos
!PARU(128)=1.     ! A coupling of Z' to neutrinos
!PARU(129)=1.     ! (m(Z')/m(W))**2 x g(Z'->WW)/g(Z->WW)              
!PARU(130)=0.     ! fraction of H->WW (i.e. W_L) in the angular distr. of Z'->WW->4f
!                   1-PARU(30): fraction of Z->WW like (i.e. aW_L+bW_T) angular distr. of Z'->WW->4f
!
!MDCY(15,1)=0   ! sets tau stable - this is important (for tauola)
!
! The next line is _mandatory_ for RunII production
! MSTJ(22)=2     !A particle is decayed only if its proper
!lifetime is smaller than PARJ(71)
! default should be ok. (strange particles stable, charm & bottom
! decay).
! MSTU(16)=2 ! Gives improved particle history record
