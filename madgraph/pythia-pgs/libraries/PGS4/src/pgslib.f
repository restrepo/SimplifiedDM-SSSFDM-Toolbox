c --------------------------------------------------------------
c
c PGS library - Pretty Good Simulation subroutines
c
c               Version 4   April 2006
c
c --------------------------------------------------------------
c
c This file contains the main body of the PGS package,
c arranged in several sections:
c
c    1. I/O and MC interface routines
c    2. trigger routines
c    3. reconstruction routines
c    4. user-callable routines and functions
c
c --------------------------------------------------------------
c 
c  calling sequence
c  ----------------
c
c    pgs_(main)                     main program (supplied by user)
c    |
c    |----> pgs_user_args           get arguments supplied by user if any
c    |
c    |----> pgs_user_init           initialize user-specific items (supplied by user, or args)
c    |      |
c    |      |---> pgs_initialize    initialize PGS
c    |            
c    |----> pgs_next_event          generate next event; store in STDHEP arrays
c    |      |
c    |      |---> pgs_read_event    read event from file           (if option set in pgs_user_init)
c    |      |---> pyevnt            generate PYTHIA event          (if option set in pgs_user_init)
c    |      |---> lunhep            translate to STDHEP (HEPEVT)
c    |      |---> isaevt            generate ISAJET event          (if option set in pgs_user_init)
c    |      |---> isahep            translate to STDHEP (HEPEVT)
c    |      |---> pgs_herwig_event  generate HERWIG event          (if option set in pgs_user_init)
c    |      |---> pgs_user_event    user fills her own HEPEVT list (if option set in pgs_user_init)
c    |
c    |----> tauola_scan             redecay taus with TAUOLA
c    |
c    |----> pgs_trigger             simulate, then find list of trigger objects
c    |      |
c    |      |---> pgs_find_tracks               make track list
c    |      |---> pgs_fill_cal                  fill calorimeter energy array
c    |      |---> pgs_find_trigger_clusters     find calorimeter energy clusters
c    |      |
c    |      |---> pgs_find_photon_electron_trig     \
c    |      |---> pgs_find_muon_trig                 |
c    |      |---> pgs_find_tau_trig                   >  find trigger objects
c    |      |---> pgs_find_jet_trig                  |
c    |      |---> pgs_find_vertex_trig  (NYI)        |
c    |      |---> pgs_find_met_trig                 /
c    |
c    |----> pgs_recon               find list of reconstructed objects
c    |      |
c    |      |---> pgs_kt_jets_bad                   jet reconstruction with kt algorithm (old version with bug)
c    |      |---> pgs_kt_jets                       jet reconstruction with kt, antikt, or CA algorithm
c    |      |
c    |      |---> pgs_find_photon_electron          \
c    |      |---> pgs_find_muons                     |
c    |      |---> pgs_find_taus                       > find unique physics objects
c    |      |---> pgs_find_jets                      |
c    |      |---> pgs_find_heavy                     |
c    |      |---> pgs_unique_id                     /
c    |
c    |----> pgs_user_analysis       perform user analysis (supplied by user)
c           |
c           |---> pgs_write_event   write out event (optional)
c
c --------------------------------------------------------------

c  --------------------------------
c  1. I/O and MC interface routines
c  --------------------------------

      subroutine pgs_initialize

c standard initialization routine

      implicit none
      include 'pgs.inc'
      include 'exthep/alpsho.inc'

      integer lok,flag,ios

      logical pgs_read_event

c     external aldata
c      external pydata

      character*80 line
      character*1 yes

C     for ALPGEN herwig interface
      integer icount, iproc

c a few pre-set items

      data pgs_log_unit/86/
      data pgs_log_file/'pgs.log'/
      data pgs_iseed,pgs_jseed/1,1/

c steal PYTHIA common block to shut it up at the beginning

      INTEGER MSTU,MSTJ
      DOUBLE PRECISION PARU,PARJ
      COMMON/PYDAT1/MSTU(200),PARU(200),MSTJ(200),PARJ(200)

c record version in log

      print '('' -------------------------------------- '')'
      print '('' |       PGS 4 - release 120611       | '')'
      print '('' -------------------------------------- '')'

c load PGS parameters

      call pgs_load_param

c initialize STDTBL - this relies on the STDHEP Unix
c environmental variable PDG_MASS_TBL

      lnhout = pgs_log_unit

      if (lnhdcy.eq.0) lnhdcy=30 
      call pdgrdtb

c FILE option - open input file and read begin run record

      if (optpgs(1:3).eq.'FIL') then

        if (.not.pgs_read_event('begin')) then
          write(pgs_log_unit,
     .          '('' PGS_INITIALIZE: read failure on'',
     .            '' begin run record: stop '')')
          stop
        endif

      endif

c PYTHIA option 

      if (optpgs(1:3).eq.'PYT') then

        write(line,'(''MSTU(11)='',i2)') pgs_log_unit
        MSTU(12) = 12345              ! prevent PYTHIA from dumping logo 
c        call pygive(line)             ! set output unit number to log file
c        call pylist(0)                ! now dump logo - to log file

c if user has specified input card file, open it and
c read in the cards, giving them to PYTHIA

        if (pgs_pythia_cards.ne.' ') then
          open (85, file=pgs_pythia_cards, status='old',
     .              form='formatted')
          ios = 0
          do while(ios.eq.0)
            read(85,fmt='(a)',iostat=ios) line
            if (ios.eq.0) then
              call pgs_remove_comments(line,80)
c              if(line.ne.' ') call pygive(line)
            endif
          enddo
          close(85)
        endif

c initialize PYTHIA (allow user to determine beam/energy)

        call pgs_user_pythia

c print PYTHIA particle decay table for reference
c        call pylist(12)
c        stop

      endif

c ISAJET option - open input card file (required for ISAJET)

      if (optpgs(1:3).eq.'ISA') then

        open(84, file=pgs_isajet_decay, status='old',
     .           form='formatted')

        open(85, file=pgs_isajet_cards, status='old',
     .           form='formatted')

c        call isaini(84, ! decay table   
c     .               0, ! no output
c     .              85, ! input card file (user-supplied)
c     .               6) ! standard output

c        call isabeg(flag)

        if (flag.ne.0)then
          write(pgs_log_unit,
     .       '('' PGS_INITIALIZE: error in ISABEG:'',i8)') flag
          stop
        endif

      endif

c HERWIG option

      if (optpgs(1:3).eq.'HER') then

c let user determine beam, energy, other items

        call pgs_user_herwig(pgs_herwig_proc)

c perform rest of initialization

        call pgs_init_herwig

      endif

c  ALPGEN options
     
      if (optpgs(1:6).eq.'ALPPYT') then !use pythia to shower
         write(line,'(''MSTU(11)='',i2)') pgs_log_unit
         mstu(12) = 12345       ! prevent PYTHIA from dumping logo 
c         call pygive(line)      ! set output unit number to log file
c         call pylist(0)         ! now dump logo - to log file       
c         call pygive('MDCY(15,1)=0')
c         call pygive('MSTP(143)=1') !turn on upveto
c         call pyinit('USER',' ',' ',0d0)         
      endif
     
      if  (optpgs(1:6).eq.'ALPHER') then ! use herwig to shower
         call pgs_init_alpher
      endif

      if (optpgs(1:3).eq.'ALP') then !common to ALPPYT and ALPHER
         if(nevpgs.le.0) then
            nevpgs = unwev        !unwev is number of events in unweighted event file
         elseif (nevpgs.gt.unwev) then
            write(pgs_log_unit,
     .             '('' requested too many events for file length'')')
            write(pgs_log_unit,
     .             '('' resetting number of events to'',i8)') unwev
            NEVPGS=UNWEV
         endif
      endif

c initialize TAUOLA 

      call tauola_init(pgs_log_unit)

      return
      end


      subroutine pgs_user_args

c scan for command line arguments

      implicit none

      include 'pgs.inc'

      logical done

      character*40 arg

      done = .false.
      numarg = 0

      do while(.not.done)
        call getarg(numarg+1,arg)
        if(arg.ne.' ') then
          numarg = numarg + 1
          pgs_args(numarg) = arg
        else
          done = .true.
        endif
      enddo      

      return
      end


      subroutine pgs_remove_comments(line,len)

      implicit none
      character*(*) line
      integer i,len

      logical comment

      comment = .false.

      do i=1,len
        if(line(i:i).eq.'!') comment = .true.
        if(comment) line(i:i) = ' ' 
      enddo

      return
      end


      subroutine pgs_load_param

      implicit none

      character*20 param_name

      include 'pgs.inc'

      if(pgs_param_file.eq.' ') pgs_param_file = 'pgs.par'

      open(84,file=pgs_param_file,status='old')           

      read(84,'(a20)') param_name
      read(84,'(i10)') netacal
      read(84,'(i10)') nphical
      read(84,'(f15.8)') deta
      read(84,'(f15.8)') dphi
      read(84,'(f15.8)') ecal_res_a
      read(84,'(f15.8)') ecal_res_b
      read(84,'(f15.8)') hcal_res
      read(84,'(f15.8)') met_res
      read(84,'(f15.8)') crack_frac
      read(84,'(a8)')    jet_alg
      read(84,'(f15.8)') seed_thresh
      read(84,'(f15.8)') shoulder_thresh
      read(84,'(f15.8)') conesize
      read(84,'(f15.8)') rmax
      read(84,'(f15.8)') bfield
      read(84,'(f15.8)') sagitta_res
      read(84,'(f15.8)') eff_track
      read(84,'(f15.8)') min_track_pt
      read(84,'(f15.8)') eta_max_track
      read(84,'(f15.8)') eta_max_egamma
      read(84,'(f15.8)') eta_max_muon
      read(84,'(f15.8)') eta_max_tau

      close(84)

      write(pgs_log_unit,'(//,''  PGS parameters '')')
      write(pgs_log_unit,'(   '' ----------------'',/)')

      write(pgs_log_unit,
     .  '('' --> parameter set representing '',a10,/)')   param_name

      write(pgs_log_unit,
     .  '(''  number of eta cells in calorimeter: '',i10)')  
     .                                                      netacal  
      write(pgs_log_unit,
     .  '(''  number of phi cells in calorimeter: '',i10)')   
     .                                                      nphical  
      write(pgs_log_unit,
     .  '(''           width of each cell in eta: '',f15.8)') 
     .                                                      deta   
      write(pgs_log_unit,
     .  '(''           width of each cell in phi: '',f15.8)') 
     .                                                      dphi   
      write(pgs_log_unit,
     .  '(''       em calorimeter resolution (a): '',f15.8)')   
     .                                                      ecal_res_a 
      write(pgs_log_unit,
     .  '(''       em calorimeter resolution (b): '',f15.8)')   
     .                                                      ecal_res_b  
      write(pgs_log_unit,
     .  '(''       hadron calorimeter resolution: '',f15.8)')
     .                                                      hcal_res   
      write(pgs_log_unit,
     .  '(''              trigger MET resolution: '',f15.8)')
     .                                                      met_res    
      write(pgs_log_unit,
     .  '(''calorimeter cell edge crack fraction: '',f15.8)')
     .                                                      crack_frac 
      write(pgs_log_unit,
     .  '('' jet finding algorithm (cone, ktjet): '',a)')
     .                                                      jet_alg
      write(pgs_log_unit,
     .  '(''        cluster seed tower threshold: '',f15.8)')
     .                                                      seed_thresh
      write(pgs_log_unit,
     .  '(''    cluster shoulder tower threshold: '',f15.8)')
     .                                                  shoulder_thresh
      write(pgs_log_unit,
     .  '(''            cluster finder cone size: '',f15.8)')
     .                                                      conesize   
      write(pgs_log_unit,
     .  '(''        outer radius of tracking (m): '',f15.8)')
     .                                                      rmax
      write(pgs_log_unit,
     .  '(''                  magnetic field (T): '',f15.8)')
     .                                                 bfield
      write(pgs_log_unit,
     .  '(''              sagitta resolution (m): '',f15.8)')
     .                                                 sagitta_res
      write(pgs_log_unit,
     .  '(''                    track efficiency: '',f15.8)')
     .                                                 eff_track 
      write(pgs_log_unit,
     .  '(''                    minimum track pt: '',f15.8)')
     .                                                 min_track_pt 
      write(pgs_log_unit,
     .  '(''               tracking eta coverage: '',f15.8)')
     .                                                 eta_max_track 
      write(pgs_log_unit,
     .  '(''                e/gamma eta coverage: '',f15.8)')
     .                                                 eta_max_egamma
      write(pgs_log_unit,
     .  '(''                   muon eta coverage: '',f15.8)')
     .                                                 eta_max_muon
      write(pgs_log_unit,
     .  '(''                    tau eta coverage: '',f15.8)')
     .                                                 eta_max_tau

      write(pgs_log_unit,'(//)')      

      return
      end


      subroutine pgs_init_herwig

c do non user-specific initialization of HERWIG

c      include 'herwig65.inc'  ! contains implicit none 
c
c      integer pgs_random_seed
c
c      character*80 susy_file
c
cc initialize common blocks
c
c      call hwigin
c
c      prvtx = .false.
c      maxpr = 0
c      maxer = 10
c
cc initialize random seeds
c
c      nrn(1) = pgs_random_seed(1)
c      nrn(2) = pgs_random_seed(2)
c
cc input SUSY/top data
c
c      call pgs_herwig_susy_file(susy_file)
c
c      open(lrsusy,file=susy_file,status='old')
c
c      call hwissp
c
cc compute parameter dependent constants
c
c      call hwuinc
c
cc make taus stable 
c
c      call hwusta('TAU+    ')
c      call hwusta('TAU-    ')
c
cc use TAUOLA
c
c      taudec = 'TAUOLA'
c
cc initialize process
c
c      call hweini
c
      return
      end

      subroutine pgs_init_alpher
      
cc     do non user-specific initialization of HERWIG
c      
c      include 'herwig65.inc'    ! contains implicit none 
c      
c      iproc=-100
c      maxpr=0
c      prvtx = .false.
c      call hwigin
c      call hwuinc
cC      call hwabeg
c      call hwusta('TAU+    ')   !make taus stable for tauoloa
c      call hwusta('TAU-    ')
c      taudec = 'TAUOLA'
c      call hweini               !initialize elementary process
C      icount=0
      return
      end


      subroutine pgs_herwig_susy_file(susy_file)

c cut-out routine to pass file name to HERWIG initialization

      implicit none
      include 'pgs.inc'

      character*(*) susy_file

      susy_file = pgs_herwig_susy

      return
      end


      integer function pgs_random_seed(ij)

      implicit none 
      include 'pgs.inc'
      integer ij

      if(ij.eq.1) pgs_random_seed = pgs_iseed
      if(ij.eq.2) pgs_random_seed = pgs_jseed

      return
      end


      subroutine pgs_herwig_event

c generate HERWIG event (see hep/ph-0011363)

c      include 'herwig65.inc'  ! contains implicit none
c
c      integer gen_err
c
c      gen_err = 0
c      
c      call hwuine               ! initialize event 
c      call hwepro               ! generate hard process
c      call hwbgen               ! generate parton cascades
c      call hwdhob               ! heavy object decays
c      call hwcfor               ! cluster formation
c      call hwcdec               ! cluster decays
c      call hwdhad               ! unstable particle decays
c      call hwdhvy               ! heavy flavor hadron decays
c      call hwmevt               ! add soft underlying event
c      call hwufne               ! finish event
c
c      if(ierror.ne.0) then
c        gen_err = gen_err + 1
c        if(gen_err.gt.10) then
c           print '('' ---> more than 10 errors in pgs_herwig_event '')'
c           stop
c        endif
c      endif

      return
      end


      subroutine pgs_alpher_event

c generate HERWIG event (see hep/ph-0011363)

c      include 'HERWIG65.INC'    ! contains implicit none
c      external hwudat
c      integer gen_err
c      integer ipveto
c
c      gen_err = 0
c
c 1    call hwuine               ! initialize event 
c      call hwepro               ! generate hard process
c
cc     matching-driven veto
c
c      call upveto(ipveto)
c
c      if(ipveto.ne.0) then
c        call hwwarn('UPVETO',-1)  ! ATP modification
c      endif
c
c      call hwbgen               ! generate parton cascades
c      call hwdhob               ! heavy object decays
c      call hwcfor               ! cluster formation
c      call hwcdec               ! cluster decays
c      call hwdhad               ! unstable particle decays
c      call hwdhvy               ! heavy flavor hadron decays
c      call hwmevt               ! add soft underlying event
c      call hwufne               ! finish event
c      
c      if(ierror.ne.0) then
c         gen_err = gen_err + 1
c         if(gen_err.gt.10) then
c            print '('' ---> more than 10 errors in pgs_herwig_event '')'
c            stop
c       else
c          go to 1
c        endif
c      endif
c
      return
      end



      logical function pgs_next_event()

c read or generate next event; return false on error or end

      implicit none
      include 'pgs.inc'

      integer max_read, events_read, lok, isatry, ndum

      logical pgs_read_event,isokay,done

      data isatry /0/

c FILE

      if (optpgs(1:3).eq.'FIL') then

c return true status if normal read
        if (pgs_read_event('event')) then
          
          pgs_next_event = .true.

c return false if done (end run record) or error
        else

          call pgs_write_event('end') ! routine detects if this is needed
          pgs_next_event = .false.

        endif
      endif

c PYTHIA

      if (optpgs(1:3).eq.'PYT') then

cc hack to allow user to specify integrated luminosity
c        if(evtlum(1:2).eq.'pb') then
c          call stdflpyxsec(ndum)
c          nevpgs = target_lum * stdxsec * 1.0d09  ! target_lum is in pb-1, stdxsec is in mb
c          if(mod(nevhep,1000).eq.0 .or.
c     .       (nevhep.lt.100 .and.mod(nevhep,10) .eq.0) .or.
c     .       (nevhep.lt.1000.and.mod(nevhep,100).eq.0)) then
c            write(pgs_log_unit,'(/,'' estimated cross section: '',g15.5,
c     .                             '' pb'')') stdxsec*1.0d09
c            write(pgs_log_unit,'('' target number of events'',
c     .                           '' now '',i10)') nevpgs
c            call flush(pgs_log_unit)
c          endif
c          if(nevpgs.lt.10) then
c            nevpgs = 10
c            if(nevhep.gt.5.and.stdxsec.gt.0) then
c              write(pgs_log_unit,
c     .         '('' WARNING: target integrated luminosity'',
c     .           '' gives fewer than 10 events '')')
c              write(pgs_log_unit,'('' PYTHIA cross section '',g15.5,
c     .           '' pb'')') stdxsec*1.0d09
c            endif
c          endif
c        endif
c        
c        if (nevhep.lt.nevpgs) then
cc generate PYTHIA event; translate to HEPEVT
c          call pyevnt
c          call lunhep(1) ! increments nevhep
cc print out event
c          lnhout = pgs_log_unit
c          if (nevhep.le.nprpgs) call heplst(1)
c          pgs_next_event = .true.
c        else
c          call pgs_write_event('end') ! routine detects if this is needed
c          pgs_next_event = .false.
c          call stdflpyxsec(ndum)
c          write(pgs_log_unit,
c     .        '('' PGS_NEXT_EVENT: done generating PYTHIA events '')')
c          write(pgs_log_unit,
c     .        '(''                 cross section: '',g15.4,'' fb'')')
c     .                             stdxsec*1.0d12
c        endif
      endif

c ISAJET

      if (optpgs(1:3).eq.'ISA') then
c        if (nevhep.lt.nevpgs) then
cc generate ISAJET event
c          isokay = .false.
c          do while(.not.isokay)
c            isatry = isatry + 1
cc            call isaevt(isatry,isokay,done)
c          enddo
cc translate to HEPEVT
cc          call isahep(1) ! increments nevhep
cc          if (nevhep.le.nprpgs) call heplst(1)
c          pgs_next_event = .true.
c        else
cc          call isaend
c          call pgs_write_event('end') ! routine detects if this is needed
c          pgs_next_event = .false.
c        endif
      endif

c HERWIG

      if (optpgs(1:3).eq.'HER') then
c        if(nevhep.lt.nevpgs) then
c          call pgs_herwig_event
c          pgs_next_event = .true.
c        else
c          call hwefin
c          pgs_next_event = .false.
c        endif
      endif

c ALPGEN -> PYTHIA

      if (optpgs(1:6).eq.'ALPPYT') then
c         if (nevhep.lt.nevpgs) then
cc generate PYTHIA event; translate to HEPEVT
c            call pyevnt
c            call lunhep(1)      ! increments nevhep
cc print out event
c            lnhout = pgs_log_unit
c            if (nevhep.le.nprpgs) call heplst(1)
c            pgs_next_event = .true.
c         else
c            call pgs_write_event('end') ! routine detects if this is needed
c            pgs_next_event = .false.
c         endif  
      endif

c ALPGEN -> HERWIG

      if (optpgs(1:6).eq.'ALPHER') then
c         if(nevhep.lt.nevpgs) then
c            call pgs_herwig_event !note nevhep incremented internally
cc     print out event
c            lnhout = pgs_log_unit
c            if (nevhep.le.nprpgs) call heplst(1)
c            pgs_next_event = .true.
c         else
c            call hwefin
c            pgs_next_event = .false.
c         endif
      endif

c USER

      if (optpgs(1:3 ).eq.'USE') then
        if (nevhep.lt.nevpgs) then
          call pgs_user_event(done)  ! user fills HEPEVT common somehow
          pgs_next_event = .true.
          if(done) pgs_next_event = .false.
        else
          call pgs_write_event('end') ! routine detects if this is needed
          pgs_next_event = .false.
        endif
      endif

      return
      end


      subroutine pgs_write_event(command)

