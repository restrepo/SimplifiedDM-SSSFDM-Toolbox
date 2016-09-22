C   Program to read MadEvent files, shower, hadronize and decay
C   Stores the events in a stdhep file
C
C   Version 2.0, 09/10/2006
C   Includes matching analysis
C
C   Written by Johan Alwall, 23/02/2006
C
C   E-mail: alwall@fyma.ucl.ac.be

      PROGRAM PYTHIA

      IMPLICIT NONE

C...EXTERNAL statement links PYDATA on most machines.
      EXTERNAL PYDATA

C...The event record.
      INTEGER N,NPAD,K
      DOUBLE PRECISION P,V
      COMMON/PYJETS/N,NPAD,K(4000,5),P(4000,5),V(4000,5)

C...Inputs for jet clustering and Pythia run
C...IJETALG=1(getjet)/0(ktclus)
C...NITER=-1 means all available events
C...Inputs for jet clustering and Pythia run
      INTEGER NITER,NFILES,IJETALG,KTSCHE
      DOUBLE PRECISION ETCLUS,ETMIN,RMAX,ETAMAX,ETAJETMAX
      COMMON/JETPAR/ETCLUS,ETMIN,RMAX,ETAMAX,ETAJETMAX,
     $     NITER,NFILES,IJETALG,KTSCHE
      DATA ETCLUS,ETMIN,RMAX,ETAMAX,ETAJETMAX/10d0,10d0,0.7d0,5d0,4.5d0/
      DATA KTSCHE/4313/
      DATA NITER,NFILES,IJETALG/-1,0,1/
C...External functions
      DOUBLE PRECISION PYP,PYANGL,PSERAP,PT
      EXTERNAL PYP,PYANGL,PSERAP,PT
C...Variables for the kT-clustering
      INTEGER NMAX
      PARAMETER (NMAX=512)
      INTEGER NN,IHEP,I,NSUB,JET(NMAX),NCJET
      DOUBLE PRECISION ECUT,YCUT,RAD
      DOUBLE PRECISION PCJET(4,NMAX),Y(NMAX),PP(4,NMAX),ETJETC(NMAX)
C...User process event common block.
      INTEGER MAXNUP
      PARAMETER (MAXNUP=500)
      INTEGER NUP,IDPRUP,IDUP,ISTUP,MOTHUP,ICOLUP
      DOUBLE PRECISION XWGTUP,SCALUP,AQEDUP,AQCDUP,PUP,VTIMUP,SPINUP
      COMMON/HEPEUP/NUP,IDPRUP,XWGTUP,SCALUP,AQEDUP,AQCDUP,IDUP(MAXNUP),
     &   ISTUP(MAXNUP),MOTHUP(2,MAXNUP),ICOLUP(2,MAXNUP),PUP(5,MAXNUP),
     &   VTIMUP(MAXNUP),SPINUP(MAXNUP)
C...HEPEVT commonblock.
      INTEGER NMXHEP,NEVHEP,NHEP,ISTHEP,IDHEP,JMOHEP,JDAHEP
      DOUBLE PRECISION PHEP,VHEP
      PARAMETER (NMXHEP=4000)
      COMMON/HEPEVT/NEVHEP,NHEP,ISTHEP(NMXHEP),IDHEP(NMXHEP),
     &JMOHEP(2,NMXHEP),JDAHEP(2,NMXHEP),PHEP(5,NMXHEP),VHEP(4,NMXHEP)
      SAVE /HEPEVT/
C...GETJET commonblocks
      INTEGER MNCY,MNCPHI,NCY,NCPHI,NJMAX,JETNO,NJJET
      DOUBLE PRECISION YCMIN,YCMAX,DELY,DELPHI,ET,STHCAL,CTHCAL,CPHCAL,
     &  SPHCAL,PJJET,ETJETJ
      PARAMETER (MNCY=200)
      PARAMETER (MNCPHI=200)
      COMMON/CALOR/DELY,DELPHI,ET(MNCY,MNCPHI),
     $CTHCAL(MNCY),STHCAL(MNCY),CPHCAL(MNCPHI),SPHCAL(MNCPHI),
     $YCMIN,YCMAX,NCY,NCPHI
      DATA YCMIN,YCMAX/-5d0,5d0/
      DATA NCY,NCPHI/100,60/
      PARAMETER (NJMAX=500)
      COMMON/GETCOM/PJJET(4,NJMAX),ETJETJ(NJMAX),JETNO(MNCY,MNCPHI),
     $NJJET
