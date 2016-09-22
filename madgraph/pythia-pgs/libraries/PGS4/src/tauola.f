C...Scan the hepevt list for taus.  WARNING: this will decay only those
C...taus which have not already been decayed by the generator.  So, if
C...you want TAUOLA to handle the tau decays, you must turn off the decays
C...in the generator.

      subroutine tauola_scan
      implicit none

C...Include files.
      include 'stdhep.inc'
      include 'polhep.inc'

C...Parameters.
      integer taup,taum
      parameter (taup=-15)
      parameter (taum=15)

      integer zbos,wbos,h1bos,h2bos,h3bos,chbos
      parameter (zbos=23)
      parameter (wbos=24)
      parameter (h1bos=25)
      parameter (h2bos=35)
      parameter (h3bos=36)
      parameter (chbos=37)

C...Local declarations.
      integer i
      real mult
      integer imoth

C...Externals.
      integer get_mother
      external get_mother

C...Initialize the chirality array.
      do i=1,nhep
         chirality(i) = 0
      enddo

C...Loop over the particles and set polarizations for taus.
C      if (nevhep.ge.23) then
C         write (*,*) 'tauola: isthep', isthep
C         write (*,*) 'tauola: idhep', idhep
C      endif
      do i=1,nhep
            if (isthep(i).eq.1) then
            if (idhep(i).eq.taup.or.idhep(i).eq.taum) then

C...Randomly select a chirality.
               call tdrand(mult,1)
               if (mult.le.0.5) then
                  mult = -1.0   !Left-chiral
               else
                  mult =  1.0   !Right-chiral
               endif
C               if (nevhep.eq.24) then
C                  WRITE (*,*) 'calling mother'
C               endif
C...  Find the index to the mother particle.
               imoth = get_mother(i)
C               if (nevhep.eq.24) then
C                  WRITE (*,*) 'mother:', imoth
C               endif
C...Check the Z bosons first.  The tau's must have same chirality.
               if (idhep(imoth).eq.zbos) then
                  if (chirality(imoth).eq.0) then
                     chirality(i) = mult
                     chirality(imoth) = mult
                  else
                     chirality(i) = chirality(imoth)
                  endif

C...W bosons.  Tau's from W's are always left-chiral.
               else if (abs(idhep(imoth)).eq.wbos) then
                  chirality(i) = -1
                  chirality(imoth) = -1

C...Charged Higgs bosons.  Tau's from H+- are always right-chiral.
               else if (abs(idhep(imoth)).eq.chbos) then
                  chirality(i) = 1
                  chirality(imoth) = 1

C...Neutral Higgs bosons.  Tau's have the opposite chirality.
               else if (idhep(imoth).eq.h1bos
     .                 .or.idhep(imoth).eq.h2bos
     .                 .or.idhep(imoth).eq.h3bos) then
                  if (chirality(imoth).eq.0) then
                     chirality(i) = mult
                     chirality(imoth) = mult
                  else
                     chirality(i) = -chirality(imoth)
                  endif
               else
                  chirality(i) = mult
               endif
            endif
         endif
      enddo
C      if (nevhep.eq.24) then
C         write (*,*) 'assigned chiralities'
C      endif
C...Loop over the particles and find the taus and decay them.
      do i=1,nhep
         if (isthep(i).eq.1) then
            if (idhep(i).eq.taup.or.idhep(i).eq.taum) then
               call tauola_decay(i)
            endif
         endif
      enddo

C...Done.  Leave. 
      return
      end


      subroutine tauola_decay(index)
      implicit none

C...Parameter declaration.
      integer index

C...Include files.
      include 'tauola.inc'
      include 'stdhep.inc'
      include 'polhep.inc'

C...Local declarations.
      integer i,ind

      real p2,E2,m2,p,E,m,mult
      real pol(4),vertex(4),dist
      real fourv(4)
      real rnuni

C...Speed of light in mm/fs.
      real c
      parameter (c=2.99792458E-4)

C...Externals.
      real rnexp
      external rnexp

C...Executable code.
C...Reset the input common block.
      call reslu

C...Fix the mass (and energy) of the tau.
      phep(5,index) = amtau
      phep(4,index) = sqrt(
     .     (phep(1,index)**2+phep(2,index)**2+phep(3,index)**2)+
     .     phep(5,index)**2)

C...Mark this as a decaying particle now.
      isthep(index) = 2

C...Determine the chirality.
      mult = chirality(index)

C...Calculate tau information into temporary arrays.
       p2 = phep(1,index)**2+phep(2,index)**2+phep(3,index)**2
      E2 = p2 + phep(5,index)**2
      m = phep(5,index)
      
      p = sqrt(p2)
      E = sqrt(E2)
C...Determine polarization.
      if (WZpolar) then
         call searchWZ(index,pol)
      else
         pol(1) = phep(1,index)/p
         pol(2) = phep(2,index)/p
         pol(3) = phep(3,index)/p
         pol(4) = 0.0
      endif
      
C...Put polarization in correct direction.
      pol(1) = mult*pol(1)
      pol(2) = mult*pol(2)
      pol(3) = mult*pol(3)
      pol(4) = mult*pol(4)

C...Load tau information into temporary arrays.
      cnst1 = (E-m)/p2
      cnst2 = 1./m
      betah(1) = phep(1,index)
      betah(2) = phep(2,index)
      betah(3) = phep(3,index)
      fourv(1) = phep(1,index)
      fourv(2) = phep(2,index)
      fourv(3) = phep(3,index)
      fourv(4) = E

C...Determine the decay vertex for all decay products.
      vertex(1) = vhep(1,index)
      vertex(2) = vhep(2,index)
      vertex(3) = vhep(3,index)
      vertex(4) = vhep(4,index)
      if (p.ne.0.) then
         call tdrand(rnuni,1)
         dist = rnexp(rnuni,(p*taulife*c)/m)
         vertex(1) = vertex(1) + (betah(1)/p)*dist
         vertex(2) = vertex(2) + (betah(2)/p)*dist
         vertex(3) = vertex(3) + (betah(3)/p)*dist
         vertex(4) = vertex(4) + dist
      endif

C...Have TAUOLA decay the tau.
      if (idhep(index).eq.15) then
         ind = 4
         call filhep(ind,1,15,0,0,0,0,fourv,amtau,.true.)
         call dexay(2,pol)
      else if (idhep(index).eq.-15) then
         pol(1) = -pol(1)
         pol(2) = -pol(2)
         pol(3) = -pol(3)
         ind = 3
         call filhep(ind,1,-15,0,0,0,0,fourv,amtau,.true.)
         call dexay(1,pol)
      endif
      call decay_tau(index,ind,vertex)

C...Done.  Leave.
      return
      end



C...This routine is called at initialization.
      subroutine tauola_init(unit_number)
      implicit none

C...Include files.
      include 'tauola.inc'

C...Local declarations.
      integer i,j,unit_number
      real dummy
      integer status
      real pi
      double precision pi8
      real width

C...multipion decays
C...conventions of particles names
C...              K-,P-,K+,  K0,P-,KB,  K-,P0,K0
C...               3, 1,-3  , 4, 1,-4  , 3, 2, 4  ,
C...              P0,P0,K-,  K-,P-,P+,  P-,KB,P0
C...               2, 2, 3  , 3, 1,-1  , 1,-4, 2  ,
C...              ET,P-,P0   P-,P0,GM
C...               9, 1, 2  , 1, 2, 8
C...
      INTEGER NOPIK(6,NMODE),NPIK(NMODE)
      DATA   NPIK  /                4,                    4,  
     1                              5,                    5,
     2                              6,                    6,
     3                              3,                    3,            
     4                              3,                    3,            
     5                              3,                    3,            
     6                              3,                    3,  
     7                              2                         /         
      DATA  NOPIK / -1,-1, 1, 2, 0, 0,     2, 2, 2,-1, 0, 0,  
     1              -1,-1, 1, 2, 2, 0,    -1,-1,-1, 1, 1, 0,  
     2              -1,-1,-1, 1, 1, 2,    -1,-1, 1, 2, 2, 2, 
     3              -3,-1, 3, 0, 0, 0,    -4,-1, 4, 0, 0, 0,  
     4              -3, 2,-4, 0, 0, 0,     2, 2,-3, 0, 0, 0,  
     5              -3,-1, 1, 0, 0, 0,    -1, 4, 2, 0, 0, 0,  
     6               9,-1, 2, 0, 0, 0,    -1, 2, 8, 0, 0, 0,
     7              -3, 4, 0, 0, 0, 0                         /

      character*1 yes

C...Send TAUOLA output to unit 6. (No input needed.)
      inut = 0
      iout = unit_number
      tun = unit_number

C...Set the lifetime for the tau (fs).
      taulife = 295.6

C...Add the logical for "same chirality."
      schiral = .true.

C...Set the logical for using W/Z/H rest frame for tau polarization.
      wzpolar = .true.

C...Assume we have already read in the PDG table.  JC 051102
c      call pdgrdtb
c      call pdgprtb(1,6)

C...Set the variables for the default parameter set (par=1).
C...First the masses. (PARMAS)
      call pdgmw(11,amel,width)
      call pdgmw(12,amnue,width)

      call pdgmw(13,ammu,width)
      call pdgmw(14,amnumu,width)

      call pdgmw(15,amtau,width)

      call pdgmw(16,amnuta,width)
      if (amnuta.le.0.) amnuta = 0.010

      call pdgmw(111,ampiz,width)
      call pdgmw(211,ampi,width)

      call pdgmw(113,amro,gamro)

      call pdgmw(20113,ama1,gama1)
      if (gama1.le.0.) gama1 = 0.599

      call pdgmw(321,amk,width)
      call pdgmw(311,amkz,width)
      call pdgmw(323,amkst,gamkst)

C...Now Standard Model and QED parameters. (DECPAR and QEDPRM)
      gfermi = 1.166392e-5
      gv     = 1.0
      ga     =-1.0
      ccabib = 0.975
      scabib = sqrt(1.-ccabib*ccabib)
      pi = 4.*atan(1.)
      gamel  = gfermi**2*amtau**5/(192*pi**3)

      alfinv = 137.035989561D0
      pi8    = 4.D0*DATAN(1.D0)
      alfpi  = 1D0/(alfinv*pi8)
      xk0    = 0.10

C...Now the branching ratios.
      nchan = nmode + 7
      do i=1,30
        if (i.le.nchan) jlist(i) = i
        gamprt(i) = 0.
      enddo
      gamprt( 1) = 1.00000
      gamprt( 2) = 0.97980
      gamprt( 3) = 0.64956
      gamprt( 4) = 1.39902
      gamprt( 5) = 1.00055
      gamprt( 6) = 0.03712
      gamprt( 7) = 0.08024
      gamprt( 8) = 0.31223

C...Now the kaon decay parameters.
      bra1   = 0.5
      brk0   = 0.5
      brk0b  = 0.5
      brks   = 0.6667

C...Lastly the helicity. (Default is left-chiral.)
      helicity = 1.0

C...Now set those variables which do not depend on the parameter set.
C...Names of the decay modes.
      names( 1)='  TAU-  --> 2PI-,  PI0,  PI+   '
      names( 2)='  TAU-  --> 3PI0,        PI-   '
      names( 3)='  TAU-  --> 2PI-,  PI+, 2PI0   '
      names( 4)='  TAU-  --> 3PI-, 2PI+,        '
      names( 5)='  TAU-  --> 3PI-, 2PI+,  PI0   '
      names( 6)='  TAU-  --> 2PI-,  PI+, 3PI0   '
      names( 7)='  TAU-  -->  K-, PI-,  K+      '
      names( 8)='  TAU-  -->  K0, PI-, K0B      '
      names( 9)='  TAU-  -->  K-,  K0, PI0      '
      names(10)='  TAU-  --> PI0, PI0,  K-      '
      names(11)='  TAU-  -->  K-, PI-, PI+      '
      names(12)='  TAU-  --> PI-, K0B, PI0      '
      names(13)='  TAU-  --> ETA, PI-, PI0      '
      names(14)='  TAU-  --> PI-, PI0, GAM      '
      names(15)='  TAU-  -->  K-,  K0           '

C...Multipion decays.
      do i=1,nmode
        mulpik(i) = npik(i)
        do j=1,mulpik(i)
          idffin(j,i) = nopik(j,i)
        enddo
        call flush(6)
      enddo

C...Switches.
      jak1 = 0
      jak2 = 0
      itdkrc = 1
      xk0dec = 0.001
      idff = -15
      keya1 = 0

C...Flag for printing out TAUOLA endrun statistics.
      ptauend = .true.

C...Flag indicating which event bank to use (GENP or HEPG).
      usegenp = .true.

C...Initialize the TAUOLA package.
      call dexay(-1,dummy)

C...Print out the current parameters.
      call show_parset()

      return
      end


C...This subroutine transforms any vector from the tau rest frame
C...to the lab frame.
C...This formulation of the Lorentz transformation guarantees that the
C...mass is invarient.  The constants used in the transformation are:
C...  cnst2 = 1/m
C...  cnst1 = (E-m)/(p*p)
C...where p is the magnitude of the momentum vector.
C...
      subroutine tralo4(kto,vrest,vlab,mass)
      implicit none

C...Include file.
      include 'tauola.inc'

C...Parameter declarations.
      integer kto
      real vrest(4),vlab(4),mass

C...Local declarations.
      real betahx, A

C...Calculate the mass.
      mass = vlab(4)**2-vlab(1)**2-vlab(2)**2-vlab(3)**2
      mass = sqrt(max(0.0,mass))

C...Calculate constants.
      betahx = betah(1)*vrest(1)+betah(2)*vrest(2)+betah(3)*vrest(3)
      A = cnst2*(cnst1*betahx+vrest(4))

C...Actually transform the vector.
      vlab(1) = vrest(1) + betah(1)*A
      vlab(2) = vrest(2) + betah(2)*A
      vlab(3) = vrest(3) + betah(3)*A
      vlab(4) = sqrt(vlab(1)**2+vlab(2)**2+vlab(3)**2+mass**2)

C...Enough.
      return
      end

C...This prints out all of the parameters.
      subroutine show_parset()
      implicit none

C...Include file.
      include 'tauola.inc'

C...Local declarations.
      integer i

C...Write out the values from the common block.
      write(tun,*) '________________________________________',
     .              '_______________________________________'
      write(tun,*) 'TAUOLA VERSION 2.1 PARAMETER SET',curpars

      write(tun,*) '________________________________________',
     .              '_______________________________________'
      if (ptauend) write(tun,*) 'Printing end run statistics.'
      if (.not.ptauend) write(tun,*) 'NOT Printing end run statistics.'
      if (usegenp) write(tun,*) 'GENP bank used for input.'
      if (.not.usegenp) write(tun,*) 'HEPG bank used for input.'
      if (schiral) write(tun,*) 
     .    'Mult. taus in event have same chirality.'
      if (.not.schiral) write(tun,*) 
     .    'Mult. taus in event have random chirality.'
      if (wzpolar) write(tun,*) 
     .    'Taus polarized in W/Z rest frame.'
      if (.not.wzpolar) write(tun,*) 
     .    'Taus polarized in lab frame.'
      write(tun,*) 'Helicity: ',helicity
      write(tun,*) 'Lifetime: ',taulife,'fs'
      write(tun,*) '________________________________________',
     .              '_______________________________________'
      write(tun,*) 'STANDARD MODEL PARAMETERS'
      write(tun,*) 'Gfermi =             ',gfermi
      write(tun,*) 'Gv =                 ',gv
      write(tun,*) 'Ga =                 ',ga
      write(tun,*) 'Cos(Cabibbo_angle) = ',ccabib
      write(tun,*) 'Sin(Cabibbo_angle) = ',scabib
      write(tun,*) 'Gamma_e =            ',gamel
      write(tun,*) '1/alpha =            ',alfinv
      write(tun,*) '1/(alpha*pi) =       ',alfpi
      write(tun,*) 'xk0 =                ',xk0
      write(tun,*) '________________________________________',
     .              '_______________________________________'
      write(tun,*) 'KAON/A1 DECAY PARAMETERS'
      write(tun,*) 'bra1  =',bra1
      write(tun,*) 'brk0  =',brk0
      write(tun,*) 'brk0b =',brk0b
      write(tun,*) 'brks  =',brks
      write(tun,*) '________________________________________',
     .              '_______________________________________'
      write(tun,*) 'MASSES'
      write(tun,*) 'e     =',amel,'     nu_e  =',amnue
      write(tun,*) 'mu    =',ammu,'     nu_mu =',amnumu
      write(tun,*) 'tau   =',amtau,'     nu_tau=',amnuta
      write(tun,*) 'pi    =',ampi
      write(tun,*) 'pi0   =',ampiz
      write(tun,*) 'rho   =',amro,'     rho wid.=',gamro
      write(tun,*) 'A1    =',ama1,'     A1 wid. =',gama1
      write(tun,*) 'K     =',amk
      write(tun,*) 'K0    =',amkz
      write(tun,*) 'K*    =',amkst,'     K* wid. =',gamkst
      write(tun,*) '________________________________________',
     .              '_______________________________________'
      write(tun,*) 'TAU BRANCHING RATIOS'
      write(tun,*) 'nchan = ',nchan
      write(tun,*) 'Tau --> e nu nu         ',gamprt( 1)
      write(tun,*) 'Tau --> mu nu nu        ',gamprt( 2)
      write(tun,*) 'Tau --> pi nu           ',gamprt( 3)
      write(tun,*) 'Tau --> Rho (--> 2pi) nu',gamprt( 4)
      write(tun,*) 'Tau --> A1 (--> 3pi) nu ',gamprt( 5)
      write(tun,*) 'Tau --> K nu            ',gamprt( 6)
      write(tun,*) 'Tau --> K* nu           ',gamprt( 7)
      write(tun,*) 'Tau --> 3pi pi0 nu      ',gamprt( 8)
      write(tun,*) 'Tau --> pi 3pi0 nu      ',gamprt( 9)
      write(tun,*) 'Tau --> 3pi 2pi0 nu     ',gamprt(10)
      write(tun,*) 'Tau --> 5pi nu          ',gamprt(11)
      write(tun,*) 'Tau --> 5pi pi0 nu      ',gamprt(12)
      write(tun,*) 'Tau --> 3pi 3pi0 nu     ',gamprt(13)
      write(tun,*) 'Tau --> 2K pi nu        ',gamprt(14)
      write(tun,*) 'Tau --> pi K0 K0bar nu  ',gamprt(15)
      write(tun,*) 'Tau --> K K0 pi0 nu     ',gamprt(16)
      write(tun,*) 'Tau --> K 2pi0 nu       ',gamprt(17)
      write(tun,*) 'Tau --> K 2pi nu        ',gamprt(18)
      write(tun,*) 'Tau --> pi K0bar pi0 nu ',gamprt(19)
      write(tun,*) 'Tau --> eta pi pi0 nu   ',gamprt(20)
      write(tun,*) 'Tau --> pi pi0 gam nu   ',gamprt(21)
      write(tun,*) 'Tau --> K K0 nu         ',gamprt(22)
      write(tun,*) '________________________________________',
     .              '_______________________________________'

C...Leave.
      return
      end

C...This provides an interface to the CDF random number generator
C...without modifying the TAUOLA library.
      subroutine tdrand(rvec,lenv)
      implicit none

C...Parameter declarations.
      real rvec(*),pgs_ranmar
      integer lenv

C...Local declarations.
      integer i
      integer iseed/2933/
      save iseed

C...Executable code.
      do i=1,lenv
        rvec(i) = pgs_ranmar()
      enddo

      return
      end



      subroutine decay_tau(root,index,vertex)
      implicit none

C...Parameter declaration.
      integer root,index
      real vertex(4)

C...Include files.
      include 'tauola.inc'
      include 'stdhep.inc'

C...Event output common block.  THIS IS A COPY OF THE TDEVNT COMMON
C...BLOCK IN THE TAUOLA LIBRARY.  THE NAMES HAVE BEEN CHANGED SO THAT
C...THIS PART OF THE CODE CAN ACCESS BOTH THE HEPEVT COMMON BLOCK AND
C...THE TDEVNT COMMON BLOCK AT THE SAME TIME.
      integer nmxhepx
      parameter (nmxhepx=2000)

      integer nevhepx,nhepx,isthepx,idhepx,jmohepx,jdahepx
      double precision phepx,vhepx
      common/tdevnt/nevhepx,nhepx,isthepx(nmxhepx),idhepx(nmxhepx),
     &jmohepx(2,nmxhepx),jdahepx(2,nmxhepx),phepx(5,nmxhepx),
     &vhepx(4,nmxhepx)

C...Local declarations.
      integer i,j,ndau,offset
      real p2,E2,m2,p,E,m
      real njet,mult,pol(4)
      real mtemp,fourv(4),pout(5,5)
      integer nf,ierr,idout(3)

C...Externals.
      integer cdftra,reloff

C...Loop over TAUOLA's event record and use PDECAY to
C...decay any eta's or pizero's which appear.
      i = index+1
      do while (i.le.nhepx)
         if ((idhepx(i).eq.111.or.idhepx(i).eq.221)) then
            
            p2 = phepx(1,i)**2+phepx(2,i)**2+phepx(3,i)**2
            E2 = phepx(4,i)**2
            m2 = E2-p2

C...Add trap for m=0.
C...Added a trap for negative or zero masses.
            if (m2.le.0.) then
               if (idhepx(i).eq.111) m = ampiz
               if (idhepx(i).eq.221) m = 0.54745
               write(tun,*) 'WARNING: Non-positive pi-zero or eta mass.'
            else
               m = sqrt(m2)
            endif
            
            cnst1 = (phepx(4,i)-m)/p2
            cnst2 = 1./m
            betah(1) = phepx(1,i)
            betah(2) = phepx(2,i)
            betah(3) = phepx(3,i)
            fourv(1) = phepx(1,i)
            fourv(2) = phepx(2,i)
            fourv(3) = phepx(3,i)
            fourv(4) = phepx(4,i)
            
            call pdecay(idhepx(i),m,pout,idout,nf)
            do j=1,nf
               fourv(1) = pout(1,j)
               fourv(2) = pout(2,j)
               fourv(3) = pout(3,j)
               fourv(4) = pout(4,j)
               call tralo4(0,fourv,fourv,mtemp)
               mtemp = pout(5,j)
               call filhep(0,1,idout(j),i,i,0,0,
     .              fourv,mtemp,.true.)
            enddo
         endif
         i = i+1
      enddo

C...Move information into HEPEVT commons.
C...First update the daughter indicies for the decayed tau.
      offset = nhep
      jdahep(1,root) = reloff(jdahepx(1,index),root,index,offset)
      jdahep(2,root) = reloff(jdahepx(2,index),root,index,offset)
      do i=index+1,nhepx
        nhep = nhep + 1
        phep(1,nhep) = phepx(1,i)
        phep(2,nhep) = phepx(2,i)
        phep(3,nhep) = phepx(3,i)
        phep(4,nhep) = phepx(4,i)
        phep(5,nhep) = phepx(5,i)
        idhep(nhep) = idhepx(i)
        vhep(1,nhep) = vertex(1)
        vhep(2,nhep) = vertex(2)
        vhep(3,nhep) = vertex(3)
        vhep(4,nhep) = vertex(4)
        jmohep(1,nhep) = reloff(jmohepx(1,i),root,index,offset)
        jmohep(2,nhep) = 0
        jdahep(1,nhep) = reloff(jdahepx(1,i),root,index,offset)
        jdahep(2,nhep) = reloff(jdahepx(2,i),root,index,offset)

        if (jdahep(1,nhep).gt.0) then
           isthep(nhep) = 2
        else
           isthep(nhep) = 1
        endif
      enddo

C...Return.
      return
      end


      integer function reloff(value,root,index,offset)
      implicit none

C...Parameter declarations.
      integer value,root,index,offset

C...Executable code.
      if (value.eq.0) then
        reloff = 0
      else if (value.eq.index) then
        reloff = root
      else
        reloff = offset+(value-index)
      endif

C...Return.
      return
      end


C...Exponentially distributed random number.
      real function rnexp(rnuni,tau)
      implicit none

C...Parameter declarations.
      real rnuni,tau

C...Local declarations.
      rnexp = -tau*log(1.-rnuni)
         
      end
      
C...This subroutine searches back in the decay tree for the W or Z which 
C...produced the tau. (This routine now searches for a parent Higgs.)
      subroutine searchWZ(tauind,polar)
      implicit none

C...Parameter declarations.
      integer tauind
      real polar(4)

C...Include files.
      include 'tauola.inc'
      include 'stdhep.inc'

C...Local declarations.
      integer point,nerrors
      data nerrors/0/
      real p,p2,E,E2,m,mass,fourv(4),mult
      
C...Setup current particle pointer.
      point = tauind

C...Setup default polarization in case of error.
      p2 = phep(1,tauind)**2+phep(2,tauind)**2+phep(3,tauind)**2
      p = sqrt(p2)
      call tdrand(mult,1)
      if (mult.lt.0.5) then
        mult = 1.
      else
        mult = -1.
      endif
      polar(1) = mult*phep(1,tauind)/p
      polar(2) = mult*phep(2,tauind)/p
      polar(3) = mult*phep(3,tauind)/p
      polar(4) = 0.0
C...Check for errors.
10    continue
      if (point.le.0) then
         if(nerrors.lt.10)then
            write(tun,*) 'WARNING: Tau doesn''t come from W/Z/H.'
            nerrors = nerrors + 1
         else if(nerrors.eq.10)then
            write(tun,*) 'WARNING: Tau doesn''t come from W/Z/H.'
            write(tun,*) 'Additional warnings will be suppressed'
            nerrors = nerrors + 1
         endif
         return
      endif
      if (jmohep(1,point).eq.0) then
         if(nerrors.lt.10)then
            write(tun,*) 'WARNING: Tau doesn''t come from W/Z/H.'
            nerrors = nerrors + 1
         else if(nerrors.eq.10)then
            write(tun,*) 'WARNING: Tau doesn''t come from W/Z/H.'
            write(tun,*) 'Additional warnings will be suppressed'
            nerrors = nerrors + 1
         endif
        return
      endif
C     ATP, JKT, LTW fix to avoid Herwig infinite loop
      if (idhep(point).eq.0) then
         if(nerrors.lt.10)then
            write(tun,*) 'WARNING: Tau doesn''t come from W/Z/H.'
            nerrors = nerrors + 1
         else if(nerrors.eq.10)then
            write(tun,*) 'WARNING: Tau doesn''t come from W/Z/H.'
            write(tun,*) 'Additional warnings will be suppressed'
            nerrors = nerrors + 1
         endif
         return
      endif
c     end  ATP,JKT,LTW

      point = jmohep(1,point)

C...Is this particle a W, Z, or H?
      if (idhep(point).eq.24.or.idhep(point).eq.-24.or.
     .    idhep(point).eq.23.or.idhep(point).eq.25.or.
     .    idhep(point).eq.35.or.idhep(point).eq.36.or.
     .    idhep(point).eq.37.or.idhep(point).eq.-37) then
        p2 = phep(1,point)**2+phep(2,point)**2+phep(3,point)**2
        E2 = p2 + phep(5,point)**2
        m = phep(5,point)

        p = sqrt(p2)
        E = sqrt(E2)

        cnst1 = (E-m)/p2
        cnst2 = 1./m
        betah(1) = -phep(1,point)
        betah(2) = -phep(2,point)
        betah(3) = -phep(3,point)

C...Determine tau direction in W or Z rest frame.
        E2 = phep(1,tauind)**2+phep(2,tauind)**2+phep(3,tauind)**2+
     .       phep(5,tauind)**2
        E = sqrt(E2)
        fourv(1) = phep(1,tauind)
        fourv(2) = phep(2,tauind)
        fourv(3) = phep(3,tauind)
        fourv(4) = E
        call tralo4(1,fourv,fourv,mass)

        p2 = fourv(1)**2+fourv(2)**2+fourv(3)**2
        p = sqrt(p2)
        if (p.ge.0) then
           polar(1) = fourv(1)/p
           polar(2) = fourv(2)/p
           polar(3) = fourv(3)/p
        else
           polar(1) = 0.0
           polar(2) = 0.0
           polar(3) = 0.0
        endif
        polar(4) = 0.0        
      endif

C...Loop back to find ancestors.
      goto 10
      end


C...Search PDG file for mass and width of a particle.
      subroutine pdgmw(id,mass,width)
      implicit none

C...Parameter declarations.
      integer id
      real mass,width

C...Include files.
      include 'stdtbl.inc'

C...Local declarations.
      integer i

C...Setup for an error return.
      mass = 0.
      width = 0.

C...Loop over file to find particle.
      do i=1,nmxln

         if (idt(i).eq.id) then
            mass = stmass(i)
            width = stwidth(i)
            return
         endif
      enddo

C...Done.
      return
      end


C...Subroutine to find the mother of a particle.
      integer function get_mother(index)
      implicit none

C...Parameter declarations.
      integer index

C...Include files.
      include 'stdhep.inc'
      include 'polhep.inc'

C...Local declarations.
      integer i

C...Error return.
      get_mother = 0

C...Search through list to find the parent of this particle at index.
      do i=1,nhep
         if (isthep(i).ne.3) then
            if (index.ge.jdahep(1,i).and.index.le.jdahep(2,i)) then
               get_mother=i
               return
            endif
         endif
      enddo

C...Leave.
      return
      end

C...This subroutine will generate pizero and eta (phase-space) decays. 
C...This is needed because tauola does not generate these decays itself.
      subroutine pdecay(id,m,pout,idout,nf)
      implicit none

C...Parameter declarations.
      integer id,nf,idout(3)
      real m,pout(5,3)

C...Local declarations.
      integer i,j
      real mass,width,test
      real pcm(4,3)

C...First generate the decays.
      if (id.eq.111) then
         nf = 2
         idout(1) = 22
         idout(2) = 22
      else if (id.eq.221) then
         call tdrand(test,1)
         if (test.lt.0.3951) then
            nf = 2
            idout(1) = 22
            idout(2) = 22
         else if (test.lt.0.7183) then
            nf = 3
            idout(1) = 111
            idout(2) = 111
            idout(3) = 111
         else if (test.lt.0.9519) then
            nf = 3
            idout(1) = 211
            idout(2) =-211
            idout(3) = 111
         else
            nf = 3
            idout(1) = 211
            idout(2) =-211
            idout(3) = 22
         endif
      else
c         write(tun,*) 'WARNING: pdecay called for non-pizero or -eta.'
         return
      endif

C...Fill in the masses.
      do i=1,nf
         call pdgmw(idout(i),mass,width)
         pout(5,i) = mass
      enddo

C...Actual decay.
      if (nf.eq.2) then
         call gdeca2(m,pout(5,1),pout(5,2),pcm)
      else if (nf.eq.3) then
         call gdeca3(m,pout(5,1),pout(5,2),pout(5,3),pcm)
      endif

C...Move information back into output arrays.
      do i=1,nf
         do j=1,4
            pout(j,i) = pcm(j,i)
         enddo
      enddo

C...Done.
      return
      end


      SUBROUTINE GDECA2(XM0,XM1,XM2,PCM)
C.
C.    ******************************************************************
C.    *                                                                *
C.    *  Simulates two body decay process with isotropic angular       *
C.    *  distribution in CMS.                                          *
C.    *                                                                *
C.    *    ==>Called by : GDECAY                                       *
C.    *       Author    G.Patrick  *********                           *
C.    *                                                                *
C.    ******************************************************************
C.
c#include "geant321/gconsp.inc"
      double precision twopi
      parameter (twopi=2d0*3.141592654)
      DIMENSION PCM(4,2)
      DIMENSION RNDM(2)
C.
C.    ------------------------------------------------------------------
C.
C             Generate first decay product in CMS.
C
      E1=(XM0*XM0+XM1*XM1-XM2*XM2)/(2.*XM0)
      P1=SQRT(ABS((E1-XM1)*(E1+XM1)))
C
C             Isotropic decay angular distribution.
C
c      CALL GRNDM(RNDM,2)
      CALL tdrand(RNDM,2)
      COSTH=2.*RNDM(1)-1.
      IF(ABS(COSTH).GE.1.0) THEN
         COSTH=SIGN(1.,COSTH)
         SINTH=0.
      ELSE
         SINTH=SQRT((1.-COSTH)*(1.+COSTH))
      ENDIF
      PHI=TWOPI*RNDM(2)
C
C             Polar co-ordinates to momentum components.
C
      PCM(1,1)=P1*SINTH*COS(PHI)
      PCM(2,1)=P1*SINTH*SIN(PHI)
      PCM(3,1)=P1*COSTH
      PCM(4,1)=E1
C
C             Generate second decay product.
C
      PCM(1,2)=-PCM(1,1)
      PCM(2,2)=-PCM(2,1)
      PCM(3,2)=-PCM(3,1)
      PCM(4,2)=SQRT(PCM(1,2)**2+PCM(2,2)**2+PCM(3,2)**2+XM2*XM2)
C
      END


      SUBROUTINE GDECA3(XM0,XM1,XM2,XM3,PCM)
C.
C.    ******************************************************************
C.    *                                                                *
C.    *   This routine simulates three-body decays in center-of-mass.  *
C.    *   Written by Jurgen Schukraft and Vincent Hedberg for R807.    *
C.    *   Adapted for Geant3 by Sverker Johansson (Aug-1987).          *
C.    *   (Quite extensive modifications; comments etc. are not always *
C.    *    consistent with the code anymore. )                         *
C.    *                                                                *
C.    *   As it is, the decay is done according to pure phase-space.   *
C.    *   There is code in the routine to properly treat K decays (V-A)*
C.    *   but it is not used. (Requires an additional parameter        *
C.    *   in the call, to tell which type of decay.)                   *
C.    *                                                                *
C.    *    ==>Called by : GDECAY                                       *
C.    *       Author    S. Johansson  *********                        *
C.    *                                                                *
C.    ******************************************************************
C.
***************************************************************
******* original name :                     *******************
******SUBROUTINE  D E C 3 B (ID,IP,K1,K2,K3)*******************
***************************************************************
C--------------------------------------------------------
C      O B S O L E T E   C O M M E N T   ! ! !
C     THIS ROUTINE SIMULATES THE THREE-BODY DECAYS OF:
C--------------------------------------------------------
C     ID = 1 : ETA   INTO  PI0 + PI0 + PI0     PHASE SPACE
C     ID = 2 : OMEGA INTO  PI0 + PI- + PI+        - " -
C     ID = 3 : ETAPR INTO  PI0 + PI0 + ETA        - " -
C     ID = 4 : K+/-  INTO  E+/- + PI0 + NU        (V-A)
C     ID = 5 : K0L   INTO  E+/- + PI-/+ + NU      - " -
C     ID = 6 : D     INTO  E   +  K  + NU      PHASE SPACE
C     ID = 7 : D     INTO  E   +  K* + NU         - " -
**      (** or any other decay; input is now masses
**          rather than process ID   S.J.
**          But the ID parameter could someday be useful
**          since it controls the non-phase-space code. ***)
C--------------------------------------------------------
C     THE OUTPUT COMMON BLOCK /LAB/ PLAB(20,J) IS FILLED
*       (** Not a common block anymore.  S.J. **)
C     ACCORDING TO THE ORDER OF THE SECONDARY PARTICLES
C     AS THEY APPEARE IN THE COMMENTS ABOVE. FOR EXAMPLE,
C     IN THE CASE OF ID=6 (D-MESON DECAY)
C     J = K1 IN PLAB(20,J) CORRESPONDS TO ELECTRON,
C     J = K2  -- " -- " -- " -- " --  K-MESON,
C     J = K3  -- " -- " -- " -- " --  NEUTRINO
C--------------------------------------------------------
      DIMENSION  P(20,20)
      DIMENSION  HM(4,7)
      DIMENSION  PCM(4,3)
      DIMENSION RNDM(3)
*
****************************************************
*   Translation from new to old input parameters :
*      ( S.J. )
****************************************************
      ID = 1
      HM(1,ID) = XM1
      HM(2,ID) = XM2
      HM(3,ID) = XM3
      HM(4,ID) = XM0
      K1 = 1
      K2 = 2
      K3 = 3
      PI2 = 2. * 3.141592654
***********************
*  Original code :
C--------------------------------------------------------
C     SIMULATION OF SECONDARY PARTICLE MOMENTA
C     IN THE REST FRAME OF PARENT PARTICLE
C--------------------------------------------------------
      T0=HM(4,ID)-HM(1,ID)-HM(2,ID)-HM(3,ID)
c  10  CALL GRNDM(RNDM,2)
  10  CALL tdrand(RNDM,2)
      G1=RNDM(1)
      G2=RNDM(2)
      GMI=MIN(G1,G2)
      GMA=MAX(G1,G2)
      TE=GMI*T0
      TM=(1.-GMA)*T0
      TN=(GMA-GMI)*T0
      PA1=SQRT(TE**2+2.*HM(1,ID)*TE)
      PA2=SQRT(TM**2+2.*HM(2,ID)*TM)
      PA3=SQRT(TN**2+2.*HM(3,ID)*TN)
C--------------------------------------------------------
C     CHECK OF THE MOMENTUM CONSERVATION
C--------------------------------------------------------
      PMMM=MAX(PA1,PA2)
      PMAX=MAX(PA3,PMMM)
      SP=PA1+PA2+PA3
      IF(PMAX.GE.SP-PMAX) GOTO 10
      P(4,K1)=TE+HM(1,ID)
      P(4,K2)=TM+HM(2,ID)
      P(4,K3)=TN+HM(3,ID)
C--------------------------------------------------------
C     ACCOUNTING FOR MATRIX ELEMENT (FOR ID=4 AND 5)
*     (** Calculates correct (V-A) decay for kaons.       **)
*     (** Now inactive.  Change ID to activate it. (S.J)  **)
C--------------------------------------------------------
      IF(ID.NE.4.AND.ID.NE.5) GOTO 20
      EEM=((HM(4,ID)-HM(2,ID))**2+HM(1,ID)**2-
     *      HM(3,ID)**2)/(2.*(HM(4,ID)-HM(2,ID)))
      HMMAX=EEM*(HM(4,ID)-HM(2,ID)-EEM)+
     *      0.5*(EEM**2-HM(1,ID)**2)
      HMA=P(4,K1)*P(4,K3)+0.25*(PA1**2+PA3**2-PA2**2)
c      CALL GRNDM(RNDM,1)
      CALL tdrand(RNDM,1)
      GG=RNDM(1)
      IF(HMA.LT.GG*HMMAX) GOTO 10
C--------------------------------------------------------
C     CALCULATIONS OF MOMENTA
C--------------------------------------------------------
20    CONTINUE
c      CALL GRNDM(RNDM,3)
      CALL tdrand(RNDM,3)
      CTE=2.*RNDM(1)-1.
      STE=SQRT(ABS(1.-CTE**2))
      FE =PI2*RNDM(2)
      CFE=COS(FE)
      SFE=SIN(FE)
      P(1,K1)=PA1*STE*CFE
      P(2,K1)=PA1*STE*SFE
      P(3,K1)=PA1*CTE
      CTEN=(PA2**2-PA1**2-PA3**2)/(2.*PA1*PA3)
      STEN=SQRT(ABS(1.-CTEN**2))
      FEN =PI2*RNDM(3)
      CFEN=COS(FEN)
      SFEN=SIN(FEN)
      P(1,K3)=PA3*(STEN*CFEN*CTE*CFE-STEN*SFEN*SFE+CTEN*STE*CFE)
      P(2,K3)=PA3*(STEN*CFEN*CTE*SFE+STEN*SFEN*CFE+CTEN*STE*SFE)
      P(3,K3)=PA3*(-STEN*CFEN*STE+CTEN*CTE)
      P(1,K2)=-P(1,K1)-P(1,K3)
      P(2,K2)=-P(2,K1)-P(2,K3)
      P(3,K2)=-P(3,K1)-P(3,K3)
C-------------------------------------------------------
***   Re-translation from old to new output arrays : ***
***     (S.J.)                                       ***
***--------------------------------------------------***
      DO 37 I=1,4
        DO 38 J=1,3
          PCM(I,J) = P(I,J)
 38     CONTINUE
 37   CONTINUE
      END
      SUBROUTINE BOSTD3(EXE,PVEC,QVEC)
      IMPLICIT NONE
      DOUBLE PRECISION EXE,PVEC(4),QVEC(4)
C ----------------------------------------------------------------------
C BOOST ALONG Z AXIS, EXE=EXP(ETA), ETA= HIPERBOLIC VELOCITY.
C
C     USED BY : KORALZ RADKOR
C ----------------------------------------------------------------------
      INTEGER I
      DOUBLE PRECISION RVEC(4)
      DOUBLE PRECISION RPL,QPL,RMI,QMI
C
      DO 10 I=1,4
  10  RVEC(I)=PVEC(I)
      RPL=RVEC(4)+RVEC(3)
      RMI=RVEC(4)-RVEC(3)
      QPL=RPL*EXE
      QMI=RMI/EXE
      QVEC(1)=RVEC(1)
      QVEC(2)=RVEC(2)
      QVEC(3)=(QPL-QMI)/2
      QVEC(4)=(QPL+QMI)/2
      RETURN
      END
      SUBROUTINE BOSTR3(EXE,PVEC,QVEC)
      IMPLICIT NONE
      REAL EXE,PVEC(4),QVEC(4)
C ----------------------------------------------------------------------
C BOOST ALONG Z AXIS, EXE=EXP(ETA), ETA= HIPERBOLIC VELOCITY.
C
C     USED BY : TAUOLA KORALZ (?)
C ----------------------------------------------------------------------
      INTEGER I
      REAL RPL,QPL,RMI,QMI
      REAL RVEC(4)
C
      DO 10 I=1,4
  10  RVEC(I)=PVEC(I)
      RPL=RVEC(4)+RVEC(3)
      RMI=RVEC(4)-RVEC(3)
      QPL=RPL*EXE
      QMI=RMI/EXE
      QVEC(1)=RVEC(1)
      QVEC(2)=RVEC(2)
      QVEC(3)=(QPL-QMI)/2
      QVEC(4)=(QPL+QMI)/2
      END
      COMPLEX FUNCTION BWIG(S,M,G)
      IMPLICIT NONE
C **********************************************************
C     P-WAVE BREIT-WIGNER  FOR RHO
C **********************************************************
      REAL S,M,G
      REAL QS,QM,W,GS
      REAL PI,PIM
      PARAMETER (PI=3.141592654)
      PARAMETER (PIM=0.139)
C -------  BREIT-WIGNER -----------------------
       IF (S.GT.4.*PIM**2) THEN
         QS=SQRT(ABS(ABS(S/4.-PIM**2)+(S/4.-PIM**2))/2.0)
         QM=SQRT(M**2/4.-PIM**2)
         W=SQRT(S)
         GS=G*(M/W)*(QS/QM)**3
       ELSE
         GS=0.0
       ENDIF
         BWIG=M**2/CMPLX(M**2-S,-M*GS)
      RETURN
      END
      COMPLEX FUNCTION BWIGS(S,M,G)
      IMPLICIT NONE
C **********************************************************
C     P-WAVE BREIT-WIGNER  FOR K*
C **********************************************************
      REAL S,M,G
      REAL QS,QM,W,GS

      REAL PI,PIM,MK
      PARAMETER (PI=3.141592654)
      PARAMETER (PIM=0.139)
      PARAMETER (MK=0.493667)

      REAL P,A,B,C
      P(A,B,C)=SQRT(ABS(ABS(((A+B-C)**2-4.*A*B)/4./A)
     $                    +(((A+B-C)**2-4.*A*B)/4./A))/2.0)
C -------  BREIT-WIGNER -----------------------
         QS=P(S,PIM**2,MK**2)
         QM=P(M**2,PIM**2,MK**2)
         W=SQRT(S)
         GS=G*(M/W)*(QS/QM)**3
         BWIGS=M**2/CMPLX(M**2-S,-M*GS)
      RETURN
      END
      SUBROUTINE CLAXI(HJ,PN,PIA)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      COMPLEX HJ(4)
      REAL PN(4),PIA(4)
C ----------------------------------------------------------------------
* CALCULATES THE "AXIAL TYPE"  PI-VECTOR  PIA
* NOTE THAT THE NEUTRINO MOM. PN IS ASSUMED TO BE ALONG Z-AXIS
C SIGN is chosen +/- for decay of TAU +/- respectively
C     called by : DAMPAA, CLNUT
C ----------------------------------------------------------------------
      INTEGER I,J
      REAL SIGN
      COMPLEX HJC(4)
C     DET2(I,J)=AIMAG(HJ(I)*HJC(J)-HJ(J)*HJC(I))
C -- here was an error (ZW, 21.11.1991)
      REAL DET2
      DET2(I,J)=AIMAG(HJC(I)*HJ(J)-HJC(J)*HJ(I))
C -- it was affecting sign of A_LR asymmetry in a1 decay.
C -- note also collision of notation of gamma_va as defined in
C -- TAUOLA paper and J.H. Kuhn and Santamaria Z. Phys C 48 (1990) 445
* -----------------------------------
      IF     (KTOM.EQ.1.OR.KTOM.EQ.-1) THEN
        SIGN= IDFF/ABS(IDFF)
      ELSEIF (KTOM.EQ.2) THEN
        SIGN=-IDFF/ABS(IDFF)
      ELSE
        PRINT *, 'STOP IN CLAXI: KTOM=',KTOM
        STOP
      ENDIF
C
      DO 10 I=1,4
 10   HJC(I)=CONJG(HJ(I))
      PIA(1)= -2.*PN(3)*DET2(2,4)+2.*PN(4)*DET2(2,3)
      PIA(2)= -2.*PN(4)*DET2(1,3)+2.*PN(3)*DET2(1,4)
      PIA(3)=  2.*PN(4)*DET2(1,2)
      PIA(4)=  2.*PN(3)*DET2(1,2)
C ALL FOUR INDICES ARE UP SO  PIA(3) AND PIA(4) HAVE SAME SIGN
      DO 20 I=1,4
  20  PIA(I)=PIA(I)*SIGN
      END
      SUBROUTINE CLNUT(HJ,B,HV)
      IMPLICIT NONE
      COMPLEX HJ(4)
      REAL B,HV(4)
C ----------------------------------------------------------------------
* CALCULATES THE CONTRIBUTION BY NEUTRINO MASS
* NOTE THE TAU IS ASSUMED TO BE AT REST
C
C     called by : DAMPAA
C ----------------------------------------------------------------------
      REAL P(4)
      DATA P /3*0.,1.0/
C
      CALL CLAXI(HJ,P,HV)
      B=REAL( HJ(4)*AIMAG(HJ(4)) - HJ(3)*AIMAG(HJ(3))
     &      - HJ(2)*AIMAG(HJ(2)) - HJ(1)*AIMAG(HJ(1))  )
      RETURN
      END
      SUBROUTINE CLVEC(HJ,PN,PIV)
      IMPLICIT NONE
      COMPLEX HJ(4)
      REAL PN(4),PIV(4)
C ----------------------------------------------------------------------
* CALCULATES THE "VECTOR TYPE"  PI-VECTOR  PIV
* NOTE THAT THE NEUTRINO MOM. PN IS ASSUMED TO BE ALONG Z-AXIS
C
C     called by : DAMPAA
C ----------------------------------------------------------------------
      INTEGER I
      REAL HH
      COMPLEX HN
C
      HN= HJ(4)*CMPLX(PN(4))-HJ(3)*CMPLX(PN(3))
      HH= REAL(HJ(4)*CONJG(HJ(4))-HJ(3)*CONJG(HJ(3))
     $        -HJ(2)*CONJG(HJ(2))-HJ(1)*CONJG(HJ(1)))
      DO 10 I=1,4
   10 PIV(I)=4.*REAL(HN*CONJG(HJ(I)))-2.*HH*PN(I)
      RETURN
      END
      SUBROUTINE DADMAA(MODE,ISGN,HHV,PNU,PAA,PIM1,PIM2,PIPL,JAA)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MODE,ISGN
      REAL HHV(4),PNU(4),PAA(4),PIM1(4),PIM2(4),PIPL(4)
      INTEGER JAA
C ----------------------------------------------------------------------
* A1 DECAY UNWEIGHTED EVENTS
C ----------------------------------------------------------------------
      INTEGER I
      REAL  HV(4)
      REAL  PDUM1(4),PDUM2(4),PDUM3(4),PDUM4(4),PDUM5(4)
      REAL RRR(3)
      DOUBLE PRECISION SWT, SSWT
      REAL PI /3.141592653589793238462643/
      REAL RN,COSTHE,THET,PHI,PARGAM,ERROR,RAT

      INTEGER IWARM/0/
      INTEGER NEVRAW,NEVACC,NEVOVR
      REAL WT,WTMAX
      SAVE IWARM
      SAVE NEVRAW,NEVACC,NEVOVR
      SAVE SWT,SSWT,WT,WTMAX
C
      IF(MODE.EQ.-1) THEN
C     ===================
        IWARM=1
        NEVRAW=0
        NEVACC=0
        NEVOVR=0
        SWT=0
        SSWT=0
        WTMAX=1E-20
        DO 15 I=1,500
        CALL DPHSAA(WT,HV,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5,JAA)
        IF(WT.GT.WTMAX/1.2) WTMAX=WT*1.2
15      CONTINUE
CC      CALL HBOOK1(801,'WEIGHT DISTRIBUTION  DADMAA    $',100,0,2)
C
      ELSEIF(MODE.EQ. 0) THEN
C     =======================
300     CONTINUE
        IF(IWARM.EQ.0) GOTO 902
        CALL DPHSAA(WT,HV,PNU,PAA,PIM1,PIM2,PIPL,JAA)
CC      CALL HFILL(801,WT/WTMAX)
        NEVRAW=NEVRAW+1
        SWT=SWT+WT
        SSWT=SSWT+WT**2
        CALL TDRAND(RRR,3)
        RN=RRR(1)
        IF(WT.GT.WTMAX) NEVOVR=NEVOVR+1
        IF(RN*WTMAX.GT.WT) GOTO 300
C ROTATIONS TO BASIC TAU REST FRAME
        COSTHE=-1.+2.*RRR(2)
        THET=ACOS(COSTHE)
        PHI =2*PI*RRR(3)
        CALL ROTPOL(THET,PHI,PNU)
        CALL ROTPOL(THET,PHI,PAA)
        CALL ROTPOL(THET,PHI,PIM1)
        CALL ROTPOL(THET,PHI,PIM2)
        CALL ROTPOL(THET,PHI,PIPL)
        CALL ROTPOL(THET,PHI,HV)
        DO 44 I=1,3
 44     HHV(I)=-ISGN*HV(I)
        NEVACC=NEVACC+1
C
      ELSEIF(MODE.EQ. 1) THEN
C     =======================
        IF(NEVRAW.EQ.0) RETURN
        PARGAM=SWT/FLOAT(NEVRAW+1)
        ERROR=0
        IF(NEVRAW.NE.0) ERROR=SQRT(SSWT/SWT**2-1./FLOAT(NEVRAW))
        RAT=PARGAM/GAMEL
        WRITE(TUN, 7010) NEVRAW,NEVACC,NEVOVR,PARGAM,RAT,ERROR
CC      CALL HPRINT(801)
        GAMPMC(5)=RAT
        GAMPER(5)=ERROR
CAM     NEVDEC(5)=NEVACC
      ENDIF
C     =====
      RETURN
 7003 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'******** DADMAA INITIALISATION ********',9X,1H*
     $ /,' *',E20.5,5X,'WTMAX  = MAXIMUM WEIGHT                ',9X,1H*
     $  /,1X,15(5H*****)/)
 7010 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'******** DADMAA FINAL REPORT  ******** ',9X,1H*
     $ /,' *',I20  ,5X,'NEVRAW = NO. OF A1  DECAYS TOTAL       ',9X,1H*
     $ /,' *',I20  ,5X,'NEVACC = NO. OF A1   DECS. ACCEPTED    ',9X,1H*
     $ /,' *',I20  ,5X,'NEVOVR = NO. OF OVERWEIGHTED EVENTS    ',9X,1H*
     $ /,' *',E20.5,5X,'PARTIAL WTDTH (A1  DECAY) IN GEV UNITS ',9X,1H*
     $ /,' *',F20.9,5X,'IN UNITS GFERMI**2*MASS**5/192/PI**3   ',9X,1H*
     $ /,' *',F20.8,5X,'RELATIVE ERROR OF PARTIAL WIDTH        ',9X,1H*
     $  /,1X,15(5H*****)/)
 902  WRITE(TUN, 9020)
 9020 FORMAT(' ----- DADMAA: LACK OF INITIALISATION')
      STOP
      END
      SUBROUTINE DADMEL(MODE,ISGN,HHV,PNU,PWB,Q1,Q2,PHX)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MODE,ISGN
      REAL HHV(4),PNU(4),PWB(4),Q1(4),Q2(4),PHX(4)
C ----------------------------------------------------------------------
C
C     called by : DEXEL,(DEKAY,DEKAY1)
C ----------------------------------------------------------------------
      INTEGER I
      REAL RN,RR1,RR2,RR3,COSTHE,THET,PHI,PARGAM,ERROR,RAT
      REAL HV(4)
      REAL PDUM1(4),PDUM2(4),PDUM3(4),PDUM4(4),PDUM5(4)
      REAL RRR(3)
      REAL PI /3.141592653589793238462643/

      INTEGER IWARM/0/
      INTEGER NEVRAW,NEVACC,NEVOVR
      DOUBLE PRECISION SWT, SSWT
      REAL WT,WTMAX
      SAVE IWARM
      SAVE NEVRAW,NEVACC,NEVOVR,SWT,SSWT,WT,WTMAX
C
      IF(MODE.EQ.-1) THEN
C     ===================
        IWARM=1
        NEVRAW=0
        NEVACC=0
        NEVOVR=0
        SWT=0
        SSWT=0
        WTMAX=1E-20
        DO 15 I=1,500
        CALL DPHSEL(WT,HV,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5)
        IF(WT.GT.WTMAX/1.2) WTMAX=WT*1.2
15      CONTINUE
CC      CALL HBOOK1(803,'WEIGHT DISTRIBUTION  DADMEL    $',100,0,2)
C
      ELSEIF(MODE.EQ. 0) THEN
C     =======================
300     CONTINUE
        IF(IWARM.EQ.0) GOTO 902
        NEVRAW=NEVRAW+1
        CALL DPHSEL(WT,HV,PNU,PWB,Q1,Q2,PHX)
CC      CALL HFILL(803,WT/WTMAX)
        SWT=SWT+WT
        SSWT=SSWT+WT**2
        CALL TDRAND(RRR,3)
        RN=RRR(1)
        IF(WT.GT.WTMAX) NEVOVR=NEVOVR+1
        IF(RN*WTMAX.GT.WT) GOTO 300
C ROTATIONS TO BASIC TAU REST FRAME
        RR2=RRR(2)
        COSTHE=-1.+2.*RR2
        THET=ACOS(COSTHE)
        RR3=RRR(3)
        PHI =2*PI*RR3
        CALL ROTOR2(THET,PNU,PNU)
        CALL ROTOR3( PHI,PNU,PNU)
        CALL ROTOR2(THET,PWB,PWB)
        CALL ROTOR3( PHI,PWB,PWB)
        CALL ROTOR2(THET,Q1,Q1)
        CALL ROTOR3( PHI,Q1,Q1)
        CALL ROTOR2(THET,Q2,Q2)
        CALL ROTOR3( PHI,Q2,Q2)
        CALL ROTOR2(THET,HV,HV)
        CALL ROTOR3( PHI,HV,HV)
        CALL ROTOR2(THET,PHX,PHX)
        CALL ROTOR3( PHI,PHX,PHX)
        DO 44,I=1,3
 44     HHV(I)=-ISGN*HV(I)
        NEVACC=NEVACC+1
C
      ELSEIF(MODE.EQ. 1) THEN
C     =======================
        IF(NEVRAW.EQ.0) RETURN
        PARGAM=SWT/FLOAT(NEVRAW+1)
        ERROR=0
        IF(NEVRAW.NE.0) ERROR=SQRT(SSWT/SWT**2-1./FLOAT(NEVRAW))
        RAT=PARGAM/GAMEL
        WRITE(TUN, 7010) NEVRAW,NEVACC,NEVOVR,PARGAM,RAT,ERROR
CC      CALL HPRINT(803)
        GAMPMC(1)=RAT
        GAMPER(1)=ERROR
CAM     NEVDEC(1)=NEVACC
      ENDIF
C     =====
      RETURN
 7010 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'******** DADMEL FINAL REPORT  ******** ',9X,1H*
     $ /,' *',I20  ,5X,'NEVRAW = NO. OF EL  DECAYS TOTAL       ',9X,1H*
     $ /,' *',I20  ,5X,'NEVACC = NO. OF EL   DECS. ACCEPTED    ',9X,1H*
     $ /,' *',I20  ,5X,'NEVOVR = NO. OF OVERWEIGHTED EVENTS    ',9X,1H*
     $ /,' *',E20.5,5X,'PARTIAL WTDTH ( ELECTRON) IN GEV UNITS ',9X,1H*
     $ /,' *',F20.9,5X,'IN UNITS GFERMI**2*MASS**5/192/PI**3   ',9X,1H*
     $ /,' *',F20.9,5X,'RELATIVE ERROR OF PARTIAL WIDTH        ',9X,1H*
     $ /,' *',25X,     'COMPLETE QED CORRECTIONS INCLUDED      ',9X,1H*
     $ /,' *',25X,     'BUT ONLY V-A CUPLINGS                  ',9X,1H*
     $  /,1X,15(5H*****)/)
 902  WRITE(TUN, 9020)
 9020 FORMAT(' ----- DADMEL: LACK OF INITIALISATION')
      STOP
      END
      SUBROUTINE DADMKK(MODE,ISGN,HV,PKK,PNU)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MODE,ISGN
      REAL HV(4),PKK(4),PNU(4)
C ----------------------------------------------------------------------
C FZ
      INTEGER I
      REAL EKK,ENU,XKK,PXQ,PXN,QXN,BRAK,FKK,GAMM,ERROR,RAT
      SAVE BRAK
      REAL PI /3.141592653589793238462643/

      INTEGER NEVTOT
      SAVE NEVTOT
C
      IF(MODE.EQ.-1) THEN
C     ===================
        NEVTOT=0
      ELSEIF(MODE.EQ. 0) THEN
C     =======================
        NEVTOT=NEVTOT+1
        EKK= (AMTAU**2+AMK**2-AMNUTA**2)/(2*AMTAU)
        ENU= (AMTAU**2-AMK**2+AMNUTA**2)/(2*AMTAU)
        XKK= SQRT(EKK**2-AMK**2)
C K MOMENTUM
        CALL SPHERA(XKK,PKK)
        PKK(4)=EKK
C TAU-NEUTRINO MOMENTUM
        DO 30 I=1,3
30      PNU(I)=-PKK(I)
        PNU(4)=ENU
        PXQ=AMTAU*EKK
        PXN=AMTAU*ENU
        QXN=PKK(4)*PNU(4)-PKK(1)*PNU(1)-PKK(2)*PNU(2)-PKK(3)*PNU(3)
        BRAK=(GV**2+GA**2)*(2*PXQ*QXN-AMK**2*PXN)
     &      +(GV**2-GA**2)*AMTAU*AMNUTA*AMK**2
        DO 40 I=1,3
40      HV(I)=-ISGN*2*GA*GV*AMTAU*(2*PKK(I)*QXN-PNU(I)*AMK**2)/BRAK
        HV(4)=1
C
      ELSEIF(MODE.EQ. 1) THEN
C     =======================
        IF(NEVTOT.EQ.0) RETURN
        FKK=0.0354
CFZ THERE WAS BRAK/AMTAU**4 BEFORE
C        GAMM=(GFERMI*FKK)**2/(16.*PI)*AMTAU**3*
C     *       (BRAK/AMTAU**4)**2
CZW 7.02.93 here was an error affecting non standard model
C       configurations only
        GAMM=(GFERMI*FKK)**2/(16.*PI)*AMTAU**3*
     $       (BRAK/AMTAU**4)*
     $       SQRT((AMTAU**2-AMK**2-AMNUTA**2)**2
     $            -4*AMK**2*AMNUTA**2           )/AMTAU**2
        ERROR=0

        ERROR=0
        RAT=GAMM/GAMEL
        WRITE(TUN, 7010) NEVTOT,GAMM,RAT,ERROR
        GAMPMC(6)=RAT
        GAMPER(6)=ERROR
CAM     NEVDEC(6)=NEVTOT
      ENDIF
C     =====
      RETURN
 7010 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'******** DADMKK FINAL REPORT   ********',9X,1H*
     $ /,' *',I20  ,5X,'NEVTOT = NO. OF K  DECAYS TOTAL        ',9X,1H*,
     $ /,' *',E20.5,5X,'PARTIAL WTDTH ( K DECAY) IN GEV UNITS  ',9X,1H*,
     $ /,' *',F20.9,5X,'IN UNITS GFERMI**2*MASS**5/192/PI**3   ',9X,1H*
     $ /,' *',F20.8,5X,'RELATIVE ERROR OF PARTIAL WIDTH (STAT.)',9X,1H*
     $  /,1X,15(5H*****)/)
      END
      SUBROUTINE DADMKS(MODE,ISGN,HHV,PNU,PKS,PKK,PPI,JKST)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MODE,ISGN
      REAL HHV(4),PNU(4),PKS(4),PKK(4),PPI(4)
      INTEGER JKST
C ----------------------------------------------------------------------
      INTEGER I
      REAL DEC1,RMOD,RN,COSTHE,THET,PHI,PARGAM,ERROR,RAT
      REAL  HV(4)
      REAL  PDUM1(4),PDUM2(4),PDUM3(4),PDUM4(4)
      REAL*4 RRR(3)
      REAL PI /3.141592653589793238462643/

      INTEGER IWARM/0/
      INTEGER NEVRAW,NEVACC,NEVOVR
      DOUBLE PRECISION SWT, SSWT
      REAL WT,WTMAX
      SAVE IWARM
      SAVE NEVRAW,NEVACC,NEVOVR,SWT,SSWT,WT,WTMAX
C
      IF(MODE.EQ.-1) THEN
C     ===================
        IWARM=1
        NEVRAW=0
        NEVACC=0
        NEVOVR=0
        SWT=0
        SSWT=0
        WTMAX=1E-20
        DO 15 I=1,500
C THE INITIALISATION IS DONE WITH THE 66.7% MODE
        JKST=10
        CALL DPHSKS(WT,HV,PDUM1,PDUM2,PDUM3,PDUM4,JKST)
        IF(WT.GT.WTMAX/1.2) WTMAX=WT*1.2
15      CONTINUE
CC      CALL HBOOK1(801,'WEIGHT DISTRIBUTION  DADMKS    $',100,0,2)
CC      PRINT 7003,WTMAX
CC      CALL HBOOK1(112,'-------- K* MASS -------- $',100,0.,2.)
      ELSEIF(MODE.EQ. 0) THEN
C     =====================================
        IF(IWARM.EQ.0) GOTO 902
C  HERE WE CHOOSE RANDOMLY BETWEEN K0 PI+_ (66.7%)
C  AND K+_ PI0 (33.3%)
        DEC1=BRKS
400     CONTINUE
        CALL TDRAND(RMOD,1)
        IF(RMOD.LT.DEC1) THEN
          JKST=10
        ELSE
          JKST=20
        ENDIF
        CALL DPHSKS(WT,HV,PNU,PKS,PKK,PPI,JKST)
        CALL TDRAND(RRR,3)
        RN=RRR(1)
        IF(WT.GT.WTMAX) NEVOVR=NEVOVR+1
        NEVRAW=NEVRAW+1
        SWT=SWT+WT
        SSWT=SSWT+WT**2
        IF(RN*WTMAX.GT.WT) GOTO 400
C ROTATIONS TO BASIC TAU REST FRAME
        COSTHE=-1.+2.*RRR(2)
        THET=ACOS(COSTHE)
        PHI =2*PI*RRR(3)
        CALL ROTOR2(THET,PNU,PNU)
        CALL ROTOR3( PHI,PNU,PNU)
        CALL ROTOR2(THET,PKS,PKS)
        CALL ROTOR3( PHI,PKS,PKS)
        CALL ROTOR2(THET,PKK,PKK)
        CALL ROTOR3(PHI,PKK,PKK)
        CALL ROTOR2(THET,PPI,PPI)
        CALL ROTOR3( PHI,PPI,PPI)
        CALL ROTOR2(THET,HV,HV)
        CALL ROTOR3( PHI,HV,HV)
        DO 44 I=1,3
 44     HHV(I)=-ISGN*HV(I)
        NEVACC=NEVACC+1
C
      ELSEIF(MODE.EQ. 1) THEN
C     =======================
        IF(NEVRAW.EQ.0) RETURN
        PARGAM=SWT/FLOAT(NEVRAW+1)
        ERROR=0
        IF(NEVRAW.NE.0) ERROR=SQRT(SSWT/SWT**2-1./FLOAT(NEVRAW))
        RAT=PARGAM/GAMEL
        WRITE(TUN, 7010) NEVRAW,NEVACC,NEVOVR,PARGAM,RAT,ERROR
CC      CALL HPRINT(801)
        GAMPMC(7)=RAT
        GAMPER(7)=ERROR
CAM     NEVDEC(7)=NEVACC
      ENDIF
C     =====
      RETURN
 7003 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'******** DADMKS INITIALISATION ********',9X,1H*
     $ /,' *',E20.5,5X,'WTMAX  = MAXIMUM WEIGHT                ',9X,1H*
     $  /,1X,15(5H*****)/)
 7010 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'******** DADMKS FINAL REPORT   ********',9X,1H*
     $ /,' *',I20  ,5X,'NEVRAW = NO. OF K* DECAYS TOTAL        ',9X,1H*,
     $ /,' *',I20  ,5X,'NEVACC = NO. OF K*  DECS. ACCEPTED     ',9X,1H*,
     $ /,' *',I20  ,5X,'NEVOVR = NO. OF OVERWEIGHTED EVENTS    ',9X,1H*
     $ /,' *',E20.5,5X,'PARTIAL WTDTH (K* DECAY) IN GEV UNITS  ',9X,1H*,
     $ /,' *',F20.9,5X,'IN UNITS GFERMI**2*MASS**5/192/PI**3   ',9X,1H*
     $ /,' *',F20.8,5X,'RELATIVE ERROR OF PARTIAL WIDTH        ',9X,1H*
     $  /,1X,15(5H*****)/)
 902  WRITE(TUN, 9020)
 9020 FORMAT(' ----- DADMKS: LACK OF INITIALISATION')
      STOP
      END
      SUBROUTINE DADMMU(MODE,ISGN,HHV,PNU,PWB,Q1,Q2,PHX)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MODE,ISGN
      REAL HHV(4),PNU(4),PWB(4),Q1(4),Q2(4),PHX(4)
C ----------------------------------------------------------------------
      INTEGER I
      REAL RN,COSTHE,THET,PHI,PARGAM,ERROR,RAT
      REAL  HV(4)
      REAL  PDUM1(4),PDUM2(4),PDUM3(4),PDUM4(4),PDUM5(4)
      REAL RRR(3)
      REAL PI /3.141592653589793238462643/

      INTEGER IWARM /0/
      INTEGER NEVRAW,NEVACC,NEVOVR
      DOUBLE PRECISION SWT, SSWT
      REAL WT,WTMAX
      SAVE IWARM
      SAVE NEVRAW,NEVACC,NEVOVR,SWT,SSWT,WT,WTMAX
C
      IF(MODE.EQ.-1) THEN
C     ===================
        IWARM=1
        NEVRAW=0
        NEVACC=0
        NEVOVR=0
        SWT=0
        SSWT=0
        WTMAX=1E-20
        DO 15 I=1,500
        CALL DPHSMU(WT,HV,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5)
        IF(WT.GT.WTMAX/1.2) WTMAX=WT*1.2
15      CONTINUE
CC      CALL HBOOK1(802,'WEIGHT DISTRIBUTION  DADMMU    $',100,0,2)
C
      ELSEIF(MODE.EQ. 0) THEN
C     =======================
300     CONTINUE
        IF(IWARM.EQ.0) GOTO 902
        NEVRAW=NEVRAW+1
        CALL DPHSMU(WT,HV,PNU,PWB,Q1,Q2,PHX)
CC      CALL HFILL(802,WT/WTMAX)
        SWT=SWT+WT
        SSWT=SSWT+WT**2
        CALL TDRAND(RRR,3)
        RN=RRR(1)
        IF(WT.GT.WTMAX) NEVOVR=NEVOVR+1
        IF(RN*WTMAX.GT.WT) GOTO 300
C ROTATIONS TO BASIC TAU REST FRAME
        COSTHE=-1.+2.*RRR(2)
        THET=ACOS(COSTHE)
        PHI =2*PI*RRR(3)
        CALL ROTOR2(THET,PNU,PNU)
        CALL ROTOR3( PHI,PNU,PNU)
        CALL ROTOR2(THET,PWB,PWB)
        CALL ROTOR3( PHI,PWB,PWB)
        CALL ROTOR2(THET,Q1,Q1)
        CALL ROTOR3( PHI,Q1,Q1)
        CALL ROTOR2(THET,Q2,Q2)
        CALL ROTOR3( PHI,Q2,Q2)
        CALL ROTOR2(THET,HV,HV)
        CALL ROTOR3( PHI,HV,HV)
        CALL ROTOR2(THET,PHX,PHX)
        CALL ROTOR3( PHI,PHX,PHX)
        DO 44,I=1,3
 44     HHV(I)=-ISGN*HV(I)
        NEVACC=NEVACC+1
C
      ELSEIF(MODE.EQ. 1) THEN
C     =======================
        IF(NEVRAW.EQ.0) RETURN
        PARGAM=SWT/FLOAT(NEVRAW+1)
        ERROR=0
        IF(NEVRAW.NE.0) ERROR=SQRT(SSWT/SWT**2-1./FLOAT(NEVRAW))
        RAT=PARGAM/GAMEL
        WRITE(TUN, 7010) NEVRAW,NEVACC,NEVOVR,PARGAM,RAT,ERROR
CC      CALL HPRINT(802)
        GAMPMC(2)=RAT
        GAMPER(2)=ERROR
CAM     NEVDEC(2)=NEVACC
      ENDIF
C     =====
      RETURN
 7010 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'******** DADMMU FINAL REPORT  ******** ',9X,1H*
     $ /,' *',I20  ,5X,'NEVRAW = NO. OF MU  DECAYS TOTAL       ',9X,1H*
     $ /,' *',I20  ,5X,'NEVACC = NO. OF MU   DECS. ACCEPTED    ',9X,1H*
     $ /,' *',I20  ,5X,'NEVOVR = NO. OF OVERWEIGHTED EVENTS    ',9X,1H*
     $ /,' *',E20.5,5X,'PARTIAL WTDTH (MU  DECAY) IN GEV UNITS ',9X,1H*
     $ /,' *',F20.9,5X,'IN UNITS GFERMI**2*MASS**5/192/PI**3   ',9X,1H*
     $ /,' *',F20.9,5X,'RELATIVE ERROR OF PARTIAL WIDTH        ',9X,1H*
     $ /,' *',25X,     'COMPLETE QED CORRECTIONS INCLUDED      ',9X,1H*
     $ /,' *',25X,     'BUT ONLY V-A CUPLINGS                  ',9X,1H*
     $  /,1X,15(5H*****)/)
 902  WRITE(TUN, 9020)
 9020 FORMAT(' ----- DADMMU: LACK OF INITIALISATION')
      STOP
      END
      SUBROUTINE DADMPI(MODE,ISGN,HV,PPI,PNU)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MODE,ISGN
      REAL HHV(4),PPI(4),PNU(4)
C ----------------------------------------------------------------------
      INTEGER I
      REAL EPI,ENU,XPI,PXQ,PXN,QXN,BRAK,FPI,GAMM,ERROR,RAT
      SAVE BRAK
      REAL  HV(4)
      REAL PI /3.141592653589793238462643/

      INTEGER NEVTOT
      SAVE NEVTOT
C
      IF(MODE.EQ.-1) THEN
C     ===================
        NEVTOT=0
      ELSEIF(MODE.EQ. 0) THEN
C     =======================
        NEVTOT=NEVTOT+1
        EPI= (AMTAU**2+AMPI**2-AMNUTA**2)/(2*AMTAU)
        ENU= (AMTAU**2-AMPI**2+AMNUTA**2)/(2*AMTAU)
        XPI= SQRT(EPI**2-AMPI**2)
C PI MOMENTUM
        CALL SPHERA(XPI,PPI)
        PPI(4)=EPI
C TAU-NEUTRINO MOMENTUM
        DO 30 I=1,3
30      PNU(I)=-PPI(I)
        PNU(4)=ENU
        PXQ=AMTAU*EPI
        PXN=AMTAU*ENU
        QXN=PPI(4)*PNU(4)-PPI(1)*PNU(1)-PPI(2)*PNU(2)-PPI(3)*PNU(3)
        BRAK=(GV**2+GA**2)*(2*PXQ*QXN-AMPI**2*PXN)
     &      +(GV**2-GA**2)*AMTAU*AMNUTA*AMPI**2
        DO 40 I=1,3
40      HV(I)=-ISGN*2*GA*GV*AMTAU*(2*PPI(I)*QXN-PNU(I)*AMPI**2)/BRAK
        HV(4)=1
C
      ELSEIF(MODE.EQ. 1) THEN
C     =======================
        IF(NEVTOT.EQ.0) RETURN
        FPI=0.1284
C        GAMM=(GFERMI*FPI)**2/(16.*PI)*AMTAU**3*
C     *       (BRAK/AMTAU**4)**2
CZW 7.02.93 here was an error affecting non standard model
C       configurations only
        GAMM=(GFERMI*FPI)**2/(16.*PI)*AMTAU**3*
     $       (BRAK/AMTAU**4)*
     $       SQRT((AMTAU**2-AMPI**2-AMNUTA**2)**2
     $            -4*AMPI**2*AMNUTA**2           )/AMTAU**2
        ERROR=0
        RAT=GAMM/GAMEL
        WRITE(TUN, 7010) NEVTOT,GAMM,RAT,ERROR
        GAMPMC(3)=RAT
        GAMPER(3)=ERROR
CAM     NEVDEC(3)=NEVTOT
      ENDIF
C     =====
      RETURN
 7010 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'******** DADMPI FINAL REPORT  ******** ',9X,1H*
     $ /,' *',I20  ,5X,'NEVTOT = NO. OF PI  DECAYS TOTAL       ',9X,1H*
     $ /,' *',E20.5,5X,'PARTIAL WTDTH ( PI DECAY) IN GEV UNITS ',9X,1H*
     $ /,' *',F20.9,5X,'IN UNITS GFERMI**2*MASS**5/192/PI**3   ',9X,1H*
     $ /,' *',F20.8,5X,'RELATIVE ERROR OF PARTIAL WIDTH (STAT.)',9X,1H*
     $  /,1X,15(5H*****)/)
      END
      SUBROUTINE DADMRO(MODE,ISGN,HHV,PNU,PRO,PIC,PIZ)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MODE,ISGN
      REAL HHV(4),PNU(4),PRO(4),PIC(4),PIZ(4)
C ----------------------------------------------------------------------
      INTEGER I
      REAL RN,COSTHE,THET,PHI,PARGAM,ERROR,RAT
      REAL  HV(4)
      REAL  PDUM1(4),PDUM2(4),PDUM3(4),PDUM4(4)
      REAL*4 RRR(3)
      REAL PI /3.141592653589793238462643/

      INTEGER IWARM/0/
      INTEGER NEVRAW,NEVACC,NEVOVR
      DOUBLE PRECISION SWT, SSWT
      REAL WT,WTMAX
      SAVE IWARM
      SAVE NEVRAW,NEVACC,NEVOVR,SWT,SSWT,WT,WTMAX
C
      IF(MODE.EQ.-1) THEN
C     ===================
        IWARM=1
        NEVRAW=0
        NEVACC=0
        NEVOVR=0
        SWT=0
        SSWT=0
        WTMAX=1E-20
        DO 15 I=1,500
        CALL DPHSRO(WT,HV,PDUM1,PDUM2,PDUM3,PDUM4)
        IF(WT.GT.WTMAX/1.2) WTMAX=WT*1.2
15      CONTINUE
CC      CALL HBOOK1(801,'WEIGHT DISTRIBUTION  DADMRO    $',100,0,2)
CC      PRINT 7003,WTMAX
C
      ELSEIF(MODE.EQ. 0) THEN
C     =======================
300     CONTINUE
        IF(IWARM.EQ.0) GOTO 902
        CALL DPHSRO(WT,HV,PNU,PRO,PIC,PIZ)
CC      CALL HFILL(801,WT/WTMAX)
        NEVRAW=NEVRAW+1
        SWT=SWT+WT
        SSWT=SSWT+WT**2
        CALL TDRAND(RRR,3)
        RN=RRR(1)
        IF(WT.GT.WTMAX) NEVOVR=NEVOVR+1
        IF(RN*WTMAX.GT.WT) GOTO 300
C ROTATIONS TO BASIC TAU REST FRAME
        COSTHE=-1.+2.*RRR(2)
        THET=ACOS(COSTHE)
        PHI =2*PI*RRR(3)
        CALL ROTOR2(THET,PNU,PNU)
        CALL ROTOR3( PHI,PNU,PNU)
        CALL ROTOR2(THET,PRO,PRO)
        CALL ROTOR3( PHI,PRO,PRO)
        CALL ROTOR2(THET,PIC,PIC)
        CALL ROTOR3( PHI,PIC,PIC)
        CALL ROTOR2(THET,PIZ,PIZ)
        CALL ROTOR3( PHI,PIZ,PIZ)
        CALL ROTOR2(THET,HV,HV)
        CALL ROTOR3( PHI,HV,HV)
        DO 44 I=1,3
 44     HHV(I)=-ISGN*HV(I)
        NEVACC=NEVACC+1
C
      ELSEIF(MODE.EQ. 1) THEN
C     =======================
        IF(NEVRAW.EQ.0) RETURN
        PARGAM=SWT/FLOAT(NEVRAW+1)
        ERROR=0
        IF(NEVRAW.NE.0) ERROR=SQRT(SSWT/SWT**2-1./FLOAT(NEVRAW))
        RAT=PARGAM/GAMEL
        WRITE(TUN, 7010) NEVRAW,NEVACC,NEVOVR,PARGAM,RAT,ERROR
CC      CALL HPRINT(801)
        GAMPMC(4)=RAT
        GAMPER(4)=ERROR
CAM     NEVDEC(4)=NEVACC
      ENDIF
C     =====
      RETURN
 7003 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'******** DADMRO INITIALISATION ********',9X,1H*
     $ /,' *',E20.5,5X,'WTMAX  = MAXIMUM WEIGHT                ',9X,1H*
     $  /,1X,15(5H*****)/)
 7010 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'******** DADMRO FINAL REPORT  ******** ',9X,1H*
     $ /,' *',I20  ,5X,'NEVRAW = NO. OF RHO DECAYS TOTAL       ',9X,1H*
     $ /,' *',I20  ,5X,'NEVACC = NO. OF RHO  DECS. ACCEPTED    ',9X,1H*
     $ /,' *',I20  ,5X,'NEVOVR = NO. OF OVERWEIGHTED EVENTS    ',9X,1H*
     $ /,' *',E20.5,5X,'PARTIAL WTDTH (RHO DECAY) IN GEV UNITS ',9X,1H*
     $ /,' *',F20.9,5X,'IN UNITS GFERMI**2*MASS**5/192/PI**3   ',9X,1H*
     $ /,' *',F20.8,5X,'RELATIVE ERROR OF PARTIAL WIDTH        ',9X,1H*
     $  /,1X,15(5H*****)/)
 902  WRITE(TUN, 9020)
 9020 FORMAT(' ----- DADMRO: LACK OF INITIALISATION')
      STOP
      END
      SUBROUTINE DADNEW(MODE,ISGN,HV,PNU,PWB,PNPI,JNPI)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MODE,ISGN
      REAL HV(4),PNU(4),PWB(4),PNPI(4,9)
      INTEGER JNPI
C ----------------------------------------------------------------------
      INTEGER I,NMOD,INUM,ND
      SAVE NMOD
      REAL RN,COSTHE,THET,PHI,PARGAM,ERROR,RAT
      REAL HHV(4)
      REAL PDUM1(4),PDUM2(4),PDUMI(4,9)
      REAL RRR(3)
C
      REAL PI /3.141592653589793238462643/

      INTEGER IWARM/0/
      INTEGER NEVRAW(NMODE),NEVOVR(NMODE),NEVACC(NMODE)
      DOUBLE PRECISION SWT(NMODE),SSWT(NMODE)
      REAL WT,WTMAX(NMODE)
      SAVE IWARM
      SAVE NEVRAW,NEVOVR,NEVACC,SWT,SSWT,WT,WTMAX
C
      IF(MODE.EQ.-1) THEN
C     ===================
C -- AT THE MOMENT ONLY TWO DECAY MODES OF MULTIPIONS HAVE M. ELEM
        NMOD=NMODE
        IWARM=1
C       PRINT 7003
        DO 1 JNPI=1,NMOD
        NEVRAW(JNPI)=0
        NEVACC(JNPI)=0
        NEVOVR(JNPI)=0
        SWT(JNPI)=0
        SSWT(JNPI)=0
        WTMAX(JNPI)=-1.
        DO  I=1,500
          IF    (JNPI.LE.0) THEN
            GOTO 903 
          ELSEIF(JNPI.LE.NM4) THEN 
            CALL DPH4PI(WT,HV,PDUM1,PDUM2,PDUMI,JNPI)
          ELSEIF(JNPI.LE.NM4+NM5) THEN
             CALL DPH5PI(WT,HV,PDUM1,PDUM2,PDUMI,JNPI)
          ELSEIF(JNPI.LE.NM4+NM5+NM6) THEN
            CALL DPHNPI(WT,HV,PDUM1,PDUM2,PDUMI,JNPI)
          ELSEIF(JNPI.LE.NM4+NM5+NM6+NM3) THEN
            INUM=JNPI-NM4-NM5-NM6
            CALL DPHSPK(WT,HV,PDUM1,PDUM2,PDUMI,INUM)
          ELSEIF(JNPI.LE.NM4+NM5+NM6+NM3+NM2) THEN
            INUM=JNPI-NM4-NM5-NM6-NM3
            CALL DPHSRK(WT,HV,PDUM1,PDUM2,PDUMI,INUM)
          ELSE
           GOTO 903
          ENDIF   
        IF(WT.GT.WTMAX(JNPI)/1.2) WTMAX(JNPI)=WT*1.2
        ENDDO
C       CALL HBOOK1(801,'WEIGHT DISTRIBUTION  DADNPI    $',100,0.,2.,.0)
C       PRINT 7004,WTMAX(JNPI)
1       CONTINUE
        WRITE(TUN,7005)
C
      ELSEIF(MODE.EQ. 0) THEN
C     =======================
        IF(IWARM.EQ.0) GOTO 902
C
300     CONTINUE
          IF    (JNPI.LE.0) THEN
            GOTO 903 
          ELSEIF(JNPI.LE.NM4) THEN
             CALL DPH4PI(WT,HHV,PNU,PWB,PNPI,JNPI)
          ELSEIF(JNPI.LE.NM4+NM5) THEN
             CALL DPH5PI(WT,HHV,PNU,PWB,PNPI,JNPI)
          ELSEIF(JNPI.LE.NM4+NM5+NM6) THEN
            CALL DPHNPI(WT,HHV,PNU,PWB,PNPI,JNPI) 
          ELSEIF(JNPI.LE.NM4+NM5+NM6+NM3) THEN
            INUM=JNPI-NM4-NM5-NM6
            CALL DPHSPK(WT,HHV,PNU,PWB,PNPI,INUM)
          ELSEIF(JNPI.LE.NM4+NM5+NM6+NM3+NM2) THEN
            INUM=JNPI-NM4-NM5-NM6-NM3
            CALL DPHSRK(WT,HHV,PNU,PWB,PNPI,INUM)
          ELSE
           GOTO 903
          ENDIF   
            DO I=1,4
              HV(I)=-ISGN*HHV(I)
            ENDDO
C       CALL HFILL(801,WT/WTMAX(JNPI))
        NEVRAW(JNPI)=NEVRAW(JNPI)+1
        SWT(JNPI)=SWT(JNPI)+WT
        SSWT(JNPI)=SSWT(JNPI)+WT**2
        CALL TDRAND(RRR,3)
        RN=RRR(1)
        IF(WT.GT.WTMAX(JNPI)) NEVOVR(JNPI)=NEVOVR(JNPI)+1
        IF(RN*WTMAX(JNPI).GT.WT) GOTO 300
C ROTATIONS TO BASIC TAU REST FRAME
        COSTHE=-1.+2.*RRR(2)
        THET=ACOS(COSTHE)
        PHI =2*PI*RRR(3)
        CALL ROTOR2(THET,PNU,PNU)
        CALL ROTOR3( PHI,PNU,PNU)
        CALL ROTOR2(THET,PWB,PWB)
        CALL ROTOR3( PHI,PWB,PWB)
        CALL ROTOR2(THET,HV,HV)
        CALL ROTOR3( PHI,HV,HV)
        ND=MULPIK(JNPI)
        DO 301 I=1,ND
        CALL ROTOR2(THET,PNPI(1,I),PNPI(1,I))
        CALL ROTOR3( PHI,PNPI(1,I),PNPI(1,I))
301     CONTINUE
        NEVACC(JNPI)=NEVACC(JNPI)+1
C
      ELSEIF(MODE.EQ. 1) THEN
C     =======================
        DO 500 JNPI=1,NMOD
          IF(NEVRAW(JNPI).EQ.0) GOTO 500
          PARGAM=SWT(JNPI)/FLOAT(NEVRAW(JNPI)+1)
C...These lines were modified to avoid a square root of a negative number 
C...exception.  This happens because of roundoff errors when there was 
C...only one event generated.  Cal Loomis 7/14/94
c          ERROR=0
c          IF(NEVRAW(JNPI).NE.0)
c     &    ERROR=SQRT(SSWT(JNPI)/SWT(JNPI)**2-1./FLOAT(NEVRAW(JNPI)))
          ERROR=0
          IF(NEVRAW(JNPI).NE.0)
     &    ERROR=SSWT(JNPI)/SWT(JNPI)**2-1./FLOAT(NEVRAW(JNPI))
          error = sqrt(max(0.0,error))
C...End of modification.
          RAT=PARGAM/GAMEL
          WRITE(TUN, 7010) NAMES(JNPI),
     &     NEVRAW(JNPI),NEVACC(JNPI),NEVOVR(JNPI),PARGAM,RAT,ERROR
CC        CALL HPRINT(801)
          GAMPMC(8+JNPI-1)=RAT
          GAMPER(8+JNPI-1)=ERROR
CAM       NEVDEC(8+JNPI-1)=NEVACC(JNPI)
  500     CONTINUE
      ENDIF
C     =====
      RETURN
 7003 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'******** DADNEW INITIALISATION ********',9X,1H*
     $ )
 7004 FORMAT(' *',E20.5,5X,'WTMAX  = MAXIMUM WEIGHT  ',9X,1H*/)
 7005 FORMAT(
     $  /,1X,15(5H*****)/)
 7010 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'******** DADNEW FINAL REPORT  ******** ',9X,1H*
     $ /,' *',     25X,'CHANNEL:',A31                           ,9X,1H*
     $ /,' *',I20  ,5X,'NEVRAW = NO. OF DECAYS TOTAL           ',9X,1H*
     $ /,' *',I20  ,5X,'NEVACC = NO. OF DECAYS ACCEPTED        ',9X,1H*
     $ /,' *',I20  ,5X,'NEVOVR = NO. OF OVERWEIGHTED EVENTS    ',9X,1H*
     $ /,' *',E20.5,5X,'PARTIAL WTDTH IN GEV UNITS             ',9X,1H*
     $ /,' *',F20.9,5X,'IN UNITS GFERMI**2*MASS**5/192/PI**3   ',9X,1H*
     $ /,' *',F20.8,5X,'RELATIVE ERROR OF PARTIAL WIDTH        ',9X,1H*
     $  /,1X,15(5H*****)/)
 902  WRITE(TUN, 9020)
 9020 FORMAT(' ----- DADNEW: LACK OF INITIALISATION')
      STOP
 903  WRITE(TUN, 9030) JNPI,MODE
 9030 FORMAT(' ----- DADNEW: WRONG JNPI',2I5)
      STOP
      END
 
 
      SUBROUTINE DAM4PI(MNUM,PT,PN,PIM1,PIM2,PIM3,PIM4,AMPLIT,HV)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MNUM
      REAL PT(4),PN(4),PIM1(4),PIM2(4),PIM3(4),PIM4(4),AMPLIT,HV(4)
C ----------------------------------------------------------------------
* CALCULATES DIFFERENTIAL CROSS SECTION AND POLARIMETER VECTOR
* FOR TAU DECAY INTO 4 PI MODES
* ALL SPIN EFFECTS IN THE FULL DECAY CHAIN ARE TAKEN INTO ACCOUNT.
* CALCULATIONS DONE IN TAU REST FRAME WITH Z-AXIS ALONG NEUTRINO MOMENT
C MNUM DECAY MODE IDENTIFIER.
C
C     called by : DPHSAA
C ----------------------------------------------------------------------
      INTEGER I
      REAL BRAK,BRAKM
      REAL  PIVEC(4),PIAKS(4),HVM(4)
      COMPLEX HADCUR(4),FORM1,FORM2,FORM3,FORM4,FORM5
      EXTERNAL FORM1,FORM2,FORM3,FORM4,FORM5
      REAL PI /3.141592653589793238462643/
      INTEGER ICONT /0/
C
      CALL CURR(MNUM,PIM1,PIM2,PIM3,PIM4,HADCUR)
C
* CALCULATE PI-VECTORS: VECTOR AND AXIAL
      CALL CLVEC(HADCUR,PN,PIVEC)
      CALL CLAXI(HADCUR,PN,PIAKS)
      CALL CLNUT(HADCUR,BRAKM,HVM)
* SPIN INDEPENDENT PART OF DECAY DIFF-CROSS-SECT. IN TAU REST  FRAME
      BRAK= (GV**2+GA**2)*PT(4)*PIVEC(4) +2.*GV*GA*PT(4)*PIAKS(4)
     &     +2.*(GV**2-GA**2)*AMNUTA*AMTAU*BRAKM
      AMPLIT=(CCABIB*GFERMI)**2*BRAK/2.
C POLARIMETER VECTOR IN TAU REST FRAME
      DO 90 I=1,3
      HV(I)=-(AMTAU*((GV**2+GA**2)*PIAKS(I)+2.*GV*GA*PIVEC(I)))
     &      +(GV**2-GA**2)*AMNUTA*AMTAU*HVM(I)
C HV IS DEFINED FOR TAU-    WITH GAMMA=B+HV*POL
      IF (BRAK.NE.0.0)
     &HV(I)=-HV(I)/BRAK
 90   CONTINUE
      END
      SUBROUTINE DAMPAA(PT,PN,PIM1,PIM2,PIPL,AMPLIT,HV)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL  PT(4),PN(4),PIM1(4),PIM2(4),PIPL(4),AMPLIT,HV(4)
C ----------------------------------------------------------------------
* CALCULATES DIFFERENTIAL CROSS SECTION AND POLARIMETER VECTOR
* FOR TAU DECAY INTO A1, A1 DECAYS NEXT INTO RHO+PI AND RHO INTO PI+PI.
* ALL SPIN EFFECTS IN THE FULL DECAY CHAIN ARE TAKEN INTO ACCOUNT.
* CALCULATIONS DONE IN TAU REST FRAME WITH Z-AXIS ALONG NEUTRINO MOMENT
* THE ROUTINE IS WRITEN FOR ZERO NEUTRINO MASS.
C
C     called by : DPHSAA
C ----------------------------------------------------------------------
      INTEGER I
      REAL XMAA,XMRO1,XMRO2,PROD1,PROD2,FA1
      REAL FAROPI,FRO2PI,FNORM,FAMAX,BRAK,BRAKM
      REAL GAMAX
      REAL  PAA(4),VEC1(4),VEC2(4)
      REAL  PIVEC(4),PIAKS(4),HVM(4)
      COMPLEX BWIGN,HADCUR(4),FPIK
      INTEGER ICONT /1/

      REAL GFUN
      EXTERNAL GFUN
C
* F CONSTANTS FOR A1, A1-RHO-PI, AND RHO-PI-PI
*
      REAL FPI
      DATA  FPI /93.3E-3/
* THIS INLINE FUNCT. CALCULATES THE SCALAR PART OF THE PROPAGATOR
      REAL XM,AM,GAMMA
      BWIGN(XM,AM,GAMMA)=1./CMPLX(XM**2-AM**2,GAMMA*AM)
C
* FOUR MOMENTUM OF A1
      DO 10 I=1,4
   10 PAA(I)=PIM1(I)+PIM2(I)+PIPL(I)
* MASSES OF A1, AND OF TWO PI-PAIRS WHICH MAY FORM RHO
      XMAA   =SQRT(ABS(PAA(4)**2-PAA(3)**2-PAA(2)**2-PAA(1)**2))
      XMRO1  =SQRT(ABS((PIPL(4)+PIM1(4))**2-(PIPL(1)+PIM1(1))**2
     $                -(PIPL(2)+PIM1(2))**2-(PIPL(3)+PIM1(3))**2))
      XMRO2  =SQRT(ABS((PIPL(4)+PIM2(4))**2-(PIPL(1)+PIM2(1))**2
     $                -(PIPL(2)+PIM2(2))**2-(PIPL(3)+PIM2(3))**2))
* ELEMENTS OF HADRON CURRENT
      PROD1  =PAA(4)*(PIM1(4)-PIPL(4))-PAA(1)*(PIM1(1)-PIPL(1))
     $       -PAA(2)*(PIM1(2)-PIPL(2))-PAA(3)*(PIM1(3)-PIPL(3))
      PROD2  =PAA(4)*(PIM2(4)-PIPL(4))-PAA(1)*(PIM2(1)-PIPL(1))
     $       -PAA(2)*(PIM2(2)-PIPL(2))-PAA(3)*(PIM2(3)-PIPL(3))
      DO 40 I=1,4
      VEC1(I)= PIM1(I)-PIPL(I) -PAA(I)*PROD1/XMAA**2
 40   VEC2(I)= PIM2(I)-PIPL(I) -PAA(I)*PROD2/XMAA**2
* HADRON CURRENT SATURATED WITH A1 AND RHO RESONANCES
      IF (KEYA1.EQ.1) THEN
        FA1=9.87
        FAROPI=1.0
        FRO2PI=1.0
        FNORM=FA1/SQRT(2.)*FAROPI*FRO2PI
        DO 45 I=1,4
        HADCUR(I)= CMPLX(FNORM) *AMA1**2*BWIGN(XMAA,AMA1,GAMA1)
     $              *(CMPLX(VEC1(I))*AMRO**2*BWIGN(XMRO1,AMRO,GAMRO)
     $               +CMPLX(VEC2(I))*AMRO**2*BWIGN(XMRO2,AMRO,GAMRO))
 45     CONTINUE
      ELSE
        FNORM=2.0*SQRT(2.)/3.0/FPI
        GAMAX=GAMA1*GFUN(XMAA**2)/GFUN(AMA1**2)
        DO 46 I=1,4
        HADCUR(I)= CMPLX(FNORM) *AMA1**2*BWIGN(XMAA,AMA1,GAMAX)
     $              *(CMPLX(VEC1(I))*FPIK(XMRO1)
     $               +CMPLX(VEC2(I))*FPIK(XMRO2))
 46     CONTINUE
      ENDIF
C
* CALCULATE PI-VECTORS: VECTOR AND AXIAL
      CALL CLVEC(HADCUR,PN,PIVEC)
      CALL CLAXI(HADCUR,PN,PIAKS)
      CALL CLNUT(HADCUR,BRAKM,HVM)
* SPIN INDEPENDENT PART OF DECAY DIFF-CROSS-SECT. IN TAU REST  FRAME
      BRAK= (GV**2+GA**2)*PT(4)*PIVEC(4) +2.*GV*GA*PT(4)*PIAKS(4)
     &     +2.*(GV**2-GA**2)*AMNUTA*AMTAU*BRAKM
      AMPLIT=(GFERMI*CCABIB)**2*BRAK/2.
C THE STATISTICAL FACTOR FOR IDENTICAL PI'S WAS CANCELLED WITH
C TWO, FOR TWO MODES OF A1 DECAY NAMELLY PI+PI-PI- AND PI-PI0PI0
C POLARIMETER VECTOR IN TAU REST FRAME
      DO 90 I=1,3
      HV(I)=-(AMTAU*((GV**2+GA**2)*PIAKS(I)+2.*GV*GA*PIVEC(I)))
     &      +(GV**2-GA**2)*AMNUTA*AMTAU*HVM(I)
C HV IS DEFINED FOR TAU-    WITH GAMMA=B+HV*POL
      HV(I)=-HV(I)/BRAK
 90   CONTINUE
      END
 
      SUBROUTINE DAMPOG(PT,PN,PIM1,PIM2,PIPL,AMPLIT,HV)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL  PT(4),PN(4),PIM1(4),PIM2(4),PIPL(4),AMPLIT,HV(4)
C ----------------------------------------------------------------------
* CALCULATES DIFFERENTIAL CROSS SECTION AND POLARIMETER VECTOR
* FOR TAU DECAY INTO A1, A1 DECAYS NEXT INTO RHO+PI AND RHO INTO PI+PI.
* ALL SPIN EFFECTS IN THE FULL DECAY CHAIN ARE TAKEN INTO ACCOUNT.
* CALCULATIONS DONE IN TAU REST FRAME WITH Z-AXIS ALONG NEUTRINO MOMENT
* THE ROUTINE IS WRITEN FOR ZERO NEUTRINO MASS.
C
C     called by : DPHSAA
C ----------------------------------------------------------------------
      INTEGER I,JJ
      REAL XMAA,XMOM,XMRO2,PROD1,PROD2,P12,P1PL,P2PL,GNORM
      REAL P1VEC1,P1VEC2,P2VEC1,P2VEC2,BRAK,BRAKM
      REAL  PAA(4),VEC1(4),VEC2(4)
      REAL  PIVEC(4),PIAKS(4),HVM(4)
      COMPLEX HADCUR(4),FNORM,FORMOM
      INTEGER ICONT /1/
C
* FOUR MOMENTUM OF A1
      DO 10 I=1,4
      VEC1(I)=0.0
      VEC2(I)=0.0
      HV(I)  =0.0
   10 PAA(I)=PIM1(I)+PIM2(I)+PIPL(I)
      VEC1(1)=1.0
* MASSES OF A1, AND OF TWO PI-PAIRS WHICH MAY FORM RHO
      XMAA   =SQRT(ABS(PAA(4)**2-PAA(3)**2-PAA(2)**2-PAA(1)**2))
      XMOM   =SQRT(ABS( (PIM2(4)+PIPL(4))**2-(PIM2(3)+PIPL(3))**2
     $                 -(PIM2(2)+PIPL(2))**2-(PIM2(1)+PIPL(1))**2   ))
      XMRO2  =(PIPL(1))**2 +(PIPL(2))**2 +(PIPL(3))**2
* ELEMENTS OF HADRON CURRENT
      PROD1  =VEC1(1)*PIPL(1)
      PROD2  =VEC2(2)*PIPL(2)
      P12    =PIM1(4)*PIM2(4)-PIM1(1)*PIM2(1)
     $       -PIM1(2)*PIM2(2)-PIM1(3)*PIM2(3)
      P1PL   =PIM1(4)*PIPL(4)-PIM1(1)*PIPL(1)
     $       -PIM1(2)*PIPL(2)-PIM1(3)*PIPL(3)
      P2PL   =PIPL(4)*PIM2(4)-PIPL(1)*PIM2(1)
     $       -PIPL(2)*PIM2(2)-PIPL(3)*PIM2(3)
      DO 40 I=1,3
        VEC1(I)= (VEC1(I)-PROD1/XMRO2*PIPL(I))
 40   CONTINUE
        GNORM=SQRT(VEC1(1)**2+VEC1(2)**2+VEC1(3)**2)
      DO 41 I=1,3
        VEC1(I)= VEC1(I)/GNORM
 41   CONTINUE
      VEC2(1)=(VEC1(2)*PIPL(3)-VEC1(3)*PIPL(2))/SQRT(XMRO2)
      VEC2(2)=(VEC1(3)*PIPL(1)-VEC1(1)*PIPL(3))/SQRT(XMRO2)
      VEC2(3)=(VEC1(1)*PIPL(2)-VEC1(2)*PIPL(1))/SQRT(XMRO2)
      P1VEC1   =PIM1(4)*VEC1(4)-PIM1(1)*VEC1(1)
     $         -PIM1(2)*VEC1(2)-PIM1(3)*VEC1(3)
      P2VEC1   =VEC1(4)*PIM2(4)-VEC1(1)*PIM2(1)
     $         -VEC1(2)*PIM2(2)-VEC1(3)*PIM2(3)
      P1VEC2   =PIM1(4)*VEC2(4)-PIM1(1)*VEC2(1)
     $         -PIM1(2)*VEC2(2)-PIM1(3)*VEC2(3)
      P2VEC2   =VEC2(4)*PIM2(4)-VEC2(1)*PIM2(1)
     $         -VEC2(2)*PIM2(2)-VEC2(3)*PIM2(3)
* HADRON CURRENT
      FNORM=FORMOM(XMAA,XMOM)
      BRAK=0.0
      DO 120 JJ=1,2
        DO 45 I=1,4
       IF (JJ.EQ.1) THEN
        HADCUR(I) = FNORM *(
     $             VEC1(I)*(AMPI**2*P1PL-P2PL*(P12-P1PL))
     $            -PIM2(I)*(P2VEC1*P1PL-P1VEC1*P2PL)
     $            +PIPL(I)*(P2VEC1*P12 -P1VEC1*(AMPI**2+P2PL))  )
       ELSE
        HADCUR(I) = FNORM *(
     $             VEC2(I)*(AMPI**2*P1PL-P2PL*(P12-P1PL))
     $            -PIM2(I)*(P2VEC2*P1PL-P1VEC2*P2PL)
     $            +PIPL(I)*(P2VEC2*P12 -P1VEC2*(AMPI**2+P2PL))  )
       ENDIF
 45     CONTINUE
C
* CALCULATE PI-VECTORS: VECTOR AND AXIAL
      CALL CLVEC(HADCUR,PN,PIVEC)
      CALL CLAXI(HADCUR,PN,PIAKS)
      CALL CLNUT(HADCUR,BRAKM,HVM)
* SPIN INDEPENDENT PART OF DECAY DIFF-CROSS-SECT. IN TAU REST  FRAME
      BRAK=BRAK+(GV**2+GA**2)*PT(4)*PIVEC(4) +2.*GV*GA*PT(4)*PIAKS(4)
     &         +2.*(GV**2-GA**2)*AMNUTA*AMTAU*BRAKM
      DO 90 I=1,3
      HV(I)=HV(I)-(AMTAU*((GV**2+GA**2)*PIAKS(I)+2.*GV*GA*PIVEC(I)))
     &      +(GV**2-GA**2)*AMNUTA*AMTAU*HVM(I)
  90  CONTINUE
C HV IS DEFINED FOR TAU-    WITH GAMMA=B+HV*POL
 120  CONTINUE
      AMPLIT=(GFERMI*CCABIB)**2*BRAK/2.
C THE STATISTICAL FACTOR FOR IDENTICAL PI'S WAS CANCELLED WITH
C TWO, FOR TWO MODES OF A1 DECAY NAMELLY PI+PI-PI- AND PI-PI0PI0
C POLARIMETER VECTOR IN TAU REST FRAME
      DO 91 I=1,3
      HV(I)=-HV(I)/BRAK
 91   CONTINUE
 
      END
      SUBROUTINE DAMPPK(MNUM,PT,PN,PIM1,PIM2,PIM3,AMPLIT,HV)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MNUM
      REAL  PT(4),PN(4),PIM1(4),PIM2(4),PIM3(4),AMPLIT,HV(4)
C ----------------------------------------------------------------------
* CALCULATES DIFFERENTIAL CROSS SECTION AND POLARIMETER VECTOR
* FOR TAU DECAY INTO K K pi, K pi pi.
* ALL SPIN EFFECTS IN THE FULL DECAY CHAIN ARE TAKEN INTO ACCOUNT.
* CALCULATIONS DONE IN TAU REST FRAME WITH Z-AXIS ALONG NEUTRINO MOMENT
C MNUM DECAY MODE IDENTIFIER.
C
C     called by : DPHSAA
C ----------------------------------------------------------------------
      INTEGER I,K
      REAL DWAPI0,MXAA,MXRO1,XMAA,XMRO1,XMRO2,XMRO3
      REAL PROD1,PROD2,PROD3,BRAK
      REAL BRAKM,ZNAK,XM1,XM2,XM3
      REAL  PAA(4),VEC1(4),VEC2(4),VEC3(4),VEC4(4),VEC5(4)
      REAL  PIVEC(4),PIAKS(4),HVM(4)
      REAL FNORM(0:7),COEF(1:5,0:7)
      COMPLEX HADCUR(4),FORM1,FORM2,FORM3,FORM4,FORM5,UROJ
      EXTERNAL FORM1,FORM2,FORM3,FORM4,FORM5
      REAL PI /3.141592653589793238462643/
      INTEGER ICONT /0/
C
      REAL FPI
      DATA  FPI /93.3E-3/
      IF (ICONT.EQ.0) THEN
       ICONT=1
       UROJ=CMPLX(0.0,1.0)
       DWAPI0=SQRT(2.0)
       FNORM(0)=CCABIB/FPI
       FNORM(1)=CCABIB/FPI
       FNORM(2)=CCABIB/FPI
       FNORM(3)=CCABIB/FPI
       FNORM(4)=SCABIB/FPI/DWAPI0
       FNORM(5)=SCABIB/FPI
       FNORM(6)=SCABIB/FPI
       FNORM(7)=CCABIB/FPI
C
       COEF(1,0)= 2.0*SQRT(2.)/3.0
       COEF(2,0)=-2.0*SQRT(2.)/3.0
       COEF(3,0)= 0.0
       COEF(4,0)= FPI
       COEF(5,0)= 0.0
C
       COEF(1,1)=-SQRT(2.)/3.0
       COEF(2,1)= SQRT(2.)/3.0
       COEF(3,1)= 0.0
       COEF(4,1)= FPI
       COEF(5,1)= SQRT(2.)
C
       COEF(1,2)=-SQRT(2.)/3.0
       COEF(2,2)= SQRT(2.)/3.0
       COEF(3,2)= 0.0
       COEF(4,2)= 0.0
       COEF(5,2)=-SQRT(2.)
C
       COEF(1,3)= 0.0
       COEF(2,3)=-1.0
       COEF(3,3)= 0.0
       COEF(4,3)= 0.0
       COEF(5,3)= 0.0
C
       COEF(1,4)= 1.0/SQRT(2.)/3.0
       COEF(2,4)=-1.0/SQRT(2.)/3.0
       COEF(3,4)= 0.0
       COEF(4,4)= 0.0
       COEF(5,4)= 0.0
C
       COEF(1,5)=-SQRT(2.)/3.0
       COEF(2,5)= SQRT(2.)/3.0
       COEF(3,5)= 0.0
       COEF(4,5)= 0.0
       COEF(5,5)=-SQRT(2.)
C
       COEF(1,6)= 0.0
       COEF(2,6)=-1.0
       COEF(3,6)= 0.0
       COEF(4,6)= 0.0
       COEF(5,6)=-2.0
C
       COEF(1,7)= 0.0
       COEF(2,7)= 0.0
       COEF(3,7)= 0.0
       COEF(4,7)= 0.0
       COEF(5,7)=-SQRT(2.0/3.0)
C
      ENDIF
C
      DO 10 I=1,4
   10 PAA(I)=PIM1(I)+PIM2(I)+PIM3(I)
      XMAA   =SQRT(ABS(PAA(4)**2-PAA(3)**2-PAA(2)**2-PAA(1)**2))
      XMRO1  =SQRT(ABS((PIM3(4)+PIM2(4))**2-(PIM3(1)+PIM2(1))**2
     $                -(PIM3(2)+PIM2(2))**2-(PIM3(3)+PIM2(3))**2))
      XMRO2  =SQRT(ABS((PIM3(4)+PIM1(4))**2-(PIM3(1)+PIM1(1))**2
     $                -(PIM3(2)+PIM1(2))**2-(PIM3(3)+PIM1(3))**2))
      XMRO3  =SQRT(ABS((PIM1(4)+PIM2(4))**2-(PIM1(1)+PIM2(1))**2
     $                -(PIM1(2)+PIM2(2))**2-(PIM1(3)+PIM2(3))**2))
* ELEMENTS OF HADRON CURRENT
      PROD1  =PAA(4)*(PIM2(4)-PIM3(4))-PAA(1)*(PIM2(1)-PIM3(1))
     $       -PAA(2)*(PIM2(2)-PIM3(2))-PAA(3)*(PIM2(3)-PIM3(3))
      PROD2  =PAA(4)*(PIM3(4)-PIM1(4))-PAA(1)*(PIM3(1)-PIM1(1))
     $       -PAA(2)*(PIM3(2)-PIM1(2))-PAA(3)*(PIM3(3)-PIM1(3))
      PROD3  =PAA(4)*(PIM1(4)-PIM2(4))-PAA(1)*(PIM1(1)-PIM2(1))
     $       -PAA(2)*(PIM1(2)-PIM2(2))-PAA(3)*(PIM1(3)-PIM2(3))
      DO 40 I=1,4
      VEC1(I)= PIM2(I)-PIM3(I) -PAA(I)*PROD1/XMAA**2
      VEC2(I)= PIM3(I)-PIM1(I) -PAA(I)*PROD2/XMAA**2
      VEC3(I)= PIM1(I)-PIM2(I) -PAA(I)*PROD3/XMAA**2
 40   VEC4(I)= PIM1(I)+PIM2(I)+PIM3(I)
      CALL PROD5(PIM1,PIM2,PIM3,VEC5)
* HADRON CURRENT
C be aware that sign of vec2 is opposite to sign of vec1 in a1 case
      DO 45 I=1,4
      HADCUR(I)= CMPLX(FNORM(MNUM)) * (
     $CMPLX(VEC1(I)*COEF(1,MNUM))*FORM1(MNUM,XMAA**2,XMRO1**2,XMRO2**2)+
     $CMPLX(VEC2(I)*COEF(2,MNUM))*FORM2(MNUM,XMAA**2,XMRO2**2,XMRO1**2)+
     $CMPLX(VEC3(I)*COEF(3,MNUM))*FORM3(MNUM,XMAA**2,XMRO3**2,XMRO1**2)+
     *(-1.0*UROJ)*
     $CMPLX(VEC4(I)*COEF(4,MNUM))*FORM4(MNUM,XMAA**2,XMRO1**2,
     $                                      XMRO2**2,XMRO3**2)         +
     $(-1.0)*UROJ/4.0/PI**2/FPI**2*
     $CMPLX(VEC5(I)*COEF(5,MNUM))*FORM5(MNUM,XMAA**2,XMRO1**2,XMRO2**2))
 45   CONTINUE
C
* CALCULATE PI-VECTORS: VECTOR AND AXIAL
      CALL CLVEC(HADCUR,PN,PIVEC)
      CALL CLAXI(HADCUR,PN,PIAKS)
      CALL CLNUT(HADCUR,BRAKM,HVM)
* SPIN INDEPENDENT PART OF DECAY DIFF-CROSS-SECT. IN TAU REST  FRAME
      BRAK= (GV**2+GA**2)*PT(4)*PIVEC(4) +2.*GV*GA*PT(4)*PIAKS(4)
     &     +2.*(GV**2-GA**2)*AMNUTA*AMTAU*BRAKM
      AMPLIT=(GFERMI)**2*BRAK/2.
      IF (MNUM.GE.9) THEN
        PRINT *, 'MNUM=',MNUM
        ZNAK=-1.0
        XM1=0.0
        XM2=0.0
        XM3=0.0
        DO 77 K=1,4
        IF (K.EQ.4) ZNAK=1.0
        XM1=ZNAK*PIM1(K)**2+XM1
        XM2=ZNAK*PIM2(K)**2+XM2
        XM3=ZNAK*PIM3(K)**2+XM3
 77     PRINT *, 'PIM1=',PIM1(K),'PIM2=',PIM2(K),'PIM3=',PIM3(K)
        PRINT *, 'XM1=',SQRT(XM1),'XM2=',SQRT(XM2),'XM3=',SQRT(XM3)
        PRINT *, '************************************************'
      ENDIF
C POLARIMETER VECTOR IN TAU REST FRAME
      DO 90 I=1,3
      HV(I)=-(AMTAU*((GV**2+GA**2)*PIAKS(I)+2.*GV*GA*PIVEC(I)))
     &      +(GV**2-GA**2)*AMNUTA*AMTAU*HVM(I)
C HV IS DEFINED FOR TAU-    WITH GAMMA=B+HV*POL
      HV(I)=-HV(I)/BRAK
 90   CONTINUE
      END
      SUBROUTINE DAMPRY(ITDKRC_LOC,XK0DEC_LOC,XK,XA,QP,XN,AMPLIT,HV)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER ITDKRC_LOC
      DOUBLE PRECISION XK0DEC_LOC,XK(4),XA(4),QP(4),XN(4),AMPLIT,HV(4)
C ----------------------------------------------------------------------
C IT CALCULATES MATRIX ELEMENT FOR THE
C TAU --> MU(E) NU NUBAR DECAY MODE
C INCLUDING COMPLETE ORDER ALPHA QED CORRECTIONS.
C ----------------------------------------------------------------------
C
      DOUBLE PRECISION AK0
      DOUBLE PRECISION THB,SQM2
      EXTERNAL THB,SQM2

      HV(4)=1.D0
      AK0=XK0DEC_LOC*AMTAU
      IF(XK(4).LT.0.1D0*AK0) THEN
        AMPLIT=THB(ITDKRC_LOC,QP,XN,XA,AK0,HV)
      ELSE
        AMPLIT=SQM2(ITDKRC_LOC,QP,XN,XA,XK,AK0,HV)
      ENDIF
      RETURN
      END
      SUBROUTINE DEKAY(KTO,HX)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER KTO
      DOUBLE PRECISION HX(4)
C     ***********************
C THIS DEKAY IS IN SPIRIT OF THE 'DECAY' WHICH
C WAS INCLUDED IN KORAL-B PROGRAM, COMP. PHYS. COMMUN.
C VOL. 36 (1985) 191, SEE COMMENTS  ON GENERAL PHILOSOPHY THERE.
C KTO=0 INITIALISATION (OBLIGATORY)
C KTO=1,11 DENOTES TAU+ AND KTO=2,12 TAU-
C DEKAY(1,H) AND DEKAY(2,H) IS CALLED INTERNALLY BY MC GENERATOR.
C H DENOTES THE POLARIMETRIC VECTOR, USED BY THE HOST PROGRAM FOR
C CALCULATION OF THE SPIN WEIGHT.
C USER MAY OPTIONALLY CALL DEKAY(11,H) DEKAY(12,H) IN ORDER
C TO TRANSFORM DECAY PRODUCTS TO CMS AND WRITE LUND RECORD IN /LUJETS/.
C KTO=100, PRINT FINAL REPORT  (OPTIONAL).
C DECAY MODES:
C JAK=1 ELECTRON DECAY
C JAK=2 MU  DECAY
C JAK=3 PI  DECAY
C JAK=4 RHO DECAY
C JAK=5 A1  DECAY
C JAK=6 K   DECAY
C JAK=7 K*  DECAY
C JAK=8 NPI DECAY
C JAK=0 INCLUSIVE:  JAK=1,2,3,4,5,6,7,8
      INTEGER I,K,ISGN,IDUM,JDUM,NEVTOT,NEV1,NEV2
      SAVE NEVTOT,NEV1,NEV2
      REAL X,PDUM
      REAL  H(4)
      REAL  PDUM1(4),PDUM2(4),PDUM3(4),PDUM4(4),PDUM5(4),HDUM(4)
      REAL  PDUMX(4,9)
      INTEGER IWARM/0/
      KTOM=KTO
      IF(KTO.EQ.-1) THEN
C     ==================
C       INITIALISATION OR REINITIALISATION
        KTOM=1
        IF (IWARM.EQ.1) X=5/(IWARM-1)
        IWARM=1
        WRITE(TUN,7001) JAK1,JAK2
        NEVTOT=0
        NEV1=0
        NEV2=0
        IF(JAK1.NE.-1.OR.JAK2.NE.-1) THEN
          CALL DADMEL(-1,IDUM,HDUM,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5)
          CALL DADMMU(-1,IDUM,HDUM,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5)
          CALL DADMPI(-1,IDUM,PDUM,PDUM1,PDUM2)
          CALL DADMRO(-1,IDUM,HDUM,PDUM1,PDUM2,PDUM3,PDUM4)
          CALL DADMAA(-1,IDUM,HDUM,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5,JDUM)
          CALL DADMKK(-1,IDUM,PDUM,PDUM1,PDUM2)
          CALL DADMKS(-1,IDUM,HDUM,PDUM1,PDUM2,PDUM3,PDUM4,JDUM)
          CALL DADNEW(-1,IDUM,HDUM,PDUM1,PDUM2,PDUMX,JDUM)
        ENDIF
        DO 21 I=1,30
        NEVDEC(I)=0
        GAMPMC(I)=0
 21     GAMPER(I)=0
      ELSEIF(KTO.EQ.1) THEN
C     =====================
C DECAY OF TAU+ IN THE TAU REST FRAME
        NEVTOT=NEVTOT+1
        IF(IWARM.EQ.0) GOTO 902
        ISGN= IDFF/IABS(IDFF)
        CALL DEKAY1(0,H,ISGN)
      ELSEIF(KTO.EQ.2) THEN
C     =================================
C DECAY OF TAU- IN THE TAU REST FRAME
        NEVTOT=NEVTOT+1
        IF(IWARM.EQ.0) GOTO 902
        ISGN=-IDFF/IABS(IDFF)
        CALL DEKAY2(0,H,ISGN)
      ELSEIF(KTO.EQ.11) THEN
C     ======================
C REST OF DECAY PROCEDURE FOR ACCEPTED TAU+ DECAY
        NEV1=NEV1+1
        ISGN= IDFF/IABS(IDFF)
        CALL DEKAY1(1,H,ISGN)
      ELSEIF(KTO.EQ.12) THEN
C     ======================
C REST OF DECAY PROCEDURE FOR ACCEPTED TAU- DECAY
        NEV2=NEV2+1
        ISGN=-IDFF/IABS(IDFF)
        CALL DEKAY2(1,H,ISGN)
      ELSEIF(KTO.EQ.100) THEN
C     =======================
        IF(JAK1.NE.-1.OR.JAK2.NE.-1) THEN
          CALL DADMEL( 1,IDUM,HDUM,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5)
          CALL DADMMU( 1,IDUM,HDUM,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5)
          CALL DADMPI( 1,IDUM,PDUM,PDUM1,PDUM2)
          CALL DADMRO( 1,IDUM,HDUM,PDUM1,PDUM2,PDUM3,PDUM4)
          CALL DADMAA( 1,IDUM,HDUM,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5,JDUM)
          CALL DADMKK( 1,IDUM,PDUM,PDUM1,PDUM2)
          CALL DADMKS( 1,IDUM,HDUM,PDUM1,PDUM2,PDUM3,PDUM4,JDUM)
          CALL DADNEW( 1,IDUM,HDUM,PDUM1,PDUM2,PDUMX,JDUM)
          WRITE(TUN,7010) NEV1,NEV2,NEVTOT
          WRITE(TUN,7011) (NEVDEC(I),GAMPMC(I),GAMPER(I),I= 1,7)
          WRITE(TUN,7012) 
     $         (NEVDEC(I),GAMPMC(I),GAMPER(I),NAMES(I-7),I=8,7+NMODE)
          WRITE(TUN,7013) 
        ENDIF
      ELSE
C     ====
        GOTO 910
      ENDIF
C     =====
        DO 78 K=1,4
 78     HX(K)=H(K)
      RETURN
 
 7001 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'*****TAUOLA LIBRARY: VERSION 2.5 ******',9X,1H*,
     $ /,' *',     25X,'***********JUNE     1994***************',9X,1H*,
     $ /,' *',     25X,'**AUTHORS: S.JADACH, Z.WAS*************',9X,1H*,
     $ /,' *',     25X,'**R. DECKER, M. JEZABEK, J.H.KUEHN*****',9X,1H*,
     $ /,' *',     25X,'**AVAILABLE FROM: WASM AT CERNVM ******',9X,1H*,
     $ /,' *',     25X,'***** PUBLISHED IN COMP. PHYS. COMM.***',9X,1H*,
     $ /,' *',     25X,'*******CERN-TH-5856 SEPTEMBER 1990*****',9X,1H*,
     $ /,' *',     25X,'*******CERN-TH-6195 SEPTEMBER 1991*****',9X,1H*,
     $ /,' *',     25X,'*******CERN TH-6793 NOVEMBER  1992*****',9X,1H*,
     $ /,' *',     25X,'**5 or more pi dec.: precision limited ',9X,1H*,
     $ /,' *',     25X,'****DEKAY ROUTINE: INITIALIZATION******',9X,1H*,
     $ /,' *',I20  ,5X,'JAK1   = DECAY MODE TAU+               ',9X,1H*,
     $ /,' *',I20  ,5X,'JAK2   = DECAY MODE TAU-               ',9X,1H*,
     $  /,1X,15(5H*****)/)
 7010 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'*****TAUOLA LIBRARY: VERSION 2.5 ******',9X,1H*,
     $ /,' *',     25X,'***********JUNE     1994***************',9X,1H*,
     $ /,' *',     25X,'**AUTHORS: S.JADACH, Z.WAS*************',9X,1H*,
     $ /,' *',     25X,'**R. DECKER, M. JEZABEK, J.H.KUEHN*****',9X,1H*,
     $ /,' *',     25X,'**AVAILABLE FROM: WASM AT CERNVM ******',9X,1H*,
     $ /,' *',     25X,'***** PUBLISHED IN COMP. PHYS. COMM.***',9X,1H*,
     $ /,' *',     25X,'*******CERN-TH-5856 SEPTEMBER 1990*****',9X,1H*,
     $ /,' *',     25X,'*******CERN-TH-6195 SEPTEMBER 1991*****',9X,1H*,
     $ /,' *',     25X,'*******CERN TH-6793 NOVEMBER  1992*****',9X,1H*,
     $ /,' *',     25X,'*****DEKAY ROUTINE: FINAL REPORT*******',9X,1H*,
     $ /,' *',I20  ,5X,'NEV1   = NO. OF TAU+ DECS. ACCEPTED    ',9X,1H*,
     $ /,' *',I20  ,5X,'NEV2   = NO. OF TAU- DECS. ACCEPTED    ',9X,1H*,
     $ /,' *',I20  ,5X,'NEVTOT = SUM                           ',9X,1H*,
     $ /,' *','    NOEVTS ',
     $   ' PART.WIDTH     ERROR       ROUTINE    DECAY MODE    ',9X,1H*)
 7011 FORMAT(1X,'*'
     $       ,I10,2F12.7       ,'     DADMEL     ELECTRON      ',9X,1H*
     $ /,' *',I10,2F12.7       ,'     DADMMU     MUON          ',9X,1H*
     $ /,' *',I10,2F12.7       ,'     DADMPI     PION          ',9X,1H*
     $ /,' *',I10,2F12.7,       '     DADMRO     RHO (->2PI)   ',9X,1H*
     $ /,' *',I10,2F12.7,       '     DADMAA     A1  (->3PI)   ',9X,1H*
     $ /,' *',I10,2F12.7,       '     DADMKK     KAON          ',9X,1H*
     $ /,' *',I10,2F12.7,       '     DADMKS     K*            ',9X,1H*)
 7012 FORMAT(1X,'*'
     $       ,I10,2F12.7,A31                                    ,8X,1H*)
 7013 FORMAT(1X,'*'
     $       ,20X,'THE ERROR IS RELATIVE AND  PART.WIDTH      ',10X,1H*
     $ /,' *',20X,'IN UNITS GFERMI**2*MASS**5/192/PI**3       ',10X,1H*
     $  /,1X,15(5H*****)/)
 902  PRINT 9020
 9020 FORMAT(' ----- DEKAY: LACK OF INITIALISATION')
      STOP
 910  PRINT 9100
 9100 FORMAT(' ----- DEKAY: WRONG VALUE OF KTO ')
      STOP
      END
      SUBROUTINE DEKAY1(IMOD,HH,ISGN)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER IMOD
      REAL HH(4)
      INTEGER ISGN
C     *******************************
C THIS ROUTINE  SIMULATES TAU+  DECAY
      INTEGER I,KTO,IMD,JAK,JAA,JKST
      SAVE JAK
      REAL  HV(4),PNU(4),PPI(4)
      REAL  PWB(4),PMU(4),PNM(4)
      REAL  PRHO(4),PIC(4),PIZ(4)
      REAL  PAA(4),PIM1(4),PIM2(4),PIPL(4)
      REAL  PKK(4),PKS(4)
      REAL  PNPI(4,9)
      REAL  PHOT(4)
      REAL  PDUM(4)
      INTEGER NEV/0/,NPRIN/10/

      KTO=1
      IF(JAK1.EQ.-1) RETURN
      IMD=IMOD
      IF(IMD.EQ.0) THEN
C     =================
      JAK=JAK1
      IF(JAK1.EQ.0) CALL JAKER(JAK)
      IF(JAK.EQ.1) THEN
        CALL DADMEL(0, ISGN,HV,PNU,PWB,PMU,PNM,PHOT)
      ELSEIF(JAK.EQ.2) THEN
        CALL DADMMU(0, ISGN,HV,PNU,PWB,PMU,PNM,PHOT)
      ELSEIF(JAK.EQ.3) THEN
        CALL DADMPI(0, ISGN,HV,PPI,PNU)
      ELSEIF(JAK.EQ.4) THEN
        CALL DADMRO(0, ISGN,HV,PNU,PRHO,PIC,PIZ)
      ELSEIF(JAK.EQ.5) THEN
        CALL DADMAA(0, ISGN,HV,PNU,PAA,PIM1,PIM2,PIPL,JAA)
      ELSEIF(JAK.EQ.6) THEN
        CALL DADMKK(0, ISGN,HV,PKK,PNU)
      ELSEIF(JAK.EQ.7) THEN
        CALL DADMKS(0, ISGN,HV,PNU,PKS ,PKK,PPI,JKST)
      ELSE
        CALL DADNEW(0, ISGN,HV,PNU,PWB,PNPI,JAK-7)
      ENDIF

      DO 33 I=1,3
 33   HH(I)=HV(I)
      HH(4)=1.0
 
      ELSEIF(IMD.EQ.1) THEN
C     =====================
      NEV=NEV+1
        IF (JAK.LT.31) THEN
           NEVDEC(JAK)=NEVDEC(JAK)+1
         ENDIF
      DO 34 I=1,4
 34   PDUM(I)=.0
      IF(JAK.EQ.1) THEN
        CALL DWLUEL(1,ISGN,PNU,PWB,PMU,PNM)
        CALL DWRPH(KTOM,PHOT)
        DO 10 I=1,4
 10     PP1(I)=PMU(I)
 
      ELSEIF(JAK.EQ.2) THEN
        CALL DWLUMU(1,ISGN,PNU,PWB,PMU,PNM)
        CALL DWRPH(KTOM,PHOT)
        DO 20 I=1,4
 20     PP1(I)=PMU(I)
 
      ELSEIF(JAK.EQ.3) THEN
        CALL DWLUPI(1,ISGN,PPI,PNU)
        DO 30 I=1,4
 30     PP1(I)=PPI(I)
 
      ELSEIF(JAK.EQ.4) THEN
        CALL DWLURO(1,ISGN,PNU,PRHO,PIC,PIZ)
        DO 40 I=1,4
 40     PP1(I)=PRHO(I)
 
      ELSEIF(JAK.EQ.5) THEN
        CALL DWLUAA(1,ISGN,PNU,PAA,PIM1,PIM2,PIPL,JAA)
        DO 50 I=1,4
 50     PP1(I)=PAA(I)
      ELSEIF(JAK.EQ.6) THEN
        CALL DWLUKK(1,ISGN,PKK,PNU)
        DO 60 I=1,4
 60     PP1(I)=PKK(I)
      ELSEIF(JAK.EQ.7) THEN
        CALL DWLUKS(1,ISGN,PNU,PKS,PKK,PPI,JKST)
        DO 70 I=1,4
 70     PP1(I)=PKS(I)
      ELSE
CAM     MULTIPION DECAY
        CALL DWLNEW(1,ISGN,PNU,PWB,PNPI,JAK)
        DO 80 I=1,4
 80     PP1(I)=PWB(I)
      ENDIF
 
      ENDIF
C     =====
      END
      SUBROUTINE DEKAY2(IMOD,HH,ISGN)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER IMOD
      REAL HH(4)
      INTEGER ISGN
C     *******************************
C THIS ROUTINE  SIMULATES TAU-  DECAY
      INTEGER I,KTO,IMD,JAK,JAA,JKST
      SAVE JAK
      REAL  HV(4),PNU(4),PPI(4)
      REAL  PWB(4),PMU(4),PNM(4)
      REAL  PRHO(4),PIC(4),PIZ(4)
      REAL  PAA(4),PIM1(4),PIM2(4),PIPL(4)
      REAL  PKK(4),PKS(4)
      REAL  PNPI(4,9)
      REAL  PHOT(4)
      REAL  PDUM(4)
      INTEGER NEV/0/,NPRIN/10/
      KTO=2
      IF(JAK2.EQ.-1) RETURN
      IMD=IMOD
      IF(IMD.EQ.0) THEN
C     =================
      JAK=JAK2
      IF(JAK2.EQ.0) CALL JAKER(JAK)
      IF(JAK.EQ.1) THEN
        CALL DADMEL(0, ISGN,HV,PNU,PWB,PMU,PNM,PHOT)
      ELSEIF(JAK.EQ.2) THEN
        CALL DADMMU(0, ISGN,HV,PNU,PWB,PMU,PNM,PHOT)
      ELSEIF(JAK.EQ.3) THEN
        CALL DADMPI(0, ISGN,HV,PPI,PNU)
      ELSEIF(JAK.EQ.4) THEN
        CALL DADMRO(0, ISGN,HV,PNU,PRHO,PIC,PIZ)
      ELSEIF(JAK.EQ.5) THEN
        CALL DADMAA(0, ISGN,HV,PNU,PAA,PIM1,PIM2,PIPL,JAA)
      ELSEIF(JAK.EQ.6) THEN
        CALL DADMKK(0, ISGN,HV,PKK,PNU)
      ELSEIF(JAK.EQ.7) THEN
        CALL DADMKS(0, ISGN,HV,PNU,PKS ,PKK,PPI,JKST)
      ELSE
        CALL DADNEW(0, ISGN,HV,PNU,PWB,PNPI,JAK-7)
      ENDIF
      DO 33 I=1,3
 33   HH(I)=HV(I)
      HH(4)=1.0
      ELSEIF(IMD.EQ.1) THEN
C     =====================
      NEV=NEV+1
        IF (JAK.LT.31) THEN
           NEVDEC(JAK)=NEVDEC(JAK)+1
         ENDIF
      DO 34 I=1,4
 34   PDUM(I)=.0
      IF(JAK.EQ.1) THEN
        CALL DWLUEL(2,ISGN,PNU,PWB,PMU,PNM)
        CALL DWRPH(KTOM,PHOT)
        DO 10 I=1,4
 10     PP2(I)=PMU(I)
 
      ELSEIF(JAK.EQ.2) THEN
        CALL DWLUMU(2,ISGN,PNU,PWB,PMU,PNM)
        CALL DWRPH(KTOM,PHOT)
        DO 20 I=1,4
 20     PP2(I)=PMU(I)
 
      ELSEIF(JAK.EQ.3) THEN
        CALL DWLUPI(2,ISGN,PPI,PNU)
        DO 30 I=1,4
 30     PP2(I)=PPI(I)
 
      ELSEIF(JAK.EQ.4) THEN
        CALL DWLURO(2,ISGN,PNU,PRHO,PIC,PIZ)
        DO 40 I=1,4
 40     PP2(I)=PRHO(I)
 
      ELSEIF(JAK.EQ.5) THEN
        CALL DWLUAA(2,ISGN,PNU,PAA,PIM1,PIM2,PIPL,JAA)
        DO 50 I=1,4
 50     PP2(I)=PAA(I)
      ELSEIF(JAK.EQ.6) THEN
        CALL DWLUKK(2,ISGN,PKK,PNU)
        DO 60 I=1,4
 60     PP1(I)=PKK(I)
      ELSEIF(JAK.EQ.7) THEN
        CALL DWLUKS(2,ISGN,PNU,PKS,PKK,PPI,JKST)
        DO 70 I=1,4
 70     PP1(I)=PKS(I)
      ELSE
CAM     MULTIPION DECAY
        CALL DWLNEW(2,ISGN,PNU,PWB,PNPI,JAK)
        DO 80 I=1,4
 80     PP1(I)=PWB(I)
      ENDIF
C 
      ENDIF
C     =====
      END
      SUBROUTINE DEXAA(MODE,ISGN,POL,PNU,PAA,PIM1,PIM2,PIPL,JAA)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MODE,ISGN
      REAL POL(4),PNU(4),PAA(4),PIM1(4),PIM2(4),PIPL(4)
      INTEGER JAA
C ----------------------------------------------------------------------
* THIS SIMULATES TAU DECAY IN TAU REST FRAME
* INTO NU A1, NEXT A1 DECAYS INTO RHO PI AND FINALLY RHO INTO PI PI.
* OUTPUT FOUR MOMENTA: PNU   TAUNEUTRINO,
*                      PAA   A1
*                      PIM1  PION MINUS (OR PI0) 1      (FOR TAU MINUS)
*                      PIM2  PION MINUS (OR PI0) 2
*                      PIPL  PION PLUS  (OR PI-)
*                      (PIPL,PIM1) FORM A RHO
C ----------------------------------------------------------------------
      REAL HV(4)
      REAL WT,RN
      INTEGER IWARM/0/
C
      IF(MODE.EQ.-1) THEN
C     ===================
        IWARM=1
        CALL DADMAA( -1,ISGN,HV,PNU,PAA,PIM1,PIM2,PIPL,JAA)
CC      CALL HBOOK1(816,'WEIGHT DISTRIBUTION  DEXAA    $',100,-2.,2.)
C
      ELSEIF(MODE.EQ. 0) THEN
*     =======================
 300    CONTINUE
        IF(IWARM.EQ.0) GOTO 902
        CALL DADMAA(  0,ISGN,HV,PNU,PAA,PIM1,PIM2,PIPL,JAA)
        WT=(1+POL(1)*HV(1)+POL(2)*HV(2)+POL(3)*HV(3))/2.
CC      CALL HFILL(816,WT)
        CALL TDRAND(RN,1)
        IF(RN.GT.WT) GOTO 300
C
      ELSEIF(MODE.EQ. 1) THEN
*     =======================
        CALL DADMAA(  1,ISGN,HV,PNU,PAA,PIM1,PIM2,PIPL,JAA)
CC      CALL HPRINT(816)
      ENDIF
C     =====
      RETURN
 902  WRITE(TUN, 9020)
 9020 FORMAT(' ----- DEXAA: LACK OF INITIALISATION')
      STOP
      END
      SUBROUTINE DEXAY(KTO,POL)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER KTO
      REAL POL(4)
C ----------------------------------------------------------------------
C THIS 'DEXAY' IS A ROUTINE WHICH GENERATES DECAY OF THE SINGLE
C POLARIZED TAU,  POL IS A POLARIZATION VECTOR (NOT A POLARIMETER
C VECTOR AS IN DEKAY) OF THE TAU AND IT IS AN INPUT PARAMETER.
C KTO=0 INITIALISATION (OBLIGATORY)
C KTO=1 DENOTES TAU+ AND KTO=2 TAU-
C DEXAY(1,POL) AND DEXAY(2,POL) ARE CALLED INTERNALLY BY MC GENERATOR.
C DECAY PRODUCTS ARE TRANSFORMED READILY
C TO CMS AND WRITEN IN THE  LUND RECORD IN /LUJETS/
C KTO=100, PRINT FINAL REPORT (OPTIONAL).
C
C     called by : KORALZ
C ----------------------------------------------------------------------
      INTEGER I,IDUM,ISGN,NEV1,NEV2,NEVTOT
      SAVE NEV1,NEV2,NEVTOT
      REAL  PDUM1(4),PDUM2(4),PDUM3(4),PDUM4(4),PDUM5(4)
      REAL  PDUM(4)
      REAL  PDUMI(4,9)
      INTEGER IWARM/0/
      KTOM=KTO
C
      IF(KTO.EQ.-1) THEN
C     ==================
C       INITIALISATION OR REINITIALISATION
        IWARM=1
        WRITE(TUN, 7001) JAK1,JAK2
        NEVTOT=0
        NEV1=0
        NEV2=0
        IF(JAK1.NE.-1.OR.JAK2.NE.-1) THEN
          CALL DEXEL(-1,IDUM,PDUM,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5)
          CALL DEXMU(-1,IDUM,PDUM,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5)
          CALL DEXPI(-1,IDUM,PDUM,PDUM1,PDUM2)
          CALL DEXRO(-1,IDUM,PDUM,PDUM1,PDUM2,PDUM3,PDUM4)
          CALL DEXAA(-1,IDUM,PDUM,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5,IDUM)
          CALL DEXKK(-1,IDUM,PDUM,PDUM1,PDUM2)
          CALL DEXKS(-1,IDUM,PDUM,PDUM1,PDUM2,PDUM3,PDUM4,IDUM)
          CALL DEXNEW(-1,IDUM,PDUM,PDUM1,PDUM2,PDUMI,IDUM)
        ENDIF
        DO 21 I=1,30
        NEVDEC(I)=0
        GAMPMC(I)=0
 21     GAMPER(I)=0
      ELSEIF(KTO.EQ.1) THEN
C     =====================
C DECAY OF TAU+ IN THE TAU REST FRAME
        NEVTOT=NEVTOT+1
        NEV1=NEV1+1
        IF(IWARM.EQ.0) GOTO 902
        ISGN=IDFF/IABS(IDFF)
CAM     CALL DEXAY1(POL,ISGN)
        CALL DEXAY1(KTO,JAK1,JAKP,POL,ISGN)
      ELSEIF(KTO.EQ.2) THEN
C     =================================
C DECAY OF TAU- IN THE TAU REST FRAME
        NEVTOT=NEVTOT+1
        NEV2=NEV2+1
        IF(IWARM.EQ.0) GOTO 902
        ISGN=-IDFF/IABS(IDFF)
CAM     CALL DEXAY2(POL,ISGN)
        CALL DEXAY1(KTO,JAK2,JAKM,POL,ISGN)
      ELSEIF(KTO.EQ.100) THEN
C     =======================
        IF(JAK1.NE.-1.OR.JAK2.NE.-1) THEN
          CALL DEXEL( 1,IDUM,PDUM,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5)
          CALL DEXMU( 1,IDUM,PDUM,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5)
          CALL DEXPI( 1,IDUM,PDUM,PDUM1,PDUM2)
          CALL DEXRO( 1,IDUM,PDUM,PDUM1,PDUM2,PDUM3,PDUM4)
          CALL DEXAA( 1,IDUM,PDUM,PDUM1,PDUM2,PDUM3,PDUM4,PDUM5,IDUM)
          CALL DEXKK( 1,IDUM,PDUM,PDUM1,PDUM2)
          CALL DEXKS( 1,IDUM,PDUM,PDUM1,PDUM2,PDUM3,PDUM4,IDUM)
          CALL DEXNEW( 1,IDUM,PDUM,PDUM1,PDUM2,PDUMI,IDUM)
          WRITE(TUN,7010) NEV1,NEV2,NEVTOT
          WRITE(TUN,7011) (NEVDEC(I),GAMPMC(I),GAMPER(I),I= 1,7)
          WRITE(TUN,7012) 
     $         (NEVDEC(I),GAMPMC(I),GAMPER(I),NAMES(I-7),I=8,7+NMODE)
          WRITE(TUN,7013) 
        ENDIF
      ELSE
        GOTO 910
      ENDIF
      RETURN
 7001 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'*****TAUOLA LIBRARY: VERSION 2.5 ******',9X,1H*,
     $ /,' *',     25X,'***********JUNE     1994***************',9X,1H*,
     $ /,' *',     25X,'**AUTHORS: S.JADACH, Z.WAS*************',9X,1H*,
     $ /,' *',     25X,'**R. DECKER, M. JEZABEK, J.H.KUEHN*****',9X,1H*,
     $ /,' *',     25X,'**AVAILABLE FROM: WASM AT CERNVM ******',9X,1H*,
     $ /,' *',     25X,'***** PUBLISHED IN COMP. PHYS. COMM.***',9X,1H*,
     $ /,' *',     25X,'*******CERN-TH-5856 SEPTEMBER 1990*****',9X,1H*,
     $ /,' *',     25X,'*******CERN-TH-6195 SEPTEMBER 1991*****',9X,1H*,
     $ /,' *',     25X,'*******CERN-TH-6793 NOVEMBER  1992*****',9X,1H*,
     $ /,' *',     25X,'**5 or more pi dec.: precision limited ',9X,1H*,
     $ /,' *',     25X,'******DEXAY ROUTINE: INITIALIZATION****',9X,1H*
     $ /,' *',I20  ,5X,'JAK1   = DECAY MODE FERMION1 (TAU+)    ',9X,1H*
     $ /,' *',I20  ,5X,'JAK2   = DECAY MODE FERMION2 (TAU-)    ',9X,1H*
     $  /,1X,15(5H*****)/)
CHBU  format 7010 had more than 19 continuation lines
CHBU  split into two
 7010 FORMAT(///1X,15(5H*****)
     $ /,' *',     25X,'*****TAUOLA LIBRARY: VERSION 2.5 ******',9X,1H*,
     $ /,' *',     25X,'***********JUNE     1994***************',9X,1H*,
     $ /,' *',     25X,'**AUTHORS: S.JADACH, Z.WAS*************',9X,1H*,
     $ /,' *',     25X,'**R. DECKER, M. JEZABEK, J.H.KUEHN*****',9X,1H*,
     $ /,' *',     25X,'**AVAILABLE FROM: WASM AT CERNVM ******',9X,1H*,
     $ /,' *',     25X,'***** PUBLISHED IN COMP. PHYS. COMM.***',9X,1H*,
     $ /,' *',     25X,'*******CERN-TH-5856 SEPTEMBER 1990*****',9X,1H*,
     $ /,' *',     25X,'*******CERN-TH-6195 SEPTEMBER 1991*****',9X,1H*,
     $ /,' *',     25X,'*******CERN-TH-6793 NOVEMBER  1992*****',9X,1H*,
     $ /,' *',     25X,'******DEXAY ROUTINE: FINAL REPORT******',9X,1H*
     $ /,' *',I20  ,5X,'NEV1   = NO. OF TAU+ DECS. ACCEPTED    ',9X,1H*
     $ /,' *',I20  ,5X,'NEV2   = NO. OF TAU- DECS. ACCEPTED    ',9X,1H*
     $ /,' *',I20  ,5X,'NEVTOT = SUM                           ',9X,1H*
     $ /,' *','    NOEVTS ',
     $   ' PART.WIDTH     ERROR       ROUTINE    DECAY MODE    ',9X,1H*)
 7011 FORMAT(1X,'*'
     $       ,I10,2F12.7       ,'     DADMEL     ELECTRON      ',9X,1H*
     $ /,' *',I10,2F12.7       ,'     DADMMU     MUON          ',9X,1H*
     $ /,' *',I10,2F12.7       ,'     DADMPI     PION          ',9X,1H*
     $ /,' *',I10,2F12.7,       '     DADMRO     RHO (->2PI)   ',9X,1H*
     $ /,' *',I10,2F12.7,       '     DADMAA     A1  (->3PI)   ',9X,1H*
     $ /,' *',I10,2F12.7,       '     DADMKK     KAON          ',9X,1H*
     $ /,' *',I10,2F12.7,       '     DADMKS     K*            ',9X,1H*)
 7012 FORMAT(1X,'*'
     $       ,I10,2F12.7,A31                                    ,8X,1H*)
 7013 FORMAT(1X,'*'
     $       ,20X,'THE ERROR IS RELATIVE AND  PART.WIDTH      ',10X,1H*
     $ /,' *',20X,'IN UNITS GFERMI**2*MASS**5/192/PI**3       ',10X,1H*
     $  /,1X,15(5H*****)/)
 902  WRITE(TUN, 9020)
 9020 FORMAT(' ----- DEXAY: LACK OF INITIALISATION')
      STOP
 910  WRITE(TUN, 9100)
 9100 FORMAT(' ----- DEXAY: WRONG VALUE OF KTO ')
      STOP
      END
      SUBROUTINE DEXAY1(KTO,JAKIN,JAK,POL,ISGN)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER KTO,JAKIN,JAK
      REAL POL(4)
      INTEGER ISGN
C ---------------------------------------------------------------------
C THIS ROUTINE  SIMULATES TAU+-  DECAY
C
C     called by : DEXAY
C ---------------------------------------------------------------------
      INTEGER I,JAA,JKST,JNPI
      REAL  POLAR(4)
      REAL  PNU(4),PPI(4)
      REAL  PRHO(4),PIC(4),PIZ(4)
      REAL  PWB(4),PMU(4),PNM(4)
      REAL  PAA(4),PIM1(4),PIM2(4),PIPL(4)
      REAL  PKK(4),PKS(4)
      REAL  PNPI(4,9)
      REAL PHOT(4)
      REAL PDUM(4)
C
      IF(JAKIN.EQ.-1) RETURN
      DO 33 I=1,3
 33   POLAR(I)=POL(I)
      POLAR(4)=0.
      DO 34 I=1,4
 34   PDUM(I)=.0
      JAK=JAKIN
      IF(JAK.EQ.0) CALL JAKER(JAK)
CAM
      IF(JAK.EQ.1) THEN
        CALL DEXEL(0, ISGN,POLAR,PNU,PWB,PMU,PNM,PHOT)
        CALL DWLUEL(KTO,ISGN,PNU,PWB,PMU,PNM)
        CALL DWRPH(KTO,PHOT )
      ELSEIF(JAK.EQ.2) THEN
        CALL DEXMU(0, ISGN,POLAR,PNU,PWB,PMU,PNM,PHOT)
        CALL DWLUMU(KTO,ISGN,PNU,PWB,PMU,PNM)
        CALL DWRPH(KTO,PHOT )
      ELSEIF(JAK.EQ.3) THEN
        CALL DEXPI(0, ISGN,POLAR,PPI,PNU)
        CALL DWLUPI(KTO,ISGN,PPI,PNU)
      ELSEIF(JAK.EQ.4) THEN
        CALL DEXRO(0, ISGN,POLAR,PNU,PRHO,PIC,PIZ)
        CALL DWLURO(KTO,ISGN,PNU,PRHO,PIC,PIZ)
      ELSEIF(JAK.EQ.5) THEN
        CALL DEXAA(0, ISGN,POLAR,PNU,PAA,PIM1,PIM2,PIPL,JAA)
        CALL DWLUAA(KTO,ISGN,PNU,PAA,PIM1,PIM2,PIPL,JAA)
      ELSEIF(JAK.EQ.6) THEN
        CALL DEXKK(0, ISGN,POLAR,PKK,PNU)
        CALL DWLUKK(KTO,ISGN,PKK,PNU)
      ELSEIF(JAK.EQ.7) THEN
        CALL DEXKS(0, ISGN,POLAR,PNU,PKS,PKK,PPI,JKST)
        CALL DWLUKS(KTO,ISGN,PNU,PKS,PKK,PPI,JKST)
      ELSE
        JNPI=JAK-7
        CALL DEXNEW(0, ISGN,POLAR,PNU,PWB,PNPI,JNPI)
        CALL DWLNEW(KTO,ISGN,PNU,PWB,PNPI,JAK)
      ENDIF
      NEVDEC(JAK)=NEVDEC(JAK)+1
      END
      SUBROUTINE DEXEL(MODE,ISGN,POL,PNU,PWB,Q1,Q2,PH)
      IMPLICIT NONE
      INTEGER MODE,ISGN
      REAL POL(4),PNU(4),PWB(4),Q1(4),Q2(4),PH(4)
C ----------------------------------------------------------------------
C THIS SIMULATES TAU DECAY IN TAU REST FRAME
C INTO ELECTRON AND TWO NEUTRINOS
C
C     called by : DEXAY,DEXAY1
C ----------------------------------------------------------------------
      REAL WT,RN
      REAL  HV(4)
      INTEGER IWARM/0/
C
      IF(MODE.EQ.-1) THEN
C     ===================
        IWARM=1
        CALL DADMEL( -1,ISGN,HV,PNU,PWB,Q1,Q2,PH)
CC      CALL HBOOK1(813,'WEIGHT DISTRIBUTION  DEXEL    $',100,0,2)
C
      ELSEIF(MODE.EQ. 0) THEN
C     =======================
300     CONTINUE
        IF(IWARM.EQ.0) GOTO 902
        CALL DADMEL(  0,ISGN,HV,PNU,PWB,Q1,Q2,PH)
        WT=(1+POL(1)*HV(1)+POL(2)*HV(2)+POL(3)*HV(3))/2.
CC      CALL HFILL(813,WT)
        CALL TDRAND(RN,1)
        IF(RN.GT.WT) GOTO 300
C
      ELSEIF(MODE.EQ. 1) THEN
C     =======================
        CALL DADMEL(  1,ISGN,HV,PNU,PWB,Q1,Q2,PH)
CC      CALL HPRINT(813)
      ENDIF
C     =====
      RETURN
 902  PRINT 9020
 9020 FORMAT(' ----- DEXEL: LACK OF INITIALISATION')
      STOP
      END
      SUBROUTINE DEXKK(MODE,ISGN,POL,PKK,PNU)
      IMPLICIT NONE
      INTEGER MODE,ISGN
      REAL POL(4),PKK(4),PNU(4)
C ----------------------------------------------------------------------
C TAU DECAY INTO KAON  AND TAU-NEUTRINO
C IN TAU REST FRAME
C OUTPUT FOUR MOMENTA: PNU   TAUNEUTRINO,
C                      PKK   KAON CHARGED
C ----------------------------------------------------------------------
      REAL WT,RN
      REAL  HV(4)
C
      IF(MODE.EQ.-1) THEN
C     ===================
        CALL DADMKK(-1,ISGN,HV,PKK,PNU)
CC      CALL HBOOK1(815,'WEIGHT DISTRIBUTION  DEXPI    $',100,0,2)
C
      ELSEIF(MODE.EQ. 0) THEN
C     =======================
300     CONTINUE
        CALL DADMKK( 0,ISGN,HV,PKK,PNU)
        WT=(1+POL(1)*HV(1)+POL(2)*HV(2)+POL(3)*HV(3))/2.
CC      CALL HFILL(815,WT)
        CALL TDRAND(RN,1)
        IF(RN.GT.WT) GOTO 300
C
      ELSEIF(MODE.EQ. 1) THEN
C     =======================
        CALL DADMKK( 1,ISGN,HV,PKK,PNU)
CC      CALL HPRINT(815)
      ENDIF
C     =====
      RETURN
      END
      SUBROUTINE DEXKS(MODE,ISGN,POL,PNU,PKS,PKK,PPI,JKST)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MODE,ISGN
      REAL POL(4),PNU(4),PKS(4),PKK(4),PPI(4)
      INTEGER JKST
C ----------------------------------------------------------------------
C THIS SIMULATES TAU DECAY IN TAU REST FRAME
C INTO NU K*, THEN K* DECAYS INTO PI0,K+-(JKST=20)
C OR PI+-,K0(JKST=10).
C OUTPUT FOUR MOMENTA: PNU   TAUNEUTRINO,
C                      PKS   K* CHARGED
C                      PK0   K ZERO
C                      PKC   K CHARGED
C                      PIC   PION CHARGED
C                      PIZ   PION ZERO
C ----------------------------------------------------------------------
      REAL WT,RN
      REAL  HV(4)
      INTEGER IWARM/0/
C
      IF(MODE.EQ.-1) THEN
C     ===================
        IWARM=1
CFZ INITIALISATION DONE WITH THE GHARGED PION NEUTRAL KAON MODE(JKST=10
        CALL DADMKS( -1,ISGN,HV,PNU,PKS,PKK,PPI,JKST)
CC      CALL HBOOK1(816,'WEIGHT DISTRIBUTION  DEXKS    $',100,0,2)
CC      CALL HBOOK1(916,'ABS2 OF HV IN ROUTINE DEXKS   $',100,0,2)
C
      ELSEIF(MODE.EQ. 0) THEN
C     =======================
300     CONTINUE
        IF(IWARM.EQ.0) GOTO 902
        CALL DADMKS(  0,ISGN,HV,PNU,PKS,PKK,PPI,JKST)
        WT=(1+POL(1)*HV(1)+POL(2)*HV(2)+POL(3)*HV(3))/2.
CC      CALL HFILL(816,WT)
CC      XHELP=HV(1)**2+HV(2)**2+HV(3)**2
CC      CALL HFILL(916,XHELP)
        CALL TDRAND(RN,1)
        IF(RN.GT.WT) GOTO 300
C
      ELSEIF(MODE.EQ. 1) THEN
C     ======================================
        CALL DADMKS( 1,ISGN,HV,PNU,PKS,PKK,PPI,JKST)
CC      CALL HPRINT(816)
CC      CALL HPRINT(916)
      ENDIF
C     =====
      RETURN
 902  WRITE(TUN, 9020)
 9020 FORMAT(' ----- DEXKS: LACK OF INITIALISATION')
      STOP
      END
      SUBROUTINE DEXMU(MODE,ISGN,POL,PNU,PWB,Q1,Q2,PH)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MODE,ISGN
      REAL POL(4),PNU(4),PWB(4),Q1(4),Q2(4),PH(4)
C ----------------------------------------------------------------------
C THIS SIMULATES TAU DECAY IN ITS REST FRAME
C INTO MUON AND TWO NEUTRINOS
C OUTPUT FOUR MOMENTA: PNU   TAUNEUTRINO,
C                      PWB   W-BOSON
C                      Q1    MUON
C                      Q2    MUON-NEUTRINO
C ----------------------------------------------------------------------
      REAL WT,RN
      REAL HV(4)
      INTEGER IWARM/0/
C
      IF(MODE.EQ.-1) THEN
C     ===================
        IWARM=1
        CALL DADMMU( -1,ISGN,HV,PNU,PWB,Q1,Q2,PH)
CC      CALL HBOOK1(814,'WEIGHT DISTRIBUTION  DEXMU    $',100,0,2)
C
      ELSEIF(MODE.EQ. 0) THEN
C     =======================
300     CONTINUE
        IF(IWARM.EQ.0) GOTO 902
        CALL DADMMU(  0,ISGN,HV,PNU,PWB,Q1,Q2,PH)
        WT=(1+POL(1)*HV(1)+POL(2)*HV(2)+POL(3)*HV(3))/2.
CC      CALL HFILL(814,WT)
        CALL TDRAND(RN,1)
        IF(RN.GT.WT) GOTO 300
C
      ELSEIF(MODE.EQ. 1) THEN
C     =======================
        CALL DADMMU(  1,ISGN,HV,PNU,PWB,Q1,Q2,PH)
CC      CALL HPRINT(814)
      ENDIF
C     =====
      RETURN
 902  WRITE(TUN, 9020)
 9020 FORMAT(' ----- DEXMU: LACK OF INITIALISATION')
      STOP
      END
      SUBROUTINE DEXNEW(MODE,ISGN,POL,PNU,PAA,PNPI,JNPI)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MODE,ISGN
      REAL POL(4),PNU(4),PAA(4),PNPI(4,9)
      INTEGER JNPI
C ----------------------------------------------------------------------
* THIS SIMULATES TAU DECAY IN TAU REST FRAME
* INTO NU A1, NEXT A1 DECAYS INTO RHO PI AND FINALLY RHO INTO PI PI.
* OUTPUT FOUR MOMENTA: PNU   TAUNEUTRINO,
*                      PAA   A1
*                      PIM1  PION MINUS (OR PI0) 1      (FOR TAU MINUS)
*                      PIM2  PION MINUS (OR PI0) 2
*                      PIPL  PION PLUS  (OR PI-)
*                      (PIPL,PIM1) FORM A RHO
C ----------------------------------------------------------------------
      INTEGER JDUMM
      REAL WT,RN
      REAL  HV(4)
      INTEGER IWARM/0/
C
      IF(MODE.EQ.-1) THEN
C     ===================
        IWARM=1
        CALL DADNEW( -1,ISGN,HV,PNU,PAA,PNPI,JDUMM)
CC      CALL HBOOK1(816,'WEIGHT DISTRIBUTION  DEXAA    $',100,-2.,2.)
C
      ELSEIF(MODE.EQ. 0) THEN
*     =======================
 300    CONTINUE
        IF(IWARM.EQ.0) GOTO 902
        CALL DADNEW( 0,ISGN,HV,PNU,PAA,PNPI,JNPI)
        WT=(1+POL(1)*HV(1)+POL(2)*HV(2)+POL(3)*HV(3))/2.
CC      CALL HFILL(816,WT)
          CALL TDRAND(RN,1)
          IF(RN.GT.WT) GOTO 300
C
      ELSEIF(MODE.EQ. 1) THEN
*     =======================
        CALL DADNEW( 1,ISGN,HV,PNU,PAA,PNPI,JDUMM)
CC      CALL HPRINT(816)
      ENDIF
C     =====
      RETURN
 902  WRITE(TUN, 9020)
 9020 FORMAT(' ----- DEXNEW: LACK OF INITIALISATION')
      STOP
      END
      SUBROUTINE DEXPI(MODE,ISGN,POL,PPI,PNU)
      IMPLICIT NONE
      INTEGER MODE,ISGN
      REAL POL(4),PPI(4),PNU(4)
C ----------------------------------------------------------------------
C TAU DECAY INTO PION AND TAU-NEUTRINO
C IN TAU REST FRAME
C OUTPUT FOUR MOMENTA: PNU   TAUNEUTRINO,
C                      PPI   PION CHARGED
C ----------------------------------------------------------------------
      REAL WT,RN
      REAL HV(4)
CC
      IF(MODE.EQ.-1) THEN
C     ===================
        CALL DADMPI(-1,ISGN,HV,PPI,PNU)
CC      CALL HBOOK1(815,'WEIGHT DISTRIBUTION  DEXPI    $',100,0,2)
 
      ELSEIF(MODE.EQ. 0) THEN
C     =======================
300     CONTINUE
        CALL DADMPI( 0,ISGN,HV,PPI,PNU)
        WT=(1+POL(1)*HV(1)+POL(2)*HV(2)+POL(3)*HV(3))/2.
CC      CALL HFILL(815,WT)
        CALL TDRAND(RN,1)
        IF(RN.GT.WT) GOTO 300
C
      ELSEIF(MODE.EQ. 1) THEN
C     =======================
        CALL DADMPI( 1,ISGN,HV,PPI,PNU)
CC      CALL HPRINT(815)
      ENDIF
C     =====
      RETURN
      END
      SUBROUTINE DEXRO(MODE,ISGN,POL,PNU,PRO,PIC,PIZ)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER MODE,ISGN
      REAL  POL(4),PNU(4),PRO(4),PIC(4),PIZ(4)
C ----------------------------------------------------------------------
C THIS SIMULATES TAU DECAY IN TAU REST FRAME
C INTO NU RHO, NEXT RHO DECAYS INTO PION PAIR.
C OUTPUT FOUR MOMENTA: PNU   TAUNEUTRINO,
C                      PRO   RHO
C                      PIC   PION CHARGED
C                      PIZ   PION ZERO
C ----------------------------------------------------------------------
      REAL WT,RN
      REAL HV(4)
      INTEGER IWARM/0/
C
      IF(MODE.EQ.-1) THEN
C     ===================
        IWARM=1
        CALL DADMRO( -1,ISGN,HV,PNU,PRO,PIC,PIZ)
CC      CALL HBOOK1(816,'WEIGHT DISTRIBUTION  DEXRO    $',100,0,2)
CC      CALL HBOOK1(916,'ABS2 OF HV IN ROUTINE DEXRO   $',100,0,2)
C
      ELSEIF(MODE.EQ. 0) THEN
C     =======================
300     CONTINUE
        IF(IWARM.EQ.0) GOTO 902
        CALL DADMRO(  0,ISGN,HV,PNU,PRO,PIC,PIZ)
        WT=(1+POL(1)*HV(1)+POL(2)*HV(2)+POL(3)*HV(3))/2.
CC      CALL HFILL(816,WT)
CC      XHELP=HV(1)**2+HV(2)**2+HV(3)**2
CC      CALL HFILL(916,XHELP)
        CALL TDRAND(RN,1)
        IF(RN.GT.WT) GOTO 300
C
      ELSEIF(MODE.EQ. 1) THEN
C     =======================
        CALL DADMRO(  1,ISGN,HV,PNU,PRO,PIC,PIZ)
CC      CALL HPRINT(816)
CC      CALL HPRINT(916)
      ENDIF
C     =====
      RETURN
 902  WRITE(TUN, 9020)
 9020 FORMAT(' ----- DEXRO: LACK OF INITIALISATION')
      STOP
      END
      SUBROUTINE DPH4PI(DGAMT,HV,PN,PAA,PMULT,JNPI)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL DGAMT,HV(4),PN(4),PAA(4),PMULT(4,9)
      INTEGER JNPI
C ----------------------------------------------------------------------
* IT SIMULATES A1  DECAY IN TAU REST FRAME WITH
* Z-AXIS ALONG A1  MOMENTUM
C ----------------------------------------------------------------------
      INTEGER I,K,ICHAN
      REAL PHSPAC,PHSP,PREZ,AMP1,AMP2,AMP3,AMP4,AMRX,GAMRX,AMROP
      REAL GAMROP,PROB1,PROB2,PROB3,AMRB,GAMRB
      REAL RR,RR1,RR2,RR3,RR4,RR5,AMS1,AMS2
      REAL ALP1,ALP2,ALP,AM4SQ,AM4,AM3SQ,AM3,AM2SQ,AM2
      REAL THET,PHI,GG,AMPLIT,EXE,PPI,PPPI,ENQ1,ENQ2
      REAL PT(4),PIM1(4),PIM2(4),PIPL(4)
      REAL PR(4),PIZ(4)
      REAL RRR(9)
      DOUBLE PRECISION UU,FF,FF1,FF2,FF3,FF4,GG1,GG2,GG3,GG4
      REAL PI /3.141592653589793238462643/
      INTEGER ICONT /0/

      REAL XLAM,X,Y,Z
      XLAM(X,Y,Z)=SQRT(ABS((X-Y-Z)**2-4.0*Y*Z))
C AMRO, GAMRO IS ONLY A PARAMETER FOR GETING HIGHT EFFICIENCY
C
C THREE BODY PHASE SPACE NORMALISED AS IN BJORKEN-DRELL
C D**3 P /2E/(2PI)**3 (2PI)**4 DELTA4(SUM P)
      PHSPAC=1./2**23/PI**11
      PHSP=1./2**5/PI**2
      IF (JNPI.EQ.1) THEN
       PREZ=0.7
       AMP1=AMPI
       AMP2=AMPI
       AMP3=AMPI
       AMP4=AMPIZ
       AMRX=0.782
       GAMRX=0.0084
        AMROP =1.2
        GAMROP=.46
 
      ELSE
       PREZ=0.0
       AMP1=AMPIZ
       AMP2=AMPIZ
       AMP3=AMPIZ
       AMP4=AMPI
       AMRX=1.4
       GAMRX=.6
        AMROP =AMRX
        GAMROP=GAMRX
 
      ENDIF
      RR=0.3
      CALL CHOICE(100+JNPI,RR,ICHAN,PROB1,PROB2,PROB3,
     $            AMROP,GAMROP,AMRX,GAMRX,AMRB,GAMRB)
      PREZ=PROB1+PROB2
C TAU MOMENTUM
      PT(1)=0.
      PT(2)=0.
      PT(3)=0.
      PT(4)=AMTAU
C
      CALL TDRAND(RRR,9)
C
* MASSES OF 4, 3 AND 2 PI SYSTEMS
C 3 PI WITH SAMPLING FOR RESONANCE
CAM
        RR1=RRR(6)
        AMS1=(AMP1+AMP2+AMP3+AMP4)**2
        AMS2=(AMTAU-AMNUTA)**2
        ALP1=ATAN((AMS1-AMROP**2)/AMROP/GAMROP)
        ALP2=ATAN((AMS2-AMROP**2)/AMROP/GAMROP)
        ALP=ALP1+RR1*(ALP2-ALP1)
        AM4SQ =AMROP**2+AMROP*GAMROP*TAN(ALP)
        AM4 =SQRT(AM4SQ)
        PHSPAC=PHSPAC*
     $         ((AM4SQ-AMROP**2)**2+(AMROP*GAMROP)**2)/(AMROP*GAMROP)
        PHSPAC=PHSPAC*(ALP2-ALP1)
 
C
        RR1=RRR(1)
        AMS1=(AMP2+AMP3+AMP4)**2
        AMS2=(AM4-AMP1)**2
        IF (RRR(9).GT.PREZ) THEN
          AM3SQ=AMS1+   RR1*(AMS2-AMS1)
          AM3 =SQRT(AM3SQ)
C --- this part of jacobian will be recovered later
          FF1=AMS2-AMS1
        ELSE
* PHASE SPACE WITH SAMPLING FOR OMEGA RESONANCE,
        ALP1=ATAN((AMS1-AMRX**2)/AMRX/GAMRX)
        ALP2=ATAN((AMS2-AMRX**2)/AMRX/GAMRX)
        ALP=ALP1+RR1*(ALP2-ALP1)
        AM3SQ =AMRX**2+AMRX*GAMRX*TAN(ALP)
        AM3 =SQRT(AM3SQ)
C --- THIS PART OF THE JACOBIAN WILL BE RECOVERED LATER ---------------
        FF1=((AM3SQ-AMRX**2)**2+(AMRX*GAMRX)**2)/(AMRX*GAMRX)
        FF1=FF1*(ALP2-ALP1)
        ENDIF
C MASS OF 2
        RR2=RRR(2)
        AMS1=(AMP3+AMP4)**2
        AMS2=(AM3-AMP2)**2
* FLAT PHASE SPACE;
        AM2SQ=AMS1+   RR2*(AMS2-AMS1)
        AM2 =SQRT(AM2SQ)
C --- this part of jacobian will be recovered later
        FF2=(AMS2-AMS1)
*  2 RESTFRAME, DEFINE PIZ AND PIPL
        ENQ1=(AM2SQ-AMP3**2+AMP4**2)/(2*AM2)
        ENQ2=(AM2SQ+AMP3**2-AMP4**2)/(2*AM2)
        PPI=         ENQ1**2-AMP4**2
        PPPI=SQRT(ABS(ENQ1**2-AMP4**2))
        PHSPAC=PHSPAC*(4*PI)*(2*PPPI/AM2)
* PIZ   MOMENTUM IN 2 REST FRAME
        CALL SPHERA(PPPI,PIZ)
        PIZ(4)=ENQ1
* PIPL  MOMENTUM IN 2 REST FRAME
        DO 30 I=1,3
 30     PIPL(I)=-PIZ(I)
        PIPL(4)=ENQ2
* 3 REST FRAME, DEFINE PIM1
*       PR   MOMENTUM
        PR(1)=0
        PR(2)=0
        PR(4)=1./(2*AM3)*(AM3**2+AM2**2-AMP2**2)
        PR(3)= SQRT(ABS(PR(4)**2-AM2**2))
        PPI  =          PR(4)**2-AM2**2
*       PIM1  MOMENTUM
        PIM1(1)=0
        PIM1(2)=0
        PIM1(4)=1./(2*AM3)*(AM3**2-AM2**2+AMP2**2)
        PIM1(3)=-PR(3)
C --- this part of jacobian will be recovered later
        FF3=(4*PI)*(2*PR(3)/AM3)
* OLD PIONS BOOSTED FROM 2 REST FRAME TO 3 REST FRAME
      EXE=(PR(4)+PR(3))/AM2
      CALL BOSTR3(EXE,PIZ,PIZ)
      CALL BOSTR3(EXE,PIPL,PIPL)
      RR3=RRR(3)
      RR4=RRR(4)
      THET =ACOS(-1.+2*RR3)
      PHI = 2*PI*RR4
      CALL ROTPOL(THET,PHI,PIPL)
      CALL ROTPOL(THET,PHI,PIM1)
      CALL ROTPOL(THET,PHI,PIZ)
      CALL ROTPOL(THET,PHI,PR)
* 4  REST FRAME, DEFINE PIM2
*       PR   MOMENTUM
        PR(1)=0
        PR(2)=0
        PR(4)=1./(2*AM4)*(AM4**2+AM3**2-AMP1**2)
        PR(3)= SQRT(ABS(PR(4)**2-AM3**2))
        PPI  =          PR(4)**2-AM3**2
*       PIM2 MOMENTUM
        PIM2(1)=0
        PIM2(2)=0
        PIM2(4)=1./(2*AM4)*(AM4**2-AM3**2+AMP1**2)
        PIM2(3)=-PR(3)
C --- this part of jacobian will be recovered later
        FF4=(4*PI)*(2*PR(3)/AM4)
* OLD PIONS BOOSTED FROM 3 REST FRAME TO 4 REST FRAME
      EXE=(PR(4)+PR(3))/AM3
      CALL BOSTR3(EXE,PIZ,PIZ)
      CALL BOSTR3(EXE,PIPL,PIPL)
      CALL BOSTR3(EXE,PIM1,PIM1)
      RR3=RRR(7)
      RR4=RRR(8)
      THET =ACOS(-1.+2*RR3)
      PHI = 2*PI*RR4
      CALL ROTPOL(THET,PHI,PIPL)
      CALL ROTPOL(THET,PHI,PIM1)
      CALL ROTPOL(THET,PHI,PIM2)
      CALL ROTPOL(THET,PHI,PIZ)
      CALL ROTPOL(THET,PHI,PR)
C
* NOW TO THE TAU REST FRAME, DEFINE PAA AND NEUTRINO MOMENTA
* PAA  MOMENTUM
      PAA(1)=0
      PAA(2)=0
      PAA(4)=1./(2*AMTAU)*(AMTAU**2-AMNUTA**2+AM4**2)
      PAA(3)= SQRT(ABS(PAA(4)**2-AM4**2))
      PPI   =          PAA(4)**2-AM4**2
      PHSPAC=PHSPAC*(4*PI)*(2*PAA(3)/AMTAU)
      PHSP=PHSP*(4*PI)*(2*PAA(3)/AMTAU)
* TAU-NEUTRINO MOMENTUM
      PN(1)=0
      PN(2)=0
      PN(4)=1./(2*AMTAU)*(AMTAU**2+AMNUTA**2-AM4**2)
      PN(3)=-PAA(3)
C WE INCLUDE REMAINING PART OF THE JACOBIAN
C --- FLAT CHANNEL
        AM3SQ=(PIM1(4)+PIZ(4)+PIPL(4))**2-(PIM1(3)+PIZ(3)+PIPL(3))**2
     $       -(PIM1(2)+PIZ(2)+PIPL(2))**2-(PIM1(1)+PIZ(1)+PIPL(1))**2
        AMS2=(AM4-AMP2)**2
        AMS1=(AMP1+AMP3+AMP4)**2
        FF1=(AMS2-AMS1)
        AMS1=(AMP3+AMP4)**2
        AMS2=(SQRT(AM3SQ)-AMP1)**2
        FF2=AMS2-AMS1
        FF3=(4*PI)*(XLAM(AM2**2,AMP1**2,AM3SQ)/AM3SQ)
        FF4=(4*PI)*(XLAM(AM3SQ,AMP2**2,AM4**2)/AM4**2)
        UU=FF1*FF2*FF3*FF4
C --- FIRST CHANNEL
        AM3SQ=(PIM1(4)+PIZ(4)+PIPL(4))**2-(PIM1(3)+PIZ(3)+PIPL(3))**2
     $       -(PIM1(2)+PIZ(2)+PIPL(2))**2-(PIM1(1)+PIZ(1)+PIPL(1))**2
        AMS2=(AM4-AMP2)**2
        AMS1=(AMP1+AMP3+AMP4)**2
        ALP1=ATAN((AMS1-AMRX**2)/AMRX/GAMRX)
        ALP2=ATAN((AMS2-AMRX**2)/AMRX/GAMRX)
        FF1=((AM3SQ-AMRX**2)**2+(AMRX*GAMRX)**2)/(AMRX*GAMRX)
        FF1=FF1*(ALP2-ALP1)
        AMS1=(AMP3+AMP4)**2
        AMS2=(SQRT(AM3SQ)-AMP1)**2
        FF2=AMS2-AMS1
        FF3=(4*PI)*(XLAM(AM2**2,AMP1**2,AM3SQ)/AM3SQ)
        FF4=(4*PI)*(XLAM(AM3SQ,AMP2**2,AM4**2)/AM4**2)
        FF=FF1*FF2*FF3*FF4
C --- SECOND CHANNEL
        AM3SQ=(PIM2(4)+PIZ(4)+PIPL(4))**2-(PIM2(3)+PIZ(3)+PIPL(3))**2
     $       -(PIM2(2)+PIZ(2)+PIPL(2))**2-(PIM2(1)+PIZ(1)+PIPL(1))**2
        AMS2=(AM4-AMP1)**2
        AMS1=(AMP2+AMP3+AMP4)**2
        ALP1=ATAN((AMS1-AMRX**2)/AMRX/GAMRX)
        ALP2=ATAN((AMS2-AMRX**2)/AMRX/GAMRX)
        GG1=((AM3SQ-AMRX**2)**2+(AMRX*GAMRX)**2)/(AMRX*GAMRX)
        GG1=GG1*(ALP2-ALP1)
        AMS1=(AMP3+AMP4)**2
        AMS2=(SQRT(AM3SQ)-AMP2)**2
        GG2=AMS2-AMS1
        GG3=(4*PI)*(XLAM(AM2**2,AMP2**2,AM3SQ)/AM3SQ)
        GG4=(4*PI)*(XLAM(AM3SQ,AMP1**2,AM4**2)/AM4**2)
        GG=GG1*GG2*GG3*GG4
C --- JACOBIAN AVERAGED OVER THE TWO
        IF ( ( (FF+GG)*UU+FF*GG ).GT.0.0D0) THEN
          RR=FF*GG*UU/(0.5*PREZ*(FF+GG)*UU+(1.0-PREZ)*FF*GG)
          PHSPAC=PHSPAC*RR
        ELSE
          PHSPAC=0.0
        ENDIF
* MOMENTA OF THE TWO PI-MINUS ARE RANDOMLY SYMMETRISED
       IF (JNPI.EQ.1) THEN
        RR5= RRR(5)
        IF(RR5.LE.0.5) THEN
         DO 70 I=1,4
         X=PIM1(I)
         PIM1(I)=PIM2(I)
 70      PIM2(I)=X
        ENDIF
        PHSPAC=PHSPAC/2.
       ELSE
C MOMENTA OF PI0'S ARE GENERATED UNIFORMLY ONLY IF PREZ=0.0
        RR5= RRR(5)
        IF(RR5.LE.0.5) THEN
         DO 71 I=1,4
         X=PIM1(I)
         PIM1(I)=PIM2(I)
 71      PIM2(I)=X
        ENDIF
        PHSPAC=PHSPAC/6.
       ENDIF
* ALL PIONS BOOSTED FROM  4  REST FRAME TO TAU REST FRAME
* Z-AXIS ANTIPARALLEL TO NEUTRINO MOMENTUM
      EXE=(PAA(4)+PAA(3))/AM4
      CALL BOSTR3(EXE,PIZ,PIZ)
      CALL BOSTR3(EXE,PIPL,PIPL)
      CALL BOSTR3(EXE,PIM1,PIM1)
      CALL BOSTR3(EXE,PIM2,PIM2)
      CALL BOSTR3(EXE,PR,PR)
C PARTIAL WIDTH CONSISTS OF PHASE SPACE AND AMPLITUDE
C CHECK ON CONSISTENCY WITH DADNPI, THEN, CODE BREAKES UNIFORM PION
C DISTRIBUTION IN HADRONIC SYSTEM
CAM     Assume neutrino mass=0. and sum over final polarisation
C      AMX2=AM4**2
C      BRAK= 2*(AMTAU**2-AMX2) * (AMTAU**2+2.*AMX2)
C      AMPLIT=CCABIB**2*GFERMI**2/2. * BRAK * AMX2*XSIGEE(AMX2,1)
      IF     (JNPI.EQ.1) THEN
        CALL DAM4PI(JNPI,PT,PN,PIM1,PIM2,PIZ,PIPL,AMPLIT,HV)
      ELSEIF (JNPI.EQ.2) THEN
        CALL DAM4PI(JNPI,PT,PN,PIM1,PIM2,PIPL,PIZ,AMPLIT,HV)
      ENDIF
      DGAMT=1/(2.*AMTAU)*AMPLIT*PHSPAC
C PHASE SPACE CHECK
C      DGAMT=PHSPAC
      DO 77 K=1,4
        PMULT(K,1)=PIM1(K)
        PMULT(K,2)=PIM2(K)
        PMULT(K,3)=PIPL(K)
        PMULT(K,4)=PIZ (K)
 77   CONTINUE
      END
       SUBROUTINE DPH5PI(DGAMT,HV,PN,PAA,PMULT,JNPI)                    
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL DGAMT,HV(4),PN(4),PAA(4),PMULT(4,9)
      INTEGER JNPI
C ----------------------------------------------------------------------
* IT SIMULATES 5pi DECAY IN TAU REST FRAME WITH                         
* Z-AXIS ALONG 5pi MOMENTUM                                             
C ----------------------------------------------------------------------
      INTEGER I,K
      REAL PHSPAC,RR1,RR2,RR3,RR4,AM2,ENQ1,ENQ2,PPI,PPPI,EXE,THET,PHI
      REAL PXQ,PXN,QXN,BRAK,FOMPP,FNORM,AMPLIT
      REAL  PT(4)
      REAL PR(4),PI1(4),PI2(4),PI3(4),PI4(4),PI5(4)                   
      DOUBLE PRECISION AMP1,AMP2,AMP3,AMP4,AMP5,ams1,ams2,amom,gamom
      DOUBLE PRECISION AM5SQ,AM4SQ,AM3SQ,AM2SQ,AM5,AM4,AM3
      REAL RRR(10)                                                    
      DOUBLE PRECISION gg1,gg2,gg3,ff1,ff2,ff3,ff4,alp,alp1,alp2
      REAL PI /3.141592653589793238462643/                              
      INTEGER ICONT /0/
      REAL fpi /93.3e-3/                                                

      REAL DCDMAS
      EXTERNAL DCDMAS
c                                                                       
      COMPLEX BWIGN                                                     
      DOUBLE PRECISION XM,AM,GAMMA
      BWIGN(XM,AM,GAMMA)=XM**2/CMPLX(XM**2-AM**2,GAMMA*AM)              
C                              
      AMOM=.782                                                         
      GAMOM=0.0085                                                      
c                                                                       
C 6 BODY PHASE SPACE NORMALISED AS IN BJORKEN-DRELL                     
C D**3 P /2E/(2PI)**3 (2PI)**4 DELTA4(SUM P)                            
      PHSPAC=1./2**29/PI**14                                            
c     PHSPAC=1./2**5/PI**2                                              
C init 5pi decay mode (JNPI)                                            
      AMP1=DCDMAS(IDFFIN(1,JNPI))
      AMP2=DCDMAS(IDFFIN(2,JNPI))
      AMP3=DCDMAS(IDFFIN(3,JNPI))
      AMP4=DCDMAS(IDFFIN(4,JNPI))
      AMP5=DCDMAS(IDFFIN(5,JNPI))
c                                                                       
C TAU MOMENTUM                                                          
      PT(1)=0.                                                          
      PT(2)=0.                                                          
      PT(3)=0.                                                          
      PT(4)=AMTAU                                                       
C                                                                       
      CALL TDRAND(RRR,10)                                               
C                                                                       
c masses of 5, 4, 3 and 2 pi systems                                    
c 3 pi with sampling for omega resonance                                
cam                                                                     
c mass of 5   (12345)                                                   
      rr1=rrr(10)                                                       
      ams1=(amp1+amp2+amp3+amp4+amp5)**2                                
      ams2=(amtau-amnuta)**2                                            
      am5sq=ams1+   rr1*(ams2-ams1)                                     
      am5 =sqrt(am5sq)                                                  
      phspac=phspac*(ams2-ams1)  
c                                                                       
c mass of 4   (2345)                                                    
c flat phase space                                                      
      rr1=rrr(9)                                                        
      ams1=(amp2+amp3+amp4+amp5)**2                                     
      ams2=(am5-amp1)**2                                                
      am4sq=ams1+   rr1*(ams2-ams1)                                     
      am4 =sqrt(am4sq)                                                  
      gg1=ams2-ams1                   
c                                                                       
c mass of 3   (234)                                                     
C phase space with sampling for omega resonance                         
      rr1=rrr(1)                                                        
      ams1=(amp2+amp3+amp4)**2                                          
      ams2=(am4-amp5)**2                                                
      alp1=atan((ams1-amom**2)/amom/gamom)                              
      alp2=atan((ams2-amom**2)/amom/gamom)                              
      alp=alp1+rr1*(alp2-alp1)                                          
      am3sq =amom**2+amom*gamom*tan(alp)                                
      am3 =sqrt(am3sq)                                                  
c --- this part of the jacobian will be recovered later --------------- 
      gg2=((am3sq-amom**2)**2+(amom*gamom)**2)/(amom*gamom)             
      gg2=gg2*(alp2-alp1)                          
c flat phase space;                                                     
C      am3sq=ams1+   rr1*(ams2-ams1)                                     
C      am3 =sqrt(am3sq)                                                  
c --- this part of jacobian will be recovered later                     
C      gg2=ams2-ams1                                                     
c                                                                       
C mass of 2  (34)                                                       
      rr2=rrr(2)                                                        
      ams1=(amp3+amp4)**2                                               
      ams2=(am3-amp2)**2                                                
c flat phase space;                                                     
      am2sq=ams1+   rr2*(ams2-ams1)                                     
      am2 =sqrt(am2sq)                                                  
c --- this part of jacobian will be recovered later                     
      gg3=ams2-ams1                            
c                                                                       
c (34) restframe, define pi3 and pi4                                    
      enq1=(am2sq+amp3**2-amp4**2)/(2*am2)                              
      enq2=(am2sq-amp3**2+amp4**2)/(2*am2)                              
      ppi=          enq1**2-amp3**2                                     
      pppi=sqrt(abs(enq1**2-amp3**2))                                   
      ff1=(4*pi)*(2*pppi/am2)                                           
c pi3   momentum in (34) rest frame                                     
      call sphera(pppi,pi3)                                             
      pi3(4)=enq1                                                       
c pi4   momentum in (34) rest frame                                     
      do 30 i=1,3                                                       
 30   pi4(i)=-pi3(i)                                                    
      pi4(4)=enq2                                                       
c                                                                       
c (234) rest frame, define pi2                                          
c pr   momentum                                                         
      pr(1)=0                                                           
      pr(2)=0                                                           
      pr(4)=1./(2*am3)*(am3**2+am2**2-amp2**2)                          
      pr(3)= sqrt(abs(pr(4)**2-am2**2))                                 
      ppi  =          pr(4)**2-am2**2                                   
c pi2   momentum                                                        
      pi2(1)=0                                                          
      pi2(2)=0                                                          
      pi2(4)=1./(2*am3)*(am3**2-am2**2+amp2**2)                         
      pi2(3)=-pr(3)                                                     
c --- this part of jacobian will be recovered later                     
      ff2=(4*pi)*(2*pr(3)/am3)                                          
c old pions boosted from 2 rest frame to 3 rest frame                   
      exe=(pr(4)+pr(3))/am2                                             
      call bostr3(exe,pi3,pi3)                                          
      call bostr3(exe,pi4,pi4)                                          
      rr3=rrr(3)                                                        
      rr4=rrr(4)                                                        
      thet =acos(-1.+2*rr3)                                             
      phi = 2*pi*rr4                                                    
      call rotpol(thet,phi,pi2)                                         
      call rotpol(thet,phi,pi3)                                         
      call rotpol(thet,phi,pi4)                                         
C                                                                       
C (2345)  rest frame, define pi5                                        
c pr   momentum                                                         
      pr(1)=0                                                           
      pr(2)=0                                                           
      pr(4)=1./(2*am4)*(am4**2+am3**2-amp5**2)                          
      pr(3)= sqrt(abs(pr(4)**2-am3**2))                                 
      ppi  =          pr(4)**2-am3**2                                   
c pi5  momentum                                                         
      pi5(1)=0                                                          
      pi5(2)=0                                                          
      pi5(4)=1./(2*am4)*(am4**2-am3**2+amp5**2)                         
      pi5(3)=-pr(3)                                                     
c --- this part of jacobian will be recovered later                     
      ff3=(4*pi)*(2*pr(3)/am4)                                          
c old pions boosted from 3 rest frame to 4 rest frame                   
      exe=(pr(4)+pr(3))/am3                                             
      call bostr3(exe,pi2,pi2)                                          
      call bostr3(exe,pi3,pi3)                                          
      call bostr3(exe,pi4,pi4)                                          
      rr3=rrr(5)                                                        
      rr4=rrr(6)                                                        
      thet =acos(-1.+2*rr3)                                             
      phi = 2*pi*rr4                                                    
      call rotpol(thet,phi,pi2)                                         
      call rotpol(thet,phi,pi3)                                         
      call rotpol(thet,phi,pi4)                                         
      call rotpol(thet,phi,pi5)                                         
C                                                                       
C (12345)  rest frame, define pi1                                       
c pr   momentum                                                         
      pr(1)=0                                                           
      pr(2)=0                                                           
      pr(4)=1./(2*am5)*(am5**2+am4**2-amp1**2)                          
      pr(3)= sqrt(abs(pr(4)**2-am4**2))                                 
      ppi  =          pr(4)**2-am4**2                                   
c pi1  momentum                                                         
      pi1(1)=0                                                          
      pi1(2)=0                                                          
      pi1(4)=1./(2*am5)*(am5**2-am4**2+amp1**2)                         
      pi1(3)=-pr(3)                                                     
c --- this part of jacobian will be recovered later                     
      ff4=(4*pi)*(2*pr(3)/am5)                                          
c old pions boosted from 4 rest frame to 5 rest frame                   
      exe=(pr(4)+pr(3))/am4                                             
      call bostr3(exe,pi2,pi2)                                          
      call bostr3(exe,pi3,pi3)                                          
      call bostr3(exe,pi4,pi4)                                          
      call bostr3(exe,pi5,pi5)                                          
      rr3=rrr(7)                                                        
      rr4=rrr(8)                                                        
      thet =acos(-1.+2*rr3)                                             
      phi = 2*pi*rr4                                                    
      call rotpol(thet,phi,pi1)                                         
      call rotpol(thet,phi,pi2)                                         
      call rotpol(thet,phi,pi3)                                         
      call rotpol(thet,phi,pi4)                                         
      call rotpol(thet,phi,pi5)                                         
c                                                                       
* now to the tau rest frame, define paa and neutrino momenta            
* paa  momentum                                                         
      paa(1)=0                                                          
      paa(2)=0                                                          
c     paa(4)=1./(2*amtau)*(amtau**2-amnuta**2+am5**2)                   
c     paa(3)= sqrt(abs(paa(4)**2-am5**2))                               
c     ppi   =          paa(4)**2-am5**2                                 
      paa(4)=1./(2*amtau)*(amtau**2-amnuta**2+am5sq)                    
      paa(3)= sqrt(abs(paa(4)**2-am5sq))                                
      ppi   =          paa(4)**2-am5sq                                  
      phspac=phspac*(4*pi)*(2*paa(3)/amtau)                             
* tau-neutrino momentum                                                 
      pn(1)=0                                                           
      pn(2)=0                                                           
      pn(4)=1./(2*amtau)*(amtau**2+amnuta**2-am5**2)                    
      pn(3)=-paa(3)                                                     
c                                                                       
      phspac=phspac * gg1*gg2*gg3*ff1*ff2*ff3*ff4                       
c                                                                       
C all pions boosted from  5  rest frame to tau rest frame               
C z-axis antiparallel to neutrino momentum                              
      exe=(paa(4)+paa(3))/am5                                           
      call bostr3(exe,pi1,pi1)                                          
      call bostr3(exe,pi2,pi2)                                          
      call bostr3(exe,pi3,pi3)                                          
      call bostr3(exe,pi4,pi4)                                          
      call bostr3(exe,pi5,pi5)                                          
c                                                                       
C partial width consists of phase space and amplitude                   
C AMPLITUDE  (cf YS.Tsai Phys.Rev.D4,2821(1971)                         
C    or F.Gilman SH.Rhie Phys.Rev.D31,1066(1985)                        
C                                                                       
      PXQ=AMTAU*PAA(4)                                                  
      PXN=AMTAU*PN(4)                                                   
      QXN=PAA(4)*PN(4)-PAA(1)*PN(1)-PAA(2)*PN(2)-PAA(3)*PN(3)           
      BRAK=2*(GV**2+GA**2)*(2*PXQ*QXN+AM5SQ*PXN)                        
     &    -6*(GV**2-GA**2)*AMTAU*AMNUTA*AM5SQ                           
      fompp = cabs(bwign(am3,amom,gamom))**2                            
c normalisation factor (to some numerical undimensioned factor;         
c cf R.Fischer et al ZPhys C3, 313 (1980))                              
      fnorm = 1/fpi**6                                                  
c     AMPLIT=CCABIB**2*GFERMI**2/2. * BRAK * AM5SQ*XSIGEE(AM5SQ,JNPI)    
      AMPLIT=CCABIB**2*GFERMI**2/2. * BRAK                              
      amplit = amplit * fompp * fnorm                                   
c phase space test                                                      
c     amplit = amplit * fnorm                                           
      DGAMT=1/(2.*AMTAU)*AMPLIT*PHSPAC                                  
c ignore spin terms                                                     
      DO 40 I=1,3                                                       
 40   HV(I)=0.                                    
c                                                                       
      do 77 k=1,4                                                       
        pmult(k,1)=pi1(k)                                               
        pmult(k,2)=pi2(k)                                               
        pmult(k,3)=pi3(k)                                               
        pmult(k,4)=pi4(k)                                               
        pmult(k,5)=pi5(k)                                               
 77   continue                                                          
      return           
C missing: transposition of identical particles, startistical factors 
C for identical matrices, polarimetric vector. Matrix element rather naive.
C flat phase space in pion system + with breit wigner for omega
C anyway it is better than nothing, and code is improvable.                                                  
      end                                                               
      SUBROUTINE DPHNPI(DGAMT,HVX,PNX,PRX,PPIX,JNPI)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL DGAMT,HVX(4),PNX(4),PRX(4),PPIX(4,9)
      INTEGER JNPI
C ----------------------------------------------------------------------
C IT SIMULATES MULTIPI DECAY IN TAU REST FRAME WITH
C Z-AXIS OPPOSITE TO NEUTRINO MOMENTUM
C ----------------------------------------------------------------------
      INTEGER I,J,K,L,KK,IL,JL,NCONT,ND
      REAL PS,PHSPAC,RR1,AMX2,AMW,PXQ,PXN,QXN,BRAK,AMPLIT,RN,XNPI
C
      DOUBLE PRECISION  PN(4),PR(4),PPI(4,9),HV(4)
      DOUBLE PRECISION  PV(5,9),PT(4),UE(3),BE(3)
      DOUBLE PRECISION  PAWT,AMX,AMS1,AMS2,PA,PHS,PHSMAX,PMIN,PMAX
      DOUBLE PRECISION  GAM,BEP,PHI,A,B,C
      DOUBLE PRECISION  AMPIK
      REAL RRR(9),RRX(2)
C
      REAL PI /3.141592653589793238462643/
      DOUBLE PRECISION WETMAX(20) 
      DATA WETMAX /20*1D-15/

      REAL XSIGEE,DCDMAS
      EXTERNAL XSIGEE,DCDMAS
C
CC--      PAWT(A,B,C)=SQRT((A**2-(B+C)**2)*(A**2-(B-C)**2))/(2.*A)
C
      PAWT(A,B,C)=
     $  SQRT(MAX(0.D0,(A**2-(B+C)**2)*(A**2-(B-C)**2)))/(2.D0*A)
C
      AMPIK(I,J)=DCDMAS(IDFFIN(I,J))
C
C
      IF ((JNPI.LE.0).OR.JNPI.GT.20) THEN
       WRITE(TUN,*) 'JNPI OUTSIDE RANGE DEFINED BY WETMAX; JNPI=',JNPI
       STOP
      ENDIF

C TAU MOMENTUM
      PT(1)=0.
      PT(2)=0.
      PT(3)=0.
      PT(4)=AMTAU
C
 500  CONTINUE
C MASS OF VIRTUAL W
      ND=MULPIK(JNPI)
      PS=0.
      PHSPAC = 1./2.**5 /PI**2
      DO 4 I=1,ND
4     PS  =PS+AMPIK(I,JNPI)
      CALL TDRAND(RR1,1)
      AMS1=PS**2
      AMS2=(AMTAU-AMNUTA)**2
C
C
      AMX2=AMS1+   RR1*(AMS2-AMS1)
      AMX =SQRT(AMX2)
      AMW =AMX
      PHSPAC=PHSPAC * (AMS2-AMS1)
C
C TAU-NEUTRINO MOMENTUM
      PN(1)=0
      PN(2)=0
      PN(4)=1./(2*AMTAU)*(AMTAU**2+AMNUTA**2-AMX2)
      PN(3)=-SQRT((PN(4)-AMNUTA)*(PN(4)+AMNUTA))
C W MOMENTUM
      PR(1)=0
      PR(2)=0
      PR(4)=1./(2*AMTAU)*(AMTAU**2-AMNUTA**2+AMX2)
      PR(3)=-PN(3)
      PHSPAC=PHSPAC * (4.*PI) * (2.*PR(3)/AMTAU)
C
C AMPLITUDE  (cf YS.Tsai Phys.Rev.D4,2821(1971)
C    or F.Gilman SH.Rhie Phys.Rev.D31,1066(1985)
C
        PXQ=AMTAU*PR(4)
        PXN=AMTAU*PN(4)
        QXN=PR(4)*PN(4)-PR(1)*PN(1)-PR(2)*PN(2)-PR(3)*PN(3)
C HERE WAS AN ERROR. 20.10.91 (ZW)
C       BRAK=2*(GV**2+GA**2)*(2*PXQ*PXN+AMX2*QXN)
        BRAK=2*(GV**2+GA**2)*(2*PXQ*QXN+AMX2*PXN)
     &      -6*(GV**2-GA**2)*AMTAU*AMNUTA*AMX2
CAM     Assume neutrino mass=0. and sum over final polarisation
C     BRAK= 2*(AMTAU**2-AMX2) * (AMTAU**2+2.*AMX2)
      AMPLIT=CCABIB**2*GFERMI**2/2. * BRAK * AMX2*XSIGEE(AMX2,JNPI)
      DGAMT=1./(2.*AMTAU)*AMPLIT*PHSPAC
C
C   ISOTROPIC W DECAY IN W REST FRAME
      PHSMAX = 1.
      DO 200 I=1,4
  200 PV(I,1)=PR(I)
      PV(5,1)=AMW
      PV(5,ND)=AMPIK(ND,JNPI)
C    COMPUTE MAX. PHASE SPACE FACTOR
      PMAX=AMW-PS+AMPIK(ND,JNPI)
      PMIN=.0
      DO 220 IL=ND-1,1,-1
      PMAX=PMAX+AMPIK(IL,JNPI)
      PMIN=PMIN+AMPIK(IL+1,JNPI)
  220 PHSMAX=PHSMAX*PAWT(PMAX,PMIN,AMPIK(IL,JNPI))/PMAX

C --- 2.02.94 ZW  9 lines
      AMX=AMW
      DO 222 IL=1,ND-2
      AMS1=.0
      DO 223 JL=IL+1,ND
 223  AMS1=AMS1+AMPIK(JL,JNPI)
      AMS1=AMS1**2
      AMX =(AMX-AMPIK(IL,JNPI))
      AMS2=(AMX)**2
      PHSMAX=PHSMAX * (AMS2-AMS1)
 222  CONTINUE
      NCONT=0
  100 CONTINUE
      NCONT=NCONT+1
CAM  GENERATE ND-2 EFFECTIVE MASSES
      PHS=1.D0
      PHSPAC = 1./2.**(6*ND-7) /PI**(3*ND-4)
      AMX=AMW
      CALL TDRAND(RRR,ND-2)
      DO 230 IL=1,ND-2
      AMS1=.0D0
      DO 231 JL=IL+1,ND
  231 AMS1=AMS1+AMPIK(JL,JNPI)
      AMS1=AMS1**2
      AMS2=(AMX-AMPIK(IL,JNPI))**2
      RR1=RRR(IL)
      AMX2=AMS1+  RR1*(AMS2-AMS1)
      AMX=SQRT(AMX2)
      PV(5,IL+1)=AMX
      PHSPAC=PHSPAC * (AMS2-AMS1)
C ---  2.02.94 ZW 1 line 
      PHS=PHS* (AMS2-AMS1)
      PA=PAWT(PV(5,IL),PV(5,IL+1),AMPIK(IL,JNPI))
      PHS   =PHS    *PA/PV(5,IL)
  230 CONTINUE
      PA=PAWT(PV(5,ND-1),AMPIK(ND-1,JNPI),AMPIK(ND,JNPI))
      PHS   =PHS    *PA/PV(5,ND-1)
      CALL TDRAND(RN,1)
      WETMAX(JNPI)=1.2D0*MAX(WETMAX(JNPI)/1.2D0,PHS/PHSMAX)
      IF (NCONT.EQ.500 000) THEN
          XNPI=0.0
          DO KK=1,ND
            XNPI=XNPI+AMPIK(KK,JNPI)
          ENDDO
       WRITE(TUN,*) 'ROUNDING INSTABILITY IN DPHNPI ?'
       WRITE(TUN,*) 'AMW=',AMW,'XNPI=',XNPI
       WRITE(TUN,*) 'IF =AMW= IS NEARLY EQUAL =XNPI= THAT IS IT' 
       WRITE(TUN,*) 'PHS=',PHS,'PHSMAX=',PHSMAX 
       GOTO 500
      ENDIF
      IF(RN*PHSMAX*WETMAX(JNPI).GT.PHS) GO TO 100
C...PERFORM SUCCESSIVE TWO-PARTICLE DECAYS IN RESPECTIVE CM FRAME
  280 DO 300 IL=1,ND-1
      PA=PAWT(PV(5,IL),PV(5,IL+1),AMPIK(IL,JNPI))
      CALL TDRAND(RRX,2)
      UE(3)=2.*RRX(1)-1.
      PHI=2.*PI*RRX(2)
      UE(1)=SQRT(1.D0-UE(3)**2)*COS(PHI)
      UE(2)=SQRT(1.D0-UE(3)**2)*SIN(PHI)
      DO 290 J=1,3
      PPI(J,IL)=PA*UE(J)
  290 PV(J,IL+1)=-PA*UE(J)
      PPI(4,IL)=SQRT(PA**2+AMPIK(IL,JNPI)**2)
      PV(4,IL+1)=SQRT(PA**2+PV(5,IL+1)**2)
      PHSPAC=PHSPAC *(4.*PI)*(2.*PA/PV(5,IL))
  300 CONTINUE
C...LORENTZ TRANSFORM DECAY PRODUCTS TO TAU FRAME
      DO 310 J=1,4
  310 PPI(J,ND)=PV(J,ND)
      DO 340 IL=ND-1,1,-1
      DO 320 J=1,3
  320 BE(J)=PV(J,IL)/PV(4,IL)
      GAM=PV(4,IL)/PV(5,IL)
      DO 340 I=IL,ND
      BEP=BE(1)*PPI(1,I)+BE(2)*PPI(2,I)+BE(3)*PPI(3,I)
      DO 330 J=1,3
  330 PPI(J,I)=PPI(J,I)+GAM*(GAM*BEP/(1.D0+GAM)+PPI(4,I))*BE(J)
      PPI(4,I)=GAM*(PPI(4,I)+BEP)
  340 CONTINUE
C
            HV(4)=1.
            HV(3)=0.
            HV(2)=0.
            HV(1)=0.
      DO K=1,4
        PNX(K)=PN(K)
        PRX(K)=PR(K)
        HVX(K)=HV(K)
        DO L=1,ND
          PPIX(K,L)=PPI(K,L)
        ENDDO
      ENDDO
      RETURN
      END
      SUBROUTINE DPHSAA(DGAMT,HV,PN,PAA,PIM1,PIM2,PIPL,JAA)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL DGAMT,HV(4),PN(4),PAA(4),PIM1(4),PIM2(4),PIPL(4)
      INTEGER JAA
C ----------------------------------------------------------------------
* IT SIMULATES A1  DECAY IN TAU REST FRAME WITH
* Z-AXIS ALONG A1  MOMENTUM
C ----------------------------------------------------------------------
      INTEGER MNUM,KEYT
      REAL RMOD,AMP1,AMP2,AMP3
 
      REAL*4 RRR(1)
C MATRIX ELEMENT NUMBER:
      MNUM=0
C TYPE OF THE GENERATION:
      KEYT=1
      CALL TDRAND(RRR,1)
      RMOD=RRR(1)
      IF (RMOD.LT.BRA1) THEN
       JAA=1
       AMP1=AMPI
       AMP2=AMPI
       AMP3=AMPI
      ELSE
       JAA=2
       AMP1=AMPIZ
       AMP2=AMPIZ
       AMP3=AMPI
      ENDIF
 
      CALL
     $   DPHTRE(DGAMT,HV,PN,PAA,PIM1,AMP1,PIM2,AMP2,PIPL,AMP3,KEYT,MNUM)
      END
      SUBROUTINE DPHSEL(DGAMX,HVX,XNX,PAAX,QPX,XAX,PHX)
      IMPLICIT NONE
      REAL DGAMX,HVX(4),XNX(4),PAAX(4),QPX(4),XAX(4),PHX(4)
C XNX,XNA was flipped in parameters of dphsel and dphsmu
C *********************************************************************
C *   ELECTRON DECAY MODE                                             *
C *********************************************************************
      INTEGER K,IELMU
      DOUBLE PRECISION  HV(4),PH(4),PAA(4),XA(4),QP(4),XN(4)
      DOUBLE PRECISION  DGAMT
      IELMU=1
      CALL DRCMU(DGAMT,HV,PH,PAA,XA,QP,XN,IELMU)
      DO 7 K=1,4
        HVX(K)=HV(K)
        PHX(K)=PH(K)
        PAAX(K)=PAA(K)
        XAX(K)=XA(K)
        QPX(K)=QP(K)
        XNX(K)=XN(K)
  7   CONTINUE
      DGAMX=DGAMT
      END
      SUBROUTINE DPHSKS(DGAMT,HV,PN,PKS,PKK,PPI,JKST)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL DGAMT,HV(4),PN(4),PKS(4),PKK(4),PPI(4)
      INTEGER JKST
C ----------------------------------------------------------------------
C IT SIMULATES KAON* DECAY IN TAU REST FRAME WITH
C Z-AXIS ALONG KAON* MOMENTUM
C     JKST=10 FOR K* --->K0 + PI+-
C     JKST=20 FOR K* --->K+- + PI0
C ----------------------------------------------------------------------
      INTEGER I
      REAL PHSPAC,RR1,AMS1,AMS2,ALP,ALP1,ALP2,AMX,AMX2,ENPI,PPPI
      REAL EXE,PKSD,QQPKS,PRODPQ,PRODNQ,PRODPN,QQ2,BRAK,FKS,AMPLIT
      REAL  PT(4),QQ(4)
      COMPLEX BWIGS
      REAL PI /3.141592653589793238462643/
C
      INTEGER ICONT /0/
C THREE BODY PHASE SPACE NORMALISED AS IN BJORKEN-DRELL
      PHSPAC=1./2**11/PI**5
C TAU MOMENTUM
      PT(1)=0.
      PT(2)=0.
      PT(3)=0.
      PT(4)=AMTAU
      CALL TDRAND(RR1,1)
C HERE BEGIN THE K0,PI+_ DECAY
      IF(JKST.EQ.10)THEN
C     ==================
C MASS OF (REAL/VIRTUAL) K*
        AMS1=(AMPI+AMKZ)**2
        AMS2=(AMTAU-AMNUTA)**2
C FLAT PHASE SPACE
C       AMX2=AMS1+   RR1*(AMS2-AMS1)
C       AMX=SQRT(AMX2)
C       PHSPAC=PHSPAC*(AMS2-AMS1)
C PHASE SPACE WITH SAMPLING FOR K* RESONANCE
        ALP1=ATAN((AMS1-AMKST**2)/AMKST/GAMKST)
        ALP2=ATAN((AMS2-AMKST**2)/AMKST/GAMKST)
        ALP=ALP1+RR1*(ALP2-ALP1)
        AMX2=AMKST**2+AMKST*GAMKST*TAN(ALP)
        AMX=SQRT(AMX2)
        PHSPAC=PHSPAC*((AMX2-AMKST**2)**2+(AMKST*GAMKST)**2)
     &                /(AMKST*GAMKST)
        PHSPAC=PHSPAC*(ALP2-ALP1)
C
C TAU-NEUTRINO MOMENTUM
        PN(1)=0
        PN(2)=0
        PN(4)=1./(2*AMTAU)*(AMTAU**2+AMNUTA**2-AMX**2)
        PN(3)=-SQRT((PN(4)-AMNUTA)*(PN(4)+AMNUTA))
C
C K* MOMENTUM
        PKS(1)=0
        PKS(2)=0
        PKS(4)=1./(2*AMTAU)*(AMTAU**2-AMNUTA**2+AMX**2)
        PKS(3)=-PN(3)
        PHSPAC=PHSPAC*(4*PI)*(2*PKS(3)/AMTAU)
C
CAM
        ENPI=( AMX**2+AMPI**2-AMKZ**2 ) / ( 2*AMX )
        PPPI=SQRT((ENPI-AMPI)*(ENPI+AMPI))
        PHSPAC=PHSPAC*(4*PI)*(2*PPPI/AMX)
C CHARGED PI MOMENTUM IN KAON* REST FRAME
        CALL SPHERA(PPPI,PPI)
        PPI(4)=ENPI
C NEUTRAL KAON MOMENTUM IN K* REST FRAME
        DO 20 I=1,3
20      PKK(I)=-PPI(I)
        PKK(4)=( AMX**2+AMKZ**2-AMPI**2 ) / ( 2*AMX )
        EXE=(PKS(4)+PKS(3))/AMX
C PION AND K  BOOSTED FROM K* REST FRAME TO TAU REST FRAME
        CALL BOSTR3(EXE,PPI,PPI)
        CALL BOSTR3(EXE,PKK,PKK)
        DO 30 I=1,4
30      QQ(I)=PPI(I)-PKK(I)
C QQ transverse to PKS
        PKSD =PKS(4)*PKS(4)-PKS(3)*PKS(3)-PKS(2)*PKS(2)-PKS(1)*PKS(1)
        QQPKS=PKS(4)* QQ(4)-PKS(3)* QQ(3)-PKS(2)* QQ(2)-PKS(1)* QQ(1)
        DO 31 I=1,4
31      QQ(I)=QQ(I)-PKS(I)*QQPKS/PKSD
C AMPLITUDE
        PRODPQ=PT(4)*QQ(4)
        PRODNQ=PN(4)*QQ(4)-PN(1)*QQ(1)-PN(2)*QQ(2)-PN(3)*QQ(3)
        PRODPN=PT(4)*PN(4)
        QQ2= QQ(4)**2-QQ(1)**2-QQ(2)**2-QQ(3)**2
        BRAK=(GV**2+GA**2)*(2*PRODPQ*PRODNQ-PRODPN*QQ2)
     &      +(GV**2-GA**2)*AMTAU*AMNUTA*QQ2
C A SIMPLE BREIT-WIGNER IS CHOSEN FOR K* RESONANCE
        FKS=CABS(BWIGS(AMX2,AMKST,GAMKST))**2
        AMPLIT=(GFERMI*SCABIB)**2*BRAK*2*FKS
        DGAMT=1/(2.*AMTAU)*AMPLIT*PHSPAC
        DO 40 I=1,3
 40     HV(I)=2*GV*GA*AMTAU*(2*PRODNQ*QQ(I)-QQ2*PN(I))/BRAK
C
C HERE BEGIN THE K+-,PI0 DECAY
      ELSEIF(JKST.EQ.20)THEN
C     ======================
C MASS OF (REAL/VIRTUAL) K*
        AMS1=(AMPIZ+AMK)**2
        AMS2=(AMTAU-AMNUTA)**2
C FLAT PHASE SPACE
C       AMX2=AMS1+   RR1*(AMS2-AMS1)
C       AMX=SQRT(AMX2)
C       PHSPAC=PHSPAC*(AMS2-AMS1)
C PHASE SPACE WITH SAMPLING FOR K* RESONANCE
        ALP1=ATAN((AMS1-AMKST**2)/AMKST/GAMKST)
        ALP2=ATAN((AMS2-AMKST**2)/AMKST/GAMKST)
        ALP=ALP1+RR1*(ALP2-ALP1)
        AMX2=AMKST**2+AMKST*GAMKST*TAN(ALP)
        AMX=SQRT(AMX2)
        PHSPAC=PHSPAC*((AMX2-AMKST**2)**2+(AMKST*GAMKST)**2)
     &                /(AMKST*GAMKST)
        PHSPAC=PHSPAC*(ALP2-ALP1)
C
C TAU-NEUTRINO MOMENTUM
        PN(1)=0
        PN(2)=0
        PN(4)=1./(2*AMTAU)*(AMTAU**2+AMNUTA**2-AMX**2)
        PN(3)=-SQRT((PN(4)-AMNUTA)*(PN(4)+AMNUTA))
C KAON* MOMENTUM
        PKS(1)=0
        PKS(2)=0
        PKS(4)=1./(2*AMTAU)*(AMTAU**2-AMNUTA**2+AMX**2)
        PKS(3)=-PN(3)
        PHSPAC=PHSPAC*(4*PI)*(2*PKS(3)/AMTAU)
C
CAM
        ENPI=( AMX**2+AMPIZ**2-AMK**2 ) / ( 2*AMX )
        PPPI=SQRT((ENPI-AMPIZ)*(ENPI+AMPIZ))
        PHSPAC=PHSPAC*(4*PI)*(2*PPPI/AMX)
C NEUTRAL PI MOMENTUM IN K* REST FRAME
        CALL SPHERA(PPPI,PPI)
        PPI(4)=ENPI
C CHARGED KAON MOMENTUM IN K* REST FRAME
        DO 50 I=1,3
50      PKK(I)=-PPI(I)
        PKK(4)=( AMX**2+AMK**2-AMPIZ**2 ) / ( 2*AMX )
        EXE=(PKS(4)+PKS(3))/AMX
C PION AND K  BOOSTED FROM K* REST FRAME TO TAU REST FRAME
        CALL BOSTR3(EXE,PPI,PPI)
        CALL BOSTR3(EXE,PKK,PKK)
        DO 60 I=1,4
60      QQ(I)=PKK(I)-PPI(I)
C QQ transverse to PKS
        PKSD =PKS(4)*PKS(4)-PKS(3)*PKS(3)-PKS(2)*PKS(2)-PKS(1)*PKS(1)
        QQPKS=PKS(4)* QQ(4)-PKS(3)* QQ(3)-PKS(2)* QQ(2)-PKS(1)* QQ(1)
        DO 61 I=1,4
61      QQ(I)=QQ(I)-PKS(I)*QQPKS/PKSD
C AMPLITUDE
        PRODPQ=PT(4)*QQ(4)
        PRODNQ=PN(4)*QQ(4)-PN(1)*QQ(1)-PN(2)*QQ(2)-PN(3)*QQ(3)
        PRODPN=PT(4)*PN(4)
        QQ2= QQ(4)**2-QQ(1)**2-QQ(2)**2-QQ(3)**2
        BRAK=(GV**2+GA**2)*(2*PRODPQ*PRODNQ-PRODPN*QQ2)
     &      +(GV**2-GA**2)*AMTAU*AMNUTA*QQ2
C A SIMPLE BREIT-WIGNER IS CHOSEN FOR THE K* RESONANCE
        FKS=CABS(BWIGS(AMX2,AMKST,GAMKST))**2
        AMPLIT=(GFERMI*SCABIB)**2*BRAK*2*FKS
        DGAMT=1/(2.*AMTAU)*AMPLIT*PHSPAC
        DO 70 I=1,3
 70     HV(I)=2*GV*GA*AMTAU*(2*PRODNQ*QQ(I)-QQ2*PN(I))/BRAK
      ENDIF
      RETURN
      END
      SUBROUTINE DPHSMU(DGAMX,HVX,XNX,PAAX,QPX,XAX,PHX)
      IMPLICIT NONE
      REAL DGAMX,HVX(4),XNX(4),PAAX(4),QPX(4),XAX(4),PHX(4)
C XNX,XNA was flipped in parameters of dphsel and dphsmu
C *********************************************************************
C *   MUON     DECAY MODE                                             *
C *********************************************************************
      INTEGER K,IELMU
      DOUBLE PRECISION  HV(4),PH(4),PAA(4),XA(4),QP(4),XN(4)
      DOUBLE PRECISION  DGAMT
      IELMU=2
      CALL DRCMU(DGAMT,HV,PH,PAA,XA,QP,XN,IELMU)
      DO 7 K=1,4
        HVX(K)=HV(K)
        PHX(K)=PH(K)
        PAAX(K)=PAA(K)
        XAX(K)=XA(K)
        QPX(K)=QP(K)
        XNX(K)=XN(K)
  7   CONTINUE
      DGAMX=DGAMT
      END
      SUBROUTINE DPHSPK(DGAMT,HV,PN,PAA,PNPI,JAA)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL DGAMT,HV(4),PN(4),PAA(4),PNPI(4,9)
      INTEGER JAA
C ----------------------------------------------------------------------
* IT SIMULATES THREE PI (K) DECAY IN THE TAU REST FRAME
* Z-AXIS ALONG HADRONIC SYSTEM
C ----------------------------------------------------------------------
      INTEGER I,MNUM,KEYT
      REAL AMP1,AMP2,AMP3
      REAL  PIM1(4),PIM2(4),PIPL(4)

      REAL DCDMAS
      EXTERNAL DCDMAS

C MATRIX ELEMENT NUMBER:
      MNUM=JAA
C TYPE OF THE GENERATION:
      KEYT=4
      IF(JAA.EQ.7) KEYT=3
C --- MASSES OF THE DECAY PRODUCTS
       AMP1=DCDMAS(IDFFIN(1,JAA+NM4+NM5+NM6))
       AMP2=DCDMAS(IDFFIN(2,JAA+NM4+NM5+NM6))
       AMP3=DCDMAS(IDFFIN(3,JAA+NM4+NM5+NM6))
      CALL
     $   DPHTRE(DGAMT,HV,PN,PAA,PIM1,AMP1,PIM2,AMP2,PIPL,AMP3,KEYT,MNUM)
            DO I=1,4
              PNPI(I,1)=PIM1(I)
              PNPI(I,2)=PIM2(I)
              PNPI(I,3)=PIPL(I)
            ENDDO
      END
      SUBROUTINE DPHSRK(DGAMT,HV,PN,PR,PMULT,INUM)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL DGAMT,HV(4),PN(4),PR(4),PMULT(4,9)
      INTEGER INUM
C ----------------------------------------------------------------------
C IT SIMULATES RHO DECAY IN TAU REST FRAME WITH                         
C Z-AXIS ALONG RHO MOMENTUM                                             
C Rho decays to K Kbar                                                  
C ----------------------------------------------------------------------
      INTEGER I,K
      REAL PHSPAC,RR1,AMX,AMX2,PPPI,EXE,PRODPQ,PRODNQ,PRODPN
      REAL AMS1,AMS2,ENQ1,ENQ2,PKSD,QQPDK,QQ2,QQPKS,BRAK,AMPLIT
      REAL  PT(4),PKC(4),PKZ(4),QQ(4)
      REAL PI /3.141592653589793238462643/                              
      INTEGER ICONT /0/

      REAL FPIRK
      EXTERNAL FPIRK
C                                                                       
C THREE BODY PHASE SPACE NORMALISED AS IN BJORKEN-DRELL                 
      PHSPAC=1./2**11/PI**5      
C TAU MOMENTUM                                                          
      PT(1)=0.                                                          
      PT(2)=0.                                                          
      PT(3)=0.                                                          
      PT(4)=AMTAU                                                       
C MASS OF (REAL/VIRTUAL) RHO                                            
      AMS1=(AMK+AMKZ)**2                                                
      AMS2=(AMTAU-AMNUTA)**2                                            
C FLAT PHASE SPACE                                                      
      CALL TDRAND(RR1,1)                                                
      AMX2=AMS1+   RR1*(AMS2-AMS1)                                      
      AMX=SQRT(AMX2)                                                    
      PHSPAC=PHSPAC*(AMS2-AMS1)                                         
C PHASE SPACE WITH SAMPLING FOR RHO RESONANCE                           
c     ALP1=ATAN((AMS1-AMRO**2)/AMRO/GAMRO)                              
c     ALP2=ATAN((AMS2-AMRO**2)/AMRO/GAMRO)                              
CAM                                                                     
 100  CONTINUE                                                          
c     CALL TDRAND(RR1,1)                                                
c     ALP=ALP1+RR1*(ALP2-ALP1)                                          
c     AMX2=AMRO**2+AMRO*GAMRO*TAN(ALP)                                  
c     AMX=SQRT(AMX2)                                                    
c     IF(AMX.LT.(AMK+AMKZ)) GO TO 100                                   
CAM                                                                     
c     PHSPAC=PHSPAC*((AMX2-AMRO**2)**2+(AMRO*GAMRO)**2)/(AMRO*GAMRO)    
c     PHSPAC=PHSPAC*(ALP2-ALP1)                                         
C                                                                       
C TAU-NEUTRINO MOMENTUM                                                 
      PN(1)=0                                                           
      PN(2)=0                                                           
      PN(4)=1./(2*AMTAU)*(AMTAU**2+AMNUTA**2-AMX**2)                    
      PN(3)=-SQRT((PN(4)-AMNUTA)*(PN(4)+AMNUTA))                        
C RHO MOMENTUM                                                          
      PR(1)=0                                                           
      PR(2)=0                                                           
      PR(4)=1./(2*AMTAU)*(AMTAU**2-AMNUTA**2+AMX**2)                    
      PR(3)=-PN(3)                                                      
      PHSPAC=PHSPAC*(4*PI)*(2*PR(3)/AMTAU)                              
C                                                                       
CAM                                                                     
      ENQ1=(AMX2+AMK**2-AMKZ**2)/(2.*AMX)                               
      ENQ2=(AMX2-AMK**2+AMKZ**2)/(2.*AMX)                               
      PPPI=SQRT((ENQ1-AMK)*(ENQ1+AMK))                                  
      PHSPAC=PHSPAC*(4*PI)*(2*PPPI/AMX)                                 
C CHARGED PI MOMENTUM IN RHO REST FRAME                                 
      CALL SPHERA(PPPI,PKC)                                             
      PKC(4)=ENQ1                                                       
C NEUTRAL PI MOMENTUM IN RHO REST FRAME                                 
      DO 20 I=1,3                                                       
20    PKZ(I)=-PKC(I)                                                    
      PKZ(4)=ENQ2                                                       
      EXE=(PR(4)+PR(3))/AMX                                             
C PIONS BOOSTED FROM RHO REST FRAME TO TAU REST FRAME                   
      CALL BOSTR3(EXE,PKC,PKC)                                          
      CALL BOSTR3(EXE,PKZ,PKZ)                                          
      DO 30 I=1,4                                                       
 30      QQ(I)=PKC(I)-PKZ(I)  
C QQ transverse to PR
        PKSD =PR(4)*PR(4)-PR(3)*PR(3)-PR(2)*PR(2)-PR(1)*PR(1)
        QQPKS=PR(4)* QQ(4)-PR(3)* QQ(3)-PR(2)* QQ(2)-PR(1)* QQ(1)
        DO 31 I=1,4
31      QQ(I)=QQ(I)-PR(I)*QQPKS/PKSD                        
C AMPLITUDE                                                             
      PRODPQ=PT(4)*QQ(4)                                                
      PRODNQ=PN(4)*QQ(4)-PN(1)*QQ(1)-PN(2)*QQ(2)-PN(3)*QQ(3)            
      PRODPN=PT(4)*PN(4)                                                
      QQ2= QQ(4)**2-QQ(1)**2-QQ(2)**2-QQ(3)**2                          
      BRAK=(GV**2+GA**2)*(2*PRODPQ*PRODNQ-PRODPN*QQ2)                   
     &    +(GV**2-GA**2)*AMTAU*AMNUTA*QQ2                               
      AMPLIT=(GFERMI*CCABIB)**2*BRAK*2*FPIRK(AMX)                       
      DGAMT=1/(2.*AMTAU)*AMPLIT*PHSPAC                                  
      DO 40 I=1,3                                                       
 40   HV(I)=2*GV*GA*AMTAU*(2*PRODNQ*QQ(I)-QQ2*PN(I))/BRAK               
      do 77 k=1,4                                                       
        pmult(k,1)=pkc(k)
        pmult(k,2)=pkz(k)
 77   continue           
      RETURN             
      END                
      SUBROUTINE DPHSRO(DGAMT,HV,PN,PR,PIC,PIZ)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL DGAMT,HV(4),PN(4),PR(4),PIC(4),PIZ(4)
C ----------------------------------------------------------------------
C IT SIMULATES RHO DECAY IN TAU REST FRAME WITH
C Z-AXIS ALONG RHO MOMENTUM
C ----------------------------------------------------------------------
      INTEGER I
      REAL PHSPAC,ENQ1,ENQ2,ALP,ALP1,ALP2,AMS1,AMS2,AMX,AMX2
      REAL PPPI,EXE,PRODPQ,PRODNQ,PRODPN,QQ2,BRAK,AMPLIT,RR1
      REAL  PT(4),QQ(4)
      REAL PI /3.141592653589793238462643/
      INTEGER ICONT /0/

      REAL FPIRHO
      EXTERNAL FPIRHO
C
C THREE BODY PHASE SPACE NORMALISED AS IN BJORKEN-DRELL
      PHSPAC=1./2**11/PI**5
C TAU MOMENTUM
      PT(1)=0.
      PT(2)=0.
      PT(3)=0.
      PT(4)=AMTAU
C MASS OF (REAL/VIRTUAL) RHO
      AMS1=(AMPI+AMPIZ)**2
      AMS2=(AMTAU-AMNUTA)**2
C FLAT PHASE SPACE
C     AMX2=AMS1+   RR1*(AMS2-AMS1)
C     AMX=SQRT(AMX2)
C     PHSPAC=PHSPAC*(AMS2-AMS1)
C PHASE SPACE WITH SAMPLING FOR RHO RESONANCE
      ALP1=ATAN((AMS1-AMRO**2)/AMRO/GAMRO)
      ALP2=ATAN((AMS2-AMRO**2)/AMRO/GAMRO)
CAM
 100  CONTINUE
      CALL TDRAND(RR1,1)
      ALP=ALP1+RR1*(ALP2-ALP1)
      AMX2=AMRO**2+AMRO*GAMRO*TAN(ALP)
      AMX=SQRT(AMX2)
      IF(AMX.LT.2.*AMPI) GO TO 100
CAM
      PHSPAC=PHSPAC*((AMX2-AMRO**2)**2+(AMRO*GAMRO)**2)/(AMRO*GAMRO)
      PHSPAC=PHSPAC*(ALP2-ALP1)
C
C TAU-NEUTRINO MOMENTUM
      PN(1)=0
      PN(2)=0
      PN(4)=1./(2*AMTAU)*(AMTAU**2+AMNUTA**2-AMX**2)
      PN(3)=-SQRT((PN(4)-AMNUTA)*(PN(4)+AMNUTA))
C RHO MOMENTUM
      PR(1)=0
      PR(2)=0
      PR(4)=1./(2*AMTAU)*(AMTAU**2-AMNUTA**2+AMX**2)
      PR(3)=-PN(3)
      PHSPAC=PHSPAC*(4*PI)*(2*PR(3)/AMTAU)
C
CAM
      ENQ1=(AMX2+AMPI**2-AMPIZ**2)/(2.*AMX)
      ENQ2=(AMX2-AMPI**2+AMPIZ**2)/(2.*AMX)
      PPPI=SQRT((ENQ1-AMPI)*(ENQ1+AMPI))
      PHSPAC=PHSPAC*(4*PI)*(2*PPPI/AMX)
C CHARGED PI MOMENTUM IN RHO REST FRAME
      CALL SPHERA(PPPI,PIC)
      PIC(4)=ENQ1
C NEUTRAL PI MOMENTUM IN RHO REST FRAME
      DO 20 I=1,3
20    PIZ(I)=-PIC(I)
      PIZ(4)=ENQ2
      EXE=(PR(4)+PR(3))/AMX
C PIONS BOOSTED FROM RHO REST FRAME TO TAU REST FRAME
      CALL BOSTR3(EXE,PIC,PIC)
      CALL BOSTR3(EXE,PIZ,PIZ)
      DO 30 I=1,4
30    QQ(I)=PIC(I)-PIZ(I)
C AMPLITUDE
      PRODPQ=PT(4)*QQ(4)
      PRODNQ=PN(4)*QQ(4)-PN(1)*QQ(1)-PN(2)*QQ(2)-PN(3)*QQ(3)
      PRODPN=PT(4)*PN(4)
      QQ2= QQ(4)**2-QQ(1)**2-QQ(2)**2-QQ(3)**2
      BRAK=(GV**2+GA**2)*(2*PRODPQ*PRODNQ-PRODPN*QQ2)
     &    +(GV**2-GA**2)*AMTAU*AMNUTA*QQ2
      AMPLIT=(GFERMI*CCABIB)**2*BRAK*2*FPIRHO(AMX)
      DGAMT=1/(2.*AMTAU)*AMPLIT*PHSPAC
      DO 40 I=1,3
 40   HV(I)=2*GV*GA*AMTAU*(2*PRODNQ*QQ(I)-QQ2*PN(I))/BRAK
      RETURN
      END
      SUBROUTINE
     $   DPHTRE(DGAMT,HV,PN,PAA,PIM1,AMPA,PIM2,AMPB,PIPL,AMP3,KEYT,MNUM)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL DGAMT,HV(4),PN(4),PAA(4),PIM1(4),AMPA,PIM2(4),AMPB
      REAL PIPL(4),AMP3
      INTEGER KEYT,MNUM
C ----------------------------------------------------------------------
* IT SIMULATES A1  DECAY IN TAU REST FRAME WITH
* Z-AXIS ALONG A1  MOMENTUM
* it can be also used to generate K K pi and K pi pi tau decays.
* INPUT PARAMETERS
* KEYT - algorithm controlling switch
*  2   - flat phase space PIM1 PIM2 symmetrized statistical factor 1/2
*  1   - like 1 but peaked around a1 and rho (two channels) masses.
*  3   - peaked around omega, all particles different
* other- flat phase space, all particles different
* AMP1 - mass of first pi, etc. (1-3)
* MNUM - matrix element type
*  0   - a1 matrix element
* 1-6  - matrix element for K pi pi, K K pi decay modes
*  7   - pi- pi0 gamma matrix element
C ----------------------------------------------------------------------
      INTEGER I,ICHAN
      REAL PROB1,PROB2,PROB3,AMRX,GAMRX,AMRA,GAMRA,AMRB,GAMRB
      REAL RR,RR1,RR2,RR3,RR4,PHF0,PHF1,PHF2,PPI,PPPI,EXE,THET
      REAL PHI,XPRO,FF1,FF2,GG1,GG2,XJAJE,XJADW
      REAL PHSPAC,AMP1,AMP2,AMS1,AMS2,ALP,ALP1,ALP2
      REAL AM1,AM2,AM3,AM1SQ,AM2SQ,AM3SQ,ENQ1,ENQ2
      REAL A1,A2,A3,XJAC1,XJAC2,XJAC3,AMPLIT
      REAL  PT(4)
      REAL  PR(4)
      REAL  RRR(5)
      REAL PI /3.141592653589793238462643/
      INTEGER ICONT /0/

      REAL XLAM,X,Y,Z
      XLAM(X,Y,Z)=SQRT(ABS((X-Y-Z)**2-4.0*Y*Z))
C AMRO, GAMRO IS ONLY A PARAMETER FOR GETING RIGHT EFFICIENCY
C
C THREE BODY PHASE SPACE NORMALISED AS IN BJORKEN-DRELL
C D**3 P /2E/(2PI)**3 (2PI)**4 DELTA4(SUM P)
      PHSPAC=1./2**17/PI**8
C TAU MOMENTUM
      PT(1)=0.
      PT(2)=0.
      PT(3)=0.
      PT(4)=AMTAU
C
      CALL TDRAND(RRR,5)
      RR=RRR(5)
C
      CALL CHOICE(MNUM,RR,ICHAN,PROB1,PROB2,PROB3,
     $            AMRX,GAMRX,AMRA,GAMRA,AMRB,GAMRB)
      IF     (ICHAN.EQ.1) THEN
        AMP1=AMPB
        AMP2=AMPA
      ELSEIF (ICHAN.EQ.2) THEN
        AMP1=AMPA
        AMP2=AMPB
      ELSE
        AMP1=AMPB
        AMP2=AMPA
      ENDIF
CAM
        RR1=RRR(1)
        AMS1=(AMP1+AMP2+AMP3)**2
        AMS2=(AMTAU-AMNUTA)**2
* PHASE SPACE WITH SAMPLING FOR A1  RESONANCE
        ALP1=ATAN((AMS1-AMRX**2)/AMRX/GAMRX)
        ALP2=ATAN((AMS2-AMRX**2)/AMRX/GAMRX)
        ALP=ALP1+RR1*(ALP2-ALP1)
        AM3SQ =AMRX**2+AMRX*GAMRX*TAN(ALP)
        AM3 =SQRT(AM3SQ)
        PHSPAC=PHSPAC*((AM3SQ-AMRX**2)**2+(AMRX*GAMRX)**2)/(AMRX*GAMRX)
        PHSPAC=PHSPAC*(ALP2-ALP1)
C MASS OF (REAL/VIRTUAL) RHO -
        RR2=RRR(2)
        AMS1=(AMP2+AMP3)**2
        AMS2=(AM3-AMP1)**2
      IF (ICHAN.LE.2) THEN
* PHASE SPACE WITH SAMPLING FOR RHO RESONANCE,
        ALP1=ATAN((AMS1-AMRA**2)/AMRA/GAMRA)
        ALP2=ATAN((AMS2-AMRA**2)/AMRA/GAMRA)
        ALP=ALP1+RR2*(ALP2-ALP1)
        AM2SQ =AMRA**2+AMRA*GAMRA*TAN(ALP)
        AM2 =SQRT(AM2SQ)
C --- THIS PART OF THE JACOBIAN WILL BE RECOVERED LATER ---------------
C     PHSPAC=PHSPAC*(ALP2-ALP1)
C     PHSPAC=PHSPAC*((AM2SQ-AMRA**2)**2+(AMRA*GAMRA)**2)/(AMRA*GAMRA)
C----------------------------------------------------------------------
      ELSE
* FLAT PHASE SPACE;
        AM2SQ=AMS1+   RR2*(AMS2-AMS1)
        AM2 =SQRT(AM2SQ)
        PHF0=(AMS2-AMS1)
      ENDIF
* RHO RESTFRAME, DEFINE PIPL AND PIM1
        ENQ1=(AM2SQ-AMP2**2+AMP3**2)/(2*AM2)
        ENQ2=(AM2SQ+AMP2**2-AMP3**2)/(2*AM2)
        PPI=         ENQ1**2-AMP3**2
        PPPI=SQRT(ABS(ENQ1**2-AMP3**2))
C --- this part of jacobian will be recovered later
        PHF1=(4*PI)*(2*PPPI/AM2)
* PI MINUS MOMENTUM IN RHO REST FRAME
        CALL SPHERA(PPPI,PIPL)
        PIPL(4)=ENQ1
* PI0 1 MOMENTUM IN RHO REST FRAME
        DO 30 I=1,3
 30     PIM1(I)=-PIPL(I)
        PIM1(4)=ENQ2
* A1 REST FRAME, DEFINE PIM2
*       RHO  MOMENTUM
        PR(1)=0
        PR(2)=0
        PR(4)=1./(2*AM3)*(AM3**2+AM2**2-AMP1**2)
        PR(3)= SQRT(ABS(PR(4)**2-AM2**2))
        PPI  =          PR(4)**2-AM2**2
*       PI0 2 MOMENTUM
        PIM2(1)=0
        PIM2(2)=0
        PIM2(4)=1./(2*AM3)*(AM3**2-AM2**2+AMP1**2)
        PIM2(3)=-PR(3)
      PHF2=(4*PI)*(2*PR(3)/AM3)
* OLD PIONS BOOSTED FROM RHO REST FRAME TO A1 REST FRAME
      EXE=(PR(4)+PR(3))/AM2
      CALL BOSTR3(EXE,PIPL,PIPL)
      CALL BOSTR3(EXE,PIM1,PIM1)
      RR3=RRR(3)
      RR4=RRR(4)
CAM   THET =PI*RR3
      THET =ACOS(-1.+2*RR3)
      PHI = 2*PI*RR4
      CALL ROTPOL(THET,PHI,PIPL)
      CALL ROTPOL(THET,PHI,PIM1)
      CALL ROTPOL(THET,PHI,PIM2)
      CALL ROTPOL(THET,PHI,PR)
C
* NOW TO THE TAU REST FRAME, DEFINE A1 AND NEUTRINO MOMENTA
* A1  MOMENTUM
      PAA(1)=0
      PAA(2)=0
      PAA(4)=1./(2*AMTAU)*(AMTAU**2-AMNUTA**2+AM3**2)
      PAA(3)= SQRT(ABS(PAA(4)**2-AM3**2))
      PPI   =          PAA(4)**2-AM3**2
      PHSPAC=PHSPAC*(4*PI)*(2*PAA(3)/AMTAU)
* TAU-NEUTRINO MOMENTUM
      PN(1)=0
      PN(2)=0
      PN(4)=1./(2*AMTAU)*(AMTAU**2+AMNUTA**2-AM3**2)
      PN(3)=-PAA(3)
C HERE WE CORRECT FOR THE JACOBIANS OF THE TWO CHAINS
C ---FIRST CHANNEL ------- PIM1+PIPL
        AMS1=(AMP2+AMP3)**2
        AMS2=(AM3-AMP1)**2
        ALP1=ATAN((AMS1-AMRA**2)/AMRA/GAMRA)
        ALP2=ATAN((AMS2-AMRA**2)/AMRA/GAMRA)
       XPRO =      (PIM1(3)+PIPL(3))**2
     $            +(PIM1(2)+PIPL(2))**2+(PIM1(1)+PIPL(1))**2
       AM2SQ=-XPRO+(PIM1(4)+PIPL(4))**2
C JACOBIAN OF SPEEDING
       FF1   =       ((AM2SQ-AMRA**2)**2+(AMRA*GAMRA)**2)/(AMRA*GAMRA)
       FF1   =FF1     *(ALP2-ALP1)
C LAMBDA OF RHO DECAY
       GG1   =       (4*PI)*(XLAM(AM2SQ,AMP2**2,AMP3**2)/AM2SQ)
C LAMBDA OF A1 DECAY
       GG1   =GG1   *(4*PI)*SQRT(4*XPRO/AM3SQ)
       XJAJE=GG1*(AMS2-AMS1)
C ---SECOND CHANNEL ------ PIM2+PIPL
       AMS1=(AMP1+AMP3)**2
       AMS2=(AM3-AMP2)**2
        ALP1=ATAN((AMS1-AMRB**2)/AMRB/GAMRB)
        ALP2=ATAN((AMS2-AMRB**2)/AMRB/GAMRB)
       XPRO =      (PIM2(3)+PIPL(3))**2
     $            +(PIM2(2)+PIPL(2))**2+(PIM2(1)+PIPL(1))**2
       AM2SQ=-XPRO+(PIM2(4)+PIPL(4))**2
       FF2   =       ((AM2SQ-AMRB**2)**2+(AMRB*GAMRB)**2)/(AMRB*GAMRB)
       FF2   =FF2     *(ALP2-ALP1)
       GG2   =       (4*PI)*(XLAM(AM2SQ,AMP1**2,AMP3**2)/AM2SQ)
       GG2   =GG2   *(4*PI)*SQRT(4*XPRO/AM3SQ)
       XJADW=GG2*(AMS2-AMS1)
C
       A1=0.0
       A2=0.0
       A3=0.0
       XJAC1=FF1*GG1
       XJAC2=FF2*GG2
       IF (ICHAN.EQ.2) THEN
         XJAC3=XJADW
       ELSE
         XJAC3=XJAJE
       ENDIF
       IF (XJAC1.NE.0.0) A1=PROB1/XJAC1
       IF (XJAC2.NE.0.0) A2=PROB2/XJAC2
       IF (XJAC3.NE.0.0) A3=PROB3/XJAC3
C
       IF (A1+A2+A3.NE.0.0) THEN
         PHSPAC=PHSPAC/(A1+A2+A3)
       ELSE
         PHSPAC=0.0
       ENDIF
       IF(ICHAN.EQ.2) THEN
        DO 70 I=1,4
        X=PIM1(I)
        PIM1(I)=PIM2(I)
 70     PIM2(I)=X
       ENDIF
* ALL PIONS BOOSTED FROM A1  REST FRAME TO TAU REST FRAME
* Z-AXIS ANTIPARALLEL TO NEUTRINO MOMENTUM
      EXE=(PAA(4)+PAA(3))/AM3
      CALL BOSTR3(EXE,PIPL,PIPL)
      CALL BOSTR3(EXE,PIM1,PIM1)
      CALL BOSTR3(EXE,PIM2,PIM2)
      CALL BOSTR3(EXE,PR,PR)
C PARTIAL WIDTH CONSISTS OF PHASE SPACE AND AMPLITUDE
      IF (MNUM.EQ.8) THEN
        CALL DAMPOG(PT,PN,PIM1,PIM2,PIPL,AMPLIT,HV)
C      ELSEIF (MNUM.EQ.0) THEN
C        CALL DAMPAA(PT,PN,PIM1,PIM2,PIPL,AMPLIT,HV)
      ELSE
        CALL DAMPPK(MNUM,PT,PN,PIM1,PIM2,PIPL,AMPLIT,HV)
      ENDIF
      IF (KEYT.EQ.1.OR.KEYT.EQ.2) THEN
C THE STATISTICAL FACTOR FOR IDENTICAL PI'S IS CANCELLED WITH
C TWO, FOR TWO MODES OF A1 DECAY NAMELLY PI+PI-PI- AND PI-PI0PI0
        PHSPAC=PHSPAC*2.0
        PHSPAC=PHSPAC/2.
      ENDIF
      DGAMT=1/(2.*AMTAU)*AMPLIT*PHSPAC
      END
      SUBROUTINE DRCMU(DGAMT,HV,PH,PAA,XA,QP,XN,IELMU)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      DOUBLE PRECISION DGAMT,HV(4),PH(4),PAA(4),XA(4),QP(4),XN(4)
      INTEGER IELMU
C ----------------------------------------------------------------------
* IT SIMULATES E,MU CHANNELS OF TAU  DECAY IN ITS REST FRAME WITH
* QED ORDER ALPHA CORRECTIONS
C ----------------------------------------------------------------------
      INTEGER I
      DOUBLE PRECISION PHSPAC,AMTAX,AMU,PRHARD,PRSOFT
      DOUBLE PRECISION RR1,RR2,RR3,RR4,RR5,AMS1,AMS2,XK1,XL1,XL0
      DOUBLE PRECISION AM1,AM2,AM3,AM1SQ,AM2SQ,AM3SQ,ENQ1,ENQ2
      DOUBLE PRECISION PPI,PPPI,EXE,EPS,ETA,CTHET,THET,XK,PHI,AMPLIT
      DOUBLE PRECISION  PT(4)
      DOUBLE PRECISION  PR(4)
      REAL RRR(6)
      LOGICAL IHARD
      DOUBLE PRECISION PI /3.141592653589793238462643D0/

C AMRO, GAMRO IS ONLY A PARAMETER FOR GETING HIGHT EFFICIENCY
C
C THREE BODY PHASE SPACE NORMALISED AS IN BJORKEN-DRELL
C D**3 P /2E/(2PI)**3 (2PI)**4 DELTA4(SUM P)
      PHSPAC=1./2**17/PI**8
      AMTAX=AMTAU
C TAU MOMENTUM
      PT(1)=0.D0
      PT(2)=0.D0
      PT(3)=0.D0
      PT(4)=AMTAX
C
      CALL TDRAND(RRR,6)
C
        IF (IELMU.EQ.1) THEN
          AMU=AMEL
        ELSE
          AMU=AMMU
        ENDIF
C
        PRHARD=0.30D0
        IF (  ITDKRC.EQ.0) PRHARD=0D0
        PRSOFT=1.-PRHARD
         IF(PRSOFT.LT.0.1) THEN
           PRINT *, 'ERROR IN DRCMU; PRSOFT=',PRSOFT
           STOP
         ENDIF
C
        RR5=RRR(5)
        IHARD=(RR5.GT.PRSOFT)
       IF (IHARD) THEN
C                     TAU DECAY TO `TAU+photon'
          RR1=RRR(1)
          AMS1=(AMU+AMNUTA)**2
          AMS2=(AMTAX)**2
          XK1=1-AMS1/AMS2
          XL1=LOG(XK1/2/XK0DEC)
          XL0=LOG(2*XK0DEC)
          XK=EXP(XL1*RR1+XL0)
          AM3SQ=(1-XK)*AMS2
          AM3 =SQRT(AM3SQ)
          PHSPAC=PHSPAC*AMS2*XL1*XK
          PHSPAC=PHSPAC/PRHARD
        ELSE
          AM3=AMTAX
          PHSPAC=PHSPAC*2**6*PI**3
          PHSPAC=PHSPAC/PRSOFT
        ENDIF
C MASS OF NEUTRINA SYSTEM
        RR2=RRR(2)
        AMS1=(AMNUTA)**2
        AMS2=(AM3-AMU)**2
CAM
CAM
* FLAT PHASE SPACE;
      AM2SQ=AMS1+   RR2*(AMS2-AMS1)
      AM2 =SQRT(AM2SQ)
      PHSPAC=PHSPAC*(AMS2-AMS1)
* NEUTRINA REST FRAME, DEFINE XN AND XA
        ENQ1=(AM2SQ+AMNUTA**2)/(2*AM2)
        ENQ2=(AM2SQ-AMNUTA**2)/(2*AM2)
        PPI=         ENQ1**2-AMNUTA**2
        PPPI=SQRT(ABS(ENQ1**2-AMNUTA**2))
        PHSPAC=PHSPAC*(4*PI)*(2*PPPI/AM2)
* NU TAU IN NUNU REST FRAME
        CALL SPHERD(PPPI,XN)
        XN(4)=ENQ1
* NU LIGHT IN NUNU REST FRAME
        DO 30 I=1,3
 30     XA(I)=-XN(I)
        XA(4)=ENQ2
* TAU' REST FRAME, DEFINE QP (muon
*       NUNU  MOMENTUM
        PR(1)=0
        PR(2)=0
        PR(4)=1.D0/(2*AM3)*(AM3**2+AM2**2-AMU**2)
        PR(3)= SQRT(ABS(PR(4)**2-AM2**2))
        PPI  =          PR(4)**2-AM2**2
*       MUON MOMENTUM
        QP(1)=0
        QP(2)=0
        QP(4)=1.D0/(2*AM3)*(AM3**2-AM2**2+AMU**2)
        QP(3)=-PR(3)
      PHSPAC=PHSPAC*(4*PI)*(2*PR(3)/AM3)
* NEUTRINA BOOSTED FROM THEIR FRAME TO TAU' REST FRAME
      EXE=(PR(4)+PR(3))/AM2
      CALL BOSTD3(EXE,XN,XN)
      CALL BOSTD3(EXE,XA,XA)
      RR3=RRR(3)
      RR4=RRR(4)
      IF (IHARD) THEN
        EPS=4*(AMU/AMTAX)**2
        XL1=LOG((2+EPS)/EPS)
        XL0=LOG(EPS)
        ETA  =EXP(XL1*RR3+XL0)
        CTHET=1+EPS-ETA
        THET =ACOS(CTHET)
        PHSPAC=PHSPAC*XL1/2*ETA
        PHI = 2*PI*RR4
        CALL ROTPOX(THET,PHI,XN)
        CALL ROTPOX(THET,PHI,XA)
        CALL ROTPOX(THET,PHI,QP)
        CALL ROTPOX(THET,PHI,PR)
C
* NOW TO THE TAU REST FRAME, DEFINE TAU' AND GAMMA MOMENTA
* tau'  MOMENTUM
        PAA(1)=0
        PAA(2)=0
        PAA(4)=1/(2*AMTAX)*(AMTAX**2+AM3**2)
        PAA(3)= SQRT(ABS(PAA(4)**2-AM3**2))
        PPI   =          PAA(4)**2-AM3**2
        PHSPAC=PHSPAC*(4*PI)*(2*PAA(3)/AMTAX)
* GAMMA MOMENTUM
        PH(1)=0
        PH(2)=0
        PH(4)=PAA(3)
        PH(3)=-PAA(3)
* ALL MOMENTA BOOSTED FROM TAU' REST FRAME TO TAU REST FRAME
* Z-AXIS ANTIPARALLEL TO PHOTON MOMENTUM
        EXE=(PAA(4)+PAA(3))/AM3
        CALL BOSTD3(EXE,XN,XN)
        CALL BOSTD3(EXE,XA,XA)
        CALL BOSTD3(EXE,QP,QP)
        CALL BOSTD3(EXE,PR,PR)
      ELSE
        THET =ACOS(-1.+2*RR3)
        PHI = 2*PI*RR4
        CALL ROTPOX(THET,PHI,XN)
        CALL ROTPOX(THET,PHI,XA)
        CALL ROTPOX(THET,PHI,QP)
        CALL ROTPOX(THET,PHI,PR)
C
* NOW TO THE TAU REST FRAME, DEFINE TAU' AND GAMMA MOMENTA
* tau'  MOMENTUM
        PAA(1)=0
        PAA(2)=0
        PAA(4)=AMTAX
        PAA(3)=0
* GAMMA MOMENTUM
        PH(1)=0
        PH(2)=0
        PH(4)=0
        PH(3)=0
      ENDIF
C PARTIAL WIDTH CONSISTS OF PHASE SPACE AND AMPLITUDE
      CALL DAMPRY(ITDKRC,XK0DEC,PH,XA,QP,XN,AMPLIT,HV)
      DGAMT=1/(2.*AMTAX)*AMPLIT*PHSPAC
      END
      SUBROUTINE DWLUAA(KTO,ISGN,PNU,PAA,PIM1,PIM2,PIPL,JAA)
      IMPLICIT NONE
      INTEGER KTO,ISGN
      REAL PNU(4),PAA(4),PIM1(4),PIM2(4),PIPL(4)
      INTEGER JAA
C ----------------------------------------------------------------------
C Lorentz transformation to CMsystem and
C Updating of HEPEVT record
C
C ISGN = 1/-1 for tau-/tau+
C JAA  = 1 (2) FOR A_1- DECAY TO PI+ 2PI- (PI- 2PI0)
C
C     called by : DEXAY,(DEKAY1,DEKAY2)
C ----------------------------------------------------------------------
      INTEGER NPS
      REAL AM
C
C
C position of decaying particle:
      IF(KTO.EQ. 1) THEN
        NPS=3
      ELSE
        NPS=4
      ENDIF
C
C tau neutrino (nu_tau is 16)
      CALL TRALO4(KTO,PNU,PNU,AM)
      CALL FILHEP(0,1,16*ISGN,NPS,NPS,0,0,PNU,AM,.TRUE.)
C
C charged a_1 meson (a_1+ is 20213)
      CALL TRALO4(KTO,PAA,PAA,AM)
      CALL FILHEP(0,1,-20213*ISGN,NPS,NPS,0,0,PAA,AM,.TRUE.)
C
C two possible decays of the charged a1 meson
      IF(JAA.EQ.1) THEN
C
C A1  --> PI+ PI-  PI- (or charged conjugate)
C
C pi minus (or c.c.) (pi+ is 211)
        CALL TRALO4(KTO,PIM2,PIM2,AM)
        CALL FILHEP(0,1,-211*ISGN,-1,-1,0,0,PIM2,AM,.TRUE.)
C
C pi minus (or c.c.) (pi+ is 211)
        CALL TRALO4(KTO,PIM1,PIM1,AM)
        CALL FILHEP(0,1,-211*ISGN,-2,-2,0,0,PIM1,AM,.TRUE.)
C
C pi plus (or c.c.) (pi+ is 211)
        CALL TRALO4(KTO,PIPL,PIPL,AM)
        CALL FILHEP(0,1, 211*ISGN,-3,-3,0,0,PIPL,AM,.TRUE.)
C
      ELSE IF (JAA.EQ.2) THEN
C
C A1  --> PI- PI0  PI0 (or charged conjugate)
C
C pi zero (pi0 is 111)
        CALL TRALO4(KTO,PIM2,PIM2,AM)
        CALL FILHEP(0,1,111,-1,-1,0,0,PIM2,AM,.TRUE.)
C
C pi zero (pi0 is 111)
        CALL TRALO4(KTO,PIM1,PIM1,AM)
        CALL FILHEP(0,1,111,-2,-2,0,0,PIM1,AM,.TRUE.)
C
C pi minus (or c.c.) (pi+ is 211)
        CALL TRALO4(KTO,PIPL,PIPL,AM)
        CALL FILHEP(0,1,-211*ISGN,-3,-3,0,0,PIPL,AM,.TRUE.)
C
      ENDIF
C
      RETURN
      END
      SUBROUTINE DWLUEL(KTO,ISGN,PNU,PWB,PEL,PNE)
      IMPLICIT NONE
      INTEGER KTO,ISGN
      REAL PNU(4),PWB(4),PEL(4),PNE(4)
C ----------------------------------------------------------------------
C Lorentz transformation to CMsystem and
C Updating of HEPEVT record
C
C ISGN = 1/-1 for tau-/tau+
C
C     called by : DEXAY,(DEKAY1,DEKAY2)
C ----------------------------------------------------------------------
      INTEGER NPS
      REAL AM
C
C
C position of decaying particle:
      IF(KTO.EQ. 1) THEN
        NPS=3
      ELSE
        NPS=4
      ENDIF
C
C tau neutrino (nu_tau is 16)
      CALL TRALO4(KTO,PNU,PNU,AM)
      CALL FILHEP(0,1,16*ISGN,NPS,NPS,0,0,PNU,AM,.TRUE.)
C
C W boson (W+ is 24)
      CALL TRALO4(KTO,PWB,PWB,AM)
C     CALL FILHEP(0,2,-24*ISGN,NPS,NPS,0,0,PWB,AM,.TRUE.)
C
C electron (e- is 11)
      CALL TRALO4(KTO,PEL,PEL,AM)
      CALL FILHEP(0,1,11*ISGN,NPS,NPS,0,0,PEL,AM,.FALSE.)
C
C anti electron neutrino (nu_e is 12)
      CALL TRALO4(KTO,PNE,PNE,AM)
      CALL FILHEP(0,1,-12*ISGN,NPS,NPS,0,0,PNE,AM,.TRUE.)
C
      RETURN
      END
      SUBROUTINE DWLUKK (KTO,ISGN,PKK,PNU)
      IMPLICIT NONE
      INTEGER KTO,ISGN
      REAL PKK(4),PNU(4)
C ----------------------------------------------------------------------
C Lorentz transformation to CMsystem and
C Updating of HEPEVT record
C
C ISGN = 1/-1 for tau-/tau+
C
C ----------------------------------------------------------------------
      INTEGER NPS
      REAL AM
C
C
C position of decaying particle
      IF (KTO.EQ.1) THEN
        NPS=3
      ELSE
        NPS=4
      ENDIF
C
C tau neutrino (nu_tau is 16)
      CALL TRALO4 (KTO,PNU,PNU,AM)
      CALL FILHEP(0,1,16*ISGN,NPS,NPS,0,0,PNU,AM,.TRUE.)
C
C K meson (K+ is 321)
      CALL TRALO4 (KTO,PKK,PKK,AM)
      CALL FILHEP(0,1,-321*ISGN,NPS,NPS,0,0,PKK,AM,.TRUE.)
C
      RETURN
      END
      SUBROUTINE DWLUKS(KTO,ISGN,PNU,PKS,PKK,PPI,JKST)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER KTO,ISGN
      REAL  PNU(4),PKS(4),PKK(4),PPI(4)
      INTEGER JKST
C ----------------------------------------------------------------------
C Lorentz transformation to CMsystem and
C Updating of HEPEVT record
C
C ISGN = 1/-1 for tau-/tau+
C JKST=10 (20) corresponds to K0B pi- (K- pi0) decay
C
C ----------------------------------------------------------------------
      INTEGER NPS,K0TYPE
      REAL BRAN,XIO,AM
C
C
C position of decaying particle
      IF(KTO.EQ. 1) THEN
        NPS=3
      ELSE
        NPS=4
      ENDIF
C
C tau neutrino (nu_tau is 16)
      CALL TRALO4(KTO,PNU,PNU,AM)
      CALL FILHEP(0,1,16*ISGN,NPS,NPS,0,0,PNU,AM,.TRUE.)
C
C charged K* meson (K*+ is 323)
      CALL TRALO4(KTO,PKS,PKS,AM)
      CALL FILHEP(0,1,-323*ISGN,NPS,NPS,0,0,PKS,AM,.TRUE.)
C
C two possible decay modes of charged K*
      IF(JKST.EQ.10) THEN
C
C K*- --> pi- K0B (or charged conjugate)
C
C charged pi meson  (pi+ is 211)
        CALL TRALO4(KTO,PPI,PPI,AM)
        CALL FILHEP(0,1,-211*ISGN,-1,-1,0,0,PPI,AM,.TRUE.)
C
        BRAN=BRK0B
        IF (ISGN.EQ.-1) BRAN=BRK0
C K0 --> K0_long (is 130) / K0_short (is 310) = 1/1
        CALL TDRAND(XIO,1)
        IF(XIO.GT.BRAN) THEN
          K0TYPE = 130
        ELSE
          K0TYPE = 310
        ENDIF
C
        CALL TRALO4(KTO,PKK,PKK,AM)
        CALL FILHEP(0,1,K0TYPE,-2,-2,0,0,PKK,AM,.TRUE.)
C
      ELSE IF(JKST.EQ.20) THEN
C
C K*- --> pi0 K-
C
C pi zero (pi0 is 111)
        CALL TRALO4(KTO,PPI,PPI,AM)
        CALL FILHEP(0,1,111,-1,-1,0,0,PPI,AM,.TRUE.)
C
C charged K meson (K+ is 321)
        CALL TRALO4(KTO,PKK,PKK,AM)
        CALL FILHEP(0,1,-321*ISGN,-2,-2,0,0,PKK,AM,.TRUE.)
C
      ENDIF
C
      RETURN
      END
      SUBROUTINE DWLUMU(KTO,ISGN,PNU,PWB,PMU,PNM)
      IMPLICIT NONE
      INTEGER KTO,ISGN
      REAL PNU(4),PWB(4),PMU(4),PNM(4)
C ----------------------------------------------------------------------
C Lorentz transformation to CMsystem and
C Updating of HEPEVT record
C
C ISGN = 1/-1 for tau-/tau+
C
C     called by : DEXAY,(DEKAY1,DEKAY2)
C ----------------------------------------------------------------------
      INTEGER NPS
      REAL AM
C
C
C position of decaying particle:
      IF(KTO.EQ. 1) THEN
        NPS=3
      ELSE
        NPS=4
      ENDIF
C
C tau neutrino (nu_tau is 16)
      CALL TRALO4(KTO,PNU,PNU,AM)
      CALL FILHEP(0,1,16*ISGN,NPS,NPS,0,0,PNU,AM,.TRUE.)
C
C W boson (W+ is 24)
      CALL TRALO4(KTO,PWB,PWB,AM)
C     CALL FILHEP(0,2,-24*ISGN,NPS,NPS,0,0,PWB,AM,.TRUE.)
C
C muon (mu- is 13)
      CALL TRALO4(KTO,PMU,PMU,AM)
      CALL FILHEP(0,1,13*ISGN,NPS,NPS,0,0,PMU,AM,.FALSE.)
C
C anti muon neutrino (nu_mu is 14)
      CALL TRALO4(KTO,PNM,PNM,AM)
      CALL FILHEP(0,1,-14*ISGN,NPS,NPS,0,0,PNM,AM,.TRUE.)
C
      RETURN
      END
      SUBROUTINE DWLNEW(KTO,ISGN,PNU,PWB,PNPI,MODE)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER KTO,ISGN
      REAL PNU(4),PWB(4),PNPI(4,9)
      INTEGER MODE
C ----------------------------------------------------------------------
C Lorentz transformation to CMsystem and
C Updating of HEPEVT record
C
C ISGN = 1/-1 for tau-/tau+
C
C     called by : DEXAY,(DEKAY1,DEKAY2)
C ----------------------------------------------------------------------
      INTEGER I,J,NPS,JNPI,ND,KFPI
      REAL AM
C
      REAL  PPI(4)

      INTEGER LUNPIK
      EXTERNAL LUNPIK
C
      JNPI=MODE-7
C position of decaying particle
      IF(KTO.EQ. 1) THEN
        NPS=3
      ELSE
        NPS=4
      ENDIF
C
C tau neutrino (nu_tau is 16)
      CALL TRALO4(KTO,PNU,PNU,AM)
      CALL FILHEP(0,1,16*ISGN,NPS,NPS,0,0,PNU,AM,.TRUE.)
C
C W boson (W+ is 24)
      CALL TRALO4(KTO,PWB,PWB,AM)
      CALL FILHEP(0,1,-24*ISGN,NPS,NPS,0,0,PWB,AM,.TRUE.)
C
C multi pi mode JNPI
C
C get multiplicity of mode JNPI
      ND=MULPIK(JNPI)
      DO I=1,ND
        KFPI=LUNPIK(IDFFIN(I,JNPI),-ISGN)
C for charged conjugate case, change charged pions only
C        IF(KFPI.NE.111)KFPI=KFPI*ISGN
        DO J=1,4
          PPI(J)=PNPI(J,I)
        END DO
        CALL TRALO4(KTO,PPI,PPI,AM)
        CALL FILHEP(0,1,KFPI,-I,-I,0,0,PPI,AM,.TRUE.)
      END DO
C
      RETURN
      END
      SUBROUTINE DWLUPH(KTO,PHOT)
      IMPLICIT NONE
      INTEGER KTO
      REAL PHOT(4)
C---------------------------------------------------------------------
C Lorentz transformation to CMsystem and
C Updating of HEPEVT record
C
C     called by : DEXAY1,(DEKAY1,DEKAY2)
C
C used when radiative corrections in decays are generated
C---------------------------------------------------------------------
      INTEGER NPS,KTOS
      REAL AM
C
C
C check energy
      IF (PHOT(4).LE.0.0) RETURN
C
C position of decaying particle:
      IF((KTO.EQ. 1).OR.(KTO.EQ.11)) THEN
        NPS=3
      ELSE
        NPS=4
      ENDIF
C
      KTOS=KTO
      IF(KTOS.GT.10) KTOS=KTOS-10
C boost and append photon (gamma is 22)
      CALL TRALO4(KTOS,PHOT,PHOT,AM)
      CALL FILHEP(0,1,22,NPS,NPS,0,0,PHOT,0.0,.TRUE.)
C
      RETURN
      END
 
      SUBROUTINE DWLUPI(KTO,ISGN,PPI,PNU)
      IMPLICIT NONE
      INTEGER KTO,ISGN
      REAL PPI(4),PNU(4)
C ----------------------------------------------------------------------
C Lorentz transformation to CMsystem and
C Updating of HEPEVT record
C
C ISGN = 1/-1 for tau-/tau+
C
C     called by : DEXAY,(DEKAY1,DEKAY2)
C ----------------------------------------------------------------------
      INTEGER NPS
      REAL AM
C
C
C position of decaying particle:
      IF(KTO.EQ. 1) THEN
        NPS=3
      ELSE
        NPS=4
      ENDIF
C
C tau neutrino (nu_tau is 16)
      CALL TRALO4(KTO,PNU,PNU,AM)
      CALL FILHEP(0,1,16*ISGN,NPS,NPS,0,0,PNU,AM,.TRUE.)
C
C charged pi meson (pi+ is 211)
      CALL TRALO4(KTO,PPI,PPI,AM)
      CALL FILHEP(0,1,-211*ISGN,NPS,NPS,0,0,PPI,AM,.TRUE.)
C
      RETURN
      END
      SUBROUTINE DWLURO(KTO,ISGN,PNU,PRHO,PIC,PIZ)
      IMPLICIT NONE
      INTEGER KTO,ISGN
      REAL  PNU(4),PRHO(4),PIC(4),PIZ(4)
C ----------------------------------------------------------------------
C Lorentz transformation to CMsystem and
C Updating of HEPEVT record
C
C ISGN = 1/-1 for tau-/tau+
C
C     called by : DEXAY,(DEKAY1,DEKAY2)
C ----------------------------------------------------------------------
      INTEGER NPS
      REAL AM
C
C
C position of decaying particle:
      IF(KTO.EQ. 1) THEN
        NPS=3
      ELSE
        NPS=4
      ENDIF
C
C tau neutrino (nu_tau is 16)
      CALL TRALO4(KTO,PNU,PNU,AM)
      CALL FILHEP(0,1,16*ISGN,NPS,NPS,0,0,PNU,AM,.TRUE.)
C
C charged rho meson (rho+ is 213)
      CALL TRALO4(KTO,PRHO,PRHO,AM)
      CALL FILHEP(0,2,-213*ISGN,NPS,NPS,0,0,PRHO,AM,.TRUE.)
C
C charged pi meson (pi+ is 211)
      CALL TRALO4(KTO,PIC,PIC,AM)
      CALL FILHEP(0,1,-211*ISGN,-1,-1,0,0,PIC,AM,.TRUE.)
C
C pi0 meson (pi0 is 111)
      CALL TRALO4(KTO,PIZ,PIZ,AM)
      CALL FILHEP(0,1,111,-2,-2,0,0,PIZ,AM,.TRUE.)
C
      RETURN
      END
      SUBROUTINE DWRPH(KTO,PHX)
      IMPLICIT NONE
      INTEGER KTO
      REAL PHX(4)
C
C -------------------------
C
      INTEGER I,K
      REAL QHOT(4)
C
      DO  9 K=1,4
      QHOT(K)  =0.0
  9   CONTINUE
C CASE OF TAU RADIATIVE DECAYS.
C FILLING OF THE LUND COMMON BLOCK.
        DO 1002 I=1,4
 1002   QHOT(I)=PHX(I)
        IF (QHOT(4).GT.1.E-5) CALL DWLUPH(KTO,QHOT)
        RETURN
      END
      SUBROUTINE FILHEP(N,IST,ID,JMO1,JMO2,JDA1,JDA2,P4,PINV,PHFLAG)
      IMPLICIT NONE
      INTEGER N,IST,ID,JMO1,JMO2,JDA1,JDA2
      REAL P4(4),PINV
      LOGICAL PHFLAG
C ----------------------------------------------------------------------
C this subroutine fills one entry into the HEPEVT common
C and updates the information for affected mother entries
C
C written by Martin W. Gruenewald (91/01/28)
C
C     called by : ZTOHEP,BTOHEP,DWLUxy
C ----------------------------------------------------------------------
C
      INTEGER NMXHEP
      PARAMETER (NMXHEP=2000)
      INTEGER NEVHEP,NHEP,ISTHEP,IDHEP,JMOHEP,JDAHEP
      DOUBLE PRECISION PHEP,VHEP
      COMMON/TDEVNT/NEVHEP,NHEP,ISTHEP(NMXHEP),IDHEP(NMXHEP),
     &JMOHEP(2,NMXHEP),JDAHEP(2,NMXHEP),PHEP(5,NMXHEP),VHEP(4,NMXHEP)
      SAVE  /TDEVNT/
      COMMON/PHOQED/QEDRAD(NMXHEP)
      LOGICAL QEDRAD
      SAVE /PHOQED/

      INTEGER I,IP,IHEP
C
C check address mode
      IF (N.EQ.0) THEN
C
C append mode
        IHEP=NHEP+1
      ELSE IF (N.GT.0) THEN
C
C absolute position
        IHEP=N
      ELSE
C
C relative position
        IHEP=NHEP+N
      END IF
C
C check on IHEP
      IF ((IHEP.LE.0).OR.(IHEP.GT.NMXHEP)) RETURN
C
C add entry
      NHEP=IHEP
      ISTHEP(IHEP)=IST
      IDHEP(IHEP)=ID
      JMOHEP(1,IHEP)=JMO1
      IF(JMO1.LT.0)JMOHEP(1,IHEP)=JMOHEP(1,IHEP)+IHEP
      JMOHEP(2,IHEP)=JMO2
      IF(JMO2.LT.0)JMOHEP(2,IHEP)=JMOHEP(2,IHEP)+IHEP
      JDAHEP(1,IHEP)=JDA1
      JDAHEP(2,IHEP)=JDA2
C
      DO I=1,4
        PHEP(I,IHEP)=P4(I)
C
C KORAL-B and KORAL-Z do not provide vertex and/or lifetime informations
        VHEP(I,IHEP)=0.0
      END DO
      PHEP(5,IHEP)=PINV
C FLAG FOR PHOTOS...
      QEDRAD(IHEP)=PHFLAG
C
C update process:
      DO IP=JMOHEP(1,IHEP),JMOHEP(2,IHEP)
        IF(IP.GT.0)THEN
C
C if there is a daughter at IHEP, mother entry at IP has decayed
          IF(ISTHEP(IP).EQ.1)ISTHEP(IP)=2
C
C and daughter pointers of mother entry must be updated
          IF(JDAHEP(1,IP).EQ.0)THEN
            JDAHEP(1,IP)=IHEP
            JDAHEP(2,IP)=IHEP
          ELSE
            JDAHEP(2,IP)=MAX(IHEP,JDAHEP(2,IP))
          END IF
        END IF
      END DO
C
      RETURN
      END
 
      COMPLEX FUNCTION FPIK(W)
      IMPLICIT NONE
C **********************************************************
C     PION FORM FACTOR
C **********************************************************
      COMPLEX BWIG
      REAL S,W
      EXTERNAL BWIG

      REAL PI,PIM,ROM,ROG,ROM1,ROG1,BETA1
      PARAMETER (PI=3.141592654)
      PARAMETER (PIM=0.140)
      PARAMETER (ROM=0.773)
      PARAMETER (ROG=0.145)
      PARAMETER (ROM1=1.370)
      PARAMETER (ROG1=0.510)
      PARAMETER (BETA1=-0.145)
C -----------------------------------------------
      S=W**2
      FPIK= (BWIG(S,ROM,ROG)+BETA1*BWIG(S,ROM1,ROG1))
     & /(1+BETA1)
      RETURN
      END
      REAL FUNCTION FPIRHO(W)
      IMPLICIT NONE
C **********************************************************
C     SQUARE OF PION FORM FACTOR
C **********************************************************
      REAL W
      COMPLEX FPIK
      FPIRHO=CABS(FPIK(W))**2
      END
      REAL FUNCTION FPIRK(W)  
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
C ----------------------------------------------------------            
c     square of pion form factor                                        
C ----------------------------------------------------------            
      REAL W
      COMPLEX FPIKM                                                     
      FPIRK=CABS(FPIKM(W,AMK,AMKZ))**2                                  
      END                                                               
      REAL FUNCTION GFUN(QKWA)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL QKWA
C ****************************************************************
C     G-FUNCTION USED TO INRODUCE ENERGY DEPENDENCE IN A1 WIDTH
C ****************************************************************
C
       IF (QKWA.LT.(AMRO+AMPI)**2) THEN
          GFUN=4.1*(QKWA-9*AMPIZ**2)**3
     $        *(1.-3.3*(QKWA-9*AMPIZ**2)+5.8*(QKWA-9*AMPIZ**2)**2)
       ELSE
          GFUN=QKWA*(1.623+10.38/QKWA-9.32/QKWA**2+0.65/QKWA**3)
       ENDIF
      END
      SUBROUTINE JAKER(JAK)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
C     *********************
C
C **********************************************************************
C                                                                      *
C           *********TAUOLA LIBRARY: VERSION 2.5 ********              *
C           **************JUNE     1994******************              *
C           **      AUTHORS: S.JADACH, Z.WAS        *****              *
C           **  R. DECKER, M. JEZABEK, J.H.KUEHN,   *****              *
C           ********AVAILABLE FROM: WASM AT CERNVM ******              *
C           *******PUBLISHED IN COMP. PHYS. COMM.********              *
C           *** PREPRINT CERN-TH-5856 SEPTEMBER 1990 ****              *
C           *** PREPRINT CERN-TH-6195 OCTOBER   1991 ****              *
C           *** PREPRINT CERN-TH-6793 NOVEMBER  1992 ****              *
C **********************************************************************
C
C ----------------------------------------------------------------------
c SUBROUTINE JAKER,
C CHOOSES DECAY MODE ACCORDING TO LIST OF BRANCHING RATIOS
C JAK=1 ELECTRON MODE
C JAK=2 MUON MODE
C JAK=3 PION MODE
C JAK=4 RHO  MODE
C JAK=5 A1   MODE
C JAK=6 K    MODE
C JAK=7 K*   MODE
C JAK=8 nPI  MODE
C
C     called by : DEXAY
C ----------------------------------------------------------------------
      INTEGER I,JI,JAK
      REAL SUM,RRR
C      REAL   CUMUL(20)
      REAL   CUMUL(30)
C
      IF(NCHAN.LE.0.OR.NCHAN.GT.30) GOTO 902
      CALL TDRAND(RRR,1)
      SUM=0
      DO 20 I=1,NCHAN
      SUM=SUM+GAMPRT(I)
  20  CUMUL(I)=SUM
      DO 25 I=NCHAN,1,-1
      IF(RRR.LT.CUMUL(I)/CUMUL(NCHAN)) JI=I
  25  CONTINUE
      JAK=JLIST(JI)
      RETURN
 902  PRINT 9020
 9020 FORMAT(' ----- JAKER: WRONG NCHAN')
      STOP
      END
      SUBROUTINE PROD5(P1,P2,P3,PIA)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL P1(4),P2(4),P3(4),PIA(4)
C ----------------------------------------------------------------------
C external product of P1, P2, P3 4-momenta.
C SIGN is chosen +/- for decay of TAU +/- respectively
C     called by : DAMPAA, CLNUT
C ----------------------------------------------------------------------
      INTEGER I,J
      REAL SIGN

      REAL DET2
      DET2(I,J)=P1(I)*P2(J)-P2(I)*P1(J)
* -----------------------------------
      IF     (KTOM.EQ.1.OR.KTOM.EQ.-1) THEN
        SIGN= IDFF/ABS(IDFF)
      ELSEIF (KTOM.EQ.2) THEN
        SIGN=-IDFF/ABS(IDFF)
      ELSE
        PRINT *, 'STOP IN PROD5: KTOM=',KTOM
        STOP
      ENDIF
C
C EPSILON( p1(1), p2(2), p3(3), (4) ) = 1
C
      PIA(1)= -P3(3)*DET2(2,4)+P3(4)*DET2(2,3)+P3(2)*DET2(3,4)
      PIA(2)= -P3(4)*DET2(1,3)+P3(3)*DET2(1,4)-P3(1)*DET2(3,4)
      PIA(3)=  P3(4)*DET2(1,2)-P3(2)*DET2(1,4)+P3(1)*DET2(2,4)
      PIA(4)=  P3(3)*DET2(1,2)-P3(2)*DET2(1,3)+P3(1)*DET2(2,3)
C ALL FOUR INDICES ARE UP SO  PIA(3) AND PIA(4) HAVE SAME SIGN
      DO 20 I=1,4
  20  PIA(I)=PIA(I)*SIGN
      END
 
      SUBROUTINE RESLU
      IMPLICIT NONE
C     ****************
C INITIALIZE LUND COMMON
      INTEGER NMXHEP
      PARAMETER (NMXHEP=2000)
      INTEGER NEVHEP,NHEP,ISTHEP,IDHEP,JMOHEP,JDAHEP
      DOUBLE PRECISION PHEP,VHEP
      COMMON/TDEVNT/NEVHEP,NHEP,ISTHEP(NMXHEP),IDHEP(NMXHEP),
     &JMOHEP(2,NMXHEP),JDAHEP(2,NMXHEP),PHEP(5,NMXHEP),VHEP(4,NMXHEP)
      SAVE  /TDEVNT/
      NHEP=0
      END
      SUBROUTINE ROTOD1(PH1,PVEC,QVEC)
      IMPLICIT NONE
      DOUBLE PRECISION PH1,PVEC(4),QVEC(4)
C ----------------------------------------------------------------------
C
C     USED BY : KORALZ
C ----------------------------------------------------------------------
      INTEGER I
      DOUBLE PRECISION PHI,CS,SN
      DOUBLE PRECISION RVEC(4)
C
      PHI=PH1
      CS=COS(PHI)
      SN=SIN(PHI)
      DO 10 I=1,4
  10  RVEC(I)=PVEC(I)
      QVEC(1)=RVEC(1)
      QVEC(2)= CS*RVEC(2)-SN*RVEC(3)
      QVEC(3)= SN*RVEC(2)+CS*RVEC(3)
      QVEC(4)=RVEC(4)
      RETURN
      END
      SUBROUTINE ROTOD2(PH1,PVEC,QVEC)
      IMPLICIT NONE
      DOUBLE PRECISION PH1,PVEC(4),QVEC(4)
C ----------------------------------------------------------------------
C
C     USED BY : KORALZ RADKOR
C ----------------------------------------------------------------------
      INTEGER I
      DOUBLE PRECISION PHI,CS,SN
      DOUBLE PRECISION RVEC(4)
C
      PHI=PH1
      CS=COS(PHI)
      SN=SIN(PHI)
      DO 10 I=1,4
  10  RVEC(I)=PVEC(I)
      QVEC(1)= CS*RVEC(1)+SN*RVEC(3)
      QVEC(2)=RVEC(2)
      QVEC(3)=-SN*RVEC(1)+CS*RVEC(3)
      QVEC(4)=RVEC(4)
      RETURN
      END
      SUBROUTINE ROTOD3(PH1,PVEC,QVEC)
      IMPLICIT NONE
      DOUBLE PRECISION PH1,PVEC(4),QVEC(4)
C ----------------------------------------------------------------------
C
C     USED BY : KORALZ RADKOR
C ----------------------------------------------------------------------
      INTEGER I
      DOUBLE PRECISION PHI,CS,SN
      DOUBLE PRECISION RVEC(4)
C
      PHI=PH1
      CS=COS(PHI)
      SN=SIN(PHI)
      DO 10 I=1,4
  10  RVEC(I)=PVEC(I)
      QVEC(1)= CS*RVEC(1)-SN*RVEC(2)
      QVEC(2)= SN*RVEC(1)+CS*RVEC(2)
      QVEC(3)=RVEC(3)
      QVEC(4)=RVEC(4)
      END
      SUBROUTINE ROTOR1(PH1,PVEC,QVEC)
      IMPLICIT NONE
      REAL PH1,PVEC(4),QVEC(4)
C ----------------------------------------------------------------------
C
C     called by :
C ----------------------------------------------------------------------
      INTEGER I
      REAL PHI,CS,SN
      REAL RVEC(4)
C
      PHI=PH1
      CS=COS(PHI)
      SN=SIN(PHI)
      DO 10 I=1,4
  10  RVEC(I)=PVEC(I)
      QVEC(1)=RVEC(1)
      QVEC(2)= CS*RVEC(2)-SN*RVEC(3)
      QVEC(3)= SN*RVEC(2)+CS*RVEC(3)
      QVEC(4)=RVEC(4)
      END
      SUBROUTINE ROTOR2(PH1,PVEC,QVEC)
      IMPLICIT NONE
      REAL PH1,PVEC(4),QVEC(4)
C ----------------------------------------------------------------------
C
C     USED BY : TAUOLA
C ----------------------------------------------------------------------
      INTEGER I
      REAL PHI,CS,SN
      REAL RVEC(4)
C
      PHI=PH1
      CS=COS(PHI)
      SN=SIN(PHI)
      DO 10 I=1,4
  10  RVEC(I)=PVEC(I)
      QVEC(1)= CS*RVEC(1)+SN*RVEC(3)
      QVEC(2)=RVEC(2)
      QVEC(3)=-SN*RVEC(1)+CS*RVEC(3)
      QVEC(4)=RVEC(4)
      END
      SUBROUTINE ROTOR3(PHI,PVEC,QVEC)
      IMPLICIT NONE
      REAL PHI,PVEC(4),QVEC(4)
C ----------------------------------------------------------------------
C
C     USED BY : TAUOLA
C ----------------------------------------------------------------------
      INTEGER I
      REAL CS,SN
      REAL RVEC(4)
C
      CS=COS(PHI)
      SN=SIN(PHI)
      DO 10 I=1,4
  10  RVEC(I)=PVEC(I)
      QVEC(1)= CS*RVEC(1)-SN*RVEC(2)
      QVEC(2)= SN*RVEC(1)+CS*RVEC(2)
      QVEC(3)=RVEC(3)
      QVEC(4)=RVEC(4)
      END
      SUBROUTINE ROTPOL(THET,PHI,PP)
      IMPLICIT NONE
      REAL THET,PHI,PP(4)
C ----------------------------------------------------------------------
C
C     called by : DADMAA,DPHSAA
C ----------------------------------------------------------------------
C
      CALL ROTOR2(THET,PP,PP)
      CALL ROTOR3( PHI,PP,PP)
      RETURN
      END
      SUBROUTINE ROTPOX(THET,PHI,PP)
      IMPLICIT NONE
      DOUBLE PRECISION THET,PHI,PP(4)
C ----------------------------------------------------------------------
C
C ----------------------------------------------------------------------
C
      CALL ROTOD2(THET,PP,PP)
      CALL ROTOD3( PHI,PP,PP)
      RETURN
      END
      REAL FUNCTION XSIGEE(Q2,JNP)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      REAL Q2
      INTEGER JNP
C ----------------------------------------------------------------------
C  e+e- cross section in the (1.GEV2,AMTAU**2) region                   
C  normalised to sig0 = 4/3 pi alfa2                                    
C  used in matrix element for multipion tau decays                      
C  cf YS.Tsai        Phys.Rev D4 ,2821(1971)                            
C     F.Gilman et al Phys.Rev D17,1846(1978)                            
C     C.Kiesling, to be pub. in High Energy e+e- Physics (1988)         
C  DATSIG(*,1) = e+e- -> pi+pi-2pi0                                     
C  DATSIG(*,2) = e+e- -> 2pi+2pi-                                       
C  DATSIG(*,3) = 5-pion contribution (a la TN.Pham et al)               
C                (Phys Lett 78B,623(1978)                               
C  DATSIG(*,5) = e+e- -> 6pi                                            
C                                                                       
C  4- and 6-pion cross sections from data                               
C  5-pion contribution related to 4-pion cross section                  
C                                                                       
C     Called by DPHNPI                                                  
C ----------------------------------------------------------------------
        REAL*4 DATSIG(17,6)                                             
C                                                                       
      DATA DATSIG/                                                      
     1  7.40,12.00,16.15,21.25,24.90,29.55,34.15,37.40,37.85,37.40,     
     2 36.00,33.25,30.50,27.70,24.50,21.25,18.90,                       
     3  1.24, 2.50, 3.70, 5.40, 7.45,10.75,14.50,18.20,22.30,28.90,     
     4 29.35,25.60,22.30,18.60,14.05,11.60, 9.10,                       
     5 17*.0,                                                           
     6 17*.0,                                                           
     7 9*.0,.65,1.25,2.20,3.15,5.00,5.75,7.80,8.25,                     
     8 17*.0/                                                           
      REAL SIG0 / 86.8 /                                                
      REAL PI /3.141592653589793238462643/                              


      INTEGER I,J,JNPI
      REAL AMPI2,FPI,FACT
      REAL S,S2,T,T2,Q,QMIN,QMAX

      INTEGER INIT / 0 /
      SAVE INIT
      SAVE AMPI2
      SAVE FPI
      SAVE DATSIG
      SAVE FACT
      SAVE S,S2,T,T2
C                          
        JNPI=JNP
        IF(JNP.EQ.4) JNPI=3                                             
        IF(JNP.EQ.3) JNPI=4
      IF(INIT.EQ.0) THEN                                                
        INIT=1                                                          
        AMPI2=AMPI**2                                                   
        FPI = .943*AMPI                                                 
        DO 100 I=1,17                                                   
        DATSIG(I,2) = DATSIG(I,2)/2.                                    
        DATSIG(I,1) = DATSIG(I,1) + DATSIG(I,2)                         
        S = 1.025+(I-1)*.05                                             
        FACT=0.                                                         
        S2=S**2                                                         
        DO 200 J=1,17                                                   
        T= 1.025+(J-1)*.05                                              
        IF(T . GT. S-AMPI ) GO TO 201                                   
        T2=T**2                                                         
        FACT=(T2/S2)**2*SQRT((S2-T2-AMPI2)**2-4.*T2*AMPI2)/S2 *2.*T*.05 
        FACT = FACT * (DATSIG(J,1)+DATSIG(J+1,1))                       
 200    DATSIG(I,3) = DATSIG(I,3) + FACT                                
 201    DATSIG(I,3) = DATSIG(I,3) /(2*PI*FPI)**2                        
        DATSIG(I,4) = DATSIG(I,3)                                       
        DATSIG(I,6) = DATSIG(I,5)                                       
 100    CONTINUE                                                        
C       WRITE(TUN,1000) DATSIG                                            
 1000   FORMAT(///1X,' EE SIGMA USED IN MULTIPI DECAYS'/                
     %        (17F7.2/))                                                
      ENDIF                                                             
      Q=SQRT(Q2)                                                        
      QMIN=1.                                                           
      IF(Q.LT.QMIN) THEN                                                
        XSIGEE=DATSIG(1,JNPI)+                                           
     &       (DATSIG(2,JNPI)-DATSIG(1,JNPI))*(Q-1.)/.05                 
      ELSEIF(Q.LT.1.8) THEN                                             
        DO 1 I=1,16                                                     
        QMAX = QMIN + .05                                               
        IF(Q.LT.QMAX) GO TO 2                                           
        QMIN = QMIN + .05                                               
 1      CONTINUE                                                        
 2      XSIGEE=DATSIG(I,JNPI)+                                           
     &       (DATSIG(I+1,JNPI)-DATSIG(I,JNPI)) * (Q-QMIN)/.05           
      ELSEIF(Q.GT.1.8) THEN                                             
        XSIGEE=DATSIG(17,JNPI)+                                          
     &       (DATSIG(17,JNPI)-DATSIG(16,JNPI)) * (Q-1.8)/.05            
      ENDIF                                                             
      IF(XSIGEE.LT..0) XSIGEE=0.                                          
C                                                                       
      XSIGEE = XSIGEE/(6.*PI**2*SIG0)                                     
C                                                                       
      RETURN                                                            
      END                                                               

      SUBROUTINE SPHERA(R,X)
      IMPLICIT NONE
      REAL R,X(4)
C ----------------------------------------------------------------------
C GENERATES UNIFORMLY THREE-VECTOR X ON SPHERE  OF RADIUS R
C
C     called by : DPHSxx,DADMPI,DADMKK
C ----------------------------------------------------------------------
      REAL COSTH,SINTH
      REAL RRR(2)
      REAL PI /3.141592653589793238462643/
C
      CALL TDRAND(RRR,2)
      COSTH=-1.+2.*RRR(1)
      SINTH=SQRT(1.-COSTH**2)
      X(1)=R*SINTH*COS(2*PI*RRR(2))
      X(2)=R*SINTH*SIN(2*PI*RRR(2))
      X(3)=R*COSTH
      RETURN
      END
      SUBROUTINE SPHERD(R,X)
      IMPLICIT NONE
      DOUBLE PRECISION R,X(4)
C ----------------------------------------------------------------------
C GENERATES UNIFORMLY THREE-VECTOR X ON SPHERE  OF RADIUS R
C DOUBLE PRECISON VERSION OF SPHERA
C ----------------------------------------------------------------------
      DOUBLE PRECISION PI,COSTH,SINTH
      REAL RRR(2)
      DATA PI /3.141592653589793238462643D0/
C
      CALL TDRAND(RRR,2)
      COSTH=-1+2*RRR(1)
      SINTH=SQRT(1 -COSTH**2)
      X(1)=R*SINTH*COS(2*PI*RRR(2))
      X(2)=R*SINTH*SIN(2*PI*RRR(2))
      X(3)=R*COSTH
      RETURN
      END
      DOUBLE PRECISION FUNCTION SQM2(ITDKRC_LOC,QP,XN,XA,XK,AK0,HV)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER ITDKRC_LOC
      DOUBLE PRECISION QP(4),XN(4),XA(4),XK(4),AK0,HV(4)
C
C **********************************************************************
C     REAL PHOTON MATRIX ELEMENT SQUARED                               *
C     PARAMETERS:                                                      *
C     HV- POLARIMETRIC FOUR-VECTOR OF TAU                              *
C     QP,XN,XA,XK - 4-momenta of electron (muon), NU, NUBAR and PHOTON *
C                   All four-vectors in TAU rest frame (in GeV)        *
C     AK0 - INFRARED CUTOFF, MINIMAL ENERGY OF HARD PHOTONS (GEV)      *
C     SQM2 - value for S=0                                             *
C     see Eqs. (2.9)-(2.10) from CJK ( Nucl.Phys.B(1991) )             *
C **********************************************************************
C
      INTEGER I
      DOUBLE PRECISION A,B,X,Z,S1,CONST4,ALPHAI,TMASS,TMASS2,GF
      DOUBLE PRECISION EMASS2,QPXN,QPXA,QPXK,XNXK,XAXK,TXN
      DOUBLE PRECISION TXA,TQP,TXK
      DOUBLE PRECISION R(4)
      DOUBLE PRECISION S0(3),RXA(3),RXK(3),RQP(3)
      DOUBLE PRECISION PI /3.141592653589793238462643D0/
C
      TMASS=AMTAU
      GF=GFERMI
      ALPHAI=ALFINV
      TMASS2=TMASS**2
      EMASS2=QP(4)**2-QP(1)**2-QP(2)**2-QP(3)**2
      R(4)=TMASS
C     SCALAR PRODUCTS OF FOUR-MOMENTA
      DO 7 I=1,3
        R(1)=0.D0
        R(2)=0.D0
        R(3)=0.D0
        R(I)=TMASS
        RXA(I)=R(4)*XA(4)-R(1)*XA(1)-R(2)*XA(2)-R(3)*XA(3)
C       RXN(I)=R(4)*XN(4)-R(1)*XN(1)-R(2)*XN(2)-R(3)*XN(3)
        RXK(I)=R(4)*XK(4)-R(1)*XK(1)-R(2)*XK(2)-R(3)*XK(3)
        RQP(I)=R(4)*QP(4)-R(1)*QP(1)-R(2)*QP(2)-R(3)*QP(3)
  7   CONTINUE
      QPXN=QP(4)*XN(4)-QP(1)*XN(1)-QP(2)*XN(2)-QP(3)*XN(3)
      QPXA=QP(4)*XA(4)-QP(1)*XA(1)-QP(2)*XA(2)-QP(3)*XA(3)
      QPXK=QP(4)*XK(4)-QP(1)*XK(1)-QP(2)*XK(2)-QP(3)*XK(3)
c     XNXA=XN(4)*XA(4)-XN(1)*XA(1)-XN(2)*XA(2)-XN(3)*XA(3)
      XNXK=XN(4)*XK(4)-XN(1)*XK(1)-XN(2)*XK(2)-XN(3)*XK(3)
      XAXK=XA(4)*XK(4)-XA(1)*XK(1)-XA(2)*XK(2)-XA(3)*XK(3)
      TXN=TMASS*XN(4)
      TXA=TMASS*XA(4)
      TQP=TMASS*QP(4)
      TXK=TMASS*XK(4)
C
      X= XNXK/QPXN
      Z= TXK/TQP
      A= 1+X
      B= 1+ X*(1+Z)/2+Z/2
      S1= QPXN*TXA*( -EMASS2/QPXK**2*A + 2*TQP/(QPXK*TXK)*B-
     $TMASS2/TXK**2)  +
     $QPXN/TXK**2* ( TMASS2*XAXK - TXA*TXK+ XAXK*TXK) -
     $TXA*TXN/TXK - QPXN/(QPXK*TXK)* (TQP*XAXK-TXK*QPXA)
      CONST4=256*PI/ALPHAI*GF**2
      IF (ITDKRC_LOC.EQ.0) CONST4=0D0
      SQM2=S1*CONST4
      DO 5 I=1,3
        S0(I) = QPXN*RXA(I)*(-EMASS2/QPXK**2*A + 2*TQP/(QPXK*TXK)*B-
     $  TMASS2/TXK**2) +
     $  QPXN/TXK**2* (TMASS2*XAXK - TXA*RXK(I)+ XAXK*RXK(I))-
     $  RXA(I)*TXN/TXK - QPXN/(QPXK*TXK)*(RQP(I)*XAXK- RXK(I)*QPXA)
  5     HV(I)=S0(I)/S1-1.D0
      RETURN
      END
      DOUBLE PRECISION FUNCTION THB(ITDKRC_LOC,QP,XN,XA,AK0,HV)
      IMPLICIT NONE
      INCLUDE 'tauola.inc'
      INTEGER ITDKRC_LOC
      DOUBLE PRECISION QP(4),XN(4),XA(4),AK0,HV(4)
C
C **********************************************************************
C     BORN +VIRTUAL+SOFT PHOTON MATRIX ELEMENT**2  O(ALPHA)            *
C     PARAMETERS:                                                      *
C     HV- POLARIMETRIC FOUR-VECTOR OF TAU                              *
C     QP,XN,XA - FOUR-MOMENTA OF ELECTRON (MUON), NU AND NUBAR IN GEV  *
C     ALL FOUR-VECTORS IN TAU REST FRAME                               *
C     AK0 - INFRARED CUTOFF, MINIMAL ENERGY OF HARD PHOTONS            *
C     THB - VALUE FOR S=0                                              *
C     SEE EQS. (2.2),(2.4)-(2.5) FROM CJK (NUCL.PHYS.B351(1991)70      *
C     AND (C.2) FROM JK (NUCL.PHYS.B320(1991)20 )                      *
C **********************************************************************
C
      INTEGER I
      DOUBLE PRECISION TMASS,GF,ALPHAI,TMASS2
      DOUBLE PRECISION U0,U3,UM,UP,W0,W3,WM,WP,Y,YU,YW
      DOUBLE PRECISION AL,F0,F3,FP,FM,XM3,AM3,EPS,EPS2
      DOUBLE PRECISION BRAK,BORN,CONST3
      DOUBLE PRECISION QPXN,QPXA,XNXA,TXN,TXA,TQP
      DOUBLE PRECISION R(4)
      DOUBLE PRECISION RXA(3),RXN(3),RQP(3)
      DOUBLE PRECISION BORNPL(3),AM3POL(3),XM3POL(3)
      DOUBLE PRECISION PI /3.141592653589793238462643D0/

      DOUBLE PRECISION DDILOGT
C
      TMASS=AMTAU
      GF=GFERMI
      ALPHAI=ALFINV
C
      TMASS2=TMASS**2
      R(4)=TMASS
      DO 7 I=1,3
        R(1)=0.D0
        R(2)=0.D0
        R(3)=0.D0
        R(I)=TMASS
        RXA(I)=R(4)*XA(4)-R(1)*XA(1)-R(2)*XA(2)-R(3)*XA(3)
        RXN(I)=R(4)*XN(4)-R(1)*XN(1)-R(2)*XN(2)-R(3)*XN(3)
C       RXK(I)=R(4)*XK(4)-R(1)*XK(1)-R(2)*XK(2)-R(3)*XK(3)
        RQP(I)=R(4)*QP(4)-R(1)*QP(1)-R(2)*QP(2)-R(3)*QP(3)
  7   CONTINUE
C     QUASI TWO-BODY VARIABLES
      U0=QP(4)/TMASS
      U3=SQRT(QP(1)**2+QP(2)**2+QP(3)**2)/TMASS
      W3=U3
      W0=(XN(4)+XA(4))/TMASS
      UP=U0+U3
      UM=U0-U3
      WP=W0+W3
      WM=W0-W3
      YU=LOG(UP/UM)/2
      YW=LOG(WP/WM)/2
      EPS2=U0**2-U3**2
      EPS=SQRT(EPS2)
      Y=W0**2-W3**2
      AL=AK0/TMASS
C     FORMFACTORS
      F0=2*U0/U3*(  DDILOGT(1D0-(UM*WM/(UP*WP)))- 
     $DDILOGT(1D0-WM/WP) +
     $DDILOGT(1D0-UM/UP) -2*YU+ 2*LOG(UP)*(YW+YU) ) +
     $1/Y* ( 2*U3*YU + (1-EPS2- 2*Y)*LOG(EPS) ) +
     $ 2 - 4*(U0/U3*YU -1)* LOG(2*AL)
      FP= YU/(2*U3)*(1 + (1-EPS2)/Y ) + LOG(EPS)/Y
      FM= YU/(2*U3)*(1 - (1-EPS2)/Y ) - LOG(EPS)/Y
      F3= EPS2*(FP+FM)/2
C     SCALAR PRODUCTS OF FOUR-MOMENTA
      QPXN=QP(4)*XN(4)-QP(1)*XN(1)-QP(2)*XN(2)-QP(3)*XN(3)
      QPXA=QP(4)*XA(4)-QP(1)*XA(1)-QP(2)*XA(2)-QP(3)*XA(3)
      XNXA=XN(4)*XA(4)-XN(1)*XA(1)-XN(2)*XA(2)-XN(3)*XA(3)
      TXN=TMASS*XN(4)
      TXA=TMASS*XA(4)
      TQP=TMASS*QP(4)
C     DECAY DIFFERENTIAL WIDTH WITHOUT AND WITH POLARIZATION
      CONST3=1/(2*ALPHAI*PI)*64*GF**2
      IF (ITDKRC_LOC.EQ.0) CONST3=0D0
      XM3= -( F0* QPXN*TXA +  FP*EPS2* TXN*TXA +
     $FM* QPXN*QPXA + F3* TMASS2*XNXA )
      AM3=XM3*CONST3
C V-A  AND  V+A COUPLINGS, BUT IN THE BORN PART ONLY
      BRAK= (GV+GA)**2*TQP*XNXA+(GV-GA)**2*TXA*QPXN
     &     -(GV**2-GA**2)*TMASS*AMNUTA*QPXA
      BORN= 32*(GFERMI**2/2.)*BRAK
      DO 5 I=1,3
        XM3POL(I)= -( F0* QPXN*RXA(I) +  FP*EPS2* TXN*RXA(I) +
     $  FM* QPXN* (QPXA + (RXA(I)*TQP-TXA*RQP(I))/TMASS2 ) +
     $  F3* (TMASS2*XNXA +TXN*RXA(I) -RXN(I)*TXA)  )
        AM3POL(I)=XM3POL(I)*CONST3
C V-A  AND  V+A COUPLINGS, BUT IN THE BORN PART ONLY
        BORNPL(I)=BORN+(
     &            (GV+GA)**2*TMASS*XNXA*QP(I)
     &           -(GV-GA)**2*TMASS*QPXN*XA(I)
     &           +(GV**2-GA**2)*AMNUTA*TXA*QP(I)
     &           -(GV**2-GA**2)*AMNUTA*TQP*XA(I) )*
     &                                             32*(GFERMI**2/2.)
  5     HV(I)=(BORNPL(I)+AM3POL(I))/(BORN+AM3)-1.D0
      THB=BORN+AM3
      IF (THB/BORN.LT.0.1D0) THEN
        PRINT *, 'ERROR IN THB, THB/BORN=',THB/BORN
        STOP
      ENDIF
      RETURN
      END


      REAL*8 FUNCTION DDILOGT(X)
C
C          FROM CERN PROGRAM LIBRARY
C
      IMPLICIT NONE
      DOUBLE PRECISION X,Y,T,S,A,PI3,PI6,ZERO,ONE,HALF,MALF,MONE,MTWO
      DOUBLE PRECISION C(0:18),H,ALFA,B0,B1,B2
      INTEGER I
C
      DATA ZERO /0.0D0/, ONE /1.0D0/
      DATA HALF /0.5D0/, MALF /-0.5D0/, MONE /-1.0D0/, MTWO /-2.0D0/
      DATA PI3 /3.28986 81336 96453D0/, PI6 /1.64493 40668 48226D0/
C
      DATA C( 0) / 0.42996 69356 08137 0D0/
      DATA C( 1) / 0.40975 98753 30771 1D0/
      DATA C( 2) /-0.01858 84366 50146 0D0/
      DATA C( 3) / 0.00145 75108 40622 7D0/
      DATA C( 4) /-0.00014 30418 44423 4D0/
      DATA C( 5) / 0.00001 58841 55418 8D0/
      DATA C( 6) /-0.00000 19078 49593 9D0/
      DATA C( 7) / 0.00000 02419 51808 5D0/
      DATA C( 8) /-0.00000 00319 33412 7D0/
      DATA C( 9) / 0.00000 00043 45450 6D0/
      DATA C(10) /-0.00000 00006 05784 8D0/
      DATA C(11) / 0.00000 00000 86121 0D0/
      DATA C(12) /-0.00000 00000 12443 3D0/
      DATA C(13) / 0.00000 00000 01822 6D0/
      DATA C(14) /-0.00000 00000 00270 1D0/
      DATA C(15) / 0.00000 00000 00040 4D0/
      DATA C(16) /-0.00000 00000 00006 1D0/
      DATA C(17) / 0.00000 00000 00000 9D0/
      DATA C(18) /-0.00000 00000 00000 1D0/
C
      IF(X .EQ. ONE) THEN
       DDILOGT=PI6
       RETURN
      ELSE IF(X .EQ. MONE) THEN
       DDILOGT=MALF*PI6
       RETURN
      END IF
      T=-X
      IF(T .LE. MTWO) THEN
       Y=MONE/(ONE+T)
       S=ONE
       A=-PI3+HALF*(LOG(-T)**2-LOG(ONE+ONE/T)**2)
      ELSE IF(T .LT. MONE) THEN
       Y=MONE-T
       S=MONE
       A=LOG(-T)
       A=-PI6+A*(A+LOG(ONE+ONE/T))
      ELSE IF(T .LE. MALF) THEN
       Y=(MONE-T)/T
       S=ONE
       A=LOG(-T)
       A=-PI6+A*(MALF*A+LOG(ONE+T))
      ELSE IF(T .LT. ZERO) THEN
       Y=-T/(ONE+T)
       S=MONE
       A=HALF*LOG(ONE+T)**2
      ELSE IF(T .LE. ONE) THEN
       Y=T
       S=ONE
       A=ZERO
      ELSE
       Y=ONE/T
       S=MONE
       A=PI6+HALF*LOG(T)**2
      END IF
C
      H=Y+Y-ONE
      ALFA=H+H
      B1=ZERO
      B2=ZERO
      DO 1 I = 18,0,-1
      B0=C(I)+ALFA*B1-B2
      B2=B1
 1     B1=B0
      DDILOGT=-(S*(B0-H*B2)+A)
      RETURN
      END





      FUNCTION FORMOM(XMAA,XMOM)
      IMPLICIT INTEGER (I-N), REAL (A-H,O-Z)
C     ==================================================================
C     formfactorfor pi-pi0 gamma final state
C      R. Decker, Z. Phys C36 (1987) 487.
C     ==================================================================
      COMMON / PARMAS / AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
C
      REAL*4            AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
      COMMON / DECPAR / GFERMI,GV,GA,CCABIB,SCABIB,GAMEL
      REAL*4            GFERMI,GV,GA,CCABIB,SCABIB,GAMEL
      COMMON /TESTA1/ KEYA1
      COMPLEX BWIGN,FORMOM
      DATA ICONT /1/
* THIS INLINE FUNCT. CALCULATES THE SCALAR PART OF THE PROPAGATOR
      BWIGN(XM,AM,GAMMA)=1./CMPLX(XM**2-AM**2,GAMMA*AM)
* HADRON CURRENT
      FRO  =0.266*AMRO**2
      ELPHA=- 0.1
      AMROP = 1.7
      GAMROP= 0.26
      AMOM  =0.782
      GAMOM =0.0085
      AROMEG= 1.0
      GCOUP=12.924
      GCOUP=GCOUP*AROMEG
      FQED  =SQRT(4.0*3.1415926535/137.03604)
      FORMOM=FQED*FRO**2/SQRT(2.0)*GCOUP**2*BWIGN(XMOM,AMOM,GAMOM)
     $     *(BWIGN(XMAA,AMRO,GAMRO)+ELPHA*BWIGN(XMAA,AMROP,GAMROP))
     $     *(BWIGN( 0.0,AMRO,GAMRO)+ELPHA*BWIGN( 0.0,AMROP,GAMROP))
      END
      FUNCTION FORM1(MNUM,QQ,S1,SDWA)
      IMPLICIT INTEGER (I-N), REAL (A-H,O-Z)
C     ==================================================================
C     formfactorfor F1 for 3 scalar final state
C     R. Fisher, J. Wess and F. Wagner Z. Phys C3 (1980) 313
C     H. Georgi, Weak interactions and modern particle theory,
C     The Benjamin/Cummings Pub. Co., Inc. 1984.
C     R. Decker, E. Mirkes, R. Sauer, Z. Was Karlsruhe preprint TTP92-25
C     and erratum !!!!!!
C     ==================================================================
C
      COMPLEX FORM1,WIGNER,WIGFOR,FPIKM,BWIGM
      COMMON / PARMAS / AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
C
      REAL*4            AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
      WIGNER(A,B,C)= CMPLX(1.0,0.0)/CMPLX(A-B**2,B*C)
      IF     (MNUM.EQ.0) THEN
C ------------  3 pi hadronic state (a1)
       GAMAX=GAMA1*GFUN(QQ)/GFUN(AMA1**2)
       FORM1=AMA1**2*WIGNER(QQ,AMA1,GAMAX)*FPIKM(SQRT(S1),AMPI,AMPI)
      ELSEIF (MNUM.EQ.1) THEN
C ------------ K- pi- K+
       FORM1=BWIGM(S1,AMKST,GAMKST,AMPI,AMK)
         GAMAX=GAMA1*GFUN(QQ)/GFUN(AMA1**2)
       FORM1=AMA1**2*WIGNER(QQ,AMA1,GAMAX)*FORM1
      ELSEIF (MNUM.EQ.2) THEN
C ------------ K0 pi- K0B
       FORM1=BWIGM(S1,AMKST,GAMKST,AMPI,AMK)
         GAMAX=GAMA1*GFUN(QQ)/GFUN(AMA1**2)
       FORM1=AMA1**2*WIGNER(QQ,AMA1,GAMAX)*FORM1
      ELSEIF (MNUM.EQ.3) THEN
C ------------ K- K0 pi0
       FORM1=0.0
         GAMAX=GAMA1*GFUN(QQ)/GFUN(AMA1**2)
       FORM1=AMA1**2*WIGNER(QQ,AMA1,GAMAX)*FORM1
      ELSEIF (MNUM.EQ.4) THEN
C ------------ pi0 pi0 K-
       XM2=1.402
       GAM2=0.174
       FORM1=BWIGM(S1,AMKST,GAMKST,AMK,AMPI)
       FORM1=WIGFOR(QQ,XM2,GAM2)*FORM1
      ELSEIF (MNUM.EQ.5) THEN
C ------------ K- pi- pi+
       XM2=1.402
       GAM2=0.174
       FORM1=WIGFOR(QQ,XM2,GAM2)*FPIKM(SQRT(S1),AMPI,AMPI)
      ELSEIF (MNUM.EQ.6) THEN
       FORM1=0.0
      ELSEIF (MNUM.EQ.7) THEN
C -------------- eta pi- pi0 final state
       FORM1=0.0
      ENDIF
C
      END
      FUNCTION FORM2(MNUM,QQ,S1,SDWA)
      IMPLICIT INTEGER (I-N), REAL (A-H,O-Z)
C     ==================================================================
C     formfactorfor F2 for 3 scalar final state
C     R. Fisher, J. Wess and F. Wagner Z. Phys C3 (1980) 313
C     H. Georgi, Weak interactions and modern particle theory,
C     The Benjamin/Cummings Pub. Co., Inc. 1984.
C     R. Decker, E. Mirkes, R. Sauer, Z. Was Karlsruhe preprint TTP92-25
C     and erratum !!!!!!
C     ==================================================================
C
      COMPLEX FORM2,WIGNER,WIGFOR,FPIKM,BWIGM
      COMMON / PARMAS / AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
C
      REAL*4            AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
      WIGNER(A,B,C)= CMPLX(1.0,0.0)/CMPLX(A-B**2,B*C)
      IF     (MNUM.EQ.0) THEN
C ------------  3 pi hadronic state (a1)
       GAMAX=GAMA1*GFUN(QQ)/GFUN(AMA1**2)
       FORM2=AMA1**2*WIGNER(QQ,AMA1,GAMAX)*FPIKM(SQRT(S1),AMPI,AMPI)
      ELSEIF (MNUM.EQ.1) THEN
C ------------ K- pi- K+
         GAMAX=GAMA1*GFUN(QQ)/GFUN(AMA1**2)
       FORM2=AMA1**2*WIGNER(QQ,AMA1,GAMAX)*FPIKM(SQRT(S1),AMPI,AMPI)
      ELSEIF (MNUM.EQ.2) THEN
C ------------ K0 pi- K0B
         GAMAX=GAMA1*GFUN(QQ)/GFUN(AMA1**2)
       FORM2=AMA1**2*WIGNER(QQ,AMA1,GAMAX)*FPIKM(SQRT(S1),AMPI,AMPI)
      ELSEIF (MNUM.EQ.3) THEN
C ------------ K- K0 pi0
         GAMAX=GAMA1*GFUN(QQ)/GFUN(AMA1**2)
       FORM2=AMA1**2*WIGNER(QQ,AMA1,GAMAX)*FPIKM(SQRT(S1),AMPI,AMPI)
      ELSEIF (MNUM.EQ.4) THEN
C ------------ pi0 pi0 K-
       XM2=1.402
       GAM2=0.174
       FORM2=BWIGM(S1,AMKST,GAMKST,AMK,AMPI)
       FORM2=WIGFOR(QQ,XM2,GAM2)*FORM2
      ELSEIF (MNUM.EQ.5) THEN
C ------------ K- pi- pi+
       XM2=1.402
       GAM2=0.174
       FORM2=BWIGM(S1,AMKST,GAMKST,AMK,AMPI)
       FORM2=WIGFOR(QQ,XM2,GAM2)*FORM2
C
      ELSEIF (MNUM.EQ.6) THEN
       XM2=1.402
       GAM2=0.174
       FORM2=WIGFOR(QQ,XM2,GAM2)*FPIKM(SQRT(S1),AMPI,AMPI)
C
      ELSEIF (MNUM.EQ.7) THEN
C -------------- eta pi- pi0 final state
       FORM2=0.0
      ENDIF
C
      END
      COMPLEX FUNCTION BWIGM(S,M,G,XM1,XM2)
      IMPLICIT INTEGER (I-N), REAL (A-H,O-Z)
C **********************************************************
C     P-WAVE BREIT-WIGNER  FOR RHO
C **********************************************************
      REAL S,M,G,XM1,XM2
      REAL PI,QS,QM,W,GS
      DATA INIT /0/
C ------------ PARAMETERS --------------------
      IF (INIT.EQ.0) THEN
      INIT=1
      PI=3.141592654
C -------  BREIT-WIGNER -----------------------
         ENDIF
       IF (S.GT.(XM1+XM2)**2) THEN
         QS=SQRT(ABS((S   -(XM1+XM2)**2)*(S   -(XM1-XM2)**2)))/SQRT(S)
         QM=SQRT(ABS((M**2-(XM1+XM2)**2)*(M**2-(XM1-XM2)**2)))/M
         W=SQRT(S)
         GS=G*(M/W)**2*(QS/QM)**3
       ELSE
         GS=0.0
       ENDIF
         BWIGM=M**2/CMPLX(M**2-S,-SQRT(S)*GS)
      RETURN
      END
      COMPLEX FUNCTION FPIKM(W,XM1,XM2)
      IMPLICIT INTEGER (I-N), REAL (A-H,O-Z)
C **********************************************************
C     PION FORM FACTOR
C **********************************************************
      COMPLEX BWIGM
      REAL ROM,ROG,ROM1,ROG1,BETA1,PI,PIM,S,W
      EXTERNAL BWIG
      DATA  INIT /0/
C
C ------------ PARAMETERS --------------------
      IF (INIT.EQ.0 ) THEN
      INIT=1
      PI=3.141592654
      PIM=.140
      ROM=0.773
      ROG=0.145
      ROM1=1.370
      ROG1=0.510
      BETA1=-0.145
      ENDIF
C -----------------------------------------------
      S=W**2
      FPIKM=(BWIGM(S,ROM,ROG,XM1,XM2)+BETA1*BWIGM(S,ROM1,ROG1,XM1,XM2))
     & /(1+BETA1)
      RETURN
      END
      COMPLEX FUNCTION FPIKMD(W,XM1,XM2)
      IMPLICIT INTEGER (I-N), REAL (A-H,O-Z)
C **********************************************************
C     PION FORM FACTOR
C **********************************************************
      COMPLEX BWIGM
      REAL ROM,ROG,ROM1,ROG1,PI,PIM,S,W
      EXTERNAL BWIG
      DATA  INIT /0/
C
C ------------ PARAMETERS --------------------
      IF (INIT.EQ.0 ) THEN
      INIT=1
      PI=3.141592654
      PIM=.140
      ROM=0.773
      ROG=0.145
      ROM1=1.500
      ROG1=0.220
      ROM2=1.750
      ROG2=0.120
      BETA=6.5
      DELTA=-26.0
      ENDIF
C -----------------------------------------------
      S=W**2
      FPIKMD=(DELTA*BWIGM(S,ROM,ROG,XM1,XM2)
     $      +BETA*BWIGM(S,ROM1,ROG1,XM1,XM2)
     $      +     BWIGM(S,ROM2,ROG2,XM1,XM2))
     & /(1+BETA+DELTA)
      RETURN
      END
 
      FUNCTION FORM3(MNUM,QQ,S1,SDWA)
      IMPLICIT INTEGER (I-N), REAL (A-H,O-Z)
C     ==================================================================
C     formfactorfor F3 for 3 scalar final state
C     R. Fisher, J. Wess and F. Wagner Z. Phys C3 (1980) 313
C     H. Georgi, Weak interactions and modern particle theory,
C     The Benjamin/Cummings Pub. Co., Inc. 1984.
C     R. Decker, E. Mirkes, R. Sauer, Z. Was Karlsruhe preprint TTP92-25
C     and erratum !!!!!!
C     ==================================================================
C
      COMMON / PARMAS / AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
C
      REAL*4            AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
      COMPLEX FORM3
      IF (MNUM.EQ.6) THEN
       FORM3=CMPLX(0.0)
      ELSE
       FORM3=CMPLX(0.0)
      ENDIF
        FORM3=0
      END
      FUNCTION FORM4(MNUM,QQ,S1,S2,S3)
      IMPLICIT INTEGER (I-N), REAL (A-H,O-Z)
C     ==================================================================
C     formfactorfor F4 for 3 scalar final state
C     R. Decker, in preparation
C     R. Decker, E. Mirkes, R. Sauer, Z. Was Karlsruhe preprint TTP92-25
C     and erratum !!!!!!
C     ==================================================================
C
      COMMON / PARMAS / AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
C
      REAL*4            AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
      COMPLEX FORM4,WIGNER,FPIKM
      REAL*4 M
      WIGNER(A,B,C)=CMPLX(1.0,0.0) /CMPLX(A-B**2,B*C)
      IF (MNUM.EQ.0) THEN
C ------------  3 pi hadronic state (a1)
        G1=5.8
        G2=6.08
        FPIP=0.02
        AMPIP=1.3
        GAMPIP=0.3
        S=QQ
        G=GAMPIP
        XM1=AMPIZ
        XM2=AMRO
        M  =AMPIP
         IF (S.GT.(XM1+XM2)**2) THEN
           QS=SQRT(ABS((S   -(XM1+XM2)**2)*(S   -(XM1-XM2)**2)))/SQRT(S)
           QM=SQRT(ABS((M**2-(XM1+XM2)**2)*(M**2-(XM1-XM2)**2)))/M
           W=SQRT(S)
           GS=G*(M/W)**2*(QS/QM)**5
         ELSE
           GS=0.0
         ENDIF
        GAMX=GS*W/M
        FORM4=G1*G2*FPIP/AMRO**4/AMPIP**2
     $       *AMPIP**2*WIGNER(QQ,AMPIP,GAMX)
     $       *( S1*(S2-S3)*FPIKM(SQRT(S1),AMPIZ,AMPIZ)
     $         +S2*(S1-S3)*FPIKM(SQRT(S2),AMPIZ,AMPIZ) )
      ELSEIF (MNUM.EQ.1) THEN
C ------------  3 pi hadronic state (a1)
        G1=5.8
        G2=6.08
        FPIP=0.02
        AMPIP=1.3
        GAMPIP=0.3
        S=QQ
        G=GAMPIP
        XM1=AMPIZ
        XM2=AMRO
        M  =AMPIP
         IF (S.GT.(XM1+XM2)**2) THEN
           QS=SQRT(ABS((S   -(XM1+XM2)**2)*(S   -(XM1-XM2)**2)))/SQRT(S)
           QM=SQRT(ABS((M**2-(XM1+XM2)**2)*(M**2-(XM1-XM2)**2)))/M
           W=SQRT(S)
           GS=G*(M/W)**2*(QS/QM)**5
         ELSE
           GS=0.0
         ENDIF
        GAMX=GS*W/M
        FORM4=G1*G2*FPIP/AMRO**4/AMPIP**2
     $       *AMPIP**2*WIGNER(QQ,AMPIP,GAMX)
     $       *( S1*(S2-S3)*FPIKM(SQRT(S1),AMPIZ,AMPIZ)
     $         +S2*(S1-S3)*FPIKM(SQRT(S2),AMPIZ,AMPIZ) )
      ELSE
        FORM4=CMPLX(0.0,0.0)
      ENDIF
C ---- this formfactor is switched off .. .
       FORM4=CMPLX(0.0,0.0)
      END
      FUNCTION FORM5(MNUM,QQ,S1,S2)
      IMPLICIT INTEGER (I-N), REAL (A-H,O-Z)
C     ==================================================================
C     formfactorfor F5 for 3 scalar final state
C     G. Kramer, W. Palmer, S. Pinsky, Phys. Rev. D30 (1984) 89.
C     G. Kramer, W. Palmer             Z. Phys. C25 (1984) 195.
C     R. Decker, E. Mirkes, R. Sauer, Z. Was Karlsruhe preprint TTP92-25
C     and erratum !!!!!!
C     ==================================================================
C
      COMMON / PARMAS / AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
C
      REAL*4            AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
      COMPLEX FORM5,WIGNER,FPIKM,FPIKMD,BWIGM
      WIGNER(A,B,C)=CMPLX(1.0,0.0)/CMPLX(A-B**2,B*C)
      IF     (MNUM.EQ.0) THEN
C ------------  3 pi hadronic state (a1)
        FORM5=0.0
      ELSEIF (MNUM.EQ.1) THEN
C ------------ K- pi- K+
         ELPHA=-0.2
         FORM5=FPIKMD(SQRT(QQ),AMPI,AMPI)/(1+ELPHA)
     $        *(       FPIKM(SQRT(S2),AMPI,AMPI)
     $          +ELPHA*BWIGM(S1,AMKST,GAMKST,AMPI,AMK))
      ELSEIF (MNUM.EQ.2) THEN
C ------------ K0 pi- K0B
         ELPHA=-0.2
         FORM5=FPIKMD(SQRT(QQ),AMPI,AMPI)/(1+ELPHA)
     $        *(       FPIKM(SQRT(S2),AMPI,AMPI)
     $          +ELPHA*BWIGM(S1,AMKST,GAMKST,AMPI,AMK))
      ELSEIF (MNUM.EQ.3) THEN
C ------------ K- K0 pi0
        FORM5=0.0
      ELSEIF (MNUM.EQ.4) THEN
C ------------ pi0 pi0 K-
        FORM5=0.0
      ELSEIF (MNUM.EQ.5) THEN
C ------------ K- pi- pi+
        ELPHA=-0.2
        FORM5=BWIGM(QQ,AMKST,GAMKST,AMPI,AMK)/(1+ELPHA)
     $       *(       FPIKM(SQRT(S1),AMPI,AMPI)
     $         +ELPHA*BWIGM(S2,AMKST,GAMKST,AMPI,AMK))
      ELSEIF (MNUM.EQ.6) THEN
C ------------ pi- K0B pi0
        ELPHA=-0.2
        FORM5=BWIGM(QQ,AMKST,GAMKST,AMPI,AMKZ)/(1+ELPHA)
     $       *(       FPIKM(SQRT(S2),AMPI,AMPI)
     $         +ELPHA*BWIGM(S1,AMKST,GAMKST,AMPI,AMK))
      ELSEIF (MNUM.EQ.7) THEN
C -------------- eta pi- pi0 final state
       FORM5=FPIKMD(SQRT(QQ),AMPI,AMPI)*FPIKM(SQRT(S1),AMPI,AMPI)
      ENDIF
C
      END
      SUBROUTINE CURR(MNUM,PIM1,PIM2,PIM3,PIM4,HADCUR)
      IMPLICIT INTEGER (I-N), REAL (A-H,O-Z)
C     ==================================================================
C     hadronic current for 4 pi final state
C     R. Fisher, J. Wess and F. Wagner Z. Phys C3 (1980) 313
C     R. Decker Z. Phys C36 (1987) 487.
C     M. Gell-Mann, D. Sharp, W. Wagner Phys. Rev. Lett 8 (1962) 261.
C     ==================================================================
 
      COMMON / PARMAS / AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
C
      REAL*4            AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
      COMMON / DECPAR / GFERMI,GV,GA,CCABIB,SCABIB,GAMEL
      REAL*4            GFERMI,GV,GA,CCABIB,SCABIB,GAMEL
C ARBITRARY FIXING OF THE FOUR PI X-SECTION NORMALIZATION
      COMMON /ARBIT/ ARFLAT,AROMEG
      REAL  PIM1(4),PIM2(4),PIM3(4),PIM4(4),PAA(4)
      COMPLEX HADCUR(4),FORM1,FORM2,FORM3,FPIKM
      COMPLEX BWIGN
      REAL PA(4),PB(4)
      REAL AA(4,4),PP(4,4)
      DATA PI /3.141592653589793238462643/
      DATA  FPI /93.3E-3/
      BWIGN(A,XM,XG)=1.0/CMPLX(A-XM**2,XM*XG)
C
C --- masses and constants
      G1=12.924
      G2=1475.98
      G =G1*G2
      ELPHA=-.1
      AMROP=1.7
      GAMROP=0.26
      AMOM=.782
      GAMOM=0.0085
      ARFLAT=1.0
      AROMEG=1.0
C
      FRO=0.266*AMRO**2
      COEF1=2.0*SQRT(3.0)/FPI**2*ARFLAT
      COEF2=FRO*G*AROMEG
C --- initialization of four vectors
      DO 7 K=1,4
      DO 8 L=1,4
 8    AA(K,L)=0.0
      HADCUR(K)=CMPLX(0.0)
      PAA(K)=PIM1(K)+PIM2(K)+PIM3(K)+PIM4(K)
      PP(1,K)=PIM1(K)
      PP(2,K)=PIM2(K)
      PP(3,K)=PIM3(K)
 7    PP(4,K)=PIM4(K)
C
      IF (MNUM.EQ.1) THEN
C ===================================================================
C pi- pi- p0 pi+ case                                            ====
C ===================================================================
       QQ=PAA(4)**2-PAA(3)**2-PAA(2)**2-PAA(1)**2
C --- loop over thre contribution of the non-omega current
       DO 201 K=1,3
        SK=(PP(K,4)+PIM4(4))**2-(PP(K,3)+PIM4(3))**2
     $    -(PP(K,2)+PIM4(2))**2-(PP(K,1)+PIM4(1))**2
C -- definition of AA matrix
C -- cronecker delta
        DO 202 I=1,4
         DO 203 J=1,4
 203     AA(I,J)=0.0
 202    AA(I,I)=1.0
C ... and the rest ...
        DO 204 L=1,3
         IF (L.NE.K) THEN
          DENOM=(PAA(4)-PP(L,4))**2-(PAA(3)-PP(L,3))**2
     $         -(PAA(2)-PP(L,2))**2-(PAA(1)-PP(L,1))**2
          DO 205 I=1,4
          DO 205 J=1,4
                      SIG= 1.0
           IF(J.NE.4) SIG=-SIG
           AA(I,J)=AA(I,J)
     $            -SIG*(PAA(I)-2.0*PP(L,I))*(PAA(J)-PP(L,J))/DENOM
 205      CONTINUE
         ENDIF
 204    CONTINUE
C --- let's add something to HADCURR
       FORM1= FPIKM(SQRT(SK),AMPI,AMPI) *FPIKM(SQRT(QQ),AMPI,AMPI)
C       FORM1= FPIKM(SQRT(SK),AMPI,AMPI) *FPIKMD(SQRT(QQ),AMPI,AMPI)
CCCCCCCCCCCCCCCCC       FORM1=WIGFOR(SK,AMRO,GAMRO)      (tests)
C
       FIX=1.0
       IF (K.EQ.3) FIX=-2.0
       DO 206 I=1,4
       DO 206 J=1,4
        HADCUR(I)=
     $  HADCUR(I)+CMPLX(FIX*COEF1)*FORM1*AA(I,J)*(PP(K,J)-PP(4,J))
 206   CONTINUE
C --- end of the non omega current (3 possibilities)
 201   CONTINUE
C
C
C --- there are two possibilities for omega current
C --- PA PB are corresponding first and second pi-'s
       DO 301 KK=1,2
        DO 302 I=1,4
         PA(I)=PP(KK,I)
         PB(I)=PP(3-KK,I)
 302    CONTINUE
C --- lorentz invariants
         QQA=0.0
         SS23=0.0
         SS24=0.0
         SS34=0.0
         QP1P2=0.0
         QP1P3=0.0
         QP1P4=0.0
         P1P2 =0.0
         P1P3 =0.0
         P1P4 =0.0
        DO 303 K=1,4
                     SIGN=-1.0
         IF (K.EQ.4) SIGN= 1.0
         QQA=QQA+SIGN*(PAA(K)-PA(K))**2
         SS23=SS23+SIGN*(PB(K)  +PIM3(K))**2
         SS24=SS24+SIGN*(PB(K)  +PIM4(K))**2
         SS34=SS34+SIGN*(PIM3(K)+PIM4(K))**2
         QP1P2=QP1P2+SIGN*(PAA(K)-PA(K))*PB(K)
         QP1P3=QP1P3+SIGN*(PAA(K)-PA(K))*PIM3(K)
         QP1P4=QP1P4+SIGN*(PAA(K)-PA(K))*PIM4(K)
         P1P2=P1P2+SIGN*PA(K)*PB(K)
         P1P3=P1P3+SIGN*PA(K)*PIM3(K)
         P1P4=P1P4+SIGN*PA(K)*PIM4(K)
 303    CONTINUE
C
        FORM2=COEF2*(BWIGN(QQ,AMRO,GAMRO)+ELPHA*BWIGN(QQ,AMROP,GAMROP))
C        FORM3=BWIGN(QQA,AMOM,GAMOM)*(BWIGN(SS23,AMRO,GAMRO)+
C     $        BWIGN(SS24,AMRO,GAMRO)+BWIGN(SS34,AMRO,GAMRO))
        FORM3=BWIGN(QQA,AMOM,GAMOM)
C
        DO 304 K=1,4
         HADCUR(K)=HADCUR(K)+FORM2*FORM3*(
     $             PB  (K)*(QP1P3*P1P4-QP1P4*P1P3)
     $            +PIM3(K)*(QP1P4*P1P2-QP1P2*P1P4)
     $            +PIM4(K)*(QP1P2*P1P3-QP1P3*P1P2) )
 304    CONTINUE
 301   CONTINUE
C
      ELSE
C ===================================================================
C pi0 pi0 p0 pi- case                                            ====
C ===================================================================
       QQ=PAA(4)**2-PAA(3)**2-PAA(2)**2-PAA(1)**2
       DO 101 K=1,3
C --- loop over thre contribution of the non-omega current
        SK=(PP(K,4)+PIM4(4))**2-(PP(K,3)+PIM4(3))**2
     $    -(PP(K,2)+PIM4(2))**2-(PP(K,1)+PIM4(1))**2
C -- definition of AA matrix
C -- cronecker delta
        DO 102 I=1,4
         DO 103 J=1,4
 103     AA(I,J)=0.0
 102    AA(I,I)=1.0
C
C ... and the rest ...
        DO 104 L=1,3
         IF (L.NE.K) THEN
          DENOM=(PAA(4)-PP(L,4))**2-(PAA(3)-PP(L,3))**2
     $         -(PAA(2)-PP(L,2))**2-(PAA(1)-PP(L,1))**2
          DO 105 I=1,4
          DO 105 J=1,4
                      SIG=1.0
           IF(J.NE.4) SIG=-SIG
           AA(I,J)=AA(I,J)
     $            -SIG*(PAA(I)-2.0*PP(L,I))*(PAA(J)-PP(L,J))/DENOM
 105      CONTINUE
         ENDIF
 104    CONTINUE
C --- let's add something to HADCURR
       FORM1= FPIKM(SQRT(SK),AMPI,AMPI) *FPIKM(SQRT(QQ),AMPI,AMPI)
C       FORM1= FPIKM(SQRT(SK),AMPI,AMPI) *FPIKMD(SQRT(QQ),AMPI,AMPI)
CCCCCCCCCCCCC       FORM1=WIGFOR(SK,AMRO,GAMRO)        (tests)
        DO 106 I=1,4
        DO 106 J=1,4
         HADCUR(I)=
     $   HADCUR(I)+CMPLX(COEF1)*FORM1*AA(I,J)*(PP(K,J)-PP(4,J))
 106    CONTINUE
C --- end of the non omega current (3 possibilities)
 101   CONTINUE
      ENDIF
      END
      FUNCTION WIGFOR(S,XM,XGAM)
      IMPLICIT INTEGER (I-N), REAL (A-H,O-Z)
      COMPLEX WIGFOR,WIGNOR
      WIGNOR=CMPLX(-XM**2,XM*XGAM)
      WIGFOR=WIGNOR/CMPLX(S-XM**2,XM*XGAM)
      END
 

      SUBROUTINE CHOICE(MNUM,RR,ICHAN,PROB1,PROB2,PROB3,
     $            AMRX,GAMRX,AMRA,GAMRA,AMRB,GAMRB)
C
      IMPLICIT NONE
C
      COMMON / PARMAS / AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
C
      REAL*4            AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
C
C  Declare arguments and local variables
C
      INTEGER      MNUM, ICHAN
      REAL*4       RR,PROB1,PROB2,PROB3,AMRX,GAMRX,AMRA,GAMRA,AMRB,GAMRB
      REAL*4      AMROP, GAMROP, AMOM, GAMOM
      REAL*4      AX, GX, PX, APKMAS
C
      AMROP=1.1
      GAMROP=0.36
      AMOM=.782
      GAMOM=0.0084
C     XXXXA CORRESPOND TO S2 CHANNEL !
      IF(MNUM.EQ.0) THEN
       PROB1=0.5
       PROB2=0.5
       AMRX =AMA1
       GAMRX=GAMA1
       AMRA =AMRO
       GAMRA=GAMRO
       AMRB =AMRO
       GAMRB=GAMRO
      ELSEIF(MNUM.EQ.1) THEN
       PROB1=0.5
       PROB2=0.5
       AMRX =1.57
       GAMRX=0.9
       AMRB =AMKST
       GAMRB=GAMKST
       AMRA =AMRO
       GAMRA=GAMRO
      ELSEIF(MNUM.EQ.2) THEN
       PROB1=0.5
       PROB2=0.5
       AMRX =1.57
       GAMRX=0.9
       AMRB =AMKST
       GAMRB=GAMKST
       AMRA =AMRO
       GAMRA=GAMRO
      ELSEIF(MNUM.EQ.3) THEN
       PROB1=0.5
       PROB2=0.5
       AMRX =1.27
       GAMRX=0.3
       AMRA =AMKST
       GAMRA=GAMKST
       AMRB =AMKST
       GAMRB=GAMKST
      ELSEIF(MNUM.EQ.4) THEN
       PROB1=0.5
       PROB2=0.5
       AMRX =1.27
       GAMRX=0.3
       AMRA =AMKST
       GAMRA=GAMKST
       AMRB =AMKST
       GAMRB=GAMKST
      ELSEIF(MNUM.EQ.5) THEN
       PROB1=0.5
       PROB2=0.5
       AMRX =1.27
       GAMRX=0.3
       AMRA =AMKST
       GAMRA=GAMKST
       AMRB =AMRO
       GAMRB=GAMRO
      ELSEIF(MNUM.EQ.6) THEN
       PROB1=0.4
       PROB2=0.4
       AMRX =1.27
       GAMRX=0.3
       AMRA =AMRO
       GAMRA=GAMRO
       AMRB =AMKST
       GAMRB=GAMKST
      ELSEIF(MNUM.EQ.7) THEN
       PROB1=0.0
       PROB2=1.0
       AMRX =1.27
       GAMRX=0.9
       AMRA =AMRO
       GAMRA=GAMRO
       AMRB =AMRO
       GAMRB=GAMRO
      ELSEIF(MNUM.EQ.8) THEN
       PROB1=0.0
       PROB2=1.0
       AMRX =AMROP
       GAMRX=GAMROP
       AMRB =AMOM
       GAMRB=GAMOM
       AMRA =AMRO
       GAMRA=GAMRO
      ELSEIF(MNUM.EQ.101) THEN
       PROB1=.35
       PROB2=.35
       AMRX =1.2
       GAMRX=.46
       AMRB =AMOM
       GAMRB=GAMOM
       AMRA =AMOM
       GAMRA=GAMOM
      ELSEIF(MNUM.EQ.102) THEN
       PROB1=0.0
       PROB2=0.0
       AMRX =1.4
       GAMRX=.6
       AMRB =AMOM
       GAMRB=GAMOM
       AMRA =AMOM
       GAMRA=GAMOM
      ELSE
       PROB1=0.0
       PROB2=0.0
       AMRX =AMA1
       GAMRX=GAMA1
       AMRA =AMRO
       GAMRA=GAMRO
       AMRB =AMRO
       GAMRB=GAMRO
      ENDIF
C
      IF    (RR.LE.PROB1) THEN
       ICHAN=1
      ELSEIF(RR.LE.(PROB1+PROB2)) THEN
       ICHAN=2
        AX   =AMRA
        GX   =GAMRA
        AMRA =AMRB
        GAMRA=GAMRB
        AMRB =AX
        GAMRB=GX
        PX   =PROB1
        PROB1=PROB2
        PROB2=PX
      ELSE
       ICHAN=3
      ENDIF
C
      PROB3=1.0-PROB1-PROB2
      END

      REAL*4 FUNCTION DCDMAS(IDENT)
C
      IMPLICIT NONE
C
      COMMON / PARMAS / AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
C
      REAL*4            AMTAU,AMNUTA,AMEL,AMNUE,AMMU,AMNUMU
     *                 ,AMPIZ,AMPI,AMRO,GAMRO,AMA1,GAMA1
     *                 ,AMK,AMKZ,AMKST,GAMKST
C
C  Declare arguments and locals
C
      INTEGER      IDENT
      REAL*4      APKMAS
C
      IF      (IDENT.EQ. 1) THEN
        APKMAS=AMPI
      ELSEIF  (IDENT.EQ.-1) THEN
        APKMAS=AMPI
      ELSEIF  (IDENT.EQ. 2) THEN
        APKMAS=AMPIZ
      ELSEIF  (IDENT.EQ.-2) THEN
        APKMAS=AMPIZ
      ELSEIF  (IDENT.EQ. 3) THEN
        APKMAS=AMK
      ELSEIF  (IDENT.EQ.-3) THEN
        APKMAS=AMK
      ELSEIF  (IDENT.EQ. 4) THEN
        APKMAS=AMKZ
      ELSEIF  (IDENT.EQ.-4) THEN
        APKMAS=AMKZ
      ELSEIF  (IDENT.EQ. 8) THEN
        APKMAS=0.0001
      ELSEIF  (IDENT.EQ.-8) THEN
        APKMAS=0.0001
      ELSEIF  (IDENT.EQ. 9) THEN
        APKMAS=0.5488
      ELSEIF  (IDENT.EQ.-9) THEN
        APKMAS=0.5488
      ELSE
        PRINT *, 'STOP IN APKMAS, WRONG IDENT=',IDENT
        STOP
      ENDIF
      DCDMAS=APKMAS
      RETURN
      END

      INTEGER FUNCTION LUNPIK(ID,ISGN)
C
      IMPLICIT NONE
C
      COMMON / TAUKLE / BRA1,BRK0,BRK0B,BRKS
      REAL*4            BRA1,BRK0,BRK0B,BRKS
C
C  Declare arguments and locals
C
      INTEGER      IDENT, ID, ISGN
      INTEGER      IPKDEF
      REAL*4      XIO
C
      IDENT=ID*ISGN
      IF      (IDENT.EQ. 1) THEN
        IPKDEF=-211
      ELSEIF  (IDENT.EQ.-1) THEN
        IPKDEF= 211
      ELSEIF  (IDENT.EQ. 2) THEN
        IPKDEF=111
      ELSEIF  (IDENT.EQ.-2) THEN
        IPKDEF=111
      ELSEIF  (IDENT.EQ. 3) THEN
        IPKDEF=-321
      ELSEIF  (IDENT.EQ.-3) THEN
        IPKDEF= 321
      ELSEIF  (IDENT.EQ. 4) THEN
C
C K0 --> K0_LONG (IS 130) / K0_SHORT (IS 310) = 1/1
        CALL TDRAND(XIO,1)
        IF (XIO.GT.BRK0) THEN
          IPKDEF= 130
        ELSE
          IPKDEF= 310
        ENDIF
      ELSEIF  (IDENT.EQ.-4) THEN
C
C K0B--> K0_LONG (IS 130) / K0_SHORT (IS 310) = 1/1
        CALL TDRAND(XIO,1)
        IF (XIO.GT.BRK0B) THEN
          IPKDEF= 130
        ELSE
          IPKDEF= 310
        ENDIF
      ELSEIF  (IDENT.EQ. 8) THEN
        IPKDEF= 22
      ELSEIF  (IDENT.EQ.-8) THEN
        IPKDEF= 22
      ELSEIF  (IDENT.EQ. 9) THEN
        IPKDEF= 221
      ELSEIF  (IDENT.EQ.-9) THEN
        IPKDEF= 221
      ELSE
        PRINT *, 'STOP IN IPKDEF, WRONG IDENT=',IDENT
        STOP
      ENDIF
      LUNPIK=IPKDEF
      RETURN
      END