c write event to XDR binary output file 

      implicit none
      include 'pgs.inc'

      character*(*) command

      integer lok,istream

      logical first, open

      data first /.true./, open /.false./

      if (command(1:5).eq.'begin'.or.
     .   (command(1:5).eq.'event'.and.first)) then

c open file

        call stdxwinit(pgs_output_file,'PGS file',nevpgs,istream,lok)

        if (lok.ne.0) then
          write(pgs_log_unit,'('' PGS_WRITE_EVENT: open failure on'',
     .            '' output file: '',i5)') lok
          stop
        endif

        if (optpgs(1:3).eq.'PYT') call stdflpyxsec(nevpgs)
        if (optpgs(1:3).eq.'ISA') call stdflisxsec(nevpgs)

        call stdxwrt(100,istream,lok)  ! write STDHEP begin run record

        if (lok.ne.0) then
          write(pgs_log_unit,'('' PGS_WRITE_EVENT: write failure on'',
     .            '' begin run record: '',i5)') lok
          stop
        endif

        first = .false.
        open = .true.

      endif

c normal event write 

      if (command(1:5).eq.'event') then

        call stdxwrt(1,istream,lok)

        if (lok.ne.0) then
          write(pgs_log_unit,
     .       '('' PGS_WRITE_EVENT: failure writing event '',i5)') lok
        endif

      endif

c end of run; close output file

      if (command(1:3).eq.'end'.and.open) then

        if (optpgs(1:3).eq.'PYT') call stdflpyxsec(nevpgs)
        if (optpgs(1:3).eq.'ISA') call stdflisxsec(nevpgs)

        call stdxwrt(200,istream,lok)  ! write STDHEP end run record

        if (lok.ne.0) then
          write(pgs_log_unit,'('' PGS_WRITE_EVENT: write failure on'',
     .            '' end run record: '',i5)') lok
        endif

        call stdxend(istream)

        open = .false.

      endif

      return
      end



      logical function pgs_read_event(command)

c read event from XDR binary input file 

      implicit none
      include 'pgs.inc'

      character*(*) command

      integer lok,istream,itype

      logical first, open

      data first /.true./, open /.false./

      if (command(1:5).eq.'begin'.or.
     .   (command(1:5).eq.'event'.and.first)) then

c open file

        pgs_read_event = .true.

        call stdxropen(pgs_input_file,nevpgs,istream,lok)

        if (lok.ne.0) then
          write(pgs_log_unit,'('' PGS_READ_EVENT: open failure on'',
     .            '' input file: '',i5)') lok
          stop
        endif

        call stdxrd(itype,istream,lok)  ! read STDHEP begin run record

        if (lok.ne.0) then
          write(pgs_log_unit,'('' PGS_READ_EVENT: read failure on'',
     .            '' begin run record: '',i5)') lok
          pgs_read_event = .false.
          return
        endif

        if (itype.ne.100) then
          write(pgs_log_unit,
     .      '('' PGS_READ_EVENT: expected begin run record;'',
     .            '' got: '',i5)') itype
          pgs_read_event = .false.
          return
        endif

        first = .false.
        open = .true.

      endif

c normal event read

      if (command(1:5).eq.'event') then

        call stdxrd(itype,istream,lok)

        if (lok.ne.0) then
          write(pgs_log_unit,
     .       '('' PGS_WRITE_EVENT: error reading file '',i5)') lok
        endif

        if (itype.eq.1) then

          pgs_read_event = .true.

c end run record
        elseif (itype.eq.200) then

          pgs_read_event = .false.

          call stdxend(istream)
          open = .false.

        endif

      endif

      return
      end


      real*4 function pgs_ranmar()

      implicit none

      include 'pgs.inc'

      logical first

      data first/.true./

      real*4 rvec(1000)
      integer ivec,lvec

      data ivec,lvec/1000,1000/

c initialize

      if(first) then
        call rmarin(pgs_iseed,pgs_jseed)  ! seeds must be in the range 1-30000
        first = .false.
      endif

c return number

      if(ivec.eq.lvec) then
        call ranmar(rvec,lvec)
        ivec = 0
      endif

      ivec = ivec + 1
      pgs_ranmar = rvec(ivec)

      return
      end


      subroutine pgs_rannor(a,b)

c generate gaussian-distributed random numbers

      real*4 a,b,x,y,r

      real*8 pi,phi

      data pi/3.14159265358979/

      phi = pgs_ranmar() * 2.0 * pi

      r = sqrt(-2.0*log(pgs_ranmar()))

      a = r * cos(phi)
      b = r * sin(phi)

      return
      end


c RANMAR source code

      SUBROUTINE RANMAR(RVEC,LENV)
C Universal random number generator proposed by Marsaglia and Zaman
C in report FSU-SCRI-87-50
C        slightly modified by F. James, 1988, to generate a vector
C        of pseudorandom numbers RVEC of length LENV, and to put in
C        the COMMON block everything needed to restart at same place. 
      DIMENSION RVEC(*)
      COMMON/RASET1/U(97),C,CD,CM,I97,J97
      DATA INIT/0/
C
      IF (INIT .GT. 0)  GO TO 50
C
C        Default initialization. User has called RANMAR without RMARIN.
      IJ = 1802
      KL = 9373
      KALLED = 0
      GO TO 1
C
      ENTRY      RMARIN(IJIN,KLIN)
C         Initializing routine for RANMAR, may be called before
C         generating pseudorandom numbers with RANMAR. The input
C         values should be in the ranges:  0<=IJ<=31328
C                                          0<=KL<=30081
C To get the standard values in Marsaglia's paper, IJ=1802, KL=9373
C  
      IJ = IJIN
      KL = KLIN
      KALLED = 1
    1 CONTINUE
      INIT = 1
      I = MOD(IJ/177, 177) + 2
      J = MOD(IJ, 177)     + 2
      K = MOD(KL/169, 178) + 1
      L = MOD(KL, 169)
c      PRINT '(A,2I7,4I4)',' RANMAR INITIALIZED: ', IJ,KL,I,J,K,L
      DO 2 II= 1, 97
      S = 0.
      T = .5
      DO 3 JJ= 1, 24
         M = MOD(MOD(I*J,179)*K, 179)
         I = J
         J = K
         K = M
         L = MOD(53*L+1, 169)
         IF (MOD(L*M,64) .GE. 32)  S = S+T
    3    T = 0.5*T
    2 U(II) = S
      TWOM24 = 1.0
      DO 4 I24= 1, 24
    4 TWOM24 = 0.5*TWOM24
      C  =   362436.*TWOM24
      CD =  7654321.*TWOM24
      CM = 16777213.*TWOM24
      I97 = 97
      J97 = 33
      IF (KALLED .EQ. 1)  RETURN
C
C          Normal entry to generate LENV random numbers
   50 CONTINUE
      DO 100 IVEC= 1, LENV
      UNI = U(I97)-U(J97)
      IF (UNI .LT. 0.)  UNI=UNI+1.
      U(I97) = UNI
      I97 = I97-1
      IF (I97 .EQ. 0)  I97=97
      J97 = J97-1
      IF (J97 .EQ. 0)  J97=97
      C = C - CD
      IF (C .LT. 0.)  C=C+CM
      UNI = UNI-C
      IF (UNI .LT. 0.) UNI=UNI+1.
C        Replace exact zeroes by uniform distr. *2**-24
         IF (UNI .EQ. 0.)  THEN
         UNI = TWOM24*U(2)
C             An exact zero here is very unlikely, but let's be safe.
         IF (UNI .EQ. 0.) UNI= TWOM24*TWOM24
         ENDIF
      RVEC(IVEC) = UNI
  100 CONTINUE
      RETURN
      END



c  ------------------- 
c  2. trigger routines
c  -------------------


      subroutine pgs_trigger

c this is where trigger objects are found and added
c to the list

      implicit none
      include 'pgs.inc'

c find tracks - this fills the PGSTRK common

      call pgs_find_tracks

c fill calorimeter arrays

      call pgs_fill_cal

c find calorimeter trigger clusters

      call pgs_find_trigger_clusters

c find trigger objects

      numtrg = 0

      call pgs_find_photon_electron_trig
      call pgs_find_muon_trig
      call pgs_find_tau_trig
      call pgs_find_jet_trig
      call pgs_find_vertex_trig
      call pgs_find_met_trig

      return
      end



      subroutine pgs_find_photon_electron_trig

c loop over calorimeter arrays, searching for photons
c and electrons, put them in trigger list

      implicit none
      include 'pgs.inc'
                         
      real*8 eta,phi,st,et,etiso,ptetrk,diff,ep,hadem
      integer i,ietrk,iq,ieta,iphi

      real*8 hadem_max,eta_max,et_min
      parameter(et_min=10.0,hadem_max=0.125)
      integer itrc

c loop over calorimeter clusters

      do itrc = 1,numtrc
        call pgs_index_etaphi(etatrc(itrc),phitrc(itrc),
     *                        eta,phi)
        st = sin( 2.0 * atan(exp(-eta)) )
        et = st*emtrc(itrc)
        if (et.gt.et_min.and.abs(eta).lt.eta_max_egamma) then
          hadem = ehtrc(itrc)/emtrc(itrc)
          if (hadem.lt.hadem_max) then

c find the associated track
            ptetrk = 0.
            ietrk=0
            iq=0
            ep=100.0
            do i = 1, numtrk
c difference only in phi for the trigger
              diff=abs( phi_trk(i)-phi )
              if(diff.ge.pi) diff=2.0*pi-diff
              if (diff.lt.dphi/2.0.and.pt_trk(i).gt.ptetrk .and.
     1             qtrk(i).ne.0.0) then
                ptetrk=pt_trk(i)
                ietrk=i
                iq=qtrk(i)
                ep = emtrc(itrc)/p_trk(ietrk)
              endif
            enddo
            
c this is the cal isolation energy
            call pgs_tower_isosum(etatrc(itrc),phitrc(itrc),
     .                   etiso) ! the energy in the 0.4 cone - seed tower


            if (numtrg.lt.ntrgmx-1) then
c enter photon trigger object
              numtrg = numtrg + 1

c fill HEPEVT particle index
              call pgs_eta_phi_hep_match(eta,phi,
     1               et/2.0,22,0,indtrg(numtrg))

              typtrg(numtrg) = 0 ! photon type

              vectrg(1,numtrg) = eta
              vectrg(2,numtrg) = phi
              vectrg(3,numtrg) = et
              vectrg(4,numtrg) = 0
              vectrg(5,numtrg) = ptetrk ! highest pt track in cluster
              vectrg(6,numtrg) = ietrk
              vectrg(7,numtrg) = hadem
              vectrg(8,numtrg) = iq
              vectrg(9,numtrg) = etiso ! cal iso
                

c also enter it as an electron trigger object
              numtrg = numtrg + 1

c fill HEPEVT particle index
              call pgs_eta_phi_hep_match(eta,phi,
     1               et/2.0,11,0,indtrg(numtrg))

              typtrg(numtrg) = 1 ! electron type
                
              vectrg(1,numtrg) = eta
              vectrg(2,numtrg) = phi
              vectrg(3,numtrg) = et
              vectrg(4,numtrg) = 0
              vectrg(5,numtrg) = ptetrk ! highest pt track in cluster
              vectrg(6,numtrg) = ietrk
              vectrg(7,numtrg) = hadem
              vectrg(8,numtrg) = iq
              vectrg(9,numtrg) = etiso ! cal iso
                
            endif             ! enough space in common
              
          endif               ! had/em cut
        endif                 ! et, eta cut
      enddo
      
      return
      end
      

      subroutine pgs_find_muon_trig

c find muon trigger objects

      implicit none
      include 'pgs.inc'

      integer ihep,mutk,itrk

      real*8 muon_trig_eff             ! muon trigger efficiency
      parameter (muon_trig_eff=0.98)   ! random guess...does not include track eff.

      real*4 pgs_ranmar

c loop over generated particles

      do ihep=1,nhep        

c is generated particle a muon?

        if (isthep(ihep).eq.1    .and.   ! final state particle
     .      et_gen(ihep).ge.3.0  .and.   ! ET > 3 GeV
     .      abs(idhep(ihep)).eq.13) then ! it's a muon

c is it in the fiducial region?

          if (abs(eta_gen(ihep)).lt.eta_max_muon) then 

c did the muon make a track?

            mutk = 0
            do itrk=1,numtrk
              if (indtrk(itrk).eq.ihep) mutk = itrk
            enddo

c apply efficiency (and demand that muon left track!)

            if (mutk.ne.0 .and.
     .          pgs_ranmar().lt.muon_trig_eff) then  

              numtrg = numtrg + 1

              typtrg(numtrg) = 2     ! muon type

              vectrg(1,numtrg) = eta_trk(mutk)
              vectrg(2,numtrg) = phi_trk(mutk)
              vectrg(3,numtrg) = pt_trk(mutk)
              vectrg(4,numtrg) = 0
              vectrg(5,numtrg) = pt_trk(mutk)
              vectrg(6,numtrg) = mutk
              vectrg(7,numtrg) = 0
              vectrg(8,numtrg) = 0
              vectrg(9,numtrg) = 0

            endif

          endif ! fiducial
        endif   ! it's a muon
      enddo     ! loop over generated

      return
      end


      subroutine pgs_find_tau_trig

c  locate and list tau objects that could be used in a trigger decision

      implicit none
      include 'pgs.inc'

      integer i,j,ihep,igen,itrc
      real isosum,dist,dgen,dtrk,etcluster

      real ptcut,etcut,isocut
      integer nisocut
      data ptcut   /  5.0  /
      data etcut   / 10.0  /
      data isocut  /  5.0  /
      data nisocut /  0    /

      integer lastnev
      real xtu(100)
      logical first,ignore
      data first / .true. /

      integer iseed0,n100,niso0
      real eta,phi,ptmax0,ptmaxiso0
      integer iseed,n10,niso
      real ptmax,ptmaxiso
      integer errors
      data errors/0/

c these variables are used in call to pgs_index_etaphi
      real*8 etacl,phicl

c  protection against calling this routine twice for the same event -
c  this would result in a redundant trigger object list
      if (first) then
        lastnev = nevhep
        first = .false.
      else
        if (nevhep.eq.lastnev) then
          write(pgs_log_unit,
     .      '('' pgs_find_tau_trigger: Called twice, same event.'')')
          stop
        endif
        lastnev = nevhep
      endif

c  loop over calorimeter clusters
      do itrc = 1, numtrc

c  obtain cluster ET; ultimately this should be a face-adjacent trigger cluster
        etcluster = et_trc(itrc)

c  obtain calorimeter isolation energy sum around seed tower
        isosum = 999.
        call pgs_trigger_cal_isosum(itrc,isosum)

c  find true eta and phi from seed tower coordinates; convert real*8 to real
        call pgs_index_etaphi(etatrc(itrc),phitrc(itrc),etacl,phicl)
        eta = etacl
        phi = phicl

c  find tracks associated with calorimeter cluster
        call pgs_track_assoc(eta,phi,iseed0,n100,ptmax0,niso0,ptmaxiso0)

c  do it again, using seed track as axis
        iseed = 0
        n10 = 0
        ptmax = 0.
        niso = 0
        ptmaxiso = 0.
        if (iseed0.ne.0) then
          eta = eta_trk(iseed0)
          phi = phi_trk(iseed0)
          call pgs_track_assoc(eta,phi,
     .                           iseed,n10,ptmax,niso,ptmaxiso) 
          if (iseed.ne.0) then
            eta = eta_trk(iseed)
            phi = phi_trk(iseed)
          endif
       endif
c  find the distance between seed track and seed tower
        dtrk = 999.
        if (iseed.ne.0) then
          dtrk = (etacl-eta_trk(iseed))**2 + (phicl-phi_trk(iseed))**2
          if (dtrk.gt.0.) then
            dtrk = sqrt(dtrk)
          else
            dtrk = 0.
          endif
        endif

c  locate nearest generated tau, if there is one.  Use cluster position
        igen = 0
        dgen = 999.
        do ihep = 1, nhep
          if (abs(idhep(ihep)).eq.15) then

c    disallow taus which have a tau as a daughter particle (!)
            ignore = .false.
            do j = jdahep(1,ihep), jdahep(2,ihep)
              if (abs(idhep(j)).eq.15) then
                ignore = .true.
                if(errors.le.10)then
                   write(pgs_log_unit,
     .                  '('' found a tau daughter to a tau '')')
                   errors = errors + 1
                endif
                if (errors.eq.10)then
                   write(pgs_log_unit,
     .                  '('' further errors suppressed '')')
                   errors = errors + 1
                endif
              endif
            enddo

c    disallow phantom taus with no decay products
            if ((jdahep(1,ihep).eq.0).or.(jdahep(2,ihep).eq.0)) then
              ignore = .true.
            endif

            if (.not.ignore) then
              dist = (eta-eta_gen(ihep))**2 + (phi-phi_gen(ihep))**2
              if (dist.gt.0.) then
                dist = sqrt(dist)
              else
                dist = 0.
              endif
              if (dist.lt.dgen) then
                dgen = dist
                igen = ihep
              endif
            endif
          endif
        enddo

c  fill PGS trigger object list if this object passes cuts
        if ( (etcluster.gt.etcut) .and.
     .       (isosum.lt.isocut) .and.
     .       (ptmax.gt.ptcut) .and.
     .       (niso.le.nisocut) .and.
     .       (abs(eta).lt.eta_max_tau) ) then

c  increment trigger object counter
          numtrg = numtrg + 1

c  index to HEPEVT tau, if there is one nearby
          indtrg(numtrg) = 0
          if (dgen.lt.0.4) then
            indtrg(numtrg) = igen
          endif

c  trigger object type = tau
          typtrg(numtrg) = 3

c fill vectrg
          vectrg(1,numtrg) = 0.
          vectrg(2,numtrg) = 0.
          if (iseed.ne.0) then
            vectrg(1,numtrg) = eta_trk(iseed)    ! eta seed track
            vectrg(2,numtrg) = phi_trk(iseed)    ! phi seed track
          endif
          vectrg(3,numtrg) = etcluster           ! ET of cluster
          vectrg(4,numtrg) = i                   ! cluster #
          vectrg(5,numtrg) = ptmax               ! pt of seed track
          vectrg(6,numtrg) = iseed               ! track #
        endif

c  end of loop over calorimeter clusters
      enddo

 999  return
      end


      subroutine pgs_trigger_cal_isosum(itrc,sum)

c  performs a simple calorimeter isolation energy sum calculation around a
c  given seed tower;  returns the transverse energy in a 3x3 tower array,
c  excluding the seed tower.

      implicit none
      include 'pgs.inc'

      integer itrc,ieta,iphi,iphi_left,iphi_right
      real theta1,theta2,theta3
      real f1,f2,f3
      real sum

c these variables are used in call to pgs_index_etaphi
      real*8 eta1,eta2,eta3,phi1,phi2,phi3

c  just for the sake of serenity
      sum = 0.
      if (itrc.le.0.or.itrc.gt.numtrc) then
        write(pgs_log_unit,
     .     '('' pgs_trigger_cal_isosum: illicit cluster number '')')
        sum = 999.
        goto 999
      endif

c  find the eta and phi of the seed tower of this cluster
      ieta = etatrc(itrc)
      iphi = phitrc(itrc)

c  return a large number for towers on the eta edge
      if (ieta.eq.1.or.ieta.eq.netacal) then
        sum = 999.
        goto 999
      endif

c  identify tower indices left and right of the seed tower
      iphi_left = iphi - 1
      if (iphi_left.lt.1) iphi_left = nphical

      iphi_right = iphi + 1
      if (iphi_right.gt.nphical) iphi_right = 1

c  look up true eta using tower coordinates
      call pgs_index_etaphi(ieta-1,iphi_left ,eta1,phi1)
      call pgs_index_etaphi(ieta  ,iphi      ,eta2,phi2)
      call pgs_index_etaphi(ieta+1,iphi_right,eta3,phi3)

c  convert pseudorapidity eta to angle theta;  ET = sin(theta) * E
      theta1 = 2. * atan( exp(-eta1) )
      theta2 = 2. * atan( exp(-eta2) )
      theta3 = 2. * atan( exp(-eta3) )
      f1 = sin( theta1 )
      f2 = sin( theta2 )
      f3 = sin( theta3 )

c  calculate the sum
      sum =    f1*ecal(ieta-1,iphi_left )  +  f1*hcal(ieta-1,iphi_left )
     .       + f1*ecal(ieta-1,iphi      )  +  f1*hcal(ieta-1,iphi      )
     .       + f1*ecal(ieta-1,iphi_right)  +  f1*hcal(ieta-1,iphi_right)
     .       + f2*ecal(ieta  ,iphi_left )  +  f2*hcal(ieta  ,iphi_left )
     .       + f2*ecal(ieta  ,iphi_right)  +  f2*hcal(ieta  ,iphi_right)
     .       + f3*ecal(ieta+1,iphi_left )  +  f3*hcal(ieta+1,iphi_left )
     .       + f3*ecal(ieta+1,iphi      )  +  f3*hcal(ieta+1,iphi      )
     .       + f3*ecal(ieta+1,iphi_right)  +  f3*hcal(ieta+1,iphi_right)

 999  return
      end


      subroutine pgs_track_assoc(eta,phi,iseed,n10,ptmax,niso,ptmaxiso)