c
c   STDHEP global variables
c   stdecom  - center-of-mass energy
c   stdxsec  - cross-section
c   stdseed1 - random number seed
c   stdseed2 - random number seed
c   nevtreq  - number of events to be generated
c   nevtgen  - number of events actually generated
c   nevtwrt  - number of events written to output file
c   nevtlh   - number of Les Houches events written to output file
c
      real stdecom,stdxsec
      double precision stdseed1,stdseed2
      integer nevtreq,nevtgen,nevtwrt,nevtlh
      common /stdcm1/ stdecom,stdxsec,stdseed1,stdseed2,
     1                nevtreq,nevtgen,nevtwrt,nevtlh
c
c -------------------------------------------------------------

C   Local variables
      INTEGER IEV,istrstd,ievold
      CHARACTER*5 CGIVE
      CHARACTER*30 CGIVE0
      CHARACTER*80 pythia_card,output_file,init_file,input_file!,banner_file
      CHARACTER*250 buff
      DOUBLE PRECISION APT,AETA,ETA,RFOUND
      DOUBLE PRECISION Pxmiss,Pymiss,Etmiss,Phimiss
      DOUBLE PRECISION ETACJET(NJMAX),ETAJJET(NJMAX)
      DOUBLE PRECISION PHICJET(NJMAX),PHIJJET(NJMAX)
      DOUBLE PRECISION PTE(NMAX),ETAE(NMAX),PHIE(NMAX)
      DOUBLE PRECISION PTMU(NMAX),ETAMU(NMAX),PHIMU(NMAX)
      DOUBLE PRECISION PTTA(NMAX),ETATA(NMAX),PHITA(NMAX)
      DOUBLE PRECISION PTPHOT(NMAX),ETAPHOT(NMAX),PHIPHOT(NMAX)
      INTEGER J,KSORTJ(NMAX),KSORTC(NMAX),KSORT(NMAX),IBTAG(NMAX)
      INTEGER NE,NMU,NTA,NPHOT,IOBJ,II,IFOUND
      DOUBLE PRECISION PI,TWOPI
      PARAMETER (PI=3.141592653,TWOPI=2*PI)

c      LOGICAL banner_open
      integer lok,istream,itype

C...Set pythia input card and STDHEP output file
      pythia_card='../Cards/pythia_card.dat'
c      banner_file='banner.txt'
      input_file='pythia_events.hep'
      output_file='pythia_events.lhe'
      init_file='pythia_events.init'

      IF(ijetalg.eq.0) THEN
         write(*,*)'Using KTCLUS for jet finding (ijetalg=0)'
      ELSE
         write(*,*)'Using GETJET for jet finding (ijetalg=1)'
      ENDIF

C...Open LHC Olympics output file
c      banner_open=.false.
c      OPEN (10, FILE=banner_file, ERR=10 )
c      banner_open=.true.
c      WRITE(*,*)'Opened file ',banner_file
c      GOTO 15
c 10   WRITE(*,*)'Warning: No file ',banner_file(1:len_trim(banner_file))
c     $   ,'. No banner will be written.'
 15   OPEN (20, FILE=output_file, ERR=90, ACCESS='APPEND')
      OPEN (21, FILE=init_file, ERR=90 )
      
cC...Write banner to .lhe file
c      WRITE(20,'(a)') '<LesHouchesEvents version="1.0">'
c      if(banner_open)then
c        READ(10,'(a)',ERR=5,END=5) buff
c        DO WHILE(.true.)
c          READ(10,'(a)',ERR=5,END=5) buff
c          if(index(buff,'<init>').ne.0) GOTO 5
c          WRITE(20,'(a)') buff(1:len_trim(buff))
c        ENDDO
c      endif

C...Open STDHEP input file
 5    call stdxropen('pythia_events.hep',NITER,istream,lok)
      if (lok.ne.0) then
        write(*,'('' STDX: open failure on pythia_events.hep: '',i5)')
     $     lok
        stop
      endif

