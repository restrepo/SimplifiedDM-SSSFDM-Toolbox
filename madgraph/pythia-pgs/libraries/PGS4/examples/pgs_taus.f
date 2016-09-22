c--------------------------------------------------------
c  PGS - Pretty Good Simulation main program
c
c        Version 4.0
c
c    This example main program generates PYTHIA events
c    and does a study of reconstructed taus efficiency
c    events.
c
c                          John Conway  March 1998
c                                       March 2001
c                                       Sept  2005
c--------------------------------------------------------

      program pgs

      logical pgs_next_event

c -------------------------------------------------------

c get pgs_user arguments and set values to control program

      call pgs_user_args

c initialize PGS

      call pgs_user_init 

c initialize user analysis

      call pgs_user_analysis('ini')      

c read or generate next event; events stored in HEPEVT
c common block format; returns false when finished

      do while(pgs_next_event())

c run TAUOLA - user MUST turn off tau decays for this
c to work; presently PGS treats pi0s and etas
c from tau decay as if they were gammas, since TAUOLA
c does not decay them yet

        call tauola_scan

c perform standard and user triggers on event;
c store results in common blocks in pgs.inc include file

        call pgs_trigger       

c perform reconstruction; results stored in common

        call pgs_recon

c perform user analysis (user supplies this routine);
c this calculates analysis cuts, stores ntuples, etc.

        call pgs_user_analysis('evt')

      enddo

      call pgs_user_analysis('end')

      end


      subroutine pgs_user_init

c user initialization routine

      implicit none
      include '../src/pgs.inc'  ! user needs to modify path

c PGS parameter file

      pgs_param_file = 'pars/lhc.par'      ! detector parameters

c set option: 'PYTHIA', 'ISAJET', 'FILE'

      if(numarg.ge.1) then
        optpgs = pgs_args(1)
      else
        optpgs = 'PYTHIA'
      endif

c set number of events to generate

      if(numarg.ge.2) then
        read(pgs_args(2),'(i8)') nevpgs
      else
        nevpgs = 10000
      endif

c number of events to print

      if(numarg.ge.3) then
        read(pgs_args(3),'(i8)') nprpgs
      else
        nprpgs = 5
      endif

c PYTHIA card file name

      if(optpgs(1:6).eq.'PYTHIA') then
        if(numarg.ge.4) then
          read(pgs_args(4),'(a)') pgs_pythia_cards
        else
          pgs_pythia_cards = 'cards/att.pyt'   ! process to generate, decays, etc.
        endif
      endif ! add more possibilities later?

c output file name

      if(numarg.ge.5) then
        read(pgs_args(5),'(a)') pgs_output_file
      else
        pgs_output_file = 'taueff.ntu'   
      endif

c log file

      if(numarg.ge.6) then
        read(pgs_args(6),'(a)') pgs_log_file
      else
        pgs_log_file = 'taus.log'   
      endif

      open(pgs_log_unit,file=pgs_log_file,status='new')

c set up PGS

      call pgs_initialize

      return
      end


      subroutine pgs_user_pythia

c set up beam type and energy for PYTHIA here

      call pyinit('CMS','p','p',14000.0d0) !  14 TeV p-p

c      call pylist(12)
c      stop

      return
      end


      subroutine pgs_user_analysis(command)

c routine to perform user's analysis 

      implicit none
      include '../src/pgs.inc'  ! user needs to modify path

      character*3 command

      integer i,j,ieta,iphi,iclu,ihep,iobj,itau,nlep

      real xtu(100)

      real*8 ct,ctmax

      character*8 namobj(0:4)
      data namobj /'photon','electron','muon','tau','jet'/

      logical interesting

c pgs_tau_decay_mode arguments

      integer jtau,dmode,mch
      real*8 ettau,evis,etvis,mvis,etagen,ptmax,ptmin,pvis(4),pneu(4)
      real*8 eneu,etneu,mneu,mtot,etot,ptot(4),erec
      real*8 cost,sint,xi,emfrac

      real*8 mtau
      parameter(mtau=1.77)

c initialize ---------------------------------------------

      if(command.eq.'ini') then