c  Given eta and phi, loop over track list to count tracks within 10 degrees
c  as well as tracks in the 10-30 degree isolation zone.
c    Note: as presently implemented, only the track phi information
c    is available at the trigger level, and eta is not used.
c    Also, tracks below 1.5 GeV are assumed to be unavailable to the trigger.

      implicit none
      include 'pgs.inc'

      integer i,iseed,n10,niso
      real eta,phi,ptmax,ptmaxiso
      real deltaphi

      real twopi
      parameter (twopi = 2.*pi)

      real degtorad
      parameter (degtorad = 180./3.141592654)
      real ptmin,angclu,angiso
c  minimum pt for a track to be counted in the isolation angle
      parameter (ptmin = 1.5)
c  cluster angle in phi around the seed track
      parameter (angclu = 10. / degtorad)
c  isolation angle in phi around the seed track (beyond angclu)
      parameter (angiso = 30. / degtorad)

      iseed = 0
      n10 = 0
      niso = 0
      ptmax = 0.
      ptmaxiso = 0.
      do i = 1, numtrk
        if (pt_trk(i).gt.ptmin) then

c  compute phi difference
          deltaphi = phi - phi_trk(i)
          if (abs(deltaphi).gt.twopi) then
            write(pgs_log_unit,
     .          '('' pgs_track_assoc:  bad phi values '')')
            goto 999
          endif
          if (deltaphi.gt.pi) deltaphi = deltaphi - twopi
          if (deltaphi.lt.-pi) deltaphi = deltaphi + twopi

c  decide whether this track falls in the clustering or isolation zones
          if (abs(deltaphi).lt.angclu) then
            n10 = n10 + 1
            if (pt_trk(i).gt.ptmax) then
              ptmax = pt_trk(i)
              iseed = i
            endif
          elseif (abs(deltaphi).lt.angiso) then
            niso = niso + 1
            if (pt_trk(i).gt.ptmaxiso) then
              ptmaxiso = pt_trk(i)
            endif
          endif

        endif
      enddo

 999  return
      end



      subroutine pgs_find_jet_trig

c create jet trigger objects

      implicit none
      include 'pgs.inc'

      integer itrc

      real*8 jet_et_thresh
      parameter(jet_et_thresh=10.) ! 10 GeV jet ET threshold

c loop over calorimeter clusters; this could be made much more
c sophisticated, with a simulation of trigger cluster finding, etc.

      do itrc=1,numtrc
        if (et_trc(itrc).gt.jet_et_thresh) then
          numtrg = numtrg + 1
          indtrg(numtrg) = itrc
          typtrg(numtrg) = 4
          vectrg(1,numtrg) = eta_trc(itrc)
          vectrg(2,numtrg) = phi_trc(itrc)
          vectrg(3,numtrg) = et_trc(itrc)
          vectrg(4,numtrg) = itrc
        endif
      enddo

      return
      end


      subroutine pgs_find_vertex_trig

c detached vertex trigger...wide open for development!

      implicit none
      include 'pgs.inc'

      return
      end


      subroutine pgs_find_met_trig

c if MET above threshold, record as trigger object

      implicit none
      include 'pgs.inc'

      real*8 met_thresh
      parameter(met_thresh=10.)

      real*4 a,b
      real*8 met_cal_smeared

c introduce MET trigger resolution

      call pgs_rannor(a,b)
      met_cal_smeared = met_cal + (a*met_res)*met_cal

c add to trigger object list

      if (met_cal_smeared.ge.met_thresh) then
        numtrg = numtrg + 1
        typtrg(numtrg) = 6
        indtrg(numtrg) = 0
        vectrg(1,numtrg) = 0
        vectrg(2,numtrg) = phi_met_cal
        vectrg(3,numtrg) = met_cal_smeared
      endif

      return
      end


      subroutine pgs_find_tracks

c loop over generated particles and find charged tracks

      implicit none
      include 'pgs.inc'

      integer ihep,itrk

      real stdchg

      real*4 pgs_ranmar

c initialize

      numtrk = 0

      do itrk=1,ntrkmx
        indtrk(itrk) = 0
        ptrk(1,itrk) = 0.
        ptrk(2,itrk) = 0.
        ptrk(3,itrk) = 0.
        qtrk(itrk)   = 0.
      enddo

c loop over HEPEVT entries

      do ihep=1,nhep        

c is generated particle final state and charged?

        if (isthep(ihep).eq.1 .and.               ! final state particle
     .     abs(stdchg(idhep(ihep))).gt.0.0) then  ! charged

c is it in the fiducial region for tracking?

          if (abs(eta_gen(ihep)).lt.eta_max_track) then

c apply efficiency and minimum pt

            if (pgs_ranmar().lt.eff_track.and.
     .         pt_gen(ihep).gt.min_track_pt) then

c add to list
               if (numtrk.lt.ntrkmx) then
                 numtrk = numtrk + 1
                 indtrk(numtrk) = ihep
                 qtrk(numtrk)   = stdchg(idhep(ihep))

c perform track resolution smearing
                 call pgs_track_res(phep(1,ihep),qtrk(numtrk),
     .                              ptrk(1,numtrk),qtrk(numtrk))

               endif

            endif

          endif

        endif

      enddo

      return
      end


      subroutine pgs_track_res(p,q,pnew,qnew)

c Take the input track 3-momentum, and return the
c smeared momentum, possibly with opposite charge.
c The routine does this by calculating the track sagitta
c from the track pt, and then smearing the sagitta by a
c fixed gaussian.  The routine then converts back to
c pt, preserving the original direction in space.  The
c new z momentum is taken from the original angle and
c the new track pt.
c
c The gaussian width comes from assuming a 1-meter
c tracker with a resolution of 0.08%/GeV sigma(pt)/pt**2 
c at high pt.
c
c                     blame John Conway
c                           Sept. 1998


      implicit none
      include 'pgs.inc'

      real*8 p(3),pnew(3),q,qnew

      real*8 pt,r,s,snew,phi,tanth,sinphi,arg

      real*4 aa,bb

c get pt

      arg = p(1)**2 + p(2)**2
      if (arg.gt.0.0) then
        pt = sqrt(arg)
      else
        pnew(1) = p(1)
        pnew(2) = p(2)
        pnew(3) = p(3)
        qnew    = q
        return
      endif

c get phi, tan theta

      phi = atan2(p(2),p(1))
      if (phi.lt.0.) phi = phi + 2.0d0*pi

      tanth = pt/p(3)

c find radius of curvature and sagitta

      r = pt/(0.3*bfield)

      if(r.le.(rmax/2.0)+0.01) then ! track curls up - this is pointless
        pnew(1) = p(1)
        pnew(2) = p(2)
        pnew(3) = p(3)
        qnew    = q
        return
      endif

      sinphi = (rmax/2.0)/r

      s = r - r*sqrt(1.0-sinphi**2)

      call pgs_rannor(aa,bb)

      snew = s + sagitta_res*aa

c opposite charge?

      if(snew*s.lt.0.0) then
        qnew = -q
      else
        qnew = +q
      endif

      s = abs(snew)

c get new radius

      r = s/2.0 + rmax**2/(8.0*s)

c convert back to pt
      
      pt = r*(0.3*bfield)

      pnew(1) = pt*cos(phi)
      pnew(2) = pt*sin(phi)

c no z momentum smearing presently; just take z momentum
c from original angle and new pt

      pnew(3) = pt/tanth     

      return
      end


      subroutine pgs_fill_cal

c fill electromagnetic/hadronic calorimeter arrays

      implicit none
      include 'pgs.inc'

      integer ieta,iphi,ihep

      real*8 e,p,e_ecal,e_hcal,ecal_frac
      real*4 res_ecal_a,res_ecal_b,res_ecal,res_hcal,res_dummy,r1,r2
      real*8 mu_ecal,mu_hcal
      real*8 pxmet,pymet,eta,phi,theta

      real*8 pt_min_charged             ! minimum pt of charged track 
      parameter (pt_min_charged=0.300)  ! to hit calorimeter

      real*4 stdchg,pgs_ranmar

      logical pgs_cal_crack

      integer i

c initialize

      do ieta=1,netacal
        do iphi=1,nphical
          ecal(ieta,iphi) = 0.
          hcal(ieta,iphi) = 0.
        enddo
      enddo

c sums for MET

      pxmet = 0.
      pymet = 0.

c loop over generated particles, filling in arrays

      do ihep=1,nhep        

        e_ecal = 0.
        e_hcal = 0.
 
        e = phep(4,ihep)
        p = p_gen(ihep)

c is generated particle in the final state?

        if (isthep(ihep).eq.1) then  ! final state particle

c is it a neutrino or non-interacting?

          if (abs(idhep(ihep)).eq.12 .or.
     .        abs(idhep(ihep)).eq.14 .or.
     .        abs(idhep(ihep)).eq.16 .or.
     .        idhep(ihep).eq.1000022 .or.   ! C0 (LSP)
     .        idhep(ihep).eq.1000039        ! gravitino
     .       ) then

            e_ecal = 0.
            e_hcal = 0.

c is it electromagnetic?

          elseif ((abs(idhep(ihep)).eq.11.and.
     .             pt_gen(ihep).gt.pt_min_charged) .or.  ! electron
     .            abs(idhep(ihep)).eq.111 .or.           ! pi0 (from tau decay*)
     .            abs(idhep(ihep)).eq.221 .or.           ! eta (from tau decay*)
     .            abs(idhep(ihep)).eq.22) then           ! photon

c * The reason pi0's and etas from tau decay appear here is that
c   in using the present version of TAUOLA, one must turn off 
c   tau decays at the generator level, and then call tauola_scan
c   in the main program to decay the taus.  Unfortunately, TAUOLA
c   does not decay the final state pi0's or etas.

            if (pgs_cal_crack(eta_gen(ihep),phi_gen(ihep))) then  ! crack fraction

              e_ecal = 0.
              e_hcal = 0.

            else

              ecal_frac = 0.99 ! measured from Monte Carlo single electrons

              e_ecal = ecal_frac * e
              e_hcal = (1.0-ecal_frac) * e

              call pgs_rannor(res_ecal_a,res_ecal_b)  ! gaussian random numbers
              call pgs_rannor(res_hcal,res_dummy)     ! gaussian random numbers

              e_ecal = e_ecal + ecal_res_a*e_ecal*res_ecal_a       !
     .                        + ecal_res_b*sqrt(e_ecal)*res_ecal_b
              if (e_ecal.lt.0.) e_ecal = 0.

              e_hcal = e_hcal + hcal_res*sqrt(e_hcal)*res_hcal
              if (e_hcal.lt.0.) e_hcal = 0.

            endif

c what about muonic?

          elseif (abs(idhep(ihep)).eq.13.and.
     .           pt_gen(ihep).gt.pt_min_charged) then

c deposits certain amount of energy in each calorimeter 
c as long as it still has it left...

            if (pgs_cal_crack(eta_gen(ihep),phi_gen(ihep))) then  ! crack fraction

              e_ecal = 0.
              e_hcal = 0.

            else

              call pgs_rannor(r1,r2)

              mu_ecal = 0.5 + r1*0.1 ! estimated from Monte Carlo (approx.)

              if(mu_ecal.lt.0.) mu_ecal = 0.

              e_ecal = 0.
              if (e.gt.mu_ecal) then
                e_ecal = mu_ecal
                e = e - mu_ecal
              else
                e_ecal = e
                e = 0.
              endif

              mu_hcal = 2.0 + r2*0.4  ! estimated from Monte Carlo (approx.)

              if(mu_hcal.lt.0.) mu_hcal = 0.

              e_hcal = 0.
              if (e.gt.mu_hcal) then
                e_hcal = mu_hcal
                e = e - mu_hcal
              else
                e_hcal = e
                e = 0.
              endif

            endif

c ... must be hadronic

          elseif (pt_gen(ihep).gt.pt_min_charged.or.
     .           abs(stdchg(idhep(ihep))).eq.0.0) then

              ecal_frac = 0.25                 ! 25% of energy in electromagnetic 
              call pgs_rannor(r1,r2)               ! calorimeter...
              ecal_frac = ecal_frac + 0.05*r1  ! ...with some spread in fraction...

              if (ecal_frac.le.0.) ecal_frac = 0.0
              if (ecal_frac.ge.1.) ecal_frac = 1.0

              if(pgs_ranmar().lt.0.5) then           ! ...but only half the time does this occur
                e_ecal = 0.5 + 0.1*r2          ! in which case we treat it like a muon
                if(e_ecal.ge.e) then           ! in the e.m. calorimeter
                   ecal_frac = 1.
                elseif(e_ecal.lt.0.) then
                   ecal_frac = 0.
                else
                   ecal_frac = e_ecal/e
                endif
              endif

              e_ecal = ecal_frac * e
              e_hcal = (1.0-ecal_frac) * e

              call pgs_rannor(res_ecal,res_hcal)

              e_ecal = e_ecal + hcal_res*sqrt(e_ecal)*res_ecal ! ~80%/sqrt(E) for hadrons
              if (e_ecal.lt.0.) e_ecal = 0.                    ! in e.m. calorimeter!?

              e_hcal = e_hcal + hcal_res*sqrt(e_hcal)*res_hcal ! ~80%/sqrt(E)
              if (e_hcal.lt.0.) e_hcal = 0.

          endif

c have e_ecal, e_hcal: now add into array

          call pgs_etaphi_index(eta_gen(ihep),phi_gen(ihep),ieta,iphi)

c          print '(4i8,6f10.4)',
c     .       ihep,idhep(ihep),ieta,iphi,
c     .       eta_gen(ihep),phi_gen(ihep),pt_gen(ihep),
c     .       e_ecal,e_hcal

          if (ieta.ne.0.and.iphi.ne.0) then
            ecal(ieta,iphi) = ecal(ieta,iphi) + e_ecal
            hcal(ieta,iphi) = hcal(ieta,iphi) + e_hcal

c make MET sums

            call pgs_index_etaphi(ieta,iphi,eta,phi)
            theta = 2.0 * atan(exp(-eta))

            pxmet = pxmet + (e_ecal + e_hcal)*sin(theta)*cos(phi)
            pymet = pymet + (e_ecal + e_hcal)*sin(theta)*sin(phi)

          endif

        endif

      enddo

c do final MET calculation

      pxmet = -pxmet
      pymet = -pymet

      met_cal = sqrt(pxmet**2+pymet**2)

      phi_met_cal = 0.
      if (met_cal.ne.0.) then
        phi_met_cal = atan2(pymet,pxmet)
        if (phi_met_cal.lt.0.0) phi_met_cal = phi_met_cal + 2.0d0*pi
      endif

      return
      end


      logical function pgs_cal_crack(eta,phi)

c determine whether eta,phi is near a cell edge 

      implicit none
      include 'pgs.inc'

      real*8 eta,phi

      pgs_cal_crack = .false.

      if(abs(eta/deta-float(nint(eta/deta))).lt.crack_frac) then
        pgs_cal_crack = .true.
        return
      endif

      if(abs(phi/dphi-float(nint(phi/dphi))).lt.crack_frac) then
        pgs_cal_crack = .true.
        return
      endif

      return
      end


      subroutine pgs_find_trigger_clusters

c find calorimeter clusters - this algorithm seeks seed towers,
c then adds more towers into cluster within cone in delta(R)
c from seed tower

      implicit none
      include 'pgs.inc'

      integer itrc,ieta,iphi,jeta,jphi,maxeta,maxphi
      integer nstep_eta,nstep_phi

      real*8 emax,etower,dr,eta,theta,phi,px,py,pz,e

      logical seed_found

      numtrc = 0

c set tower scan parameters (thanks, Steve!)

      nstep_eta = int(conesize/deta + 1.0)
      nstep_phi = int(conesize/dphi + 1.0)

      do iphi=1,nphical
        do ieta=1,netacal
          ctrc(ieta,iphi) = 0
        enddo
      enddo

      seed_found = .true.

      do while(seed_found)

c loop over calorimeter, find highest tower 
c not already in some cluster

        maxeta=0
        maxphi=0
        emax = 0.

        seed_found = .false.
        do ieta=1,netacal
          do iphi=1,nphical
c check etower first
            etower = ecal(ieta,iphi) + hcal(ieta,iphi)
            if (etower.gt.0.) then
            if (ctrc(ieta,iphi).eq.0) then
c              etower = ecal(ieta,iphi) + hcal(ieta,iphi)
              call pgs_index_etaphi(ieta,iphi,eta,phi)
              theta = 2.0 * atan(exp(-eta))
              etower = etower * sin(theta)  ! change to ET of tower
              if (etower.gt.seed_thresh.and.
     .           etower.gt.emax) then
                emax = etower
                maxeta = ieta
                maxphi = iphi
                seed_found = .true.
              endif
            endif
            endif
          enddo
        enddo

        if(numtrc.ge.ntrcmx) seed_found = .false. 

        if (seed_found) then

c start next cluster in list
          numtrc = numtrc + 1
          ctrc(maxeta,maxphi) = numtrc
          etatrc(numtrc) = maxeta
          phitrc(numtrc) = maxphi
          multrc(numtrc) = 1
          emtrc(numtrc)  = ecal(maxeta,maxphi)
          ehtrc(numtrc)  = hcal(maxeta,maxphi)

c add nearby towers above threshold

          do jeta=maxeta-nstep_eta,maxeta+nstep_eta
            if (jeta.ge.1.and.jeta.le.netacal) then
              do jphi=maxphi-nstep_phi,maxphi+nstep_phi
                ieta = jeta
                iphi = jphi
                if (iphi.lt.      1) iphi = iphi + nphical
                if (iphi.gt.nphical) iphi = iphi - nphical
c check etower first
                etower = ecal(ieta,iphi) + hcal(ieta,iphi)
                if (etower.gt.0.) then
                if (ctrc(ieta,iphi).eq.0) then          ! tower not yet used
c                  etower = ecal(ieta,iphi) + hcal(ieta,iphi)
                  call pgs_index_etaphi(ieta,iphi,eta,phi)
                  theta = 2.0 * atan(exp(-eta))
                  etower = etower * sin(theta)  ! change to ET of tower
                  if (etower.gt.shoulder_thresh) then   ! above threshold
                    dr =  (float(abs(jeta-maxeta))*deta)**2 
     .                  + (float(abs(jphi-maxphi))*dphi)**2
                    if (dr.gt.0.0) dr = sqrt(dr)
                    if (dr.le.conesize) then   ! within conesize of seed
                      ctrc(ieta,iphi) = numtrc
                      multrc(numtrc) = multrc(numtrc) + 1
                      emtrc(numtrc) = emtrc(numtrc) + ecal(ieta,iphi)
                      ehtrc(numtrc) = ehtrc(numtrc) + hcal(ieta,iphi)
                    endif
                  endif
                endif
                endif
              enddo
            endif
          enddo

        endif

      enddo

c find cluster properties; add to cluster list

      do itrc=1,numtrc

        ptrc(1,itrc) = 0.
        ptrc(2,itrc) = 0.
        ptrc(3,itrc) = 0.
        ptrc(4,itrc) = 0.
        ptrc(5,itrc) = 0.

        maxeta = etatrc(itrc)
        maxphi = phitrc(itrc)
        do jeta=maxeta-nstep_eta,maxeta+nstep_eta
          if (jeta.ge.1.and.jeta.le.netacal) then
            do jphi=maxphi-nstep_phi,maxphi+nstep_phi

              ieta = jeta
              iphi = jphi
              if (iphi.lt.      1) iphi = iphi + nphical
              if (iphi.gt.nphical) iphi = iphi - nphical
              if (ctrc(ieta,iphi).eq.itrc) then  ! tower in cluster

c four vector

                call pgs_index_etaphi(ieta,iphi,eta,phi)
                theta = 2.0 * atan(exp(-eta))

                e = ecal(ieta,iphi)+hcal(ieta,iphi)

                px = e * sin(theta) * cos(phi)
                py = e * sin(theta) * sin(phi)
                pz = e * cos(theta)

                ptrc(1,itrc) = ptrc(1,itrc) + px
                ptrc(2,itrc) = ptrc(2,itrc) + py
                ptrc(3,itrc) = ptrc(3,itrc) + pz
                ptrc(4,itrc) = ptrc(4,itrc) + e

              endif

            enddo

          endif
        enddo

c mass, em fraction

        ptrc(5,itrc) =  v4mass(ptrc(1,itrc))

        eftrc(itrc) = emtrc(itrc)/(emtrc(itrc)+ehtrc(itrc))

c cluster width  

        widtrc(itrc) = pgs_trigger_cluster_width(itrc)

      enddo

      return
      end


      subroutine pgs_cone_jets

c find calorimeter clusters - this algorithm seeks seed towers,
c then adds more towers into cluster within cone in delta(R)
c from seed tower

      implicit none
      include 'pgs.inc'

      integer iclu,ieta,iphi,jeta,jphi,maxeta,maxphi
      integer nstep_eta,nstep_phi

      real*8 emax,etower,dr,eta,theta,phi,px,py,pz,e

      logical seed_found

      numclu = 0

c set tower scan parameters (thanks, Steve!)

      nstep_eta = int(conesize/deta + 1.0)
      nstep_phi = int(conesize/dphi + 1.0)

      do iphi=1,nphical
        do ieta=1,netacal
          cclu(ieta,iphi) = 0
        enddo
      enddo

      seed_found = .true.

      do while(seed_found)

c loop over calorimeter, find highest tower 
c not already in some cluster

        maxeta=0
        maxphi=0
        emax = 0.

        seed_found = .false.
        do ieta=1,netacal
          do iphi=1,nphical
c check etower first
            etower = ecal(ieta,iphi) + hcal(ieta,iphi)
            if(etower.gt.0.) then
            if (cclu(ieta,iphi).eq.0) then