C...Read pythia input card
      WRITE(*,*)
      WRITE(*,*),'Reading pythia input card'
      CALL RPYCARD(pythia_card)

      IF(NITER.LE.0)THEN
        WRITE(*,*),'Generating all events'
      ELSE
        WRITE(*,*),'Generating up to ',NITER,' events'
      ENDIF

      IEV=0
      DO 130 WHILE(.TRUE.)
C...Get event
        call stdxrd(itype,istream,lok)
        if (lok.ne.0) then
          write(*,
     .       '('' READ_EVENT: error reading file: '',i5)') lok
          GOTO 135
        endif
        if(itype.eq.100) then
c start run record
           cycle
        endif
        if (itype.eq.200) then
c end run record        
C...Write init info to the .lhe init file
          WRITE(21,'(a)') '<init>'
          WRITE(21,'(2i6,2E12.5,2i2,2i6,2i2)')
     $       K(1,2),K(2,2),P(1,4),P(2,4),0,0,
     $       0,0,3,1
          WRITE(21,'(3E12.5,i4)')
     $       stdxsec*1d9,0d0,1d0,100
          WRITE(21,'(a)') '</init>'
          call stdxend(istream)
          GOTO 135
        endif

        IF(IEV.GE.NITER) CYCLE

        IEV=IEV+1

C...Convert event from STDHEP format to Pythia format
        call lunhep(2)

C...Prepare for jet clustering
        NN=0
        NCJET=0
        NJJET=0
        NHEP=N
        DO I=7,N
C...Make only interesting jet particles active
          IF(K(I,1).LT.10.AND.
     $          (ABS(K(I,2)).LT.6 .OR. K(I,2).EQ.21 .OR. K(I,2).EQ.22
     $          .OR.(ABS(K(I,2)).GT.100.AND.ABS(K(I,2)).LT.10000)))THEN
             ISTHEP(I)=1
          ELSE
             ISTHEP(I)=2
          ENDIF
          
C...Prepare for kT clustering
          IF(IJETALG.EQ.0.AND.ISTHEP(I).EQ.1)THEN
            APT=sqrt(P(I,1)**2+P(I,2)**2)
            AETA=ABS(LOG(MIN((SQRT(APT**2+P(I,3)**2)+
     $         ABS(P(I,3)))/APT,1d5)))
            IF(AETA.GT.ETAMAX) CYCLE
            IF(APT.EQ.0) CYCLE
            NN=NN+1
            IF (NN.GT.NMAX) then
              WRITE(*,*), 'Too many particles for kt clustering, ',NN,
     $              ', skipping extra particles.'
              NN=NN-1
              EXIT
            endif
            DO J=1,4
              PP(J,NN)=P(I,J)
            ENDDO
          ENDIF
        ENDDO
C...Perform jet clustering with ktclus
        IF(IJETALG.EQ.0)THEN
          IF (NN.GT.1) then
            ECUT=1
            YCUT=ETCLUS**2
            CALL KTCLUS(KTSCHE,PP,NN,ECUT,Y,*999)
            CALL KTRECO(MOD(KTSCHE,10),PP,NN,ECUT,YCUT,YCUT,
     $           PCJET,JET,NCJET,NSUB,*999)            
            DO I=1,NCJET
               ETJETC(I)=PT(PCJET(1,I))
            ENDDO
          ELSE IF (NN.EQ.1) THEN
            Y(1)=PT(PP(1,1))
            IF(Y(1).GT.YCUT)THEN
              NCJET=1
              DO I=1,4
                PCJET(I,1)=PP(I,1)
              ENDDO
            ENDIF
          ENDIF
          CALL ALPSOR(ETJETC,NCJET,KSORTC,2)
          DO I=1,NCJET
             ETACJET(I)=PSERAP(PCJET(1,KSORTC(NCJET+1-I)))
             PHICJET(I)= PYANGL(PCJET(1,KSORTC(NCJET+1-I)),
     $            PCJET(2,KSORTC(NCJET+1-I)))
             IBTAG(I)=0
          ENDDO
        ELSE
C...Perform jet reconstruction with getjet
          YCMAX=ETAMAX
          YCMIN=-YCMAX
          CALL CALINI
          CALL CALSIM
          CALL GETJET(RMAX,ETMIN,ETAMAX)
          CALL ALPSOR(ETJETJ,NJJET,KSORTJ,2)
          DO I=1,NJJET
             ETAJJET(I)=PSERAP(PJJET(1,KSORTJ(NJJET+1-I)))
             PHIJJET(I)=PYANGL(PJJET(1,KSORTJ(NJJET+1-I)),
     $            PJJET(2,KSORTJ(NJJET+1-I)))
             IBTAG(I)=0
          ENDDO
        ENDIF

