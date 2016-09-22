c-------------
c     Clean Olympics Output
c     Blame Jesse Thaler/Aaron Pierce
c-------------
      PROGRAM CLEAN
      implicit none
      integer numargs,iarg,dummy
      character*80 filetoclean,filetooutput,tmpinfo
      character*80 firstline

      integer nob,i
      parameter (nob=100)

      integer KCOUNTp,KTYPEp      
      double precision XETAp,XPHIp,XPTp,XMASSp,XNTRACKp,
     &                 XBTAGp,XHADEMp,XDUM1p,XDUM2p
      common /PARTICLE/KCOUNTp,KTYPEp,XETAp,
     &              XPHIp,XPTp,XMASSp,
     &              XNTRACKp,XBTAGp,XHADEMp,
     &              XDUM1p,XDUM2p
     

      integer KCOUNT,KTYPE,NPART
      double precision XETA,XPHI,XPT,XMASS,XNTRACK,
     &                 XBTAG,XHADEM,XDUM1,XDUM2
      common /EVENT/KCOUNT(0:nob),KTYPE(0:nob),XETA(0:nob),
     &              XPHI(0:nob),XPT(0:nob),XMASS(0:nob),
     &              XNTRACK(0:nob),XBTAG(0:nob),XHADEM(0:nob),
     &              XDUM1(0:nob),XDUM2(0:nob),NPART       


      integer lfn
      logical ismuonclean,istriggerremove,isfirstremove
      logical isoldformat
      common /FLAGS/lfn,ismuonclean,istriggerremove,isfirstremove,
     &     isoldformat


      lfn = 53

      

      
c... Get command line arguments

      numargs = IArgC()
      
      call getArg(numargs-1,filetoclean)
      call getArg(numargs,filetooutput)

      
      open(47,file=filetoclean,form='formatted',status='old')
      open(53,file=filetooutput, ACCESS='APPEND')

            
      ismuonclean=.false.
      isfirstremove=.false.
      istriggerremove=.false.
      isoldformat=.false.

      do iarg = 1, numargs-2
         call getArg(iarg,tmpinfo)
         if (tmpinfo(1:index(tmpinfo,' ')).eq.'-muon') then
            ismuonclean = .true.
         else if (tmpinfo(1:index(tmpinfo,' ')).eq.'-first') then
            isfirstremove = .true.
         else if (tmpinfo(1:index(tmpinfo,' ')).eq.'-trigger') then
            istriggerremove = .true.
         else if (tmpinfo(1:index(tmpinfo,' ')).eq.'-old') then
            isoldformat = .true.  
         else
            write(6,*) "Command line argument ", 
     &              tmpinfo(1:index(tmpinfo,' ')),
     &              " not-recognized."
         end if
      end do
C
      if(isoldformat.and.istriggerremove) then
         write(6,*) "When Old format called, Trigger option not needed"
         write(6,*) "Will remove the zero objects automatically"
      endif
      if(isoldformat.and.ismuonclean) then
         write(6,*) "When Old format called. Muon option not needed"
         write(6,*) "will combine muons automatically"
      endif
      if(isoldformat) then
         write (6,*) "I will convert the file to the old format and"
         write (6,*) "merge the non-isolated muons with jets"
      else if (ismuonclean) then
         write(6,*) "I will merge non-isolated muons with jets..."
      else if (istriggerremove) then
         write(6,*) "I will remove trigger object and put trigger"
         write(6,*) "word in the missing ET HAD/EM fraction..."
      end if
      
      if (isfirstremove) then
         write(6,*) "I will remove the first line..."
      endif
      