c book histos/ntuples  (here, Conway's simple ntuple package)

      call ntuset(1,40,'tau efficiency',pgs_output_file,1) 

c initialize statistics arrays

      endif      


c analyze event ------------------------------------------

      if(command.eq.'evt') then

c process trigger info

c calculate event selection quantities

c fill ntuple/histograms for tau efficiency ntuple

        call vzero(xtu,100)

        do ihep=1,nhep
          if(abs(idhep(ihep)).eq.15) then           ! generated tau

c get generated tau decay mode

            call pgs_tau_decay_mode(ihep,dmode,ettau,etagen,
     .                              pvis,pneu,ptmax,ptmin,mch)  

c            print '(2i5,6f15.5,i5)',ihep,dmode,ettau,etagen,
c     .                              pvis,pneu,ptmax,ptmin,mch

c get visible particle invariant mass (using PGS function calls)

            mvis  = v4mass(pvis)
            etvis = v4et(pvis)
            evis = pvis(4)

            mneu =  v4mass(pneu)
            etneu = v4et(pneu)
            eneu =  pneu(4)

c get complete tau decay total 4-momentum

            do j=1,4
              ptot(j) = pvis(j)+pneu(j)
            enddo

            mtot = v4mass(ptot)
            etot = ptot(4)

            cost = cos_theta(pvis,ptot)
            sint = sqrt(1.0-cost**2)

            erec = pvis(4)
            if(mvis.gt.0.09) erec = pvis(4)*mtau**2/mvis**2            

            if(dmode.ne.0) then

              xtu(1)  = nevhep        ! event number
              xtu(2)  = dmode         ! decay mode
              xtu(3)  = eta_gen(ihep) ! gen. eta
              xtu(4)  = phi_gen(ihep) ! gen. phi
              xtu(5)  = ettau         ! ET of decay products (inc. nu)
              xtu(6)  = etvis         ! visible ET 
              xtu(7)  = evis          ! visible E
              xtu(8)  = mvis          ! visible mass
              xtu(9)  = etagen        ! visible eta
              xtu(10) = ptmax         ! max track pt
              xtu(11) = ptmin         ! min track pt
              xtu(12) = mch           ! track multiplicity
              xtu(13) = phep(4,ihep)  ! generated tau energy
              xtu(14) = erec          ! reconstructed tau energy
              xtu(15) = erec-phep(4,ihep)
              xtu(16) = eneu
              xtu(17) = mneu
              xtu(18) = etot
              xtu(19) = mtot
              xtu(20) = sint

c look for nearest reconstructed tau

              itau = 0
              ctmax = -1.
              do iobj=1,numobj
c               if(unique(iobj).and.typobj(iobj).eq.3) then  ! reconstructed tau (unique)
                if(typobj(iobj).eq.3) then                   ! reconstructed tau (not unique)
                  ct = cos_theta(phep(1,ihep),pobj(1,iobj))
                  if(ct.gt.ctmax.and.ct.gt.0.5) then
                    ctmax = ct
                    itau = iobj
                  endif
                endif
              enddo

              if(itau.ne.0) then

                xi = vecobj(2,itau)/vecobj(3,itau)
                emfrac = vecobj(1,itau)/(vecobj(1,itau)+vecobj(2,itau))

                xtu(21) = itau
                xtu(22) = ctmax
                xtu(23) = eta_obj(itau)   ! eta
                xtu(24) =   pobj(4,itau)  ! E(total)
                xtu(25) = vecobj(1,itau)  ! EM energy
                xtu(26) = vecobj(2,itau)  ! HAD  energy
                xtu(27) = vecobj(3,itau)  ! track energy
                xtu(28) = vecobj(4,itau)  ! track multiplicity (in tau cone)
                xtu(29) = vecobj(5,itau)  ! cluster width
                xtu(30) = vecobj(6,itau)  ! mtau
                xtu(31) = vecobj(7,itau)  ! maximum track pt   
                xtu(32) = vecobj(8,itau)  ! alpha (min. angle to track not in tau cone)
                xtu(33) = vecobj(9,itau)  ! npi0_cone
                xtu(34) = vecobj(10,itau) ! npi0_iso
                xtu(35) = xi              ! electron cut variable
                xtu(36) = emfrac          ! EM fraction xi 
                xtu(37) = et_obj(itau)    ! ET
                xtu(38) = pobj(4,itau)/evis
              endif
  
              call ntufil(1,xtu)  ! fill ntuple entry (Conway's simple ntuple package)

            endif
          endif
        enddo

c print out info

        interesting = .false.

        nlep = 0
        do iobj=1,numobj
          if(unique(iobj)) then
            if(typobj(iobj).gt.0.and.typobj(iobj).le.3
     .           .and.et_obj(iobj).gt.20.) then
              nlep = nlep + 1
            endif
          endif
        enddo

        if(nlep.ge.2) interesting = .true.

        if(interesting) then
c        if(.true.) then

          print '('' NEVHEP, NHEP, TRG, TRK, OBJ, CLU: '',6i6)',
     .       nevhep,nhep,numtrg,numtrk,numobj,numclu

          print '(/,''  object  type         ET      vector''  )'

          do iobj=1,numobj
            if(unique(iobj)) then
              print '(i6,2x,L1,4x,a8,11f8.2)',
     .         iobj,unique(iobj),namobj(typobj(iobj)),et_obj(iobj),
     .         (vecobj(i,iobj),i=1,10)
            endif
          enddo

        endif

      endif      

c done - wrap up -----------------------------------------

      if(command.eq.'end') then

c close ntuple/histogram files

c write out statistics

      endif      

      return
      end


      subroutine pgs_user_event

c dummy routine to make linker happy

      return
      end

      subroutine pgs_user_herwig

c dummy routine to make linker happy

      return
      end

      subroutine pgs_user_trig

c dummy routine to make linker happy

      return
      end