C...Perform event analysis to generate .lhe and .lhco files
        Pxmiss=0
        Pymiss=0
        NUP=0
        NE=0
        NMU=0
        NTA=0
        NPHOT=0
        DO I=5,N
          IF(K(I,1).GT.20)THEN
            NUP=NUP+1
            IDUP(NUP)=K(I,2)
            IF(I.LE.6)THEN
              ISTUP(NUP)=-1
              MOTHUP(1,NUP)=0
            ELSE
              ISTUP(NUP)=2
              MOTHUP(1,NUP)=MAX(0,K(I,3)-4)
            ENDIF
            MOTHUP(2,NUP)=MOTHUP(1,NUP)
            DO J=1,5
              PUP(J,NUP)=P(I,J)
            ENDDO
          ENDIF
          IF(K(I,1).LT.10.AND.(IABS(K(I,2)).EQ.11.OR.
     $       IABS(K(I,2)).EQ.13.OR.IABS(K(I,2)).EQ.15.OR.
     $       IABS(K(I,2)).EQ.22)
     $       .AND.K(K(I,3),2).EQ.K(I,2))THEN
c            NE=NE+1
c            PTE(NE)=PYP(I,10)
c            ETAE(NE)=PYP(I,19)
c            PHIE(NE)=PYP(I,15)
            NUP=NUP+1
            IDUP(NUP)=K(I,2)
            ISTUP(NUP)=1
            MOTHUP(1,NUP)=0
            MOTHUP(2,NUP)=MOTHUP(1,NUP)
            DO J=1,5
              PUP(J,NUP)=P(I,J)
            ENDDO
          ELSE IF(K(I,1).LT.10.AND.(IABS(K(I,2)).EQ.12.OR.
     $         IABS(K(I,2)).EQ.14.OR.IABS(K(I,2)).EQ.16.OR.
     $         K(I,2).EQ.1000022))THEN
            Pxmiss=Pxmiss+P(I,1)
            Pymiss=Pymiss+P(I,2)
          ELSE IF(K(I,1).LT.10.AND.IABS(K(I,2)).GT.1000000)THEN
            NUP=NUP+1
            IDUP(NUP)=K(I,2)
            ISTUP(NUP)=1
            MOTHUP(1,NUP)=MAX(0,K(K(I,3),3)-4)
            MOTHUP(2,NUP)=MOTHUP(1,NUP)
            DO J=1,5
              PUP(J,NUP)=P(I,J)
            ENDDO
          ELSE IF(K(I,1).LT.20.AND.(IABS(K(I,2)).EQ.5.OR.
     $     (IABS(K(I,2)).GT.500.AND.IABS(K(I,2)).LT.600).OR.
     $     (IABS(K(I,2)).GT.5000.AND.IABS(K(I,2)).LT.6000)).AND.
     $     (K(I,4).EQ.0.OR.K(K(I,4),2).NE.92.AND.
     $      (IABS(K(K(I,4),2)).LT.500.OR.IABS(K(K(I,4),2)).GT.600).AND.
     $      (IABS(K(K(I,4),2)).LT.5000.OR.IABS(K(K(I,4),2)).GT.6000)))
     $      THEN
c     Check if there is a b quark/hadron going in the direction of one of the jets
            IF(IJETALG.GT.0)THEN
              RFOUND=1.5*RMAX
              IFOUND=0
c              PRINT *,'Found b particle at ',I
              DO J=1,NJJET