c              etower = ecal(ieta,iphi) + hcal(ieta,iphi)
              call pgs_index_etaphi(ieta,iphi,eta,phi)
              theta = 2.0 * atan(exp(-eta))
              etower = etower * sin(theta)  ! change to ET of tower
              if (etower.gt.seed_thresh.and.
     .           etower.gt.emax) then
                emax = etower
                maxeta = ieta
                maxphi = iphi
                seed_found = .true.
              endif
            endif
            endif
          enddo
        enddo

        if(numclu.ge.nclumx) seed_found = .false. 

        if (seed_found) then

c start next cluster in list
          numclu = numclu + 1
          cclu(maxeta,maxphi) = numclu
          etaclu(numclu) = maxeta
          phiclu(numclu) = maxphi
          mulclu(numclu) = 1
          emclu(numclu)  = ecal(maxeta,maxphi)
          ehclu(numclu)  = hcal(maxeta,maxphi)

c add nearby towers above threshold

          do jeta=maxeta-nstep_eta,maxeta+nstep_eta
            if (jeta.ge.1.and.jeta.le.netacal) then
              do jphi=maxphi-nstep_phi,maxphi+nstep_phi
                ieta = jeta
                iphi = jphi
                if (iphi.lt.      1) iphi = iphi + nphical
                if (iphi.gt.nphical) iphi = iphi - nphical
c check etower first
                etower = ecal(ieta,iphi) + hcal(ieta,iphi)
                if (etower.gt.0.) then
                if (cclu(ieta,iphi).eq.0) then          ! tower not yet used
c                  etower = ecal(ieta,iphi) + hcal(ieta,iphi)
                  call pgs_index_etaphi(ieta,iphi,eta,phi)
                  theta = 2.0 * atan(exp(-eta))
                  etower = etower * sin(theta)  ! change to ET of tower
                  if (etower.gt.shoulder_thresh) then   ! above threshold
                    dr =  (float(abs(jeta-maxeta))*deta)**2 
     .                  + (float(abs(jphi-maxphi))*dphi)**2
                    if (dr.gt.0.0) dr = sqrt(dr)
                    if (dr.le.conesize) then   ! within conesize of seed
                      cclu(ieta,iphi) = numclu
                      mulclu(numclu) = mulclu(numclu) + 1
                      emclu(numclu) = emclu(numclu) + ecal(ieta,iphi)
                      ehclu(numclu) = ehclu(numclu) + hcal(ieta,iphi)
                    endif
                  endif
                endif
                endif
              enddo
            endif
          enddo

        endif

      enddo

c find cluster properties; add to cluster list

      do iclu=1,numclu

        pclu(1,iclu) = 0.
        pclu(2,iclu) = 0.
        pclu(3,iclu) = 0.
        pclu(4,iclu) = 0.
        pclu(5,iclu) = 0.

        maxeta = etaclu(iclu)
        maxphi = phiclu(iclu)
        do jeta=maxeta-nstep_eta,maxeta+nstep_eta
          if (jeta.ge.1.and.jeta.le.netacal) then
            do jphi=maxphi-nstep_phi,maxphi+nstep_phi

              ieta = jeta
              iphi = jphi
              if (iphi.lt.      1) iphi = iphi + nphical
              if (iphi.gt.nphical) iphi = iphi - nphical
              if (cclu(ieta,iphi).eq.iclu) then  ! tower in cluster

c four vector

                call pgs_index_etaphi(ieta,iphi,eta,phi)
                theta = 2.0 * atan(exp(-eta))

                e = ecal(ieta,iphi)+hcal(ieta,iphi)

                px = e * sin(theta) * cos(phi)
                py = e * sin(theta) * sin(phi)
                pz = e * cos(theta)

                pclu(1,iclu) = pclu(1,iclu) + px
                pclu(2,iclu) = pclu(2,iclu) + py
                pclu(3,iclu) = pclu(3,iclu) + pz
                pclu(4,iclu) = pclu(4,iclu) + e

              endif

            enddo

          endif
        enddo

c mass, em fraction

        pclu(5,iclu) =  v4mass(pclu(1,iclu))

        efclu(iclu) = emclu(iclu)/(emclu(iclu)+ehclu(iclu))

c cluster width  

        widclu(iclu) = pgs_cluster_width(iclu)

      enddo

      return
      end


      subroutine pgs_kt_jets_bad

c find jets (calorimeter clusters) using kt algorithm
c (see hep-ph/0512210 for algorithm details)
c
c                             John Conway    April 2006

      implicit none
      include 'pgs.inc'

      integer i,j,m,iktj,imax,imin,jmin,ieta,iphi,idis,npass
      real*8 eta,phi,theta,etower,ettower,etjet,etmax,em,eh

      real*8 tower_thresh
      parameter(tower_thresh=0.5)

      integer nktjmx,mktjmx
      parameter(nktjmx=1000)
      parameter(mktjmx=200)

      integer nktj,nktjck
      integer eaten(nktjmx),mktj(nktjmx),lisktj(mktjmx,nktjmx)
      integer ktjeta(nktjmx),ktjphi(nktjmx)
      integer sorted(nktjmx)

      integer numcl,lisclu(nktjmx)

      real*8 pktj(4,nktjmx),etaktj(nktjmx),phiktj(nktjmx)
      real*8 dmin,dist,pgs_kt_dist
      real*8 distances(nktjmx*nktjmx)

      logical done

c  1. make intitial list of particles

      nktj = 0

      do ieta = 1,netacal
        do iphi = 1,nphical
          etower = ecal(ieta,iphi) + hcal(ieta,iphi)
          if(etower.gt.0) then
            call pgs_index_etaphi(ieta,iphi,eta,phi)
            theta = 2.0 * datan(dexp(-eta))
            ettower = etower * sin(theta)
            if(ettower.gt.tower_thresh) then
              if(nktj.le.nktjmx) then
                nktj = nktj + 1
                pktj(1,nktj)   = etower * cos(phi) * sin(theta)
                pktj(2,nktj)   = etower * sin(phi) * sin(theta)
                pktj(3,nktj)   = etower * cos(theta)
                pktj(4,nktj)   = etower
                etaktj(nktj)   = eta
                phiktj(nktj)   = phi
                mktj(nktj)     = 1
                lisktj(1,nktj) = nktj
                ktjeta(nktj)   = ieta
                ktjphi(nktj)   = iphi
                eaten(nktj)    = -1
                sorted(nktj) = 0
              else
                write(pgs_log_unit,
     .                '('' PGS_KT_JETS: maximum number of'',
     .                  '' particles (3000) exceeded '')')
              endif
            endif
          endif
        enddo
      enddo

c make initial pair distance table

      do i=1,nktj-1
        do j=i+1,nktj
          distances((i-1)*nktj + j) = 
     .            pgs_kt_dist(pktj(1,i),etaktj(i),phiktj(i),
     .                        pktj(1,j),etaktj(j),phiktj(j))
        enddo
      enddo

      done = .false.
      npass = 0

      do while(.not.done)

        npass = npass + 1

c  2. loop over all pairs of particles, finding minimum d to others and dbeam

        dmin = 1.0e20

        done = .true.

        do i=1,nktj

          if(eaten(i).lt.0) then

            done = .false.

c check pair distance
            if(i.lt.nktj) then
              do j = i+1,nktj 
                if(eaten(j).lt.0) then
                  dist = distances((i-1)*nktj + j)
                  if(dist .lt. dmin) then
                    dmin = dist
                    imin = i
                    jmin = j
                  endif
                endif
              enddo
            endif

c check beam distance
            if(v4pt(pktj(1,i))**2.lt.dmin) then
              dmin = pktj(1,i)**2
              imin = i
              jmin = 0
            endif

          endif

        enddo

c  3. merge as needed; remove "eaten" particles from live list

        if(.not.done) then
          if(jmin.eq.0) then  ! particle is on its own
            eaten(imin) = 0
          else
            if(v4pt(pktj(1,imin)).lt.v4pt(pktj(1,jmin))) then
              eaten(imin) = jmin
              pktj(1,jmin) = pktj(1,jmin) + pktj(1,imin)
              pktj(2,jmin) = pktj(2,jmin) + pktj(2,imin)
              pktj(3,jmin) = pktj(3,jmin) + pktj(3,imin)
              pktj(4,jmin) = pktj(4,jmin) + pktj(4,imin)
              etaktj(jmin) = v4eta(pktj(1,jmin))
              phiktj(jmin) = v4phi(pktj(1,jmin))
              mktj(jmin) = mktj(jmin) + mktj(imin)
              do m=1,mktj(imin)
                lisktj(mktj(jmin)+m,jmin) = lisktj(m,imin)
              enddo
              if(mktj(jmin).ge.mktjmx) then
                write(pgs_log_unit,
     .            '('' Error in pgs_kt_jets_bad on event '',i5)') nevhep
                write(pgs_log_unit,
     .            '('' jet algorithm: '',a)') jet_alg
                write(pgs_log_unit,'('' kt jet multiplicity '',
     .               ''maximum (300) reached '')')
                mktj(imin) = mktj(imin)-1
              endif
              idis = jmin
            else
              eaten(jmin) = imin
              pktj(1,imin) = pktj(1,imin) + pktj(1,jmin)
              pktj(2,imin) = pktj(2,imin) + pktj(2,jmin)
              pktj(3,imin) = pktj(3,imin) + pktj(3,jmin)
              pktj(4,imin) = pktj(4,imin) + pktj(4,jmin)
              etaktj(imin) = v4eta(pktj(1,imin))
              phiktj(imin) = v4phi(pktj(1,imin))
              mktj(imin) = mktj(imin) + mktj(jmin)    
              do m=1,mktj(jmin)
                lisktj(mktj(imin)+m,imin) = lisktj(m,jmin)
              enddo
              if(mktj(imin).ge.mktjmx) then
                write(pgs_log_unit,
     .            '('' Error in pgs_kt_jets_bad on event '',i5)') nevhep
                write(pgs_log_unit,
     .            '('' jet algorithm: '',a)') jet_alg
                write(pgs_log_unit,'('' kt jet multiplicity'',
     .                  '' maximum (300) reached '')')
                mktj(imin) = mktj(imin)-1
                idis = imin
              endif

c now re-do distance calculation for particle 
c that eats the other one (idis)

              do i=1,nktj-1
                do j=i+1,nktj
                  if(i.eq.idis.or.j.eq.idis) then
                    distances((i-1)*nktj + j) = 
     .                pgs_kt_dist(pktj(1,i),etaktj(i),phiktj(i),
     .                            pktj(1,j),etaktj(j),phiktj(j))
                  endif
                enddo               
              enddo

            endif
          endif
        endif

      enddo

c  4. fill in PGS arrays with list of clusters

c make ET-sorted list of clusters

      numclu = 0
      done = .false.
      do while(.not.done)

        done = .true.

        etmax = 0.
        do i=1,nktj
          if(eaten(i).eq.0.and.sorted(i).eq.0) then
            done = .false.
            etjet = v4et(pktj(1,i)) 
            if(etjet.gt.etmax) then
              imax = i
              etmax = etjet
            endif
          endif
        enddo

        if(numclu.lt.nclumx) then
          if(.not.done) then
            numclu = numclu + 1
            lisclu(numclu) = imax
            sorted(imax) = 1
          endif
        else
          print '('' PGS_KT_JETS: maximum number'',
     .            '' of clusters (300) reached  '')'
          done = .true.
        endif

      enddo

c zero out cluster map

      do iphi=1,nphical
        do ieta=1,netacal
          cclu(ieta,iphi) = 0
        enddo
      enddo

c fill in cluster arrays

      nktjck = 0

      do i=1,numclu

        iktj = lisclu(i)

c seed tower eta, phi

        etaclu(i) = ktjeta(iktj)
        phiclu(i) = ktjphi(iktj)

c cluster eta-phi map; keep track of em/had energy

        em = 0.
        eh = 0.

        do j=1,mktj(iktj)
          ieta = ktjeta(lisktj(j,iktj))
          iphi = ktjphi(lisktj(j,iktj))
          cclu(ieta,iphi) = i
          em = em + ecal(ieta,iphi)
          eh = eh + hcal(ieta,iphi)
        enddo

        pclu(1,i) = pktj(1,iktj)
        pclu(2,i) = pktj(2,iktj)
        pclu(3,i) = pktj(3,iktj)
        pclu(4,i) = pktj(4,iktj)
        pclu(5,i) = v4mass(pktj(1,iktj))

c em, had, em fraction

        emclu(i) = em
        ehclu(i) = eh
        efclu(i) = em/(em+eh)

c cluster width, multiplicity  

        mulclu(i) = mktj(iktj)

        widclu(i) = pgs_cluster_width(i)

        nktjck = nktjck + mulclu(i)

      enddo

      return
      end



      real*8 function pgs_kt_dist(p1,eta1,phi1,p2,eta2,phi2)

c calculate distance for kt, anti-kt, and CA jet finders

      implicit none

      include 'pgs.inc'

      real*8 p1,eta1,phi1,p2,eta2,phi2

      real*8 pt1,pt2,delphi

c -----------------------------------------------------------------

      pt1 = v4pt(p1)
      pt2 = v4pt(p2)

      delphi = phi2 - phi1
      if(delphi.gt.+pi) delphi = delphi - 2.0*pi
      if(delphi.lt.-pi) delphi = delphi + 2.0*pi

      if(jet_alg.eq.'ktjet'.or.jet_alg.eq.'ktbad') then

        if(pt1.gt.pt2) then
          pgs_kt_dist = pt2**2 
     .                     * ((eta1-eta2)**2 + delphi**2)/conesize**2
        else
          pgs_kt_dist = pt1**2 
     .                     * ((eta1-eta2)**2 + delphi**2)/conesize**2
        endif

      elseif(jet_alg.eq.'antikt') then

        if(pt1.lt.pt2) then
          pgs_kt_dist = 1.0/pt2**2 
     .                     * ((eta1-eta2)**2 + delphi**2)/conesize**2
        else
          pgs_kt_dist = 1.0/pt1**2 
     .                     * ((eta1-eta2)**2 + delphi**2)/conesize**2
        endif

      elseif(jet_alg.eq.'CAjet') then

         pgs_kt_dist = ((eta1-eta2)**2 + delphi**2)/conesize**2

      endif


      return
      end


      real*8 function pgs_kt_beam_distance(p1)

c calculate distance for kt, anti-kt, and CA jet finders

      implicit none

      include 'pgs.inc'

      real*8 p1


c -----------------------------------------------------------------

      if(jet_alg.eq.'ktjet'.or.jet_alg.eq.'ktbad') then

          pgs_kt_beam_distance = v4pt(p1)**2

      elseif(jet_alg.eq.'antikt') then

          pgs_kt_beam_distance = 1.0/v4pt(p1)**2

      elseif(jet_alg.eq.'CAjet') then

          pgs_kt_beam_distance = 1.0

      endif


      return
      end


      subroutine pgs_kt_jets

c find jets (calorimeter clusters) using kt algorithm
c (see hep-ph/0512210 for algorithm details)
c
c                             John Conway    Apr 2006
c         major bug fix:      Anson Hook     Aug 2011

      implicit none
      include 'pgs.inc'

      integer i,j,m,iktj,imax,imin,jmin,ieta,iphi,idis,npass
      real*8 eta,phi,theta,etower,ettower,etjet,etmax,em,eh

      real*8 tower_thresh
      parameter(tower_thresh=0.5)

      integer nktjmx,mktjmx
      parameter(nktjmx=1000)
      parameter(mktjmx=200)

      integer nktj,nktjck
      integer eaten(nktjmx),mktj(nktjmx),lisktj(mktjmx,nktjmx)
      integer ktjeta(nktjmx),ktjphi(nktjmx)
      integer sorted(nktjmx)

      integer numcl,lisclu(nktjmx)

      real*8 pktj(4,nktjmx),etaktj(nktjmx),phiktj(nktjmx)
      real*8 dmin,dist,dbeam,pgs_kt_dist,pgs_kt_beam_distance
      real*8 distances(nktjmx*nktjmx)

      logical done

c  1. make intitial list of particles
      
      nktj = 0

      do ieta = 1,netacal
        do iphi = 1,nphical
          etower = ecal(ieta,iphi) + hcal(ieta,iphi)
          if(etower.gt.0) then
            call pgs_index_etaphi(ieta,iphi,eta,phi)
            theta = 2.0 * datan(dexp(-eta))
            ettower = etower * sin(theta)
            if(ettower.gt.tower_thresh) then
              if(nktj.le.nktjmx) then
                nktj = nktj + 1
                pktj(1,nktj)   = etower * cos(phi) * sin(theta)
                pktj(2,nktj)   = etower * sin(phi) * sin(theta)
                pktj(3,nktj)   = etower * cos(theta)
                pktj(4,nktj)   = etower
                etaktj(nktj)   = eta
                phiktj(nktj)   = phi
                mktj(nktj)     = 1
                lisktj(1,nktj) = nktj
                ktjeta(nktj)   = ieta
                ktjphi(nktj)   = iphi
                eaten(nktj)    = -1
                sorted(nktj) = 0
              else
                write(pgs_log_unit,
     .                '('' PGS_KT_JETS: maximum number of'',
     .                  '' particles (3000) exceeded '')')
              endif
            endif
          endif
        enddo
      enddo

c make initial pair distance table

      do i=1,nktj-1
        do j=i+1,nktj
          distances((i-1)*nktj + j) = 
     .            pgs_kt_dist(pktj(1,i),etaktj(i),phiktj(i),
     .                        pktj(1,j),etaktj(j),phiktj(j))
        enddo
      enddo

      done = .false.
      npass = 0


      do while(.not.done)

        npass = npass + 1

c  2. loop over all pairs of particles, finding minimum d to others and dbeam

        dmin = 1.0e20

        done = .true.

        do i=1,nktj

          if(eaten(i).lt.0) then

            done = .false.

c check pair distance
            if(i.lt.nktj) then
              do j = i+1,nktj 
                if(eaten(j).lt.0) then
                  dist = distances((i-1)*nktj + j)
                  if(dist .lt. dmin) then
                    dmin = dist
                    imin = i
                    jmin = j
                  endif
                endif
              enddo
            endif

c check beam distance
            dbeam = pgs_kt_beam_distance(pktj(1,i))
            if(dbeam.le.dmin) then 
              dmin = dbeam
              imin = i
              jmin = 0
            endif

          endif

        enddo

c  3. merge as needed; remove "eaten" particles from live list

        if(.not.done) then
          if(jmin.eq.0) then  ! particle is on its own
            eaten(imin) = 0
          else
            if(v4pt(pktj(1,imin)).lt.v4pt(pktj(1,jmin))) then

              eaten(imin) = jmin
              pktj(1,jmin) = pktj(1,jmin) + pktj(1,imin)
              pktj(2,jmin) = pktj(2,jmin) + pktj(2,imin)
              pktj(3,jmin) = pktj(3,jmin) + pktj(3,imin)
              pktj(4,jmin) = pktj(4,jmin) + pktj(4,imin)
              etaktj(jmin) = v4eta(pktj(1,jmin))
              phiktj(jmin) = v4phi(pktj(1,jmin))
              mktj(jmin) = mktj(jmin) + mktj(imin)
              do m=1,mktj(imin)
                lisktj(mktj(jmin)+m,jmin) = lisktj(m,imin)
              enddo
              if(mktj(jmin).ge.mktjmx) then
                write(pgs_log_unit,
     .             '('' Error in pgs_kt_jets on event '',i5)') nevhep
                write(pgs_log_unit,
     .            '('' jet algorithm: '',a)') jet_alg
                write(pgs_log_unit,'('' kt jet multiplicity '',
     .                  ''maximum (300) reached '')')
                mktj(imin) = mktj(imin)-1
              endif
              idis = jmin
            else

              eaten(jmin) = imin
              pktj(1,imin) = pktj(1,imin) + pktj(1,jmin)
              pktj(2,imin) = pktj(2,imin) + pktj(2,jmin)
              pktj(3,imin) = pktj(3,imin) + pktj(3,jmin)
              pktj(4,imin) = pktj(4,imin) + pktj(4,jmin)
              etaktj(imin) = v4eta(pktj(1,imin))
              phiktj(imin) = v4phi(pktj(1,imin))
              mktj(imin) = mktj(imin) + mktj(jmin)    
              do m=1,mktj(jmin)
                lisktj(mktj(imin)+m,imin) = lisktj(m,jmin)
              enddo
              if(mktj(imin).ge.mktjmx) then
                write(pgs_log_unit,
     .             '('' Error in pgs_kt_jets on event '',i5)') nevhep
                write(pgs_log_unit,
     .            '('' jet algorithm: '',a)') jet_alg
                write(pgs_log_unit,'('' kt jet multiplicity'',
     .                  '' maximum (300) reached '')')
                mktj(imin) = mktj(imin)-1
              endif
              idis = imin
            endif

c now re-do distance calculation for particle 
c that eats the other one (idis)
 
            do i=1,nktj-1
              do j=i+1,nktj
                if(i.eq.idis.or.j.eq.idis) then
                  distances((i-1)*nktj + j) = 
     .              pgs_kt_dist(pktj(1,i),etaktj(i),phiktj(i),
     .                         pktj(1,j),etaktj(j),phiktj(j))
                endif
              enddo               
            enddo

          endif
        endif

      enddo

c  4. fill in PGS arrays with list of clusters