c... Read in data to common blocks

 600  format(i3,i5,f9.3,f7.3,f8.2,f8.2,2f6.1,f9.2,2f6.1)
 601  format(i3,i14,i7)
 602  format(i3)
      read(47,end=100,fmt='(a80)') firstline  ! first line is junk, store for later output
      if (isfirstremove) then
      else if (isoldformat) then
 630     format(1x,2a3,2x,2a7,1X,2a9,2a7) !write out the old header line instead
         write(lfn,630) '  #','typ','    eta','    phi','       pt',
     $        '     jmas',' ntrack','   btag'
      else
         write(lfn,'(a80)') firstline !spit back out the first line
      end if

      do while (.true.)
         read(47,end=100,fmt='(a80)') tmpinfo

         read(tmpinfo,fmt=602) KCOUNTp
         if (KCOUNTp.eq.0) then
            read(tmpinfo,fmt=601) dummy,KCOUNTp, KTYPEp
            call startEvent
         else
            read(tmpinfo,end=100,fmt=600) KCOUNTp,KTYPEp,
     &           XETAp,XPHIp,XPTp,XMASSp,
     &           XNTRACKp,XBTAGp,XHADEMp,
     &           XDUM1p,XDUM2p
         end if

         call addParticle

         if (KTYPEp.eq.6) call endEvent
         
      end do

 100  continue
      write(6,*) "Thank you for using the olympics output cleaner."

      end

C------ Start Event

      subroutine startEvent
      
      integer nob,i
      parameter (nob=100)

      integer KCOUNTp,KTYPEp      
      double precision XETAp,XPHIp,XPTp,XMASSp,XNTRACKp,
     &                 XBTAGp,XHADEMp,XDUM1p,XDUM2p
      common /PARTICLE/KCOUNTp,KTYPEp,XETAp,
     &              XPHIp,XPTp,XMASSp,
     &              XNTRACKp,XBTAGp,XHADEMp,
     &              XDUM1p,XDUM2p

      integer KCOUNT,KTYPE,NPART
      double precision XETA,XPHI,XPT,XMASS,XNTRACK,
     &                 XBTAG,XHADEM,XDUM1,XDUM2
      common /EVENT/KCOUNT(0:nob),KTYPE(0:nob),XETA(0:nob),
     &              XPHI(0:nob),XPT(0:nob),XMASS(0:nob),
     &              XNTRACK(0:nob),XBTAG(0:nob),XHADEM(0:nob),
     &              XDUM1(0:nob),XDUM2(0:nob),NPART        

      integer lfn
      logical ismuonclean,istriggerremove,isfirstremove
      logical isoldformat
      common /FLAGS/lfn,ismuonclean,istriggerremove,isfirstremove,
     &     isoldformat
     
      NPART = -1  ! The trigger object is the 0th object
     
      do i = 0, nob
         KCOUNT(i) = 0
         KTYPE(i)  = 0
         XETA(i)   = 0 
         XPHI(i)   = 0
         XPT(i)    = 0 
         XMASS(i)  = 0 
         XNTRACK(i)= 0
         XBTAG(i)  = 0
         XHADEM(i) = 0
         XDUM1(i)  = 0
         XDUM2(i)  = 0
      end do
     
      if (istriggerremove.or.isoldformat) then
      else
         write(lfn,'(i3,i14,i7)') 0,KCOUNTp,KTYPEp 
      end if
     
      end

C------ Add Particle

      subroutine addParticle
      
      integer nob,i
      parameter (nob=100)

      integer KCOUNTp,KTYPEp      
      double precision XETAp,XPHIp,XPTp,XMASSp,XNTRACKp,
     &                 XBTAGp,XHADEMp,XDUM1p,XDUM2p
      common /PARTICLE/KCOUNTp,KTYPEp,XETAp,
     &              XPHIp,XPTp,XMASSp,
     &              XNTRACKp,XBTAGp,XHADEMp,
     &              XDUM1p,XDUM2p

      integer KCOUNT,KTYPE,NPART
      double precision XETA,XPHI,XPT,XMASS,XNTRACK,
     &                 XBTAG,XHADEM,XDUM1,XDUM2
      common /EVENT/KCOUNT(0:nob),KTYPE(0:nob),XETA(0:nob),
     &              XPHI(0:nob),XPT(0:nob),XMASS(0:nob),
     &              XNTRACK(0:nob),XBTAG(0:nob),XHADEM(0:nob),
     &              XDUM1(0:nob),XDUM2(0:nob),NPART       

      integer lfn
      logical ismuonclean,istriggerremove,isfirstremove,
     &     isoldformat
      common /FLAGS/lfn,ismuonclean,istriggerremove,isfirstremove,
     &     isoldformat
      NPART = NPART + 1

      KCOUNT(NPART) = KCOUNTp
      KTYPE(NPART)  = KTYPEp
      XETA(NPART)   = XETAp 
      XPHI(NPART)   = XPHIp
      XPT(NPART)    = XPTp 
      XMASS(NPART)  = XMASSp 
      XNTRACK(NPART)= XNTRACKp
      XBTAG(NPART)  = XBTAGp      
      XHADEM(NPART) = XHADEMp
      XDUM1(NPART)  = XDUM1p
      XDUM2(NPART)  = XDUM2p
      if (isoldformat) then     