c                PRINT *,'DeltaR, Pt ratio: ',
c     $             SQRT((PSERAP(PJJET(1,J))-PYP(I,19))**2+
c     $           (PYANGL(PJJET(1,J),PJJET(2,J))-PYP(I,15))**2),
c     $             PYP(I,10)/PT(PJJET(1,J))
                IF(SQRT((PSERAP(PJJET(1,J))-PYP(I,19))**2+
     $             MIN(ABS(PYANGL(PJJET(1,J),PJJET(2,J))-PYP(I,15)),
     $             TWOPI-ABS(PYANGL(PJJET(1,J),PJJET(2,J))-PYP(I,15))
     $             )**2).LT.RFOUND
     $             .AND. PT(PJJET(1,J))/PYP(I,10).GT.0.3d0 
     $          ) THEN
                  RFOUND=SQRT((PSERAP(PJJET(1,J))-PYP(I,19))**2+
     $             MIN(ABS(PYANGL(PJJET(1,J),PJJET(2,J))-PYP(I,15)),
     $             TWOPI-ABS(PYANGL(PJJET(1,J),PJJET(2,J))-PYP(I,15))
     $             )**2)
                  IFOUND=J
                ENDIF
              ENDDO
              IF(IFOUND.GT.0) THEN
                IBTAG(IFOUND)=1
c                PRINT *,'Found b jet'
c              ELSE
c                PRINT *,'Couldnt find match for b in event ',IEV
c                CALL PYLIST(2)
c                WRITE(*,'(a,3I5,3F8.3)')'b: ',I,K(I,1),K(I,2),PYP(I,10),
c     $             PYP(I,19),PYP(I,15)
c                PRINT *,'Jets: pt eta phi px py pz'
c                DO J=1,NJJET
c                  WRITE(*,'(6F8.3)')PT(PJJET(1,J)),
c     $               PSERAP(PJJET(1,J)),PYANGL(PJJET(1,J),PJJET(2,J)),
c     $               (PJJET(II,J),II=1,3)
c                ENDDO
              ENDIF
            ELSE
              RFOUND=1.5*RMAX
              IFOUND=0
              DO J=1,NCJET
c             For now just use cone also for this case
                IF(SQRT((PSERAP(PCJET(1,J))-PYP(I,19))**2+
     $             MIN(ABS(PYANGL(PCJET(1,J),PCJET(2,J))-PYP(I,15)),
     $             TWOPI-ABS(PYANGL(PCJET(1,J),PCJET(2,J))-PYP(I,15))
     $             )**2).LT.RFOUND
     $             .AND. PT(PCJET(1,J))/PYP(I,10).GT.0.3d0 
     $             ) THEN
                  RFOUND=SQRT((PSERAP(PCJET(1,J))-PYP(I,19))**2+
     $             MIN(ABS(PYANGL(PCJET(1,J),PCJET(2,J))-PYP(I,15)),
     $             TWOPI-ABS(PYANGL(PCJET(1,J),PCJET(2,J))-PYP(I,15))
     $             )**2)
                  IFOUND=J
                ENDIF
              ENDDO
              IF(IFOUND.GT.0) THEN
                IBTAG(IFOUND)=1
c              ELSE
c                PRINT *,'Couldnt find match for b in event ',IEV
c                WRITE(*,'(a,3I5,3F8.3)')'b: ',I,K(I,1),K(I,2),PYP(I,10),
c     $             PYP(I,19),PYP(I,15)
c                PRINT *,'Jets: pt eta phi px py pz'
c                DO J=1,NCJET
c                  WRITE(*,'(6F8.3)')PT(PCJET(1,J)),
c     $               PSERAP(PCJET(1,J)),PYANGL(PCJET(1,J),PCJET(2,J)),
c     $               (PCJET(II,J),II=1,3)
c                ENDDO
c                CALL PYLIST(2)
              ENDIF
            ENDIF
          ENDIF
        ENDDO

c     Jets
        IF(IJETALG.EQ.0)THEN        
          DO I=1,NCJET
            NUP=NUP+1
            IF(IBTAG(KSORTC(NCJET+1-I)).EQ.0)THEN
              IDUP(NUP)=21
            ELSE
              IDUP(NUP)=5
            ENDIF
            ISTUP(NUP)=1
            MOTHUP(1,NUP)=0
            MOTHUP(2,NUP)=MOTHUP(1,NUP)
            DO J=1,4
              PUP(J,NUP)=PCJET(J,KSORTC(NCJET+1-I))
            ENDDO
            PUP(5,NUP)=SQRT(MAX(0d0,PUP(4,NUP)**2-
     $         PUP(1,NUP)**2-PUP(2,NUP)**2-PUP(3,NUP)**2))
          ENDDO
        ELSE
          DO I=1,NJJET
            NUP=NUP+1
            IF(IBTAG(KSORTJ(NJJET+1-I)).EQ.0)THEN
              IDUP(NUP)=21
            ELSE
              IDUP(NUP)=5
            ENDIF
            ISTUP(NUP)=1
            MOTHUP(1,NUP)=0
            MOTHUP(2,NUP)=MOTHUP(1,NUP)
            DO J=1,4
              PUP(J,NUP)=PJJET(J,KSORTJ(NJJET+1-I))
            ENDDO
            PUP(5,NUP)=SQRT(MAX(0d0,PUP(4,NUP)**2-
     $         PUP(1,NUP)**2-PUP(2,NUP)**2-PUP(3,NUP)**2))
          ENDDO
        ENDIF