c make ET-sorted list of clusters

      numclu = 0
      done = .false.
      do while(.not.done)

        done = .true.

        etmax = 0.
        do i=1,nktj
          if(eaten(i).eq.0.and.sorted(i).eq.0) then
            done = .false.
            etjet = v4et(pktj(1,i)) 
            if(etjet.gt.etmax) then
              imax = i
              etmax = etjet
            endif
          endif
        enddo

        if(numclu.lt.nclumx) then
          if(.not.done) then
            numclu = numclu + 1
            lisclu(numclu) = imax
            sorted(imax) = 1
          endif
        else
          print '('' PGS_KT_JETS: maximum number'',
     .            '' of clusters (300) reached  '')'
          done = .true.
        endif

      enddo

c zero out cluster map

      do iphi=1,nphical
        do ieta=1,netacal
          cclu(ieta,iphi) = 0
        enddo
      enddo

c fill in cluster arrays

      nktjck = 0

      do i=1,numclu

        iktj = lisclu(i)

c seed tower eta, phi

        etaclu(i) = ktjeta(iktj)
        phiclu(i) = ktjphi(iktj)

c cluster eta-phi map; keep track of em/had energy

        em = 0.
        eh = 0.

        do j=1,mktj(iktj)
          ieta = ktjeta(lisktj(j,iktj))
          iphi = ktjphi(lisktj(j,iktj))
          cclu(ieta,iphi) = i
          em = em + ecal(ieta,iphi)
          eh = eh + hcal(ieta,iphi)
        enddo

        pclu(1,i) = pktj(1,iktj)
        pclu(2,i) = pktj(2,iktj)
        pclu(3,i) = pktj(3,iktj)
        pclu(4,i) = pktj(4,iktj)
        pclu(5,i) = v4mass(pktj(1,iktj))

c em, had, em fraction

        emclu(i) = em
        ehclu(i) = eh
        efclu(i) = em/(em+eh)

c cluster width, multiplicity  

        mulclu(i) = mktj(iktj)

        widclu(i) = pgs_cluster_width(i)

        nktjck = nktjck + mulclu(i)

      enddo

      return
      end

c  --------------------------
c  3. reconstruction routines 
c  --------------------------

      subroutine pgs_recon

c This routine is the main event reconstruction routine;
c it finds tracks, fills the calorimeter arrays, and 
c then determines the list of reconstructed objects.

      implicit none
      include 'pgs.inc'

      integer ieta,iphi,iobj,i,j

c initialize

      numobj = 0

      do iobj=1,nobjmx
        do i=1,4
          pobj(i,iobj) = 0.
        enddo
        do i=1,10
          vecobj(i,iobj) = 0.
        enddo
      enddo

c find jet clusters with kt algorithm

      if(jet_alg.eq.'ktjet') then
        call pgs_kt_jets
      elseif(jet_alg.eq.'antikt') then
        call pgs_kt_jets
      elseif(jet_alg.eq.'CAjet') then
        call pgs_kt_jets
      elseif(jet_alg.eq.'ktbad') then
        call pgs_kt_jets_bad
      elseif(jet_alg.eq.'cone') then
        call pgs_cone_jets
      else
        print '(//,'' unsupported jet algorithm: '',a)',jet_alg
        stop
      endif

c The following routines fill the PGSOBJ common; each 
c routine must bump up the object index and add objects to
c the end of the list.

c find photons/electrons

      call pgs_find_photon_electron

c find muons

      call pgs_find_muons

c find taus (hadronic decays)

      call pgs_find_taus

c find jets (including b-tagging)

      call pgs_find_jets

c find stable heavy charged

      call pgs_find_heavy

c uniquely identify objects

      call pgs_unique_id

c correct missing ET for muons

      call pgs_cor_met

      return
      end


      subroutine pgs_find_photon_electron

c loop over calorimeter arrays, searching for photons
c and electrons, put them in object list

      implicit none
      include 'pgs.inc'
                         
      real*8 eta,phi,st,et,etiso,ptiso,ptmax,ptetrk
      real*8 diff,ep,hadem,ptsum,theta
      integer niso,itrk,ietrk,itrmax,nsum,ieta,iphi

      real*8 hadem_max,et_min,et_iso_ratio,pt_iso_max,
     1   pt_trk_max,ep_min,ep_max,dr_max
      integer ntr_iso_max

c very loose cuts for electron/photon candidates; final cuts applied
c by pgs_object _cuts
      parameter(et_min=5.0,hadem_max=0.500)
      parameter(et_iso_ratio=0.50,pt_iso_max=50.0)
      parameter(ntr_iso_max=4,pt_trk_max=3.0)
      parameter(ep_min=0.10,ep_max=5.00)

c determine drmax for track-cluster matching based on tower size

      dr_max = max(deta,dphi)

c loop over calorimeter clusters

      do ieta=1,netacal
      do iphi=1,nphical
c check ecal first
        if (ecal(ieta,iphi).gt.0.) then
        call pgs_index_etaphi(ieta,iphi,eta,phi)
        st = sin( 2.0 * atan(exp(-eta)) )
        et = st*ecal(ieta,iphi)
        if(et.gt.et_min.and.abs(eta).lt.eta_max_egamma) then
        hadem=hcal(ieta,iphi)/ecal(ieta,iphi)
        if(hadem.lt.hadem_max) then
	  call pgs_tower_isosum(ieta,iphi,etiso)  ! the energy in the 3x3 cells (excl. central)
c these are the isolation sums
          call pgs_trk_isosum(eta,phi,0.40d0,ptiso,nsum,ptmax,itrmax)
c this finds the electron track and further isolation for photons
          call pgs_trk_isosum(eta,phi,dr_max,ptsum,niso,ptetrk,ietrk)

          ep=100.0
          if(ietrk.gt.0) ep=ecal(ieta,iphi)/p_trk(ietrk)

c apply calorimeter and track isolation cuts to make a photon

          if (  etiso/et.lt.et_iso_ratio .and. 
     .          ptiso.lt.pt_iso_max      .and. 
     .          niso.le.ntr_iso_max      .and. 
     .          ptetrk.lt.pt_trk_max) then

c add it to the object list
            if (numobj.lt.nobjmx) then

              numobj = numobj + 1

c find HEPEVT particle index
              call pgs_eta_phi_hep_match(eta,phi,
     1                 et/2.0,22,0,indobj(numobj))

              typobj(numobj) = 0     ! photon type

              pobj(1,numobj) = et*cos(phi)
              pobj(2,numobj) = et*sin(phi)

              theta = 2.0d0*(atan(exp(-eta)))
              pobj(3,numobj) = et/tan(theta)

              pobj(4,numobj) = ecal(ieta,iphi)

              qobj(numobj) = 0.

              vecobj(1,numobj) = ecal(ieta,iphi)
              vecobj(2,numobj) = hcal(ieta,iphi)
              vecobj(3,numobj) = ptetrk
              vecobj(4,numobj) = niso
              vecobj(5,numobj) = 0.
              vecobj(6,numobj) = et
              vecobj(7,numobj) = etiso
              vecobj(8,numobj) = ptiso
              vecobj(9,numobj) = hadem
              vecobj(10,numobj) = ep

            endif ! enough space in common

          endif  ! iso and fid cuts

c apply calorimeter, track isolation, and E/p cuts to make electrons
          if ( etiso/et.lt.et_iso_ratio        .and. 
     .         ptiso-ptetrk.lt.pt_iso_max      .and. 
     .         ep.gt.ep_min .and. ep.lt.ep_max) then

c add it to the object list
            if (numobj.lt.nobjmx) then

              numobj = numobj + 1

c fill HEPEVT particle index
              indobj(numobj) = indtrk(ietrk)

              typobj(numobj) = 1     ! electron type

c use electron track for direction, calorimeter for ET

              theta = 2.0d0*(atan(exp(-eta_trk(ietrk))))

              et = ecal(ieta,iphi) * sin(theta)

              pobj(1,numobj) = et*cos(phi_trk(ietrk))
              pobj(2,numobj) = et*sin(phi_trk(ietrk))
              pobj(3,numobj) = et/tan(theta)
              pobj(4,numobj) = ecal(ieta,iphi)

              qobj(numobj) = qtrk(ietrk)

              vecobj(1,numobj) = ecal(ieta,iphi)
              vecobj(2,numobj) = hcal(ieta,iphi)
              vecobj(3,numobj) = ptetrk
              vecobj(4,numobj) = niso
              vecobj(5,numobj) = 0.
              vecobj(6,numobj) = et
              vecobj(7,numobj) = etiso
              vecobj(8,numobj) = ptiso-ptetrk
              vecobj(9,numobj) = hadem
              vecobj(10,numobj) = ep

            endif ! enough space in common

          endif  ! iso and fid cuts

        endif ! had/em cut
        endif ! et, eta cut
        endif ! ecal check
      enddo ! phi loop
      enddo ! eta loop


      return
      end


c ************************************************************************

      subroutine pgs_trk_isosum(eta,phi,r,ptsum,nsum,ptmax,itrmax)

c sums the charged track pt in the radius r (eta-phi space) around eta and phi
c ptsum is the sum, nsum= number of tracks 
c ptmax, itrmax is the largest pt track
      implicit none
      include 'pgs.inc'

      real*8 eta,phi,r,ptsum,ptmax,ptmin,diff
      integer n,i,nsum,itrmax

c  minimum pt for a track to be counted in the isolation angle
      parameter (ptmin = 0.5)

      ptsum = 0.
      nsum = 0
      ptmax = 0.
      itrmax = 0

      do i = 1, numtrk
        if (pt_trk(i).gt.ptmin.and.qtrk(i).ne.0.0) then
c  compute phi difference
          call pgs_eta_phi_diff(eta,phi,eta_trk(i),
     1         phi_trk(i),diff)
	  if(diff.lt.r) then
	    nsum=nsum+1
	    ptsum=ptsum + pt_trk(i)
	    if(pt_trk(i).gt.ptmax) then
              ptmax=pt_trk(i)
	      itrmax=i
	    endif
	  endif
        endif
      enddo

      return
      end

c ************************************************************************

      subroutine pgs_eta_phi_hep_match(eta,phi,ptcut,id,msign,ind)

c searches HEPEVT for the particle type id which has a pt greater than ptmin
c and is closest to eta phi.  If no particles of type id pass ptcut, ind=0
c if msign=1 then also match the sign of id
c if id=+-100000 then match to closest charged particle
c note that particles are not final state so this could be used to 
c match a Z or b
      implicit none
      include 'pgs.inc'

      real*8 eta,phi,ptcut,dmin,diff
      integer id,msign,ind,i,ichg
      integer hepchg

      ind=0
      dmin=10.0

      if(iabs(id).lt.100000) then ! match particle id
        do i = 1, nhep
          if ( (msign.eq.1.and.idhep(i).eq.id) .or. 
     1         (msign.ne.1.and.iabs(idhep(i)).eq.iabs(id)) ) then
            if (pt_gen(i).gt.ptcut) then
c  compute phi difference
              call pgs_eta_phi_diff(eta,phi,eta_gen(i),
     1             phi_gen(i),diff)
	      if(diff.lt.dmin) then
                ind=i
                dmin=diff
	      endif  ! diff cut
            endif    ! ptcut
          endif      ! match id
        enddo        ! i
      else  ! match any track
        do i = 1, nhep
          ichg=hepchg(i)
          if(isthep(i).eq.1.and.ichg.ne.0) then
            if ( (msign.eq.1.and.id*ichg.gt.0) .or. 
     1         (msign.ne.1) ) then
              if (pt_gen(i).gt.ptcut) then
c  compute phi difference
                call pgs_eta_phi_diff(eta,phi,eta_gen(i),
     1                 phi_gen(i),diff)
	        if(diff.lt.dmin) then
                  ind=i
                  dmin=diff
	        endif ! diff cut
              endif   ! ptcut
            endif     ! sign correct
          endif       ! charged track
        enddo         ! i loop
      endif ! match particle or track

      return
      end

c ************************************************************************

      subroutine pgs_eta_phi_diff(eta1,phi1,eta2,phi2,diff)
c computes the distance in eta-phi space between two points

      implicit none
      include 'pgs.inc'
      real*8 eta1,phi1,eta2,phi2,diff
      real*8 delphi

      delphi = abs( phi1 - phi2 )
      if (delphi.ge.pi) delphi=2.0*pi-delphi
      diff=sqrt( delphi**2+ ( eta1 - eta2 )**2 )

      return
      end

c ************************************************************************

      subroutine pgs_tower_isosum(ieta,iphi,sum)

c  performs a simple calorimeter isolation energy sum calculation around a
c  given tower;  returns the transverse energy in a 3x3 tower array,
c  excluding the seed tower.

      implicit none
      include 'pgs.inc'

      integer ieta,iphi,iphi_left,iphi_right
      real*8 theta1,theta2,theta3,f1,f2,f3,sum
c these variables are used in call to pgs_index_etaphi
      real*8 eta1,eta2,eta3,phi1,phi2,phi3

      sum = 0.

c  return a large number for towers on the eta edge
      if (ieta.eq.1.or.ieta.eq.netacal) then
        sum = 999.
        goto 999
      endif

c  identify tower indices left and right of the seed tower
      iphi_left = iphi - 1
      if (iphi_left.lt.1) iphi_left = nphical

      iphi_right = iphi + 1
      if (iphi_right.gt.nphical) iphi_right = 1

c  look up true eta using tower coordinates
      call pgs_index_etaphi(ieta-1,iphi_left ,eta1,phi1)
      call pgs_index_etaphi(ieta  ,iphi      ,eta2,phi2)
      call pgs_index_etaphi(ieta+1,iphi_right,eta3,phi3)

c  convert pseudorapidity eta to angle theta;  ET = sin(theta) * E
      theta1 = 2. * atan( exp(-eta1) )
      theta2 = 2. * atan( exp(-eta2) )
      theta3 = 2. * atan( exp(-eta3) )
      f1 = sin( theta1 )
      f2 = sin( theta2 )
      f3 = sin( theta3 )

c  calculate the sum
      sum =    f1*ecal(ieta-1,iphi_left )  +  f1*hcal(ieta-1,iphi_left )
     .       + f1*ecal(ieta-1,iphi      )  +  f1*hcal(ieta-1,iphi      )
     .       + f1*ecal(ieta-1,iphi_right)  +  f1*hcal(ieta-1,iphi_right)
     .       + f2*ecal(ieta  ,iphi_left )  +  f2*hcal(ieta  ,iphi_left )
     .       + f2*ecal(ieta  ,iphi_right)  +  f2*hcal(ieta  ,iphi_right)
     .       + f3*ecal(ieta+1,iphi_left )  +  f3*hcal(ieta+1,iphi_left )
     .       + f3*ecal(ieta+1,iphi      )  +  f3*hcal(ieta+1,iphi      )
     .       + f3*ecal(ieta+1,iphi_right)  +  f3*hcal(ieta+1,iphi_right)

 999  return
      end

c ************************************************************************



      subroutine pgs_find_muons

c loop over generated particles and find muons

      implicit none
      include 'pgs.inc'

      integer ihep,ieta,iphi,itrk,mutk,itmx

      integer n30,nsum,itrmax

      real*8 etrk,ct,ep,etmx

      real*4 pgs_ranmar

      real*8 pgs_muo_eff,ptiso,ptmax

c loop over HEPEVT entries

      do ihep=1,nhep        

c is generated particle a muon?

        if (isthep(ihep).eq.1    .and.   ! final state particle
     .      et_gen(ihep).ge.3.0  .and.   ! ET > 3 GeV
     .     abs(idhep(ihep)).eq.13) then  ! it's a muon

c is it in the fiducial region?

          if (abs(eta_gen(ihep)).lt.eta_max_muon) then  !  max|eta| for muons

c did the muon make a track?

            mutk = 0
            do itrk=1,numtrk
              if (indtrk(itrk).eq.ihep) mutk = itrk
            enddo

c demand that muon left track

            if (mutk.ne.0) then

c add to reconstructed object list

              if (numobj.le.nobjmx) then

                numobj = numobj + 1
                indobj(numobj) = ihep  ! index is pointer to generated muon
                typobj(numobj) = 2     ! muon type
c 4-vector
                pobj(1,numobj) = ptrk(1,mutk)
                pobj(2,numobj) = ptrk(2,mutk)
                pobj(3,numobj) = ptrk(3,mutk)
                pobj(4,numobj) = sqrt(0.10566**2 + p_trk(mutk)**2)

                qobj(numobj) = qtrk(mutk)

c look for nearby tracks in 30-degree cone

                n30 = 0
                etrk = 0.
                etmx = 0.
                itmx = 0

                do itrk=1,numtrk
                  if (pt_trk(itrk).gt.0.5 .and.itrk.ne.mutk) then
                    ct = cos_theta(ptrk(1,itrk),ptrk(1,mutk))
                    if (ct.gt.0.866) then
                      n30 = n30 + 1
                      etrk = etrk + p_trk(itrk)
                      if (p_trk(itrk).gt.etmx) then
                        etmx = p_trk(itrk)  
                        itmx = itrk
                      endif
                    endif
                  endif
                enddo

c quantities

                call pgs_trk_isosum(eta_gen(ihep),phi_gen(ihep),0.4d0,
     .              ptiso,nsum,ptmax,itrmax)

                call pgs_etaphi_index(eta_gen(ihep),phi_gen(ihep),
     .                                ieta,iphi)
                if (ieta.ge.1.and.ieta.le.netacal.and.
     .              iphi.ge.1.and.iphi.le.nphical) then

                  vecobj(1,numobj) = ecal(ieta,iphi)    ! EM energy
                  vecobj(2,numobj) = hcal(ieta,iphi)    ! HAD energy
                  vecobj(3,numobj) = p_trk(mutk)        ! track momentum
                  vecobj(4,numobj) = n30                ! additional tracks
                  vecobj(5,numobj) = etrk               ! energy of additional tracks
                  vecobj(6,numobj) = ptiso-pt_trk(mutk) ! track isolation
                endif

              endif
            endif
          endif
        endif
      enddo

      return
      end


c--------------------------------------------------------------
      real*8 function pgs_muo_eff(v4)
