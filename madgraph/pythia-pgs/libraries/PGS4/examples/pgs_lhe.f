c--------------------------------------------------------
c  PGS - Pretty Good Simulation main program
c
c        Version 4.0
c
c    This example main program reads LHE files, runs
c    PYTHIA on them, and allows the user to analyze the
c    result.
c
c   Usage:  lhe <input.lhe> [n_print] [log_file] [user_output_file]
c
c   Here <> is required, [] is optional
c
c
c                          John Conway  April 2006
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
      include 'pgs.inc'  ! user needs to modify path

c PGS parameter file

      pgs_param_file = 'pars/lhc.par'      ! detector parameters

c set option: 'PYTHIA', 'ISAJET', 'FILE', 'USER'

      optpgs = 'USER' ! user is responsible for filling HEPEVT

      nevpgs = 100000000 ! very big number

c get input file name from first argument

      if(numarg.lt.1) then
        print '('' PGS_USER_INIT: user must specify input LHE file'')'
        stop
      else
        pgs_input_file = pgs_args(1)
      endif

c number of events to print (default = 1)

      if(numarg.ge.2) then
        read(pgs_args(2),'(i8)') nprpgs
      else
        nprpgs = 1
      endif

c log file

      if(numarg.ge.3) then
        pgs_log_file = pgs_args(3)
      else
        pgs_log_file = 'pgs_lhe.log'   
      endif

      open(pgs_log_unit,file=pgs_log_file,status='new')

c output file (used by pgs_user_analysis, optionally)

      if(numarg.ge.4) then
        pgs_output_file = pgs_args(4)
      else
        pgs_output_file = 'pgs_lhe.out'
      endif

c set up PGS

      call pgs_initialize

      return
      end


      subroutine pgs_user_pythia

c set up beam type and energy for PYTHIA here

c      call pyinit('CMS','p','p',14000.0d0)   !  14 TeV p-p

c      call pylist(12)  ! need a list of decay modes?  
c      stop

      return
      end


      subroutine pgs_user_analysis(command)

c routine to perform user's analysis 

      implicit none
      include 'pgs.inc'  ! user needs to modify path

      character*3 command,yes

      integer i,j,ihep,iobj

      real*4 xtu(100)

c initialize ---------------------------------------------

      if(command.eq.'ini') then

c here is where user opens output file

      endif      

c analyze event ------------------------------------------

      if(command.eq.'evt') then

        do iobj=1,numobj
          if(unique(iobj).and.typobj(iobj).eq.4) then  ! unique jet objects
            xtu(1) = et_obj(iobj)
            xtu(2) = eta_obj(iobj)
            xtu(3) = phi_obj(iobj)
            xtu(4) = pobj(4,iobj)
            xtu(5) = vecobj(5,iobj)
          endif
        enddo

      endif

c done - wrap up -----------------------------------------

      if(command.eq.'end') then

      endif      

      return
      end


      subroutine pgs_user_event(done)

c This routine is a hook, called when optpgs = 'USER';
c the user must load the HEPEVT common block on theor own.
c
c In this case, we will open the LHE file (pgs_input_file)
c and begin processing it.

      implicit none

      include 'pgs.inc'

      logical first,done

      data first/.true./

      integer lun
      character*3 chlun

c Pythia parameters
      integer mstp,msti
      real*8  parp,pari
      common/pypars/mstp(200),parp(200),msti(200),pari(200)     

c first time in, initialize

      if(first) then

c open LHEF file on unit LUN, and tell Pythia where to find it

        lun = 88
        open(lun,file=pgs_input_file)
        write(chlun,'(i3)') lun
        call pygive('MSTP(161)='//CHLUN)
        call pygive('MSTP(162)='//CHLUN)

c initialize Pythia

        call pyinit('USER',' ',' ',0D0) 

        first = .false.

      endif

c on ordinary processing, let Pythia do the work!

      call pyevnt

c check for end of file condition

      if(msti(51).eq.1) then
        done = .true.
        print '('' pgs_user_event: end of LHE file detected '')'
        call flush(6)
        return
      endif      

      done = .false.

c translate PYTHIA event to STDHEP common blocks
      call lunhep(1)

c print out event
      lnhout = pgs_log_unit
      if (nevhep.le.nprpgs) call heplst(1)

      return
      end




      subroutine pgs_user_herwig
      return
      end