c     Missing transverse energy
        Etmiss  = sqrt(Pxmiss**2+Pymiss**2)
        IF(Etmiss.GT.0d0)THEN
          Phimiss = PYANGL(Pxmiss,Pymiss)
          NUP=NUP+1
          IDUP(NUP)=12
          ISTUP(NUP)=1
          MOTHUP(1,NUP)=0
          MOTHUP(2,NUP)=0
          PUP(1,NUP)=Pxmiss
          PUP(2,NUP)=Pymiss
          PUP(4,NUP)=Etmiss
          PUP(3,NUP)=0
          PUP(5,NUP)=0
        ENDIF
C...First write dummy events into lhe file
c        DO WHILE(ievold.lt.IEVNT-1)
c          WRITE(20,'(a)') '<event>'
c          WRITE(20,'(I3,I4,4E16.8)')
c     $       0,661,IEVNT*1d9*PARI(2),SCALUP,AQEDUP,AQCDUP
c          WRITE(20,'(a)') '</event>'
c          ievold=ievold+1
c        ENDDO
        ievold=IEV
C...Write event into lhe file
        WRITE(20,'(a)') '<event>'
        WRITE(20,'(I3,I4,4E16.8)')
     $     NUP,100,1d0,0d0,0d0,0d0
        DO I=1,NUP
          WRITE(20,'(I8,I3,2I3,2I2,5E16.8,2F3.0)')
     $       IDUP(I),ISTUP(I),MOTHUP(1,I),MOTHUP(2,I),0,0,
     $       (PUP(J,I),J=1,5),0d0,0d0
        ENDDO
        WRITE(20,'(a)') '</event>'

C...Print first 10 events

 125    IF(IEV.LE.10) THEN
          WRITE(*,*)
          WRITE(*,*),'Event number: ',IEV
          CALL PYLIST(2)
          IF(NN.GT.0) WRITE(*,*),'Jet clustering values:'
          WRITE(*,*),(SQRT(Y(J)),J=1,MIN(4,NN))
          WRITE(*,*),'Jet momenta (ktclus):'
          DO I=1,NCJET
            WRITE(*,*),(PCJET(J,I),J=1,4)
          ENDDO
          WRITE(*,*),'Jet Pts:',(ETJETC(KSORTC(NCJET+1-I)),I=1,NCJET)
          WRITE(*,*),'Jet momenta (getjet):'
          DO I=1,NJJET
            WRITE(*,*),(PJJET(J,KSORTJ(NJJET+1-I)),J=1,4)
          ENDDO
          WRITE(*,*),'Jet Pts:',(ETJETJ(KSORTJ(NJJET+1-I)),I=1,NJJET)
c          call heplst(1)
          CALL FLUSH()
        ENDIF

 130  CONTINUE

C...Close lhe file
 135  WRITE(20,'(a)') '</LesHouchesEvents>'
      
      WRITE(*,*),'Done. Wrote ',IEV,' lhe events.'

      RETURN
 4000 FORMAT(i3,i14,i7)
 4001 FORMAT(i3,i5,f9.3,f7.3,f8.2,f8.2,2f6.1,f9.2,2f6.1)
 999  WRITE(*,*) 'Error in one of the KTCLUS routines'
      STOP
 90   WRITE(*,*) 'Error: Could not open MadEvent event file'
      WRITE(*,*) 'Quitting...'
      END
      
C************************************************

      SUBROUTINE RPYCARD(pythia_card)

      IMPLICIT NONE
      
