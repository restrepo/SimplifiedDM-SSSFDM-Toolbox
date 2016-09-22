c--------------------------------------------------------
c  PGS - Pretty Good Simulation main program
c
c        Version 4.0
c
c    This example main program generates PYTHIA events
c    and writes out objects in the LHC Olympics format.
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
      include '../src/pgs.inc'  ! user needs to modify path

c PGS parameter file

c     pgs_param_file = 'pars/lhc.par'      ! detector parameters
      pgs_param_file = 'pars/cdf2.par'      ! detector parameters

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
          pgs_pythia_cards = 'cards/lhco.pyt'   ! process to generate, decays, etc.
        endif
      endif ! add more possibilities later?

c output LHC Olympics file name

      if(numarg.ge.5) then
        read(pgs_args(5),'(a)') pgs_output_file
      else
        pgs_output_file = 'lhco.lhc'   
      endif

c set up PGS

      call pgs_initialize

      return
      end


      subroutine pgs_user_pythia

c set up beam type and energy for PYTHIA here

      call pyinit('CMS','p','p',14000.0d0)   !  14 TeV p-p

c      call pylist(12)  ! need a list of decay modes?  
c      stop

      return
      end


      subroutine pgs_user_analysis(command)

c routine to perform user's analysis 

      implicit none
      include '../src/pgs.inc'  ! user needs to modify path

      character*3 command,yes

      integer itrc,iclu,i,j

c initialize ---------------------------------------------

      if(command.eq.'ini') then

      endif      

c analyze event ------------------------------------------

      if(command.eq.'evt') then

c get corrected MET

        call pgs_cor_met(met_cor,phi_met_cor)

c print out trigger and calorimeter jets

        print '(//,'' event '',i5)',nevhep

        print '(/,'' trigger jets: '',/)'

        do itrc=1,numtrc
          print '(2i8,7f12.5)',itrc,multrc(itrc),(ptrc(j,itrc),j=1,4),
     .          v4et(ptrc(1,itrc)),v4eta(ptrc(1,itrc)),
     .          v4phi(ptrc(1,itrc))
        enddo

        print '(/,'' kt jets: '',/)'

        do iclu=1,numclu
          print '(2i8,7f12.5)',iclu,mulclu(iclu),(pclu(j,iclu),j=1,4),
     .          v4et(pclu(1,iclu)),v4eta(pclu(1,iclu)),
     .          v4phi(pclu(1,iclu))
        enddo

        call pgs_display_clusters

      endif

c done - wrap up -----------------------------------------

      if(command.eq.'end') then

      endif      

      return
      end

      subroutine pgs_user_event

c dummy routine to make linker happy

      return
      end



      subroutine pgs_display_clusters

      implicit none
      include '../src/pgs.inc'

      integer ipage
      data ipage /0/

      logical first
      data first/.true./

      integer ieta,iphi,icol

      real*4 x1,x2,y1,y2

      character*20 yes,psfile

c set up colors

      if(first) then
        call ntdrgb(3,0.8,0.2,0.2) ! red
        call ntdrgb(4,0.2,0.8,0.2) ! green
        call ntdrgb(5,0.2,0.2,0.8) ! blue
        call ntdrgb(6,0.8,0.8,0.2) ! yellow
        call ntdrgb(7,0.2,0.8,0.8) ! teal
        call ntdrgb(8,0.8,0.2,0.8) ! purple
        first = .false.
      else
        call ntddel(ipage)
      endif

      ipage = ipage + 1

      call ntdpag(ipage,1)

      do ieta=1,netacal
        do iphi = 1,nphical
          x1 = 2.0 + float(ieta-1)*16.0/200.
          x2 = 2.0 + float(ieta  )*16.0/200.
          y1 = 8.0 + float(iphi-1)*16.0/200.
          y2 = 8.0 + float(iphi  )*16.0/200.
          if(cclu(ieta,iphi).gt.0) then
            icol = mod(cclu(ieta,iphi),6) + 3
            call ntdbox(ipage,icol,x1,y1,x2,y2)
          endif
        enddo
      enddo

      call ntduwk

      call ntddis(ipage)

      write(psfile,'(a,i2.2,a)') 'clu-',ipage,'.ps'
      call ntdsav(ipage,psfile)

      call getstr('next?',yes,'y')

      return
      end