C need to fix up btags column, massage number of tracks and charge
         if(KTYPEp.eq.4.and.XBTAGp.eq.1.0.or.XBTAGp.eq.2.0) then !btag for jets
            XBTAG(NPART)=1.0
         else if(KTYPEp.eq.4.and.XBTAGp.eq.1.0) then 
            XBTAG(NPART)=0.0
         endif
         if (KTYPEp.le.2) then  !for electrons and muons
            XMASS(NPART)=XNTRACKp !puts charge back in the mass column
         endif
         if (KTYPEp.eq.3) then  !for taus
            if (XNTRACKp.gt.0) then
               XMASS(NPART)=1.0
            else
               XMASS(NPART)=-1.0
               XNTRACK(NPART)=ABS(XNTRACKp)
            end if
         endif
      endif

      end

C------ End Event

      subroutine endEvent
      
      integer nob,i,k
      parameter (nob=100)

      integer KCOUNT,KTYPE,NPART
      double precision XETA,XPHI,XPT,XMASS,XNTRACK,
     &                 XBTAG,XHADEM,XDUM1,XDUM2
      common /EVENT/KCOUNT(0:nob),KTYPE(0:nob),XETA(0:nob),
     &              XPHI(0:nob),XPT(0:nob),XMASS(0:nob),
     &              XNTRACK(0:nob),XBTAG(0:nob),XHADEM(0:nob),
     &              XDUM1(0:nob),XDUM2(0:nob),NPART    

      integer lfn
      logical ismuonclean,istriggerremove,isfirstremove
      logical isoldformat
      common /FLAGS/lfn,ismuonclean,istriggerremove,isfirstremove,
     &     isoldformat
C     
      double precision  ptiso, etrat
      double precision ptisomax, etratmax
      parameter(ptisomax=5d0)
      parameter(etratmax=.1125d0)
      logical jetcloseflag

C
      if (.Not.isoldformat) then
         if (istriggerremove) then
            do i = 1, NPART
               if (KTYPE(i).eq.6) then ! if missing ET object
                  XHADEM(i) = KTYPE(0) !move the trigger word there
               end if
            end do
         end if 
      endif
      
      if (ismuonclean.or.isoldformat) then
         do i = 1, NPART
            if (KTYPE(i).eq.2) then
C     we'll check to see if muon passes cuts     
               ptiso=DBLE(INT(XHADEM(i))) 
               etrat=XHADEM(i)-ptiso !decimal part
               if (ptiso .ge. ptisomax .or. etrat.ge. etratmax) then
                  KTYPE(i) = 999 ! remove muon 
C     add it to the closest jet in delta R if there is a jet in event
C     otherwise the muon just gets deleted.
                  if (int(XBTAG(i)).gt.0) then
                     call mergeMuon(i,int(XBTAG(i)))
                  endif
               end if
            endif
         end do
      end if
      
      
      k = 0  ! renumber events
  
      do i = 1, NPART  ! trigger word has already been printed in startEvent
         if (KTYPE(i).ne.999) then ! if not a deleted object 
            k = k + 1
            if(isoldformat) then
               if (ktype(i).ne.6) then
                  write(lfn,fmt=601) k,KTYPE(i),XETA(i),
     &                 XPHI(i),XPT(i),XMASS(i),XNTRACK(i),XBTAG(i)
               else
                  write(lfn,601) k,6,0.0,xphi(i),xpt(i),0.0,0.0,0.0
               end if
            else
               write(lfn,fmt=600) k,KTYPE(i),XETA(i),
     &              XPHI(i),XPT(i),XMASS(i),
     &              XNTRACK(i),XBTAG(i),XHADEM(i),
     &              XDUM1(i),XDUM2(i)
            end if
         end if
      end do
      
 600  format(i3,i5,f9.3,f7.3,f8.2,f8.2,2f6.1,f9.2,2f6.1)
 601  format(1x,2i3,2x,2f7.3,1X,2f9.2,2f7.1)
      end

      
