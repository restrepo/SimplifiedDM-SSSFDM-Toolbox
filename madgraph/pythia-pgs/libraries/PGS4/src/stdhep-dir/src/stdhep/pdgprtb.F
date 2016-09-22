      subroutine pdgprtb(ityp,lun)
C
C   print mass and width table from appropriate common block
C   actions:
C	ITYP = 1	print table to LUN in STD format
C	ITYP = 2	print table to LUN in PDG format
C
#include "pdgtbl.inc"
#include "stdtbl.inc"
#include "stdlun.inc"
C
      integer lun,ityp,i
C
      if(ityp.eq.1)then
        write(lun,101)
        do i=1,nmxln
          if(idt(i).ne.0) write(lun,103) idt(i),stname(i),stmass(i),
     1     stmerr(1,i),stmerr(2,i),stwidth(i),stwerr(1,i),stwerr(2,i)
        enddo
      elseif(ityp.eq.2)then
        write(lun,102)
        do i=1,nmxln2
          if(idpdg(i).ne.0) write(lun,103) idpdg(i),pdname(i),
     1       pdmass(i),pdmerr(1,i),pdmerr(2,i),
     2       pdwidth(i),pdwerr(1,i),pdwerr(2,i)
        enddo
      else
        write(lnhout,*) ' PDGPRTB: Illegal table type, use 1 or 2 '
      endif
      return
 101  format(//20X,'Table of particles from PDG in StdHep format'//
     1     6X,'IDHEP',2X,'NAME',23X,'MASS',
     2     20X,'MASS ERROR',9X,'WIDTH',21X,'WIDTH ERROR')
 102  format(//20X,'Table of particles from PDG in PDG format'//
     1     6X,'IDPDG',2X,'NAME',9X,'CHARGES',7X,'MASS',
     2     20X,'MASS ERROR',9X,'WIDTH',21X,'WIDTH ERROR')
 103  format(1x, i10, 1x, a21, 1x, e25.16, 1x, 2e9.1, 1x,
     1          e25.16, 1x, 2e9.1)
      end
