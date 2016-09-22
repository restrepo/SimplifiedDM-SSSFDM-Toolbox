C  DEC/CMS REPLACEMENT HISTORY, Element TAUOLA.CIN
C  *7    12-JUL-1995 14:15:14 EKUNS "Define every variable (8 hrs work)"
C  *6    19-JAN-1995 16:50:23 EKUNS "Change TDL -> TD to avoid C$TOP name clash"
C  *5     2-DEC-1994 21:17:41 EKUNS "Add option to use W/Z rest frame for polarization"
C  *4     4-NOV-1994 22:07:56 EKUNS "Add tau polarization correlations"
C  *3    21-SEP-1994 14:44:15 EKUNS "For new version of C$TAU:TAUOLA.CDF"
C  *2    29-JUL-1994 17:02:43 EKUNS "Rename HEPEVT common to TDLEVT"
C  *1    26-JUL-1994 16:47:41 EKUNS "TAU  Include  File "
C  DEC/CMS REPLACEMENT HISTORY, Element TAUOLA.CIN
C...Error return codes.
      integer TDSUCC
      parameter (TDSUCC=0)
      integer TDERRR
      parameter (TDERRR=1)

C...Name of TAUOLA parameter bank
      character*4 tlanam
      parameter (tlanam='$TLA')

C...Common block to pass in transformation values for tralo4.
      real cnst1,cnst2,betah(4)
      common /tdpass/cnst1,cnst2,betah

C...This keeps track of the TAUOLA parameter set in memory.
      integer curpars
      real helicity,taulife
      logical ptauend,usegenp,schiral,WZpolar
      common /tdpara/curpars,ptauend,usegenp,helicity,taulife,schiral,
     .               WZpolar

C...Particle masses.
      real              amtau,amnuta,amel,amnue,ammu,amnumu
     *                 ,ampiz,ampi,amro,gamro,ama1,gama1
     *                 ,amk,amkz,amkst,gamkst
      common / parmas / amtau,amnuta,amel,amnue,ammu,amnumu
     *                 ,ampiz,ampi,amro,gamro,ama1,gama1
     *                 ,amk,amkz,amkst,gamkst

C...Standard Model parameters.
      real              gfermi,gv,ga,ccabib,scabib,gamel
      common / decpar / gfermi,gv,ga,ccabib,scabib,gamel

C...QED parameters.
      real*8           alfinv,alfpi,xk0
      common / qedprm /alfinv,alfpi,xk0

C...Tau branching ratios.
      real gamprt
      integer jlist,nchan
      common / taubra / gamprt(30),jlist(30),nchan

C...Kaon decay parameters.
      real              bra1,brk0,brk0b,brks
      common / taukle / bra1,brk0,brk0b,brks

C...Input and output unit numbers.
      integer inut,iout
      common / inout / inut,iout

C...Other common blocks.
      integer nmode,nm1,nm2,nm3,nm4,nm5,nm6
      parameter (nmode=15,nm1=0,nm2=1,nm3=8,nm4=2,nm5=1,nm6=3)

      integer idffin,mulpik
      character*32 names
      common / taudecomp /idffin(9,nmode),mulpik(nmode),names(nmode)

C...Switches for TAUOLA.
      integer jak1,jak2,jakp,jakm,ktom
      common / jaki   /jak1,jak2,jakp,jakm,ktom

C...Radiation (?) switches.
      integer itdkrc
      real*8 xk0dec
      common / taurad /xk0dec,itdkrc

C...LUND Tau+ identifier.
      integer idff
      common / idfc  /idff

C...Switch for A1 and rho resonances.
      integer keya1
      common / testa1 /keya1

C...Internal TAUOLA common.
      real gampmc, gamper
      integer nevdec
      common / taubmc /gampmc(30),gamper(30),nevdec(30)

C...Another internal TAUOLA common.
      real pp1(4),pp2(4)
      integer kf1,kf2
      common / decp4 / pp1,pp2,kf1,kf2

C...TAUOLA log file unit number
      integer tun
      common / taulun / tun