C------ Merge Muon

      subroutine mergeMuon(imuon,ijet)
      
      integer nob,i,k
      parameter (nob=100)

      double precision PX1,PY1,PZ1,PE1,PX2,PY2,PZ2,PE2,ETA,PHI,PT,MASS

      integer KCOUNT,KTYPE,NPART
      double precision XETA,XPHI,XPT,XMASS,XNTRACK,
     &                 XBTAG,XHADEM,XDUM1,XDUM2
      common /EVENT/KCOUNT(0:nob),KTYPE(0:nob),XETA(0:nob),
     &              XPHI(0:nob),XPT(0:nob),XMASS(0:nob),
     &              XNTRACK(0:nob),XBTAG(0:nob),XHADEM(0:nob),
     &              XDUM1(0:nob),XDUM2(0:nob),NPART   
      logical ismuonclean,istriggerremove,isfirstremove
      logical isoldformat
      common /FLAGS/lfn,ismuonclean,istriggerremove,isfirstremove,
     &     isoldformat
C     
      call fourVector(XETA(imuon),XPHI(imuon),XPT(imuon),XMASS(imuon),
     &      PX1,PY1,PZ1,PE1)
       
      call fourVector(XETA(ijet),XPHI(ijet),XPT(ijet),XMASS(ijet),
     &      PX2,PY2,PZ2,PE2)
C
      PX2 = PX1 + PX2
      PY2 = PY1 + PY2
      PZ2 = PZ1 + PZ2
      PE2 = PE1 + PE2

      call etaPhiPtMass(PX2,PY2,PZ2,PE2,ETA,PHI,PT,MASS)
        
      XETA(ijet) = ETA
      XPHI(ijet) = PHI
      XPT(ijet) = PT
      XMASS(ijet) = MASS
      if (.not.isoldformat) then
         XNTRACK(ijet)= XNTRACK(ijet)+1.1
      else
         XNTRACK(ijet)= XNTRACK(ijet)+1.0
      endif
      end

C----------------------------------------------------------------------
C...Begin subroutine fourVector
C----------------------------------------------------------------------

      subroutine fourVector(ETA,PHI,PT,MASS,PX,PY,PZ,PE)

      double precision ETA,PHI,PT,MASS,PX,PY,PZ,PE

      PX = PT * cos(PHI)
      PY = PT * sin(PHI)
      PZ = PT * sinh(ETA)
      PE=SQRT (PX**2+PY**2+PZ**2+MASS**2)
      end

C----------------------------------------------------------------------
C...Begin subroutine etaPhiPtMass
C----------------------------------------------------------------------

      subroutine etaPhiPtMass(PX,PY,PZ,PE,ETA,PHI,PT,MASS)
      implicit none
      double precision ETA,PHI,PT,MASS,PX,PY,PZ,PE
      double precision MASSSQ,PTSQ,PTEMP
      double precision pi
      parameter (pi=3.1415926d0)
      MASSSQ=PE**2 - PX**2 - PY**2 - PZ**2
      if (MASSSQ.gt.0d0) then
         MASS=sqrt(MASSSQ)
      else
         MASS=0d0
      endif
C     
      PTSQ=PX**2+PY**2
      IF (PTSQ.gt.0d0) then
         PT = SQRT(PTSQ)
      else
         PT=0d0
      endif
C
      PHI = atan2(PY,PX)
      if (PHI.le.0d0)  THEN 
         PHI = PHI + 2.0d0*pi
      endif
C
      ETA = 0
      PTEMP=SQRT(PTSQ+PZ**2)
      if ( (PTEMP-PZ).ne.0.0) then
        ETA = dlog(PT/(PTEMP-PZ))
      endif
      return
      end