c--------------------------------------------------------------
c submitted by Mark Kruse 
c              Univ. of Rochester
c              mkruse@fnald.fnal.gov
c--------------------------------------------------------------
c
c      * function to calculate (roughly) the efficiency for a
c        high-Pt muon in the CDF Run II detector. the input
c        is the muon 4-vector (px,py,pz,mass), and the efficiency
c        is gotten in the main routine by something like....
c        EFF = PGS_MUO_EFF(muo_4_vector)
c        at present the efficiency is returned according only to
c        the muon eta. one might imagine that later the
c        isolation also be calculated (or input) and the
c        efficiency returned as a function of this also.
c
c      THE FOLLOWING ASSUMPTIONS ARE MADE :
c
c      * assume all phi values are fiducial
c      * cmu :      |eta| < 0.6
c      * cmp/csp :  |eta| < 0.6
c      * cmx/csx :  0.6 < |eta| < 1.0
c      * imu     :  1.0 < |eta| < 1.5
c      * trigger efficiencies are not taken into account.
c      * the fiducial efficiencies assume that cmio's are not being
c        considered. even though they are not triggered on, they can come
c        in on other triggers, and so will be in some analyses, in 
c        particular dilepton analyses, and so the efficiencies here will
c        tend to be larger for those analyses which take cmio's. this could
c        be taken into account by setting some flag in a later iteration
c        if desired.
c      * the fiducial efficiencies were estimated from page 10-4 of the TDR.
c      * the efficiencies below are derived from the run 1b high-Pt
c        (Pt > 20 GeV) muon efficiencies. for lower Pt muons a different
c        routine should be called.
c      * the IMU efficiencies i put the same as the run 1b CMX efficiencies.
c        this will be about right, but naturally the purity in the IMU
c        will be a lot worse (but this won't matter for a given MC sample).
c
c-------------------------------------------------------------------------

      implicit none

      real*8 v4(4)
      real Px,Py,Pz,m,P,Pt,Et,eta,phi,theta

      real fid_eff_central, fid_eff_cmx, fid_eff_imu
      real pi,twopi
      parameter (pi = 3.142592654, twopi = 6.283185307)

      pgs_muo_eff = 0.

      Px = v4(1)
      Py = v4(2)
      Pz = v4(3)
      m  = v4(4)

c calculate Pt, Et, P

      Pt = sqrt(Px**2 + Py**2)
      Et = sqrt(Pt**2 + m**2)
      P  = sqrt(Pt**2 + Pz**2)

c calculate eta

      theta = acos(Pz/P)
      if (tan(theta/2) .eq. 0) then
         eta = 99.
      else if (tan(theta/2) .lt. 0) then
         eta = 99.
      else
         eta = -alog(tan(theta/2))
      endif

c calculate phi

      if (Px.eq.0.and.Py.eq.0) then
         phi = 0
      else
         phi = atan2(Py,Px)
      endif

      if (phi.lt.0) phi = phi + twopi

c========================================================================
c      check fiduciality and return efficiency
c========================================================================

      fid_eff_central = 1.0
      fid_eff_cmx     = 0.95
      fid_eff_imu     = 0.75

      if (abs(eta).gt.1.5) then

         pgs_muo_eff = 0.

      else if (abs(eta).lt.0.6) then

         pgs_muo_eff = 0.92*fid_eff_central

      else if (abs(eta).ge.0.6.and.abs(eta).lt.1.0) then

         pgs_muo_eff = 0.91*fid_eff_cmx

      else if (abs(eta).ge.1.0.and.abs(eta).lt.1.5) then

         pgs_muo_eff = 0.91*fid_eff_imu

      endif


      return
      end      




      subroutine pgs_find_taus

c loop over generated particles and find hadronic tau decays

      implicit none
      include 'pgs.inc'

      integer i,k,ihep,iclu,itrk,ntrk,n30,iseed,npi0_cone,npi0_iso

      integer track_used(ntrkmx)

      real*8 qtot,width,ptmax,etrk,ecut,ct,pseed(4)
      real*8 ptrk_tau(4),ppi0_tau(4),ptau(4)

      real*8 width_max,ecut_min,ptmax_cut,mpi,mpi0,mtau

      real*8 etau,cone,alpha,almin,gamma,gamin,ptiso,gtiso

      parameter(width_max=99.9) ! not a cut at all really...
      parameter(ecut_min=0.05)  ! very loose initial cut
      parameter(ptmax_cut=3.0)  !   "   "    "       "

      parameter(mpi =0.13957)
      parameter(mpi0=0.13496)

c zero used track flags
      do itrk=1,numtrk
        track_used(itrk) = 0
      enddo

c loop over calorimeter clusters
      do iclu=1,numclu
        if (abs(eta_clu(iclu)).lt.eta_max_tau) then    ! max|eta| 
          if (et_clu(iclu).gt.10.) then                ! ET > 10 GeV

            etau = pclu(4,iclu)

c find highest-pt track associated with calorimeter cluster

            iseed = 0
            ptmax = 0.
            do itrk=1,numtrk
              if(pt_trk(itrk).gt.1.0.and.track_used(itrk).eq.0) then
                ct = cos_theta(ptrk(1,itrk),pclu(1,iclu))
                if (ct.gt.0.9848) then   ! track must be within 10 degrees
                  if(pt_trk(itrk).gt.ptmax) then
                    iseed = itrk
                    ptmax = pt_trk(itrk)
                  endif
                endif
              endif
            enddo

            if(iseed.ne.0) then

              track_used(iseed) = 1

c find associated tracks in 10-degree cone and 10-30 degree cone
c around seed track direction

              ntrk = 0
              n30  = 0
              almin = 999.
              gamin = 999.

              ptmax = 0.
              etrk = 0.
              qtot = 0.
              ptrk_tau(1) = 0.
              ptrk_tau(2) = 0.
              ptrk_tau(3) = 0.
              ptrk_tau(4) = 0.

              do itrk=1,numtrk
                ct = cos_theta(ptrk(1,itrk),ptrk(1,iseed))

c calculate track isolation using "shrinking" cone

                cone = 5.0/etau  ! cone size
                if(cone.gt.0.200) cone = 0.200
                if(cone.lt.0.050) cone = 0.050

                ptiso = 0.

                if (pt_trk(itrk).gt.1.0) then
                  if (ct.gt.cos(cone)) then
                    ntrk = ntrk + 1
                    if (pt_trk(itrk).gt.ptmax) ptmax = pt_trk(itrk)
                    etrk = etrk + p_trk(itrk)
                    qtot = qtot + qtrk(itrk)
                    ptrk_tau(1) = ptrk_tau(1) + ptrk(1,itrk)
                    ptrk_tau(2) = ptrk_tau(2) + ptrk(2,itrk)
                    ptrk_tau(3) = ptrk_tau(3) + ptrk(3,itrk)
                    ptrk_tau(4) = ptrk_tau(4) 
     .                            + sqrt(p_trk(itrk)**2+mpi**2)
                  else
                    if (ct.gt.0.8660) then
                      n30 = n30 + 1
                      ptiso = ptiso + pt_trk(itrk)     ! sum pt of tracks out of cone
                    endif
                    alpha = acos(ct)
                    if(alpha.lt.almin) almin = alpha
                  endif
                endif
              enddo

c electron cut variable (should be near 0 for electrons, 1 for taus)

              ecut = 0.
              if (etrk.ne.0) then
                ecut = ehclu(iclu)/etrk
              endif

c now fake in neutrals by looking at pi0's in/out of cone

              ppi0_tau(1) = 0.
              ppi0_tau(2) = 0.
              ppi0_tau(3) = 0.
              ppi0_tau(4) = 0.

              npi0_cone = 0
              npi0_iso  = 0

              gtiso = 0.

              do ihep=1,nhep
                if (isthep(ihep).eq.2.and.
     .               abs(idhep(ihep)).eq.111.and.
     .               phep(4,ihep).gt.1.0) then
                  ct = cos_theta(phep(1,ihep),ptrk_tau(1))
                  if (ct.gt.cos(cone)) then
                    ppi0_tau(1) = ppi0_tau(1) + phep(1,ihep)    
                    ppi0_tau(2) = ppi0_tau(2) + phep(2,ihep)    
                    ppi0_tau(3) = ppi0_tau(3) + phep(3,ihep)    
                    ppi0_tau(4) = ppi0_tau(4) + phep(4,ihep)    
                    npi0_cone = npi0_cone + 1
                  else
                    if(ct.gt.0.8660) then
                      npi0_iso = npi0_iso + 1
                      gtiso = gtiso + pt_gen(ihep)      ! sum pt of pi0's out of cone
                    endif
                    gamma = acos(ct)
                    if(gamma.lt.gamin) gamin = gamma
                  endif
                endif
              enddo

c calculate tau mass

              ptau(1) = ptrk_tau(1) + ppi0_tau(1)
              ptau(2) = ptrk_tau(2) + ppi0_tau(2)
              ptau(3) = ptrk_tau(3) + ppi0_tau(3)
              ptau(4) = ptrk_tau(4) + ppi0_tau(4)

              mtau = sqrt(ptau(4)**2-ptau(3)**2-ptau(2)**2-ptau(1)**2)

c cluster width  

              width = widclu(iclu)

c perform loose final cuts to allow study offline

              if (
     .           ecut.gt.ecut_min       .and.     ! not electron  
     .           ptmax.gt.ptmax_cut     .and.     ! minimum on maximum track pt
     .           width.lt.width_max) then         ! width cut

                if (numobj.lt.nobjmx) then

                  numobj = numobj + 1
                  indobj(numobj) = iclu  ! index is pointer to cluster
                  typobj(numobj) = 3     ! tau type

c use tau track direction, calorimeter energy

                  pobj(1,numobj) = pclu(4,iclu)*ptrk_tau(1)
     .                                         /v4p(ptrk_tau)
                  pobj(2,numobj) = pclu(4,iclu)*ptrk_tau(2)
     .                                         /v4p(ptrk_tau)
                  pobj(3,numobj) = pclu(4,iclu)*ptrk_tau(3)
     .                                         /v4p(ptrk_tau)
                  pobj(4,numobj) = pclu(4,iclu)

                  qobj(numobj) = qtot

                  vecobj( 1,numobj) = emclu(iclu)   ! electromagnetic energy of tau cluster
                  vecobj( 2,numobj) = ehclu(iclu)   ! hadronic energy of tau cluster
                  vecobj( 3,numobj) = etrk          ! energy of tracks in tau cone
                  vecobj( 4,numobj) = ntrk          ! number of tracks in tau cone
                  vecobj( 5,numobj) = width         ! tau cluster width
                  vecobj( 6,numobj) = mtau          ! track+pi0 mass
                  vecobj( 7,numobj) = ptmax         ! pt of highest-pt track in cone
                  vecobj( 8,numobj) = ptiso ! almin         ! minimum angle of track (not in cone) to tau
                  vecobj( 9,numobj) = npi0_cone     ! number of pi0 in cone
                  vecobj(10,numobj) = gtiso ! gamin         ! minimum angle of pi0 (not in cone) to tau 

                endif
              endif      
            endif           
          endif
        endif
      enddo

      return
      end


      subroutine pgs_find_jets

c turn calorimeter clusters into jet objects

      implicit none
      include 'pgs.inc'

      integer iclu,itrk,n30

      real*8 qtot,width,etrk,ecut,ct

      real*8 width_max,ecut_max

      real*8 zv

      real*8 z_vertex_spread
      parameter(z_vertex_spread=30.)

      real*4 a,b

c set z vertex (used for tagging fiducial cuts)

      call pgs_rannor(a,b)
      zv = a * z_vertex_spread

c loop over calorimeter clusters
      do iclu=1,numclu
        if (abs(eta_clu(iclu)).lt.4.0) then   ! |eta| < 4
          if (et_clu(iclu).gt.5.) then        ! ET > 5 GeV

c find associated tracks in 30-degree cone

            n30 = 0
            etrk = 0.
            qtot = 0.
            do itrk=1,numtrk
              if (pt_trk(itrk).gt.1.0) then
                ct = cos_theta(ptrk(1,itrk),pclu(1,iclu))
                if (ct.gt.0.8660) then
                  n30 = n30 + 1
                  etrk = etrk + p_trk(itrk)
                  qtot = qtot + qtrk(itrk)
                endif
              endif
            enddo

c perform final cuts (well, there are none...)

            if (numobj.lt.nobjmx) then

              numobj = numobj + 1
              indobj(numobj) = iclu  ! index is pointer to cluster
              typobj(numobj) = 4     ! jet type

              pobj(1,numobj) = pclu(1,iclu)
              pobj(2,numobj) = pclu(2,iclu)
              pobj(3,numobj) = pclu(3,iclu)
              pobj(4,numobj) = pclu(4,iclu)

              qobj(numobj) = qtot

              vecobj(1,numobj) = emclu(iclu)
              vecobj(2,numobj) = ehclu(iclu)
              vecobj(3,numobj) = etrk
              vecobj(4,numobj) = n30
              vecobj(5,numobj) = widclu(iclu)

              call pgs_jet_flavor_tags(numobj,zv)

            endif      
          endif           
        endif
      enddo

      return
      end


      subroutine pgs_jet_flavor_tags(jet,zvertex)

c set flags for c- and b-tagging of jets in vecobj
c based on various algorithms
c
c    variable        meaning      value
c ---------------------------------------
c
c    vecobj(6,iobj)  true jet    21     gluon
c                    type        1,2,3  d,u,s
c                                4      c
c                                5      b
c
c    vecobj(7,iobj)  loose      0 = no tag
c                    b-tag      1 =  b tag
c
c    vecobj(8,iobj)  tight      0 = no tag
c                    b-tag      1 =  b tag
c

      implicit none
      include 'pgs.inc'

      integer jet,type

      real*8 zvertex

      real max_eta_tag
      parameter (max_eta_tag=2.0) ! maximum eta for jet tagging

      real*8 eff_loose,eff_tight,etj,etaj

      real*4 zv,pgs_ranmar,rr

      logical b_in_cone,c_in_cone

c object is a jet

      if(typobj(jet).ne.4) return

c clear variables

      vecobj(6,jet) = 0.
      vecobj(7,jet) = 0.
      vecobj(8,jet) = 0.
      vecobj(9,jet) = 0.

c determine true origin of jet (type: 21=g, 1=d, 2=u, 3=s, 4=c, 5=b)

      call pgs_true_jet_type(jet,type,c_in_cone,b_in_cone)
      vecobj(6,jet) = type

c fiducial cuts: z vertex and jet eta

      if(abs(zvertex).gt.60.) return   ! 60 cm z vertex fiducial cut
      if(abs(eta_obj(jet)).gt.max_eta_tag) return ! jet eta cut

c random number

      rr = pgs_ranmar()

      etj  = et_obj(jet)
      etaj = abs(eta_obj(jet))
      
c loose tag efficiency

      call pgs_loose_btag(type,c_in_cone,b_in_cone,
     .                    etj,etaj,eff_loose)

c tight tag efficiency

      call pgs_tight_btag(type,c_in_cone,b_in_cone,
     .                    etj,etaj,eff_tight)

c record vector quantities

      if(rr.lt.eff_loose) vecobj(7,jet) = 1.0
      if(rr.lt.eff_tight) vecobj(8,jet) = 1.0

      return
      end


      subroutine pgs_loose_btag(type,c_in_cone,b_in_cone,
     .                          etjin,etaj,efftag)

c efficiency parameterizations for CDF Run 2 loose SECVTX tagger
c
c   Jason Nielsen, Nov. 2005

      implicit none

      integer type
      real*8 etjin,etj,etaj,efftag

      logical c_in_cone,b_in_cone

      etj = etjin
      if(etj.gt.160.0) etj = 160.0

c it's a gluon/uds jet
c systematic uncertainty is 8%
      if((type.ge.1.and.type.le.3).or.type.eq.21) then
        efftag = 0.0145 - 0.00112*etj + 0.0000445*etj**2 
     .           - 0.000000560*etj**3 + 0.00000000313*etj**4 
     .           - 0.00000000000692*etj**5
        efftag = efftag * (0.876 + 0.266*etaj + 0.504*etaj**2 
     .           - 0.535*etaj**3)
      endif

c it's a charm jet
c not measured separately at CDF; 26% of bjet eff in simulation
      if(type.eq.4.or.c_in_cone) then
        efftag = 0.178 + 0.0161*etj - 0.000296*etj**2 
     .           + 0.00000271*etj**3 - 0.0000000127*etj**4 
     .           + 0.0000000000236*etj**5
        efftag = efftag * (1.02 - 0.173*etaj + 0.161*etaj**2 
     .           + 0.692*etaj**3 - 1.07*etaj**4 + 0.312*etaj**5)
!       efftag = efftag * 1.1          ! don't include soft muon tag enhancement
        efftag = efftag * 0.26
      endif

c it's a b jet
c systematic uncertainty is 7%
      if(type.eq.5.or.b_in_cone) then
        efftag = 0.178 + 0.0161*etj - 0.000296*etj**2 
     .           + 0.00000271*etj**3 - 0.0000000127*etj**4 
     .           + 0.0000000000236*etj**5
        efftag = efftag * (1.02 - 0.173*etaj + 0.161*etaj**2 
     .           + 0.692*etaj**3 - 1.07*etaj**4 + 0.312*etaj**5)
c       efftag = efftag * 1.1          ! don't include soft muon tag enhancement
      endif

      if(efftag.lt.0.0) efftag = 0.0

      return
      end


      subroutine pgs_tight_btag(type,c_in_cone,b_in_cone,
     .                          etjin,etaj,efftag)

c efficiency parameterizations based on CDF Run 2 tight SECVTX tagger
c
c   Jason Nielsen, Nov. 2005

      implicit none

      integer type
      real*8 etjin,etj,etaj,efftag

      logical c_in_cone,b_in_cone

      etj = etjin
      if(etj.gt.160.0) etj = 160.0

c it's a gluon/uds jet
c systematic uncertainty is 8%
      if((type.ge.1.and.type.le.3).or.type.eq.21) then
        efftag = 0.00355 - 0.000263*etj + 0.0000118*etj**2 
     .           - 0.000000141*etj**3 + 0.000000000753*etj**4 
     .           - 0.00000000000155*etj**5
        efftag = efftag * (0.821 + 0.452*etaj + 0.437*etaj**2 
     .           - 0.555*etaj**3)
      endif

c it's a charm jet
c not measured separately at CDF; 22% of bjet eff in simulation
      if(type.eq.4.or.c_in_cone) then
        efftag = 0.108 + 0.0175*etj - 0.000347*etj**2 
     .           + 0.00000332*etj**3 - 0.0000000158*etj**4 
     .           + 0.0000000000293*etj**5
        efftag = efftag * (1.05 - 0.517*etaj + 1.457*etaj**2 
     .           - 1.20*etaj**3 + 0.0466*etaj**4 + 0.0895*etaj**5)
        efftag = efftag * 0.22  ! charm eff is 22% of b eff
      endif

c it's a b jet
c systematic uncertainty is 7%
      if(type.eq.5.or.b_in_cone) then
        efftag = 0.108 + 0.0175*etj - 0.000347*etj**2 
     .           + 0.00000332*etj**3 - 0.0000000158*etj**4 
     .           + 0.0000000000293*etj**5
        efftag = efftag * (1.05 - 0.517*etaj + 1.457*etaj**2 
     .           - 1.20*etaj**3 + 0.0466*etaj**4 + 0.0895*etaj**5)
!       efftag = efftag * 1.1          ! don't include soft muon tag enhancement
      endif

      if(efftag.lt.0.0) efftag = 0.0

      return
      end



      subroutine pgs_true_jet_type(jet,type,c_in_cone,b_in_cone)

c Find the type of highest-ET primary parton pointing within
c 20 degrees of a reconstructed jet.  If a primary quark
c radiates a gluon, the primary should still be higher energy
c unless the gluon is radiated outside the 20 degree cone.

      implicit none
      include 'pgs.inc'

      integer ihep,jet,type

      real*8 ct,emax

      logical b_in_cone,c_in_cone

      type = 21  ! default to gluon type

c loop over generated particles

      emax = 0.

      b_in_cone = .false.
      c_in_cone = .false.

      do ihep=1,nhep

c is it a u/d/s/c/b quark or gluon?
        if((abs(idhep(ihep)).ge.1.and.abs(idhep(ihep)).le.5).or.
     .     abs(idhep(ihep)).eq.21.or.abs(idhep(ihep)).eq.9) then

c find angle between generated quark/gluon and reconstructed jet

          ct = cos_theta(phep(1,ihep),pobj(1,jet))

          if(ct.gt.0.9397) then             ! within 20 degrees

c b, c in cone?

            if(abs(idhep(ihep)).eq.4) c_in_cone = .true.
            if(abs(idhep(ihep)).eq.5) b_in_cone = .true.

c find maximum energy
            if(phep(4,ihep).gt.emax) then
              emax = phep(4,ihep)
              type = abs(idhep(ihep))
            endif

          endif

        endif
      enddo

      return
      end



      function pgs_cluster_width(iclu)

c find rms cluster width

      implicit none
      include 'pgs.inc'

      integer ieta,iphi,iclu

      real*8 sum,sume,sumee,sump,sumpp,de,dp,etower,eta,phi,theta

      pgs_cluster_width = 0.

      if (mulclu(iclu).le.1) return

      sum   = 0.
      sume  = 0.
      sumee = 0.
      sump  = 0.
      sumpp = 0.

      do ieta=1,netacal
        do iphi=1,nphical
          if (cclu(ieta,iphi).eq.iclu) then  ! tower in cluster
            etower = ecal(ieta,iphi) + hcal(ieta,iphi)
            call pgs_index_etaphi(ieta,iphi,eta,phi)
            theta = 2.0 * atan(exp(-eta))
            etower = etower * sin(theta)  ! change to ET of tower

            de = abs(eta-eta_clu(iclu))
            dp = phi-phi_clu(iclu)
            if (dp.gt.+pi) dp = dp-2.0*pi
            if (dp.lt.-pi) dp = dp+2.0*pi
            dp = abs(dp)

            sum   = sum   + etower
            sume  = sume  + etower*de 
            sumee = sumee + etower*de*de 
            sump  = sump  + etower*dp 
            sumpp = sumpp + etower*dp*dp

          endif
        enddo
      enddo

      de = abs((sume/sum)**2 - sumee/sum)
      dp = abs((sump/sum)**2 - sumpp/sum)

      pgs_cluster_width = de + dp

      if (pgs_cluster_width.gt.0.) then
        pgs_cluster_width = sqrt(pgs_cluster_width)
      else
        pgs_cluster_width = 0.
      endif

      return
      end



      function pgs_trigger_cluster_width(itrc)

c find rms cluster width of trigger cluster

      implicit none
      include 'pgs.inc'

      integer ieta,iphi,itrc

      real*8 sum,sume,sumee,sump,sumpp,de,dp,etower,eta,phi,theta

      pgs_trigger_cluster_width = 0.

      if (multrc(itrc).le.1) return

      sum   = 0.
      sume  = 0.
      sumee = 0.
      sump  = 0.
      sumpp = 0.

      do ieta=1,netacal
        do iphi=1,nphical
          if (ctrc(ieta,iphi).eq.itrc) then  ! tower in cluster
            etower = ecal(ieta,iphi) + hcal(ieta,iphi)
            call pgs_index_etaphi(ieta,iphi,eta,phi)
            theta = 2.0 * atan(exp(-eta))
            etower = etower * sin(theta)  ! change to ET of tower

            de = abs(eta-eta_trc(itrc))
            dp = phi-phi_trc(itrc)
            if (dp.gt.+pi) dp = dp-2.0*pi
            if (dp.lt.-pi) dp = dp+2.0*pi
            dp = abs(dp)

            sum   = sum   + etower
            sume  = sume  + etower*de 
            sumee = sumee + etower*de*de 
            sump  = sump  + etower*dp 
            sumpp = sumpp + etower*dp*dp

          endif
        enddo
      enddo

      de = abs((sume/sum)**2 - sumee/sum)
      dp = abs((sump/sum)**2 - sumpp/sum)

      pgs_trigger_cluster_width = de + dp

      if (pgs_trigger_cluster_width.gt.0.) then
        pgs_trigger_cluster_width = sqrt(pgs_trigger_cluster_width)
      else
        pgs_trigger_cluster_width = 0.
      endif

      return
      end


      subroutine pgs_find_heavy

c reconstruct heavy stable charged particles

      implicit none
      include 'pgs.inc'

      integer ihep,itrk,hstk

      real*4 pgs_ranmar,eff,trigeff

      real*4 stdchg

c loop over HEPEVT entries

      do ihep=1,nhep        

c is it final state and charged?

        if (isthep(ihep).eq.1    .and.            ! final state particle
     .     abs(stdchg(idhep(ihep))).gt.0.0) then  ! charged

c did it leave a track?

          hstk = 0
          do itrk=1,numtrk
            if (indtrk(itrk).eq.ihep) hstk = itrk
          enddo

          if (hstk.ne.0) then

c apply efficiency using D. Stuart routine

            call pgs_heavy_eff(phep(1,ihep),eff,trigeff)

c use product of trigger and reconstruction efficiency

            if (pgs_ranmar().lt.eff*trigeff) then

              numobj = numobj + 1
              indobj(numobj) = ihep  ! index is pointer to generated 
              typobj(numobj) = 5     ! heavy stable type
c 4-vector
              pobj(1,numobj) = ptrk(1,hstk)
              pobj(2,numobj) = ptrk(2,hstk)
              pobj(3,numobj) = ptrk(3,hstk)
              pobj(4,numobj) = sqrt(0.10566**2 + p_trk(hstk))

            endif
          endif
        endif
      enddo

      return
      end


      subroutine pgs_heavy_eff(v4,eff,trigeff)
c----------------------------------------------------------------------------------
c
c  This routine estimates the efficiency for a highly ionizing
c  track in the CDF Run II detector.
c
c  The input is the particle's 4-vector; v4 = (px,py,pz,E).
c  eff is the estimated efficiency for identifying this particle
c  as highly ionizing.
c
c  Trigeff is the estimated efficiency for triggering on this particle
c  as a muon. (You must trigger the event on something before hoping to
c  reconstruct anything in the event).
c
c  Note that this routine is not valid for strongly interacting particles.
c  They would undergo additional interactions within the calorimeters
c  which reduce the efficiency by a factor of 2 to 3 (depending on charge
c  and mass.) This effect is ignored making the efficiency estimate
c  relevant only to weakly interacting particles (e.g. a stau).
c
c  The efficiency includes the following rough constraints on 
c  detecting a highly ionizing track.
c
c     Trigger requirements:
c
c        |eta| < 0.6 (to be within triggerable muon chambers)
c                    (other chambers have time of flight cuts in trig)
c        pT > 15 GeV (tracking trigger threshold)
c        mass > 10 GeV (to quickly remove pi,k,e, etc.)
c        beta*gamma > 0.4  (to avoid track trig problems)
c        Enough beta to penetrate calorimeters. Is mass dependent.
c        Trigger efficiency is then ~90% (fiducial region, etc.)
c
c     Reconstruction requirements:
c
c        |eta| < 1.0  (to fully reconstruct the track)
c        pT > 30 (to avoid large backgrounds at low pT)
c        beta*gamma > 0.4  (to reconstruct the track w/o drift time err)
c        beta*gamma < 0.85 (to identify it as a highly ionizing track)
c        Reconstruction efficiency is then ~90% (track quality cuts)
c
c  For more information, contact David Stuart, stuart@fnal.gov
c
c-------------------------------------------------------------------------
      implicit none

      real*8 v4(4)          ! input
      real*4 eff, trigeff   ! output
      real*8 Px,Py,Pz,m,P,E,Pt,eta,phi,theta,bg
      real L  ! Penetration length in iron

c calculate momentum and beta*gamma

      Px = v4(1)
      Py = v4(2)
      Pz = v4(3)
      E  = v4(4)

      Pt = sqrt(Px**2 + Py**2)
      P = sqrt(pt**2+pz**2)
      m  = E**2 - P**2

        If ( m .lt. 0. ) Then
c          if(m.lt.-0.01) 
          eff = 0.
          Trigeff = 0.
          return
        else
          m = sqrt(m)
          if ( m .ne. 0. ) Then
            bg = p/m
          else
            bg = 999.
          endif
        endif

c ignore light particles

        if ( m .lt. 10. ) Then
          eff = 0.
          Trigeff = 0.
          Return
        endif

c calculate eta

        if ( p .ne. 0. ) Then
          theta = acos(Pz/P)
        else
          theta = 0.
        endif

	if (tan(theta/2) .eq. 0.) Then
	   eta = 99.
	else if (tan(theta/2) .lt. 0.) Then
	   eta = 99.
	else
	   eta = -log(tan(theta/2))
	endif

c========================================================================
c	check trigger
c========================================================================

        Trigeff = 0.9
	if ( abs(eta) .gt. 0.6 ) Trigeff = 0.
	if ( abs(pt) .lt. 15. ) Trigeff = 0.
        if ( bg .lt. 0.4 ) Trigeff = 0.

c  Calculate iron penetration length as parameterized by
c  Drees & Tata, Phys Lett B 252, 695

        L = 0.039 * m * exp(8.47*p/E)

        if ( L .lt. 150. ) Then
          Trigeff = 0.
        endif

c========================================================================
c	check reconstruction
c========================================================================

        eff = 0.9
	if ( abs(eta) .gt. 1.0 ) eff = 0.
	if ( abs(pt) .lt. 30. ) eff = 0.
        if ( bg .lt. 0.4 ) eff = 0.
        if ( bg .gt. 0.85 ) eff = 0.

	return
	end	


c  ---------------------------------------
c  4. user-callable routines and functions
c  ---------------------------------------

c reconstructed objects ------------------------------------------------

      function et_obj(iobj)

c this function returns the ET of a reconstructed object

      implicit none
      include 'pgs.inc'

      integer iobj

c check object number
      if (iobj.gt.numobj.or.iobj.lt.0) then
        write(pgs_log_unit,'('' ET_OBJ: called for nonexistent'',
     .          '' reconstructed object'',i5)') iobj
        et_obj = 0.
        return
      endif

      if (p_obj(iobj).gt.0.) then
        et_obj = pobj(4,iobj) * pt_obj(iobj) / p_obj(iobj)
      else
        et_obj = 0.
      endif

      return
      end


      function pt_obj(iobj)

c this function returns the ET of a reconstructed object

      implicit none
      include 'pgs.inc'

      integer iobj

c check object number
      if (iobj.gt.numobj.or.iobj.lt.0) then
        write(pgs_log_unit,'('' PT_OBJ: called for nonexistent'',
     .          '' reconstructed object'',i5)') iobj
        pt_obj = 0.
        return
      endif

      pt_obj = pobj(1,iobj)**2 + pobj(2,iobj)**2

      if (pt_obj.gt.0.) pt_obj=sqrt(pt_obj)

      return
      end


      function p_obj(iobj)

c this function returns the P of a reconstructed object

      implicit none
      include 'pgs.inc'

      integer iobj

c check object number
      if (iobj.gt.numobj.or.iobj.lt.0) then
        write(pgs_log_unit,'('' P_OBJ: called for nonexistent'',
     .          '' reconstructed object'',i5)') iobj
        p_obj = 0.
        return
      endif

      p_obj = pobj(1,iobj)**2 + pobj(2,iobj)**2 + pobj(3,iobj)**2

      if (p_obj.gt.0.) p_obj=sqrt(p_obj)

      return
      end


      function eta_obj(iobj)

c this function returns the eta (pseudorapidity) 
c of a reconstructed object

      implicit none
      include 'pgs.inc'

      integer iobj

c check object number
      if (iobj.gt.numobj.or.iobj.lt.0) then
        write(pgs_log_unit,'('' ETA_OBJ: called for nonexistent'',
     .          '' reconstructed object'',i5)') iobj
        eta_obj = 9999.
        return
      endif

      if ((p_obj(iobj)-pobj(3,iobj)).ne.0.0) then
        eta_obj = dlog(pt_obj(iobj)/(p_obj(iobj)-pobj(3,iobj)))
      endif
 
      return
      end


      function phi_obj(iobj)

c this function returns the phi (azimuthal angle)
c of a reconstructed object

      implicit none
      include 'pgs.inc'

      integer iobj

c check object number
      if (iobj.gt.numobj.or.iobj.lt.0) then
        write(pgs_log_unit,'('' PHI_OBJ: called for nonexistent'',
     .          '' reconstructed object'',i5)') iobj
        phi_obj = 0.
        return
      endif

      if ((p_obj(iobj)-pobj(3,iobj)).ne.0.0) then
        phi_obj = atan2(pobj(2,iobj),pobj(1,iobj))
        if (phi_obj.lt.0.) phi_obj = phi_obj + 2.0d0*pi
      endif
 
      return
      end


c generated particles --------------------------------------------------
      
      function et_gen(ihep)

c this function returns the ET of a generated (HEPEVT) object

      implicit none
      include 'pgs.inc'

      integer ihep

c check object number
      if (ihep.gt.nhep.or.ihep.lt.0) then
        write(pgs_log_unit,'('' ET_GEN: called for nonexistent'',
     .          '' generated (HEPEVT) object'',i5)') ihep
        et_gen = 0.
        return
      endif

      if (p_gen(ihep).gt.0.) then
        et_gen = phep(4,ihep) * pt_gen(ihep) / p_gen(ihep)
      else
        et_gen = 0.
      endif

      return
      end


      function pt_gen(ihep)

c this function returns the PT of a generated (HEPEVT) object

      implicit none
      include 'pgs.inc'

      integer ihep

c check object number
      if (ihep.gt.nhep.or.ihep.lt.0) then
        write(pgs_log_unit,'('' PT_GEN: called for nonexistent'',
     .          '' generated (HEPEVT) object'',i5)') ihep
        pt_gen = 0.
        return
      endif

      pt_gen = phep(1,ihep)**2 + phep(2,ihep)**2

      if (pt_gen.gt.0.) pt_gen=sqrt(pt_gen)

      return
      end


      function p_gen(ihep)

c this function returns the P of a generated (HEPEVT) object

      implicit none
      include 'pgs.inc'

      integer ihep

c check object number
      if (ihep.gt.nhep.or.ihep.lt.0) then
        write(pgs_log_unit,'('' P_GEN: called for nonexistent'',
     .          '' generated (HEPEVT) object'',i5)') ihep
        p_gen = 0.
        return
      endif

      p_gen = phep(1,ihep)**2 + phep(2,ihep)**2 + phep(3,ihep)**2

      if (p_gen.gt.0.) p_gen=sqrt(p_gen)

      return
      end


      function eta_gen(ihep)

c this function returns the eta (pseudorapidity) 
c of a generated (HEPEVT) particle

      implicit none
      include 'pgs.inc'

      integer ihep

c check object number
      if (ihep.gt.nhep.or.ihep.lt.0) then
        write(pgs_log_unit,'('' ETA_GEN: called for nonexistent'',
     .          '' generated (HEPEVT) object'',i5)') ihep
        eta_gen = 0.
        return
      endif

      if ((p_gen(ihep)-phep(3,ihep)).ne.0.0) then
        eta_gen = dlog(pt_gen(ihep)/(p_gen(ihep)-phep(3,ihep)))
      endif
 
      return
      end


      function phi_gen(ihep)

c this function returns the phi (azimuthal angle)
c of a generated (HEPEVT) object

      implicit none
      include 'pgs.inc'

      integer ihep

c check object number
      if (ihep.gt.nhep.or.ihep.lt.0) then
        write(pgs_log_unit,'('' PHI_GEN: called for nonexistent'',
     .          '' generated (HEPEVT) object'',i5)') ihep
        eta_gen = 0.
        return
      endif

      if ((p_gen(ihep)-phep(3,ihep)).ne.0.0) then
        phi_gen = atan2(phep(2,ihep),phep(1,ihep))
        if (phi_gen.lt.0.) phi_gen = phi_gen + 2.0d0*pi
      endif
 
      return
      end


c calorimeter clusters -------------------------------------------------

      function et_clu(iclu)

c this function returns the ET of a calorimeter cluster

      implicit none
      include 'pgs.inc'

      integer iclu     

c check object number
      if (iclu.gt.numclu.or.iclu.lt.0) then
        write(pgs_log_unit,'('' ET_CLU: called for nonexistent'',
     .          '' calorimeter cluster'',i5)') iclu
        et_clu = 0.
        return
      endif

      if (p_clu(iclu).gt.0.) then
        et_clu = pclu(4,iclu) * pt_clu(iclu) / p_clu(iclu)
      else
        et_clu = 0.
      endif

      return
      end


      function pt_clu(iclu)

c this function returns the PT of a calorimeter cluster

      implicit none
      include 'pgs.inc'

      integer iclu

c check object number
      if (iclu.gt.numclu.or.iclu.lt.0) then
        write(pgs_log_unit,'('' PT_CLU: called for nonexistent'',
     .          '' calorimeter cluster'',i5)') iclu
        pt_clu = 0.
        return
      endif

      pt_clu = pclu(1,iclu)**2 + pclu(2,iclu)**2

      if (pt_clu.gt.0.) pt_clu=sqrt(pt_clu)

      return
      end


      function p_clu(iclu)

c this function returns the P of a calorimeter cluster

      implicit none
      include 'pgs.inc'

      integer iclu

c check object number
      if (iclu.gt.numclu.or.iclu.lt.0) then
        write(pgs_log_unit,'('' P_CLU: called for nonexistent'',
     .          '' calorimeter cluster'',i5)') iclu
        p_clu = 0.
        return
      endif

      p_clu = pclu(1,iclu)**2 + pclu(2,iclu)**2 + pclu(3,iclu)**2

      if (p_clu.gt.0.) p_clu=sqrt(p_clu)

      return
      end


      function eta_clu(iclu)

c this function returns the eta (pseudorapidity) 
c of a calorimeter cluster

      implicit none
      include 'pgs.inc'

      integer iclu

c check object number
      if (iclu.gt.numclu.or.iclu.lt.0) then
        write(pgs_log_unit,'('' ETA_CLU: called for nonexistent'',
     .          '' calorimeter cluster'',i5)') iclu
        eta_clu = 0.
        return
      endif

      if ((p_clu(iclu)-pclu(3,iclu)).ne.0.0) then
        eta_clu = dlog(pt_clu(iclu)/(p_clu(iclu)-pclu(3,iclu)))
      endif
 
      return
      end


      function phi_clu(iclu)

c this function returns the phi (azimuthal angle)
c of a calorimeter cluster

      implicit none
      include 'pgs.inc'

      integer iclu

c check object number
      if (iclu.gt.numclu.or.iclu.lt.0) then
        write(pgs_log_unit,'('' PHI_CLU: called for nonexistent'',
     .          '' calorimeter cluster'',i5)') iclu
        eta_clu = 0.
        return
      endif

      if ((p_clu(iclu)-pclu(3,iclu)).ne.0.0) then
        phi_clu = atan2(pclu(2,iclu),pclu(1,iclu))
        if (phi_clu.lt.0.) phi_clu = phi_clu + 2.0d0*pi
      endif
 
      return
      end

c trigger cluster functions ----------------------------

      function et_trc(itrc)

c this function returns the ET of a trigger cluster

      implicit none
      include 'pgs.inc'

      integer itrc     

c check object number
      if (itrc.gt.numtrc.or.itrc.lt.0) then
        write(pgs_log_unit,'('' ET_TRC: called for nonexistent'',
     .          '' trigger cluster'',i5)') itrc
        et_trc = 0.
        return
      endif

      if (p_trc(itrc).gt.0.) then
        et_trc = ptrc(4,itrc) * pt_trc(itrc) / p_trc(itrc)
      else
        et_trc = 0.
      endif

      return
      end


      function pt_trc(itrc)

c this function returns the PT of a calorimeter cluster

      implicit none
      include 'pgs.inc'

      integer itrc

c check object number
      if (itrc.gt.numtrc.or.itrc.lt.0) then
        write(pgs_log_unit,'('' PT_TRC: called for nonexistent'',
     .          '' trigger cluster'',i5)') itrc
        pt_trc = 0.
        return
      endif

      pt_trc = ptrc(1,itrc)**2 + ptrc(2,itrc)**2

      if (pt_trc.gt.0.) pt_trc=sqrt(pt_trc)

      return
      end


      function p_trc(itrc)

c this function returns the P of a calorimeter cluster

      implicit none
      include 'pgs.inc'

      integer itrc

c check object number
      if (itrc.gt.numtrc.or.itrc.lt.0) then
        write(pgs_log_unit,'('' P_TRC: called for nonexistent'',
     .          '' trigger cluster'',i5)') itrc
        p_trc = 0.
        return
      endif

      p_trc = ptrc(1,itrc)**2 + ptrc(2,itrc)**2 + ptrc(3,itrc)**2

      if (p_trc.gt.0.) p_trc=sqrt(p_trc)

      return
      end


      function eta_trc(itrc)

c this function returns the eta (pseudorapidity) 
c of a calorimeter cluster

      implicit none
      include 'pgs.inc'

      integer itrc

c check object number
      if (itrc.gt.numtrc.or.itrc.lt.0) then
        write(pgs_log_unit,'('' ETA_TRC: called for nonexistent'',
     .          '' trigger cluster'',i5)') itrc
        eta_trc = 0.
        return
      endif

      if ((p_trc(itrc)-ptrc(3,itrc)).ne.0.0) then
        eta_trc = dlog(pt_trc(itrc)/(p_trc(itrc)-ptrc(3,itrc)))
      endif
 
      return
      end


      function phi_trc(itrc)

c this function returns the phi (azimuthal angle)
c of a calorimeter cluster

      implicit none
      include 'pgs.inc'

      integer itrc

c check object number
      if (itrc.gt.numtrc.or.itrc.lt.0) then
        write(pgs_log_unit,'('' PHI_TRC: called for nonexistent'',
     .          '' trigger cluster'',i5)') itrc
        eta_trc = 0.
        return
      endif

      if ((p_trc(itrc)-ptrc(3,itrc)).ne.0.0) then
        phi_trc = atan2(ptrc(2,itrc),ptrc(1,itrc))
        if (phi_trc.lt.0.) phi_trc = phi_trc + 2.0d0*pi
      endif
 
      return
      end


c reconstructed tracks -------------------------------------------------

      function et_trk(itrk)

c this function returns the ET of a reconstructed track

      implicit none
      include 'pgs.inc'

      integer itrk

c check track number
      if (itrk.gt.numtrk.or.itrk.lt.0) then
        write(pgs_log_unit,'('' ET_TRK: called for nonexistent'',
     .          '' reconstructed track'',i5)') itrk
        et_trk = 0.
        return
      endif

      if (p_trk(itrk).gt.0.) then
        et_trk = pt_trk(itrk)
      else
        et_trk = 0.
      endif

      return
      end


      function pt_trk(itrk)

c this function returns the ET of a reconstructed track

      implicit none
      include 'pgs.inc'

      integer itrk

c check track number
      if (itrk.gt.numtrk.or.itrk.lt.0) then
        write(pgs_log_unit,'('' PT_TRK: called for nonexistent'',
     .          '' reconstructed track'',i5)') itrk
        pt_trk = 0.
        return
      endif

      pt_trk = ptrk(1,itrk)**2 + ptrk(2,itrk)**2

      if (pt_trk.gt.0.) pt_trk=sqrt(pt_trk)

      return
      end


      function p_trk(itrk)

c this function returns the P of a reconstructed track

      implicit none
      include 'pgs.inc'

      integer itrk

c check track number
      if (itrk.gt.numtrk.or.itrk.lt.0) then
        write(pgs_log_unit,'('' P_TRK: called for nonexistent'',
     .          '' reconstructed track'',i5)') itrk
        p_trk = 0.
        return
      endif

      p_trk = ptrk(1,itrk)**2 + ptrk(2,itrk)**2 + ptrk(3,itrk)**2

      if (p_trk.gt.0.) p_trk=sqrt(p_trk)

      return
      end


      function eta_trk(itrk)

c this function returns the eta (pseudorapidity) 
c of a reconstructed track

      implicit none
      include 'pgs.inc'

      integer itrk

c check track number
      if (itrk.gt.numtrk.or.itrk.lt.0) then
        write(pgs_log_unit,'('' ETA_TRK: called for nonexistent'',
     .          '' reconstructed track'',i5)') itrk
        eta_trk = 9999.
        return
      endif

      if ((p_trk(itrk)-ptrk(3,itrk)).ne.0.0) then
        eta_trk = dlog(pt_trk(itrk)/(p_trk(itrk)-ptrk(3,itrk)))
      endif
 
      return
      end


      function phi_trk(itrk)

c this function returns the phi (azimuthal angle)
c of a reconstructed track

      implicit none
      include 'pgs.inc'

      integer itrk

c check track number
      if (itrk.gt.numtrk.or.itrk.lt.0) then
        write(pgs_log_unit,'('' PHI_TRK: called for nonexistent'',
     .          '' reconstructed track'',i5)') itrk
        phi_trk = 0.
        return
      endif

      if ((p_trk(itrk)-ptrk(3,itrk)).ne.0.0) then
        phi_trk = atan2(ptrk(2,itrk),ptrk(1,itrk))
        if (phi_trk.lt.0.) phi_trk = phi_trk + 2.0d0*pi
      endif
 
      return
      end


c angles, masses etc. -----------------------------------------------------


      real*8 function cos_theta(p,q)

c returns cos(theta)for two 3-vectors

      real*8 p(3),q(3)

      cos_theta = (p(1)*q(1)+p(2)*q(2)+p(3)*q(3))
     .            /sqrt(p(1)**2+p(2)**2+p(3)**2)
     .            /sqrt(q(1)**2+q(2)**2+q(3)**2)

      return
      end


      real*8 function cos_del_phi(p,q)

c returns cos(delta phi) for two three-vectors

      real*8 p(3),q(3)

      cos_del_phi = (p(1)*q(1) + p(2)*q(2))
     .               /sqrt(p(1)**2 + p(2)**2)
     .               /sqrt(q(1)**2 + q(2)**2)      

      return
      end


      real*8 function del_phi(p,q)

c returns delta phi for two three-vectors

      real*8 p(3),q(3),pi,v4phi

      parameter(pi=3.141592654)

      del_phi = v4phi(p) - v4phi(q)

      if(del_phi.lt.-pi) del_phi = del_phi + 2.0*pi
      if(del_phi.gt.+pi) del_phi = del_phi - 2.0*pi

      return
      end


      real*8 function v4mass(p)

c return mass for 4-vector

      real*8 p(4),arg

      v4mass = 0.

      arg = p(4)**2 - p(3)**2 - p(2)**2 - p(1)**2

      if(arg.gt.0.) v4mass = sqrt(arg)

      return
      end

      real*8 function v4mass2(p,q)

c return mass for sum of two 4-vectors

      real*8 p(4),q(4),arg

      v4mass2 = 0.

      arg = (p(4)+q(4))**2 - (p(3)+q(3))**2 
     .    - (p(2)+q(2))**2 - (p(1)+q(1))**2

      if(arg.gt.0.) v4mass2 = sqrt(arg)

      return
      end


      real*8 function v4et(p)

c return ET for 4-vector

      real*8 p(4),v4pt,v4p

      v4et = 0.

      if (p(4).gt.0.) then
        v4et = p(4) * v4pt(p) / v4p(p)
      else
        v4et = 0.
      endif

      return
      end


      real*8 function v4p(p)

c return p for 4-vector

      real*8 p(4)

      v4p = p(1)**2 + p(2)**2 + p(3)**2 

      if(v4p.gt.0.0) v4p = sqrt(v4p)

      return
      end


      real*8 function v4pt(p)

c return p for 4-vector

      real*8 p(4)

      v4pt = 0.

      if (p(4).gt.0.) then
        v4pt = p(1)**2 + p(2)**2
      endif

      if(v4pt.gt.0.0) v4pt = sqrt(v4pt)

      return
      end

      real*8 function v4eta(p)

c return eta for 4-vector

      real*8 p(4),v4p,v4pt

      v4eta = 0.

      if ((v4p(p)-p(3)).ne.0.0) then
        v4eta = dlog(v4pt(p)/(v4p(p)-p(3)))
      endif
 
      return
      end


      real*8 function v4phi(p)

c return phi for 4-vector

      real*8 p(4),v4p,v4pt,pi

      data pi/3.1415926/

      v4phi = 0.

      if ((v4p(p)-p(3)).ne.0.0) then
        v4phi = atan2(p(2),p(1))
        if (v4phi.lt.0.) v4phi = v4phi + 2.0d0*pi
      endif

      return
      end


c eta/phi calorimeter indices -----------------------------------------------


       subroutine pgs_etaphi_index(eta,phi,ieta,iphi)

c return eta and phi indices of calorimeter array
c given eta and phi

      implicit none
      include 'pgs.inc'

      real*8 eta,phi,etamin,etamax

      integer ieta,iphi,jeta,jphi

      logical first
      data first /.true./

c set up constants
      if (first) then

        etamin = -(netacal/2)*deta
        etamax = +(netacal/2)*deta

        first = .false.

      endif

c phi index 

      iphi = nint(phi/dphi+0.5)
      if (iphi.gt.nphical) iphi = iphi - nphical
      if (iphi.lt.0      ) iphi = iphi + nphical

c eta index
      
      ieta = 0
      if (eta.gt.etamin.and.eta.lt.etamax) then
        ieta = nint((eta-etamin)/deta+0.5)
        if (ieta.gt.netacal) ieta = 0
        if (ieta.lt.0      ) ieta = 0

c        if(nevhep.ge.17) then 
c          print '('' index: '',i5,4f12.4,3i5)',
c     .       nevhep,eta,etamin,etamax,deta,ieta,netacal,nphical
c        endif

      endif


      return
      end


      subroutine pgs_index_etaphi(ieta,iphi,eta,phi)

c return eta and phi of center of calorimeter tower
c given indices of tower

      implicit none
      include 'pgs.inc'

      real*8 eta,phi,etamin

      integer ieta,iphi,jeta,jphi

      logical first
      data first /.true./

c set up constants
      if (first) then
        etamin = -(netacal/2)*deta
        first = .false.
      endif

c eta 
      eta = etamin + deta/2. + float(ieta-1)*deta      
c phi 
      phi = dphi/2. + float(iphi-1)*dphi

      return
      end



      subroutine pgs_dump_event(mask,hepcut,calcut)

c print the event
c bit 0 = the hepevt common (only entries with pt>hepcut)
c bit 1 = the calorimeter sums (only towers with Et>calcut)
c bit 2 = calorimeter clusters 
c bit 3 = trigger objects
c bit 4 = offline objects

      include 'pgs.inc'

      real*8 hepcut,calcut,eta,phi,pt,et,eet,het,st
      integer mask,ieta,iphi,i,id
      integer nphi,indp(100),iptr,itimes,jmax
      real*8 par(10,100)
      character*20 ch
      character*10 susy(100)
      data susy /40*' ','~dL','~uL','~sL','~cL','~bL','~tL',
     1    'gluino',3*' ',
     1   '~eL','~nueL','~muL','~numuL','~tauL','~nutauL',4*' ',
     1   '~dR','~uR','~sR','~cR','~bR','~tR',
     1   '~N1','~N2','~N3','~N4',
     1   '~eR','~nueR','~muR','~numuR','~tauR','~nutauR',
     1   '~C1','~C2','~G',21*' '/

      if(mask.ne.0) then
        write(pgs_log_unit,100) nevhep
100     format(1x,' ********************** ',
     1        ' Event ',i4,' ********************** ' )
      endif

      if(btest(mask,0)) then
        write(pgs_log_unit,200)
200     format(1x,' --------------------------- ',
     1        ' HEPEVT common  --------------------------- ' )
	write(pgs_log_unit,'(2a)')
     1      '     #   Stat   ID   name      Par    Dau   ',
     1           '   Pt    eta   phi  ieta iphi'
        do i=1,nhep
          pt=sqrt(phep(1,i)**2+phep(2,i)**2)
          if(pt.ge.hepcut) then
            eta=eta_gen(i)
            phi=phi_gen(i)
            call pgs_etaphi_index(eta,phi,ieta,iphi)
            id=iabs(idhep(i))
            if(id.gt.0.and.id.lt.100) then
	      if(susy(id).ne.' ') then
                ch=susy(id)
              else
                call hepnam(idhep(i),ch)
              endif
	    else
              call hepnam(idhep(i),ch)
            endif
            write(pgs_log_unit,210)
     !        i,isthep(i),idhep(i),ch,
     1        jmohep(1,i),jdahep(1,i),jdahep(2,i),
     1        pt,eta,phi,ieta,iphi
210     format(1x,3i6,2x,a10,i3,i5,'-',i3,2x,3f6.2,2x,i3,i5)
          endif
        enddo
      endif

      if(btest(mask,1)) then
        write(pgs_log_unit,300)
300     format(1x,' ------------------- ',
     1        ' Calorimeter towers  ------------------- ' )

        write(pgs_log_unit,'(2a)')
     !    ' ieta eta   iphi phi   Et_e  Et_h   Et',
     1    '     iphi phi   Et_e  Et_h   Et'

        do ieta=1,netacal

c find the phi towers at this eta that have energy
        nphi=0
        do iphi=1,nphical
          call pgs_index_etaphi(ieta,iphi,eta,phi)
          st= sin( 2.0 * atan(exp(-eta)) )
          eet=st*ecal(ieta,iphi)
          het=st*hcal(ieta,iphi)
          if(eet+het.ge.calcut) then
            nphi=nphi+1
            indp(nphi)=iphi
            par(1,nphi)=phi
            par(2,nphi)=eet
            par(3,nphi)=het
            par(4,nphi)=eet+het
          endif
        enddo ! iphi

        if(nphi.gt.0) then
          itimes=(nphi-1)/2+1
          do i=1,itimes
            jmax=2
            if(i.eq.itimes) jmax=2-mod(nphi,2)
            iptr=(i-1)*2
            write(pgs_log_unit,310) ieta,eta,
     1  (indp(iptr+j),par(1,iptr+j),par(2,iptr+j),
     1   par(3,iptr+j),par(4,iptr+j),j=1,jmax)
310     format(1x,i4,f5.1,2(i6,f5.1,2x,3f6.2))
          enddo
        endif

        enddo ! loop over eta
      endif


      if(btest(mask,2)) then
        write(pgs_log_unit,400)
400     format(1x,' ----------------------- ',
     1        ' cal clusters  ----------------------- ' )
        write(pgs_log_unit,'(2a)')
     1         '     #    Et_e  Et_h   Et      eta   phi  ieta',
     1         ' iphi  wid   mass'
        do i=1,numclu
          ieta=etaclu(i)
          iphi=phiclu(i)
          call pgs_index_etaphi(ieta,iphi,eta,phi)
          st=sin( 2.0 * atan(exp(-eta)) )
          write(pgs_log_unit,410)
     !       i,st*emclu(i),st*ehclu(i),
     1       st*(emclu(i)+ehclu(i)),eta,phi,ieta,iphi,
     1       widclu(i),pclu(5,i)
410     format(1x,i6,2x,3f6.1,2x,2f6.1,2x,i3,i5,2f7.3)
        enddo
      endif

      if(btest(mask,3)) then
        write(pgs_log_unit,500)
500     format(1x,' --------------------------- ',
     1        ' Trig Objects  --------------------------- ' )
        write(pgs_log_unit,'(2a)')
     !      ' #  ind typ     1     2     3     4    ',
     1      'vectrg       7     8     9    10'
        do i=1,numtrg
          write(pgs_log_unit,510) 
     1        i,indtrg(i),typtrg(i),(vectrg(j,i),j=1,10)
510     format(1x,3i3,2x,10f6.1)
        enddo
      endif

      if(btest(mask,4)) then
        write(pgs_log_unit,600)
600     format(1x,' --------------------------- ',
     1        ' Recon Objects  --------------------------- ' )
        write(pgs_log_unit,'(2a)')
     1      ' #  ind typ     1     2     3     4    ',
     1      'vecobj       7     8     9    10'
        do i=1,numobj
          write(pgs_log_unit,610)
     1     i,indobj(i),typobj(i),(vecobj(j,i),j=1,10)
610     format(1x,3i3,2x,10f6.1)
        enddo
      endif


      return
      end


      subroutine pgs_cor_met

c correct MET for identified muons

      implicit none
      include 'pgs.inc'

      integer iobj

      real*8 pcor(2)

      pcor(1) = met_cal * cos(phi_met_cal)
      pcor(2) = met_cal * sin(phi_met_cal)

      do iobj=1,numobj
        if(typobj(iobj).eq.2.and.
     .     unique(iobj) .and.
     .     et_obj(iobj).gt.10.) then
          pcor(1) = pcor(1) - pobj(1,iobj)
          pcor(2) = pcor(2) - pobj(2,iobj)
        endif
      enddo

      met_cor = pcor(1)**2+pcor(2)**2
      if(met_cor.gt.0.) then
        met_cor = sqrt(met_cor)
        phi_met_cor = atan2(pcor(2),pcor(1))
        if (phi_met_cor.lt.0.0) phi_met_cor = phi_met_cor + 2.0d0*pi
      else
        met_cor = 0.
        phi_met_cor = 0.
      endif

      return
      end



      subroutine pgs_unique_id

c tag list of uniquely identified gamma/e/mu/tau/jet

      implicit none
      include 'pgs.inc'

      integer iobj,jobj

      logical pgs_object_cuts

c Objects in list are in order that they are found;
c earlier objects take precedence over later ones, 
c using 3D angle between them.  Different objects of
c the same type can co-exist as unique regardless;
c also, muons are all unique.

      do iobj=1,numobj
        unique(iobj) = .true.
        if(pgs_object_cuts(iobj)) then
          do jobj=1,iobj-1                            ! loop over previous objects
            if(typobj(jobj).ne.typobj(iobj).and.      ! not the same object type
     .         typobj(iobj).ne.2.and.                 ! not a muon
     .         typobj(jobj).ne.2) then                ! not a muon
              if(cos_theta(pobj(1,iobj),pobj(1,jobj))
     .                               .gt.0.9848) then ! within 10 degrees
                if(unique(jobj)) then                 ! earlier object is unique
                  unique(iobj) = .false.              ! object is not unique
                endif
              endif  
            endif
          enddo
        else
          unique(iobj)=.false.
        endif
      enddo

      return
      end


      logical function pgs_object_cuts(iobj)

c apply final object ID cuts (used by pgs_unique_id)

      implicit none
      include 'pgs.inc'

      real*8 xi

      integer iobj

      pgs_object_cuts = .true.

      if(typobj(iobj).eq.0) then    ! photon
          if( vecobj(6,iobj) .lt. 5.0                 .or.  !  ET > 5 GeV
     .        vecobj(7,iobj)/vecobj(6,iobj) .gt. 0.10 .or.  !  ETiso/ET < 0.1
     .        vecobj(8,iobj) .gt. 5.0                 .or.  !  pt(trk,iso) < 5 GeV
     .        vecobj(4,iobj) .gt. 1.01                .or.  !  ntrk(iso) <= 1
     .        vecobj(3,iobj) .gt. 1.00                .or.  !  pt(trk) < 1.0
     .        vecobj(9,iobj) .gt. 0.125                     !  had/em < 0.125
     .      ) pgs_object_cuts = .false.
        return
      endif

      if(typobj(iobj).eq.1) then    ! electron
          if( vecobj(6,iobj) .lt. 5.0                 .or.  !  ET > 5 GeV
     .        vecobj(7,iobj)/vecobj(6,iobj) .gt. 0.10 .or.  !  ETiso/ET < 0.1
     .        vecobj(8,iobj) .gt. 5.0                 .or.  !  pt(trk,iso) < 5 GeV
     .        vecobj(10,iobj) .le. 0.50               .or.  !  E/p < 0.5
     .        vecobj(10,iobj) .gt. 1.50                     !  E/p > 1.5
     .      ) pgs_object_cuts = .false.
        return
      endif

      if(typobj(iobj).eq.2) then    ! muon

c  user may wish at this point to apply muon ID efficiency using
c  pgs_muo_eff, or may wish to impose an isolation cut; neither is
c  done by default

        return
      endif

      if(typobj(iobj).eq.3) then    ! tau

        if(vecobj(3,iobj).ne.0.0) then
          xi = vecobj(2,iobj)/vecobj(3,iobj)
        else
          xi = 999.
        endif

        if(abs(qobj(iobj)).ne.1 .or.      ! |total charge| = 1
     .     vecobj( 4,iobj).gt.3 .or.      ! N(cone) = 1 or 3
     .     vecobj( 8,iobj).gt.2.0 .or.    ! sum pt iso track > 2 GeV
     .     vecobj(10,iobj).gt.2.0 .or.    ! sum pt iso pi0   > 2 GeV
     .     xi.lt.0.15 .or.                ! anti-electron cut
     .     vecobj(6,iobj).gt.1.8          ! mass < 1.8 GeV
     .    ) 
     .      pgs_object_cuts = .false.

        return

      endif

      if(typobj(iobj).eq.4) then    ! jet
        return
      endif

      if(typobj(iobj).eq.5) then    ! heavy stable charged
        return
      endif

      return
      end



      subroutine pgs_tau_decay_mode(jtau,dmode,ettau,etagen,
     .                              pvis,pneu,ptmax,ptmin,mch)

c decode generator info into tau decay class
c
c       class        decay mode
c
c         1            e   nu    nu
c         2            mu  nu    nu
c         3            pi  nu
c         4            K   nu
c         5            rho nu
c         6            K*  nu
c         7            pi  pi0 pi0 nu
c         8            pi  pi  pi  nu
c         9            pi  pi  pi  pi0 nu
c        10            other
c        

      implicit none
      include '../src/pgs.inc'  ! user needs to modify path

c pgs_tau_decay_mode arguments
      integer jtau,dmode,mch
      real*8 pvis(4),pneu(4),ettau,etagen,ptmax,ptmin

      real stdchg

      logical stop1,stop2

      integer itau,idtr,jdtr,kdtr,i,j,k,l,nvis,idvis(10),nneu,idneu(10)

      integer nnue,nele,nnum,nmuo,nnut,ntau,npic,npi0,nkao,nkst

      integer nlist,list(19),ldtr(19),lvis(19)
      data nlist/19/
      data list/ +12, -12, +11, -11,      !  nue, nueb,   e-,   e+
     .           +14, -14, +13, -13,      !  num, numb,  mu-,  mu+
     .           +16, -16, +15, -15,      !  nut, nutb, tau-, tau+
     .          +211,+111,-211,           !  pi+,  pi0,  pi-
     .          +321,-321,                !   K+,   K-
     .          +323,-323           /     !  K*+,  K*-

      data lvis/  0,  0,  1,  1,
     .            0,  0,  1,  1,
     .            0,  0,  0,  0,
     .            2,  3,  2,
     .            2,  2,
     .            2,  2/


c count decay species of last tau

      etagen = eta_gen(jtau)

      ettau = 0.
      ptmax = 0.
      ptmin = 1.0e6

      dmode = 0

      nvis = 0
      nneu = 0

      if(jdahep(1,jtau).eq.0) return

      dmode = 10

      if(stdchg(jtau).lt.0.0) mch = -1
      if(stdchg(jtau).gt.0.0) mch = +1

      do i=1,19
        ldtr(i) = 0
      enddo

      do idtr=jdahep(1,jtau),jdahep(2,jtau)

        stop1 = .false.
        do j=1,19
          if(idhep(idtr).eq.list(j)) then
            stop1 = .true.
            ldtr(j) = ldtr(j) + 1
            ettau = ettau + et_gen(idtr)
            if(lvis(j).ne.0) then
c charged track pt
              if(lvis(j).lt.3) then
                if(pt_gen(idtr).gt.ptmax) ptmax = pt_gen(idtr)
                if(pt_gen(idtr).lt.ptmin) ptmin = pt_gen(idtr)
              endif
c add to visible daughter list
              nvis = nvis + 1
              idvis(nvis)=idtr
            else
c add to neutrino list
              nneu = nneu + 1
              idneu(nneu)=idtr
            endif
          endif
        enddo

        if(.not.stop1) then
          do jdtr=jdahep(1,idtr),jdahep(2,idtr)

            stop2 = .false.
            do k=1,19
              if(idhep(jdtr).eq.list(k)) then
                stop2 = .true.
                ldtr(k) = ldtr(k) + 1
                ettau = ettau + et_gen(jdtr)
                if(lvis(k).ne.0) then
c charged track pt
                  if(lvis(k).lt.3) then
                    if(pt_gen(jdtr).gt.ptmax) ptmax = pt_gen(jdtr)
                    if(pt_gen(jdtr).lt.ptmin) ptmin = pt_gen(jdtr)
                  endif
c add to visible daughter list
                  nvis = nvis + 1
                  idvis(nvis)=jdtr
                else
c add to neutrino list
                  nneu = nneu + 1
                  idneu(nneu)=jdtr
                endif
              endif
            enddo

            if(.not.stop2) then
              do kdtr=jdahep(1,jdtr),jdahep(2,jdtr)
                do l=1,19
                  if(idhep(kdtr).eq.list(l)) then
                    ldtr(l) = ldtr(l) + 1
                    ettau = ettau + et_gen(kdtr)
                    if(lvis(l).ne.0) then
c charged track pt
                      if(lvis(l).lt.3) then
                        if(pt_gen(kdtr).gt.ptmax) ptmax = pt_gen(kdtr)
                        if(pt_gen(kdtr).lt.ptmin) ptmin = pt_gen(kdtr)
                      endif
c add to visible daughter list
                      nvis = nvis + 1
                      idvis(nvis)=kdtr
                    else
c add to neutrino list
                      nneu = nneu + 1
                      idneu(nneu)=kdtr
                    endif
                  endif
                enddo
              enddo
            endif
          enddo
        endif
      enddo

      nnue = ldtr( 1) + ldtr( 2)
      nele = ldtr( 3) + ldtr( 4)
      nnum = ldtr( 5) + ldtr( 6)
      nmuo = ldtr( 7) + ldtr( 8)
      nnut = ldtr( 9) + ldtr(10)
      ntau = ldtr(11) + ldtr(12)
      npic = ldtr(13) + ldtr(15)
      npi0 = ldtr(14)
      nkao = ldtr(16) + ldtr(17) 
      nkst = ldtr(18) + ldtr(19)

c         1            e   nu    nu

      if(nnue.eq.1.and.nele.eq.1.and.nnut.eq.1) dmode = 1 

c         2            mu  nu    nu

      if(nnum.eq.1.and.nmuo.eq.1.and.nnut.eq.1) dmode = 2
c         3            pi  nu

      if(npic.eq.1.and.nnut.eq.1) dmode = 3

c         4            K   nu

      if(nkao.eq.1.and.nnut.eq.1) dmode = 4

c         5            rho nu

      if(npic.eq.1.and.npi0.eq.1.and.nnut.eq.1) dmode = 5

c         6            K*  nu

      if(nkst.eq.1.and.nnut.eq.1) dmode = 6

c         7            pi  pi0 pi0 nu

      if(npic.eq.1.and.npi0.eq.2.and.nnut.eq.1) dmode = 7

c         8            pi  pi  pi  nu

      if(npic.eq.3.and.npi0.eq.0.and.nnut.eq.1) dmode = 8

c         9            pi  pi  pi  pi0 nu

      if(npic.eq.3.and.npi0.ge.1.and.nnut.eq.1) dmode = 9

c return daughter four-momenta

      do j=1,4
        pvis(j) = 0.
        pneu(j) = 0.
      enddo
      
      do i=1,nvis
        do j = 1,4
          pvis(j) = pvis(j) + phep(j,idvis(i))
        enddo
      enddo

      do i=1,nneu
        do j = 1,4
          pneu(j) = pneu(j) + phep(j,idneu(i))
        enddo
      enddo

      return
      end