C...Inputs for jet clustering and Pythia run
      INTEGER NITER,NFILES,IJETALG,KTSCHE
      DOUBLE PRECISION ETCLUS,ETMIN,RMAX,ETAMAX,ETAJETMAX
      COMMON/JETPAR/ETCLUS,ETMIN,RMAX,ETAMAX,ETAJETMAX,
     $     NITER,NFILES,IJETALG,KTSCHE

C...GETJET commonblocks
      INTEGER MNCY,MNCPHI,NCY,NCPHI,NJMAX,JETNO,NJJET
      DOUBLE PRECISION YCMIN,YCMAX,DELY,DELPHI,ET,STHCAL,CTHCAL,CPHCAL,
     &  SPHCAL,PJJET,ETJETJ
      PARAMETER (MNCY=200)
      PARAMETER (MNCPHI=200)
      COMMON/CALOR/DELY,DELPHI,ET(MNCY,MNCPHI),
     $CTHCAL(MNCY),STHCAL(MNCY),CPHCAL(MNCPHI),SPHCAL(MNCPHI),
     $YCMIN,YCMAX,NCY,NCPHI

      INTEGER ios,i
      CHARACTER*80 pythia_card
      CHARACTER*132 line
      

      if (pythia_card.ne.' ') then
        open (85, file=pythia_card, status='old',
     .     form='formatted')    ! removed for Linux: readonly)
        ios = 0
        do while(ios.eq.0)
          read(85,fmt='(a)',iostat=ios) line
          if (ios.eq.0) then
             call remove_comments(line,132)
             if(index(line,'IJETALG').ne.0.or.
     $               index(line,'ijetalg').ne.0) then
                READ(line(index(line,'=')+1:),*) ijetalg
                if(ijetalg.eq.0)then
                   write(*,*) 'Using kt jets'
                else
                   write(*,*) 'Using cone jets'
                endif
             else if(index(line,'ETCLUS').ne.0.or.
     $               index(line,'etclus').ne.0) then
                READ(line(index(line,'=')+1:),*) etclus
                write(*,*) 'Read Etclus = ',etclus
             else if(index(line,'ETMIN').ne.0.or.
     $               index(line,'etmin').ne.0) then
                READ(line(index(line,'=')+1:),*) etmin
                write(*,*) 'Read Etmin = ',etmin
             else if(index(line,'RMAX').ne.0.or.
     $               index(line,'rmax').ne.0) then
                READ(line(index(line,'=')+1:),*) rmax
                write(*,*) 'Read Rmax  = ',rmax
             else if(index(line,'ETAMAX').ne.0.or.
     $               index(line,'etamax').ne.0) then
                READ(line(index(line,'=')+1:),*) etamax
                write(*,*) 'Read Etamax = ',etamax
             else if(index(line,'ETAJETMAX').ne.0.or.
     $               index(line,'etajetmax').ne.0) then
                READ(line(index(line,'=')+1:),*) etajetmax
                write(*,*) 'Read Etamax = ',etajetmax
             else if(index(line,'NCY').ne.0.or.
     $               index(line,'ncy').ne.0) then
                READ(line(index(line,'=')+1:),*) ncy
                write(*,*) 'Read NCY = ',ncy
             else if(index(line,'NCPHI').ne.0.or.
     $               index(line,'ncphi').ne.0) then
                READ(line(index(line,'=')+1:),*) ncphi
                write(*,*) 'Read NCPHI = ',ncphi
             else if(index(line,'NITER').ne.0.or.
     $               index(line,'niter').ne.0) then
                READ(line(index(line,'=')+1:),*) niter
                write(*,*) 'Read Niter = ',niter
             else if(index(line,'KTSCHE').ne.0.or.
     $               index(line,'ktsche').ne.0) then
                READ(line(index(line,'=')+1:),*) ktsche
                write(*,*) 'Read Ktsche = ',ktsche
             endif
          endif
        enddo
        close(85)
      endif
      
      RETURN
      END
      
C************************************************

      subroutine remove_comments(line,len)

      implicit none
      character*(*) line
      integer i,len

      logical comment

      comment = .false.
      if(line(1:1).eq.'#') comment = .true.
      do i=1,len
        if(line(i:i).eq.'!') comment = .true.
        if(comment) line(i:i) = ' ' 
      enddo

      return
      end

      double precision function PT(P)

      implicit none

      double precision P(4)

      PT=sqrt(P(1)**2+P(2)**2)
      return

      end
