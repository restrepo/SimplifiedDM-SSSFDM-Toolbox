C -------------------------------------------------------------
C
      integer nmxln2
      parameter (nmxln2=1000)
      integer idpdg
      real pdmerr,pdwerr
      double precision pdmass,pdwidth
      character*21 pdname
      common/pdgtbl/ idpdg(nmxln2),pdmerr(2,nmxln2),pdwerr(2,nmxln2),
     1             pdmass(nmxln2),pdwidth(nmxln2),pdname(nmxln2)
      save /pdgtbl/
C
C -------------------------------------------------------------
