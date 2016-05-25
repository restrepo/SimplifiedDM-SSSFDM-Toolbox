! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:13 on 24.5.2016   
! ----------------------------------------------------------------------  
 
 
Module Couplings_Zee
 
Use Control 
Use Model_Data_Zee 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Contains 
 
 Subroutine AllCouplingsReallyAll(Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,               & 
& vu,ZH,ZA,Mu,ZP,Lam10,Lam8,Lam9,Lamh,g1,g2,TW,g3,Yd,epsD,ZDL,ZDR,Ye,epsE,               & 
& ZEL,ZER,epsU,Yu,ZUL,ZUR,Yh,UV,cplAhAhhh,cplAhHmcHm,cplhhhhhh,cplhhHmcHm,               & 
& cplAhAhAhAh,cplAhAhhhhh,cplAhAhHmcHm,cplAhhhHmcHm,cplhhhhhhhh,cplhhhhHmcHm,            & 
& cplHmHmcHmcHm,cplAhhhVZ,cplAhHmVWm,cplAhcHmcVWm,cplhhHmVWm,cplhhcHmcVWm,               & 
& cplHmcHmVP,cplHmcHmVZ,cplhhcVWmVWm,cplhhVZVZ,cplHmVPVWm,cplHmVWmVZ,cplcHmcVWmVP,       & 
& cplcHmcVWmVZ,cplAhAhcVWmVWm,cplAhAhVZVZ,cplAhHmVPVWm,cplAhHmVWmVZ,cplAhcHmcVWmVP,      & 
& cplAhcHmcVWmVZ,cplhhhhcVWmVWm,cplhhhhVZVZ,cplhhHmVPVWm,cplhhHmVWmVZ,cplhhcHmcVWmVP,    & 
& cplhhcHmcVWmVZ,cplHmcHmVPVP,cplHmcHmVPVZ,cplHmcHmcVWmVWm,cplHmcHmVZVZ,cplVGVGVG,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,               & 
& cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,    & 
& cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,            & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,          & 
& cplFvFecVWmR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,              & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWmL,cplcFeFvVWmR,cplVGVGVGVG1,              & 
& cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,             & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2, & 
& cplcVWmcVWmVWmVWm3,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcgGgGVG,         & 
& cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgAgWmcVWm,cplcgZgWmcVWm,     & 
& cplcgWpCgWpCVP,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcVWm, & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplcgZgAhh,cplcgWpCgAHm,cplcgWmgAcHm,cplcgWmgWmhh,         & 
& cplcgZgWmHm,cplcgWpCgWpChh,cplcgZgWpCcHm,cplcgZgZhh,cplcgWpCgZHm,cplcgWmgZcHm)

Implicit None 
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,vd,vu,ZH(2,2),ZA(2,2),Mu,Lam10,g1,g2,TW,g3

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,ZP(3,3),Lam8,Lam9,Lamh,Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3),       & 
& Ye(3,3),epsE(3,3),ZEL(3,3),ZER(3,3),epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),               & 
& Yh(3,3),UV(3,3)

Complex(dp), Intent(out) :: cplAhAhhh(2,2,2),cplAhHmcHm(2,3,3),cplhhhhhh(2,2,2),cplhhHmcHm(2,3,3),cplAhAhAhAh(2,2,2,2),& 
& cplAhAhhhhh(2,2,2,2),cplAhAhHmcHm(2,2,3,3),cplAhhhHmcHm(2,2,3,3),cplhhhhhhhh(2,2,2,2), & 
& cplhhhhHmcHm(2,2,3,3),cplHmHmcHmcHm(3,3,3,3),cplAhhhVZ(2,2),cplAhHmVWm(2,3),           & 
& cplAhcHmcVWm(2,3),cplhhHmVWm(2,3),cplhhcHmcVWm(2,3),cplHmcHmVP(3,3),cplHmcHmVZ(3,3),   & 
& cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmVPVWm(3),cplHmVWmVZ(3),cplcHmcVWmVP(3),              & 
& cplcHmcVWmVZ(3),cplAhAhcVWmVWm(2,2),cplAhAhVZVZ(2,2),cplAhHmVPVWm(2,3),cplAhHmVWmVZ(2,3),& 
& cplAhcHmcVWmVP(2,3),cplAhcHmcVWmVZ(2,3),cplhhhhcVWmVWm(2,2),cplhhhhVZVZ(2,2),          & 
& cplhhHmVPVWm(2,3),cplhhHmVWmVZ(2,3),cplhhcHmcVWmVP(2,3),cplhhcHmcVWmVZ(2,3),           & 
& cplHmcHmVPVP(3,3),cplHmcHmVPVZ(3,3),cplHmcHmcVWmVWm(3,3),cplHmcHmVZVZ(3,3),            & 
& cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,cplcFdFdAhL(3,3,2),cplcFdFdAhR(3,3,2),             & 
& cplcFeFeAhL(3,3,2),cplcFeFeAhR(3,3,2),cplcFuFuAhL(3,3,2),cplcFuFuAhR(3,3,2),           & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),           & 
& cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),             & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),         & 
& cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),             & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWmL(3,3),& 
& cplcFuFdcVWmR(3,3),cplFvFecVWmL(3,3),cplFvFecVWmR(3,3),cplcFeFeVPL(3,3),               & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),  & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),& 
& cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),  & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,& 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2, & 
& cplcVWmcVWmVWmVWm3,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcgGgGVG,         & 
& cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgAgWmcVWm,cplcgZgWmcVWm,     & 
& cplcgWpCgWpCVP,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWpCgWpCVZ,cplcgWmgZVWm,cplcgWpCgZcVWm, & 
& cplcgWmgWmAh(2),cplcgWpCgWpCAh(2),cplcgZgAhh(2),cplcgWpCgAHm(3),cplcgWmgAcHm(3),       & 
& cplcgWmgWmhh(2),cplcgZgWmHm(3),cplcgWpCgWpChh(2),cplcgZgWpCcHm(3),cplcgZgZhh(2),       & 
& cplcgWpCgZHm(3),cplcgWmgZcHm(3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplingsReallyAll'
 
cplAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhhhT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,               & 
& vu,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhHmcHmT(gt1,gt2,gt3,Mu,Lam5,Lam4,vd,vu,ZA,ZP,cplAhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,               & 
& vu,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHmcHmT(gt1,gt2,gt3,Mu,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,             & 
& Lam2,Lam8,Lam9,vd,vu,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhAhAhAh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhAhAhT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,            & 
& ZA,cplAhAhAhAh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhhhhhT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,            & 
& ZH,ZA,cplAhAhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingAhAhHmcHmT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,               & 
& Lam3,Lam2,Lam8,Lam9,ZA,ZP,cplAhAhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingAhhhHmcHmT(gt1,gt2,gt3,gt4,Lam5,Lam4,ZH,ZA,ZP,cplAhhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhhhhhT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,            & 
& ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplinghhhhHmcHmT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,               & 
& Lam3,Lam2,Lam8,Lam9,ZH,ZP,cplhhhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplHmHmcHmcHm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingHmHmcHmcHmT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,              & 
& Lam3,Lam2,Lam8,Lam9,Lamh,ZP,cplHmHmcHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZT(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhHmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingAhHmVWmT(gt1,gt2,g2,ZA,ZP,cplAhHmVWm(gt1,gt2))

 End Do 
End Do 


cplAhcHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingAhcHmcVWmT(gt1,gt2,g2,ZA,ZP,cplAhcHmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhHmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhHmVWmT(gt1,gt2,g2,ZH,ZP,cplhhHmVWm(gt1,gt2))

 End Do 
End Do 


cplhhcHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWmT(gt1,gt2,g2,ZH,ZP,cplhhcHmcVWm(gt1,gt2))

 End Do 
End Do 


cplHmcHmVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVP(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmT(gt1,g2,vd,vu,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,vd,vu,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHmVPVWm = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVPVWmT(gt1,g1,g2,vd,vu,ZP,TW,cplHmVPVWm(gt1))

End Do 


cplHmVWmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVWmVZT(gt1,g1,g2,vd,vu,ZP,TW,cplHmVWmVZ(gt1))

End Do 


cplcHmcVWmVP = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWmVPT(gt1,g1,g2,vd,vu,ZP,TW,cplcHmcVWmVP(gt1))

End Do 


cplcHmcVWmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWmVZT(gt1,g1,g2,vd,vu,ZP,TW,cplcHmcVWmVZ(gt1))

End Do 


cplAhAhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhcVWmVWmT(gt1,gt2,g2,ZA,cplAhAhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplAhAhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZT(gt1,gt2,g1,g2,ZA,TW,cplAhAhVZVZ(gt1,gt2))

 End Do 
End Do 


cplAhHmVPVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingAhHmVPVWmT(gt1,gt2,g1,g2,ZA,ZP,TW,cplAhHmVPVWm(gt1,gt2))

 End Do 
End Do 


cplAhHmVWmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingAhHmVWmVZT(gt1,gt2,g1,g2,ZA,ZP,TW,cplAhHmVWmVZ(gt1,gt2))

 End Do 
End Do 


cplAhcHmcVWmVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingAhcHmcVWmVPT(gt1,gt2,g1,g2,ZA,ZP,TW,cplAhcHmcVWmVP(gt1,gt2))

 End Do 
End Do 


cplAhcHmcVWmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingAhcHmcVWmVZT(gt1,gt2,g1,g2,ZA,ZP,TW,cplAhcHmcVWmVZ(gt1,gt2))

 End Do 
End Do 


cplhhhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWmVWmT(gt1,gt2,g2,ZH,cplhhhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZT(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplhhHmVPVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhHmVPVWmT(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhHmVPVWm(gt1,gt2))

 End Do 
End Do 


cplhhHmVWmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhHmVWmVZT(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhHmVWmVZ(gt1,gt2))

 End Do 
End Do 


cplhhcHmcVWmVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWmVPT(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhcHmcVWmVP(gt1,gt2))

 End Do 
End Do 


cplhhcHmcVWmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWmVZT(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhcHmcVWmVZ(gt1,gt2))

 End Do 
End Do 


cplHmcHmVPVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPVPT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVP(gt1,gt2))

 End Do 
End Do 


cplHmcHmVPVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVZ(gt1,gt2))

 End Do 
End Do 


cplHmcHmcVWmVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmcVWmVWmT(gt1,gt2,g2,ZP,cplHmcHmcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZVZ(gt1,gt2))

 End Do 
End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWmVPVWm = 0._dp 
Call CouplingcVWmVPVWmT(g2,TW,cplcVWmVPVWm)



cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZT(g2,TW,cplcVWmVWmVZ)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,epsD,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,epsE,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)         & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuAhT(gt1,gt2,gt3,epsU,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,epsD,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdHmL = 0._dp 
cplcFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdHmT(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdHmL(gt1,gt2,gt3)& 
& ,cplcFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFeHmL = 0._dp 
cplFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHmT(gt1,gt2,gt3,Ye,epsE,Yh,ZP,UV,ZEL,ZER,cplFvFeHmL(gt1,gt2,gt3)     & 
& ,cplFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,epsE,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucHmL = 0._dp 
cplcFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFucHmT(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFucHmL(gt1,gt2,gt3)& 
& ,cplcFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHmL = 0._dp 
cplcFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcHmT(gt1,gt2,gt3,Ye,epsE,Yh,ZP,UV,ZEL,ZER,cplcFeFvcHmL(gt1,gt2,gt3) & 
& ,cplcFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZT(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWmT(gt1,gt2,g2,UV,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


cplVGVGVGVG1 = 0._dp 
cplVGVGVGVG2 = 0._dp 
cplVGVGVGVG3 = 0._dp 
Call CouplingVGVGVGVGT(g3,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3)



cplcVWmVPVPVWm1 = 0._dp 
cplcVWmVPVPVWm2 = 0._dp 
cplcVWmVPVPVWm3 = 0._dp 
Call CouplingcVWmVPVPVWmT(g2,TW,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3)



cplcVWmVPVWmVZ1 = 0._dp 
cplcVWmVPVWmVZ2 = 0._dp 
cplcVWmVPVWmVZ3 = 0._dp 
Call CouplingcVWmVPVWmVZT(g2,TW,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3)



cplcVWmcVWmVWmVWm1 = 0._dp 
cplcVWmcVWmVWmVWm2 = 0._dp 
cplcVWmcVWmVWmVWm3 = 0._dp 
Call CouplingcVWmcVWmVWmVWmT(g2,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)



cplcVWmVWmVZVZ1 = 0._dp 
cplcVWmVWmVZVZ2 = 0._dp 
cplcVWmVWmVZVZ3 = 0._dp 
Call CouplingcVWmVWmVZVZT(g2,TW,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3)



cplcgGgGVG = 0._dp 
Call CouplingcgGgGVGT(g3,cplcgGgGVG)



cplcgWmgAVWm = 0._dp 
Call CouplingcgWmgAVWmT(g2,TW,cplcgWmgAVWm)



cplcgWpCgAcVWm = 0._dp 
Call CouplingcgWpCgAcVWmT(g2,TW,cplcgWpCgAcVWm)



cplcgWmgWmVP = 0._dp 
Call CouplingcgWmgWmVPT(g2,TW,cplcgWmgWmVP)



cplcgWmgWmVZ = 0._dp 
Call CouplingcgWmgWmVZT(g2,TW,cplcgWmgWmVZ)



cplcgAgWmcVWm = 0._dp 
Call CouplingcgAgWmcVWmT(g2,TW,cplcgAgWmcVWm)



cplcgZgWmcVWm = 0._dp 
Call CouplingcgZgWmcVWmT(g2,TW,cplcgZgWmcVWm)



cplcgWpCgWpCVP = 0._dp 
Call CouplingcgWpCgWpCVPT(g2,TW,cplcgWpCgWpCVP)



cplcgAgWpCVWm = 0._dp 
Call CouplingcgAgWpCVWmT(g2,TW,cplcgAgWpCVWm)



cplcgZgWpCVWm = 0._dp 
Call CouplingcgZgWpCVWmT(g2,TW,cplcgZgWpCVWm)



cplcgWpCgWpCVZ = 0._dp 
Call CouplingcgWpCgWpCVZT(g2,TW,cplcgWpCgWpCVZ)



cplcgWmgZVWm = 0._dp 
Call CouplingcgWmgZVWmT(g2,TW,cplcgWmgZVWm)



cplcgWpCgZcVWm = 0._dp 
Call CouplingcgWpCgZcVWmT(g2,TW,cplcgWpCgZcVWm)



cplcgWmgWmAh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgWmAhT(gt3,g2,vd,vu,ZA,cplcgWmgWmAh(gt3))

End Do 


cplcgWpCgWpCAh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgWpCAhT(gt3,g2,vd,vu,ZA,cplcgWpCgWpCAh(gt3))

End Do 


cplcgZgAhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgAhhT(gt3,g1,g2,vd,vu,ZH,TW,cplcgZgAhh(gt3))

End Do 


cplcgWpCgAHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgWpCgAHmT(gt3,g1,g2,vd,vu,ZP,TW,cplcgWpCgAHm(gt3))

End Do 


cplcgWmgAcHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgWmgAcHmT(gt3,g1,g2,vd,vu,ZP,TW,cplcgWmgAcHm(gt3))

End Do 


cplcgWmgWmhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgWmhhT(gt3,g2,vd,vu,ZH,cplcgWmgWmhh(gt3))

End Do 


cplcgZgWmHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgZgWmHmT(gt3,g1,g2,vd,vu,ZP,TW,cplcgZgWmHm(gt3))

End Do 


cplcgWpCgWpChh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgWpChhT(gt3,g2,vd,vu,ZH,cplcgWpCgWpChh(gt3))

End Do 


cplcgZgWpCcHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgZgWpCcHmT(gt3,g1,g2,vd,vu,ZP,TW,cplcgZgWpCcHm(gt3))

End Do 


cplcgZgZhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZhhT(gt3,g1,g2,vd,vu,ZH,TW,cplcgZgZhh(gt3))

End Do 


cplcgWpCgZHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgWpCgZHmT(gt3,g1,g2,vd,vu,ZP,TW,cplcgWpCgZHm(gt3))

End Do 


cplcgWmgZcHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgWmgZcHmT(gt3,g1,g2,vd,vu,ZP,TW,cplcgWmgZcHm(gt3))

End Do 


Iname = Iname - 1 
End Subroutine AllCouplingsReallyAll

Subroutine AllCouplings(Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,vu,ZH,ZA,               & 
& Mu,ZP,Lam10,Lam8,Lam9,g1,g2,TW,g3,Yd,epsD,ZDL,ZDR,Ye,epsE,ZEL,ZER,epsU,Yu,             & 
& ZUL,ZUR,Yh,UV,cplAhAhhh,cplAhHmcHm,cplhhhhhh,cplhhHmcHm,cplAhhhVZ,cplAhHmVWm,          & 
& cplAhcHmcVWm,cplhhHmVWm,cplhhcHmcVWm,cplHmcHmVP,cplHmcHmVZ,cplhhcVWmVWm,               & 
& cplhhVZVZ,cplHmVPVWm,cplHmVWmVZ,cplcHmcVWmVP,cplcHmcVWmVZ,cplVGVGVG,cplcVWmVPVWm,      & 
& cplcVWmVWmVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,         & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvVWmL,cplcFeFvVWmR)

Implicit None 
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,vd,vu,ZH(2,2),ZA(2,2),Mu,Lam10,g1,g2,TW,g3

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,ZP(3,3),Lam8,Lam9,Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3),            & 
& Ye(3,3),epsE(3,3),ZEL(3,3),ZER(3,3),epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),               & 
& Yh(3,3),UV(3,3)

Complex(dp), Intent(out) :: cplAhAhhh(2,2,2),cplAhHmcHm(2,3,3),cplhhhhhh(2,2,2),cplhhHmcHm(2,3,3),cplAhhhVZ(2,2), & 
& cplAhHmVWm(2,3),cplAhcHmcVWm(2,3),cplhhHmVWm(2,3),cplhhcHmcVWm(2,3),cplHmcHmVP(3,3),   & 
& cplHmcHmVZ(3,3),cplhhcVWmVWm(2),cplhhVZVZ(2),cplHmVPVWm(3),cplHmVWmVZ(3),              & 
& cplcHmcVWmVP(3),cplcHmcVWmVZ(3),cplVGVGVG,cplcVWmVPVWm,cplcVWmVWmVZ,cplcFdFdAhL(3,3,2),& 
& cplcFdFdAhR(3,3,2),cplcFeFeAhL(3,3,2),cplcFeFeAhR(3,3,2),cplcFuFuAhL(3,3,2),           & 
& cplcFuFuAhR(3,3,2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),           & 
& cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFeFehhL(3,3,2),             & 
& cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFucHmL(3,3,3),          & 
& cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcFdFdVGL(3,3),          & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(3,3),cplFvFecVWmR(3,3),             & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVGL(3,3),  & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWmL(3,3),   & 
& cplcFeFvVWmR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplings'
 
cplAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhhhT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,               & 
& vu,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhHmcHmT(gt1,gt2,gt3,Mu,Lam5,Lam4,vd,vu,ZA,ZP,cplAhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,               & 
& vu,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHmcHmT(gt1,gt2,gt3,Mu,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,             & 
& Lam2,Lam8,Lam9,vd,vu,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZT(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhHmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingAhHmVWmT(gt1,gt2,g2,ZA,ZP,cplAhHmVWm(gt1,gt2))

 End Do 
End Do 


cplAhcHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingAhcHmcVWmT(gt1,gt2,g2,ZA,ZP,cplAhcHmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhHmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhHmVWmT(gt1,gt2,g2,ZH,ZP,cplhhHmVWm(gt1,gt2))

 End Do 
End Do 


cplhhcHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWmT(gt1,gt2,g2,ZH,ZP,cplhhcHmcVWm(gt1,gt2))

 End Do 
End Do 


cplHmcHmVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVP(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmT(gt1,g2,vd,vu,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,vd,vu,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHmVPVWm = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVPVWmT(gt1,g1,g2,vd,vu,ZP,TW,cplHmVPVWm(gt1))

End Do 


cplHmVWmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVWmVZT(gt1,g1,g2,vd,vu,ZP,TW,cplHmVWmVZ(gt1))

End Do 


cplcHmcVWmVP = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWmVPT(gt1,g1,g2,vd,vu,ZP,TW,cplcHmcVWmVP(gt1))

End Do 


cplcHmcVWmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWmVZT(gt1,g1,g2,vd,vu,ZP,TW,cplcHmcVWmVZ(gt1))

End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWmVPVWm = 0._dp 
Call CouplingcVWmVPVWmT(g2,TW,cplcVWmVPVWm)



cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZT(g2,TW,cplcVWmVWmVZ)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,epsD,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,epsE,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)         & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuAhT(gt1,gt2,gt3,epsU,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,epsD,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdHmL = 0._dp 
cplcFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdHmT(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdHmL(gt1,gt2,gt3)& 
& ,cplcFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFeHmL = 0._dp 
cplFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHmT(gt1,gt2,gt3,Ye,epsE,Yh,ZP,UV,ZEL,ZER,cplFvFeHmL(gt1,gt2,gt3)     & 
& ,cplFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,epsE,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucHmL = 0._dp 
cplcFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFucHmT(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFucHmL(gt1,gt2,gt3)& 
& ,cplcFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHmL = 0._dp 
cplcFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcHmT(gt1,gt2,gt3,Ye,epsE,Yh,ZP,UV,ZEL,ZER,cplcFeFvcHmL(gt1,gt2,gt3) & 
& ,cplcFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZT(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWmT(gt1,gt2,g2,UV,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine AllCouplings

Subroutine CouplingAhAhhhT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,            & 
& vd,vu,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,vd,vu,ZH(2,2),ZA(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*Lam1*vd*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)
res = res-(Lam6*vu*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))
res = res-(Lam6*vd*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,1))
res = res-(Lam5*vu*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,1))
res = res-(Lam6*vd*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,1))
res = res-(Lam5*vu*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,1))
res = res-(Lam3*vd*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res-(Lam4*vd*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res+Lam5*vd*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)
res = res-(Lam7*vu*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res-(Lam6*vd*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res-(Lam3*vu*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res-(Lam4*vu*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res+Lam5*vu*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)
res = res-(Lam5*vd*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,2))
res = res-(Lam7*vu*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,2))
res = res-(Lam5*vd*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,2))
res = res-(Lam7*vu*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,2))
res = res-(Lam7*vd*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))
res = res-2*Lam2*vu*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhT  
 
 
Subroutine CouplingAhHmcHmT(gt1,gt2,gt3,Mu,Lam5,Lam4,vd,vu,ZA,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Mu,Lam5,vd,vu,ZA(2,2)

Complex(dp), Intent(in) :: Lam4,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(Lam4*vu*Conjg(ZP(gt2,2))*ZA(gt1,1)*ZP(gt3,1))/2._dp
res = res-(Lam5*vu*Conjg(ZP(gt2,2))*ZA(gt1,1)*ZP(gt3,1))/2._dp
res = res-(Lam4*vd*Conjg(ZP(gt2,2))*ZA(gt1,2)*ZP(gt3,1))/2._dp
res = res+(Lam5*vd*Conjg(ZP(gt2,2))*ZA(gt1,2)*ZP(gt3,1))/2._dp
res = res-((Mu*Conjg(ZP(gt2,3))*ZA(gt1,2)*ZP(gt3,1))/sqrt(2._dp))
res = res-(Lam4*vu*Conjg(ZP(gt2,1))*ZA(gt1,1)*ZP(gt3,2))/2._dp
res = res+(Lam5*vu*Conjg(ZP(gt2,1))*ZA(gt1,1)*ZP(gt3,2))/2._dp
res = res+(Mu*Conjg(ZP(gt2,3))*ZA(gt1,1)*ZP(gt3,2))/sqrt(2._dp)
res = res+(Lam4*vd*Conjg(ZP(gt2,1))*ZA(gt1,2)*ZP(gt3,2))/2._dp
res = res-(Lam5*vd*Conjg(ZP(gt2,1))*ZA(gt1,2)*ZP(gt3,2))/2._dp
res = res-((Mu*Conjg(ZP(gt2,2))*ZA(gt1,1)*ZP(gt3,3))/sqrt(2._dp))
res = res+(Mu*Conjg(ZP(gt2,1))*ZA(gt1,2)*ZP(gt3,3))/sqrt(2._dp)
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcHmT  
 
 
Subroutine CouplinghhhhhhT(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,            & 
& vd,vu,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,vd,vu,ZH(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-6*Lam1*vd*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res-3*Lam6*vu*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res-3*Lam6*vd*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)
res = res-(Lam3*vu*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(Lam4*vu*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(Lam5*vu*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-3*Lam6*vd*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)
res = res-(Lam3*vu*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam4*vu*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam5*vu*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam3*vd*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam4*vd*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam5*vd*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-3*Lam7*vu*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)
res = res-3*Lam6*vd*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)
res = res-(Lam3*vu*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam4*vu*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam5*vu*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam3*vd*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam4*vd*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam5*vd*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-3*Lam7*vu*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)
res = res-(Lam3*vd*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(Lam4*vd*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(Lam5*vd*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-3*Lam7*vu*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)
res = res-3*Lam7*vd*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res-6*Lam2*vu*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhT  
 
 
Subroutine CouplinghhHmcHmT(gt1,gt2,gt3,Mu,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,            & 
& Lam3,Lam2,Lam8,Lam9,vd,vu,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Mu,Lam6,Lam5,Lam7,Lam10,vd,vu,ZH(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*Lam1*vd*Conjg(ZP(gt2,1))*ZH(gt1,1)*ZP(gt3,1)
res = res-(Lam6*vu*Conjg(ZP(gt2,1))*ZH(gt1,1)*ZP(gt3,1))
res = res-(Lam6*vd*Conjg(ZP(gt2,2))*ZH(gt1,1)*ZP(gt3,1))
res = res-(Lam4*vu*Conjg(ZP(gt2,2))*ZH(gt1,1)*ZP(gt3,1))/2._dp
res = res-(Lam5*vu*Conjg(ZP(gt2,2))*ZH(gt1,1)*ZP(gt3,1))/2._dp
res = res-(Lam6*vd*Conjg(ZP(gt2,1))*ZH(gt1,2)*ZP(gt3,1))
res = res-(Lam3*vu*Conjg(ZP(gt2,1))*ZH(gt1,2)*ZP(gt3,1))
res = res-(Lam4*vd*Conjg(ZP(gt2,2))*ZH(gt1,2)*ZP(gt3,1))/2._dp
res = res-(Lam5*vd*Conjg(ZP(gt2,2))*ZH(gt1,2)*ZP(gt3,1))/2._dp
res = res-(Lam7*vu*Conjg(ZP(gt2,2))*ZH(gt1,2)*ZP(gt3,1))
res = res-((Mu*Conjg(ZP(gt2,3))*ZH(gt1,2)*ZP(gt3,1))/sqrt(2._dp))
res = res-(Lam6*vd*Conjg(ZP(gt2,1))*ZH(gt1,1)*ZP(gt3,2))
res = res-(Lam4*vu*Conjg(ZP(gt2,1))*ZH(gt1,1)*ZP(gt3,2))/2._dp
res = res-(Lam5*vu*Conjg(ZP(gt2,1))*ZH(gt1,1)*ZP(gt3,2))/2._dp
res = res-(Lam3*vd*Conjg(ZP(gt2,2))*ZH(gt1,1)*ZP(gt3,2))
res = res-(Lam7*vu*Conjg(ZP(gt2,2))*ZH(gt1,1)*ZP(gt3,2))
res = res+(Mu*Conjg(ZP(gt2,3))*ZH(gt1,1)*ZP(gt3,2))/sqrt(2._dp)
res = res-(Lam4*vd*Conjg(ZP(gt2,1))*ZH(gt1,2)*ZP(gt3,2))/2._dp
res = res-(Lam5*vd*Conjg(ZP(gt2,1))*ZH(gt1,2)*ZP(gt3,2))/2._dp
res = res-(Lam7*vu*Conjg(ZP(gt2,1))*ZH(gt1,2)*ZP(gt3,2))
res = res-(Lam7*vd*Conjg(ZP(gt2,2))*ZH(gt1,2)*ZP(gt3,2))
res = res-2*Lam2*vu*Conjg(ZP(gt2,2))*ZH(gt1,2)*ZP(gt3,2)
res = res+(Mu*Conjg(ZP(gt2,2))*ZH(gt1,1)*ZP(gt3,3))/sqrt(2._dp)
res = res-(Lam8*vd*Conjg(ZP(gt2,3))*ZH(gt1,1)*ZP(gt3,3))
res = res-(Lam10*vu*Conjg(ZP(gt2,3))*ZH(gt1,1)*ZP(gt3,3))
res = res-((Mu*Conjg(ZP(gt2,1))*ZH(gt1,2)*ZP(gt3,3))/sqrt(2._dp))
res = res-(Lam10*vd*Conjg(ZP(gt2,3))*ZH(gt1,2)*ZP(gt3,3))
res = res-(Lam9*vu*Conjg(ZP(gt2,3))*ZH(gt1,2)*ZP(gt3,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcHmT  
 
 
Subroutine CouplingAhAhAhAhT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,           & 
& Lam2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,ZA(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-6*Lam1*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,1)
res = res-3*Lam6*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,1)
res = res-3*Lam6*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1)
res = res-(Lam3*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1))
res = res-(Lam4*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1))
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1))
res = res-3*Lam6*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1)
res = res-(Lam3*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1))
res = res-(Lam4*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1))
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1))
res = res-(Lam3*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1))
res = res-(Lam4*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1))
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1))
res = res-3*Lam7*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1)
res = res-3*Lam6*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2)
res = res-(Lam3*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2))
res = res-(Lam4*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2))
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2))
res = res-(Lam3*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2))
res = res-(Lam4*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2))
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2))
res = res-3*Lam7*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2)
res = res-(Lam3*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2))
res = res-(Lam4*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2))
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2))
res = res-3*Lam7*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2)
res = res-3*Lam7*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,2)
res = res-6*Lam2*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhT  
 
 
Subroutine CouplingAhAhhhhhT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,           & 
& Lam2,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,ZH(2,2),ZA(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*Lam1*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res-(Lam6*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,1))
res = res-(Lam6*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(Lam3*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(Lam4*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res+Lam5*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1)
res = res-(Lam6*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam7*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam6*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam7*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam3*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(Lam4*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res+Lam5*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2)
res = res-(Lam7*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(Lam7*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,2))
res = res-2*Lam2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhT  
 
 
Subroutine CouplingAhAhHmcHmT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,              & 
& Lam4,Lam3,Lam2,Lam8,Lam9,ZA,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam10,ZA(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*Lam1*Conjg(ZP(gt3,1))*ZA(gt1,1)*ZA(gt2,1)*ZP(gt4,1)
res = res-(Lam6*Conjg(ZP(gt3,2))*ZA(gt1,1)*ZA(gt2,1)*ZP(gt4,1))
res = res-(Lam6*Conjg(ZP(gt3,1))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,1))
res = res-(Lam4*Conjg(ZP(gt3,2))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,1))/2._dp
res = res-(Lam5*Conjg(ZP(gt3,2))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,1))/2._dp
res = res-(Lam6*Conjg(ZP(gt3,1))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,1))
res = res-(Lam4*Conjg(ZP(gt3,2))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,1))/2._dp
res = res-(Lam5*Conjg(ZP(gt3,2))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,1))/2._dp
res = res-(Lam3*Conjg(ZP(gt3,1))*ZA(gt1,2)*ZA(gt2,2)*ZP(gt4,1))
res = res-(Lam7*Conjg(ZP(gt3,2))*ZA(gt1,2)*ZA(gt2,2)*ZP(gt4,1))
res = res-(Lam6*Conjg(ZP(gt3,1))*ZA(gt1,1)*ZA(gt2,1)*ZP(gt4,2))
res = res-(Lam3*Conjg(ZP(gt3,2))*ZA(gt1,1)*ZA(gt2,1)*ZP(gt4,2))
res = res-(Lam4*Conjg(ZP(gt3,1))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Lam5*Conjg(ZP(gt3,1))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Lam7*Conjg(ZP(gt3,2))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,2))
res = res-(Lam4*Conjg(ZP(gt3,1))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,2))/2._dp
res = res-(Lam5*Conjg(ZP(gt3,1))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,2))/2._dp
res = res-(Lam7*Conjg(ZP(gt3,2))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,2))
res = res-(Lam7*Conjg(ZP(gt3,1))*ZA(gt1,2)*ZA(gt2,2)*ZP(gt4,2))
res = res-2*Lam2*Conjg(ZP(gt3,2))*ZA(gt1,2)*ZA(gt2,2)*ZP(gt4,2)
res = res-(Lam8*Conjg(ZP(gt3,3))*ZA(gt1,1)*ZA(gt2,1)*ZP(gt4,3))
res = res-(Lam10*Conjg(ZP(gt3,3))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,3))
res = res-(Lam10*Conjg(ZP(gt3,3))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,3))
res = res-(Lam9*Conjg(ZP(gt3,3))*ZA(gt1,2)*ZA(gt2,2)*ZP(gt4,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHmT  
 
 
Subroutine CouplingAhhhHmcHmT(gt1,gt2,gt3,gt4,Lam5,Lam4,ZH,ZA,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam5,ZH(2,2),ZA(2,2)

Complex(dp), Intent(in) :: Lam4,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Lam4*Conjg(ZP(gt3,2))*ZA(gt1,2)*ZH(gt2,1)*ZP(gt4,1))/2._dp
res = res+(Lam5*Conjg(ZP(gt3,2))*ZA(gt1,2)*ZH(gt2,1)*ZP(gt4,1))/2._dp
res = res+(Lam4*Conjg(ZP(gt3,2))*ZA(gt1,1)*ZH(gt2,2)*ZP(gt4,1))/2._dp
res = res-(Lam5*Conjg(ZP(gt3,2))*ZA(gt1,1)*ZH(gt2,2)*ZP(gt4,1))/2._dp
res = res+(Lam4*Conjg(ZP(gt3,1))*ZA(gt1,2)*ZH(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Lam5*Conjg(ZP(gt3,1))*ZA(gt1,2)*ZH(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Lam4*Conjg(ZP(gt3,1))*ZA(gt1,1)*ZH(gt2,2)*ZP(gt4,2))/2._dp
res = res+(Lam5*Conjg(ZP(gt3,1))*ZA(gt1,1)*ZH(gt2,2)*ZP(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhHmcHmT  
 
 
Subroutine CouplinghhhhhhhhT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,           & 
& Lam2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,ZH(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-6*Lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res-3*Lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res-3*Lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1)
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-3*Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1)
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1)
res = res-3*Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2)
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2)
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-3*Lam7*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2)
res = res-3*Lam7*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
res = res-6*Lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhT  
 
 
Subroutine CouplinghhhhHmcHmT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,              & 
& Lam4,Lam3,Lam2,Lam8,Lam9,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam10,ZH(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*Lam1*Conjg(ZP(gt3,1))*ZH(gt1,1)*ZH(gt2,1)*ZP(gt4,1)
res = res-(Lam6*Conjg(ZP(gt3,2))*ZH(gt1,1)*ZH(gt2,1)*ZP(gt4,1))
res = res-(Lam6*Conjg(ZP(gt3,1))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,1))
res = res-(Lam4*Conjg(ZP(gt3,2))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,1))/2._dp
res = res-(Lam5*Conjg(ZP(gt3,2))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,1))/2._dp
res = res-(Lam6*Conjg(ZP(gt3,1))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,1))
res = res-(Lam4*Conjg(ZP(gt3,2))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,1))/2._dp
res = res-(Lam5*Conjg(ZP(gt3,2))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,1))/2._dp
res = res-(Lam3*Conjg(ZP(gt3,1))*ZH(gt1,2)*ZH(gt2,2)*ZP(gt4,1))
res = res-(Lam7*Conjg(ZP(gt3,2))*ZH(gt1,2)*ZH(gt2,2)*ZP(gt4,1))
res = res-(Lam6*Conjg(ZP(gt3,1))*ZH(gt1,1)*ZH(gt2,1)*ZP(gt4,2))
res = res-(Lam3*Conjg(ZP(gt3,2))*ZH(gt1,1)*ZH(gt2,1)*ZP(gt4,2))
res = res-(Lam4*Conjg(ZP(gt3,1))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Lam5*Conjg(ZP(gt3,1))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,2))/2._dp
res = res-(Lam7*Conjg(ZP(gt3,2))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,2))
res = res-(Lam4*Conjg(ZP(gt3,1))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,2))/2._dp
res = res-(Lam5*Conjg(ZP(gt3,1))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,2))/2._dp
res = res-(Lam7*Conjg(ZP(gt3,2))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,2))
res = res-(Lam7*Conjg(ZP(gt3,1))*ZH(gt1,2)*ZH(gt2,2)*ZP(gt4,2))
res = res-2*Lam2*Conjg(ZP(gt3,2))*ZH(gt1,2)*ZH(gt2,2)*ZP(gt4,2)
res = res-(Lam8*Conjg(ZP(gt3,3))*ZH(gt1,1)*ZH(gt2,1)*ZP(gt4,3))
res = res-(Lam10*Conjg(ZP(gt3,3))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,3))
res = res-(Lam10*Conjg(ZP(gt3,3))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,3))
res = res-(Lam9*Conjg(ZP(gt3,3))*ZH(gt1,2)*ZH(gt2,2)*ZP(gt4,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHmcHmT  
 
 
Subroutine CouplingHmHmcHmcHmT(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,             & 
& Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam10

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmHmcHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-4*Lam1*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,1))*ZP(gt3,1)*ZP(gt4,1)
res = res-2*Lam6*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,1))*ZP(gt3,1)*ZP(gt4,1)
res = res-2*Lam6*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,2))*ZP(gt3,1)*ZP(gt4,1)
res = res-2*Lam5*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,2))*ZP(gt3,1)*ZP(gt4,1)
res = res-2*Lam6*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,1))*ZP(gt3,2)*ZP(gt4,1)
res = res-(Lam3*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,1))*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam4*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,1))*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam3*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,2))*ZP(gt3,2)*ZP(gt4,1))
res = res-(Lam4*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,2))*ZP(gt3,2)*ZP(gt4,1))
res = res-2*Lam7*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,2))*ZP(gt3,2)*ZP(gt4,1)
res = res-(Lam8*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,1))*ZP(gt3,3)*ZP(gt4,1))
res = res-(Lam10*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,2))*ZP(gt3,3)*ZP(gt4,1))
res = res-(Lam8*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,3))*ZP(gt3,3)*ZP(gt4,1))
res = res-(Lam10*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,3))*ZP(gt3,3)*ZP(gt4,1))
res = res-2*Lam6*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,1))*ZP(gt3,1)*ZP(gt4,2)
res = res-(Lam3*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,1))*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam4*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,1))*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam3*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,2))*ZP(gt3,1)*ZP(gt4,2))
res = res-(Lam4*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,2))*ZP(gt3,1)*ZP(gt4,2))
res = res-2*Lam7*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,2))*ZP(gt3,1)*ZP(gt4,2)
res = res-2*Lam5*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,1))*ZP(gt3,2)*ZP(gt4,2)
res = res-2*Lam7*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,1))*ZP(gt3,2)*ZP(gt4,2)
res = res-2*Lam7*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,2))*ZP(gt3,2)*ZP(gt4,2)
res = res-4*Lam2*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,2))*ZP(gt3,2)*ZP(gt4,2)
res = res-(Lam10*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,1))*ZP(gt3,3)*ZP(gt4,2))
res = res-(Lam9*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,2))*ZP(gt3,3)*ZP(gt4,2))
res = res-(Lam10*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,3))*ZP(gt3,3)*ZP(gt4,2))
res = res-(Lam9*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,3))*ZP(gt3,3)*ZP(gt4,2))
res = res-(Lam8*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,1))*ZP(gt3,1)*ZP(gt4,3))
res = res-(Lam10*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,2))*ZP(gt3,1)*ZP(gt4,3))
res = res-(Lam8*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,3))*ZP(gt3,1)*ZP(gt4,3))
res = res-(Lam10*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,3))*ZP(gt3,1)*ZP(gt4,3))
res = res-(Lam10*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,1))*ZP(gt3,2)*ZP(gt4,3))
res = res-(Lam9*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,2))*ZP(gt3,2)*ZP(gt4,3))
res = res-(Lam10*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,3))*ZP(gt3,2)*ZP(gt4,3))
res = res-(Lam9*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,3))*ZP(gt3,2)*ZP(gt4,3))
res = res-4*Lamh*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,3))*ZP(gt3,3)*ZP(gt4,3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmHmcHmcHmT  
 
 
Subroutine CouplingAhhhVZT(gt1,gt2,g1,g2,ZH,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2*Cos(TW)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(g1*Sin(TW)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZT  
 
 
Subroutine CouplingAhHmVWmT(gt1,gt2,g2,ZA,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Conjg(ZP(gt2,1))*ZA(gt1,1))/2._dp
res = res-(g2*Conjg(ZP(gt2,2))*ZA(gt1,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmVWmT  
 
 
Subroutine CouplingAhcHmcVWmT(gt1,gt2,g2,ZA,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZA(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*ZA(gt1,2)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmcVWmT  
 
 
Subroutine CouplinghhHmVWmT(gt1,gt2,g2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Conjg(ZP(gt2,1))*ZH(gt1,1))/2._dp
res = res-(g2*Conjg(ZP(gt2,2))*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmVWmT  
 
 
Subroutine CouplinghhcHmcVWmT(gt1,gt2,g2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g2*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmcVWmT  
 
 
Subroutine CouplingHmcHmVPT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*Conjg(ZP(gt1,1))*Cos(TW)*ZP(gt2,1))/2._dp
res = res+(g2*Conjg(ZP(gt1,1))*Sin(TW)*ZP(gt2,1))/2._dp
res = res+(g1*Conjg(ZP(gt1,2))*Cos(TW)*ZP(gt2,2))/2._dp
res = res+(g2*Conjg(ZP(gt1,2))*Sin(TW)*ZP(gt2,2))/2._dp
res = res+g1*Conjg(ZP(gt1,3))*Cos(TW)*ZP(gt2,3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPT  
 
 
Subroutine CouplingHmcHmVZT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Conjg(ZP(gt1,1))*Cos(TW)*ZP(gt2,1))/2._dp
res = res-(g1*Conjg(ZP(gt1,1))*Sin(TW)*ZP(gt2,1))/2._dp
res = res+(g2*Conjg(ZP(gt1,2))*Cos(TW)*ZP(gt2,2))/2._dp
res = res-(g1*Conjg(ZP(gt1,2))*Sin(TW)*ZP(gt2,2))/2._dp
res = res-(g1*Conjg(ZP(gt1,3))*Sin(TW)*ZP(gt2,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZT  
 
 
Subroutine CouplinghhcVWmVWmT(gt1,g2,vd,vu,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,vd,vu,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vd*ZH(gt1,1))/2._dp
res = res+(g2**2*vu*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWmVWmT  
 
 
Subroutine CouplinghhVZVZT(gt1,g1,g2,vd,vu,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vd*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*vd*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+(g1**2*vd*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(g2**2*vu*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res+g1*g2*vu*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+(g1**2*vu*Sin(TW)**2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZT  
 
 
Subroutine CouplingHmVPVWmT(gt1,g1,g2,vd,vu,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmVPVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*vd*Conjg(ZP(gt1,1))*Cos(TW))/2._dp
res = res+(g1*g2*vu*Conjg(ZP(gt1,2))*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmVPVWmT  
 
 
Subroutine CouplingHmVWmVZT(gt1,g1,g2,vd,vu,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*vd*Conjg(ZP(gt1,1))*Sin(TW))/2._dp
res = res-(g1*g2*vu*Conjg(ZP(gt1,2))*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmVWmVZT  
 
 
Subroutine CouplingcHmcVWmVPT(gt1,g1,g2,vd,vu,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res+(g1*g2*vu*Cos(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmcVWmVPT  
 
 
Subroutine CouplingcHmcVWmVZT(gt1,g1,g2,vd,vu,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(g1*g2*vu*Sin(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmcVWmVZT  
 
 
Subroutine CouplingAhAhcVWmVWmT(gt1,gt2,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g2**2*ZA(gt1,2)*ZA(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWmVWmT  
 
 
Subroutine CouplingAhAhVZVZT(gt1,gt2,g1,g2,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1)
res = res+(g1**2*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)**2*ZA(gt1,2)*ZA(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZA(gt1,2)*ZA(gt2,2)
res = res+(g1**2*Sin(TW)**2*ZA(gt1,2)*ZA(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZT  
 
 
Subroutine CouplingAhHmVPVWmT(gt1,gt2,g1,g2,ZA,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZA(2,2),TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmVPVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Conjg(ZP(gt2,1))*Cos(TW)*ZA(gt1,1))/2._dp
res = res+(g1*g2*Conjg(ZP(gt2,2))*Cos(TW)*ZA(gt1,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmVPVWmT  
 
 
Subroutine CouplingAhHmVWmVZT(gt1,gt2,g1,g2,ZA,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZA(2,2),TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Conjg(ZP(gt2,1))*Sin(TW)*ZA(gt1,1))/2._dp
res = res-(g1*g2*Conjg(ZP(gt2,2))*Sin(TW)*ZA(gt1,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmVWmVZT  
 
 
Subroutine CouplingAhcHmcVWmVPT(gt1,gt2,g1,g2,ZA,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZA(2,2),TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Cos(TW)*ZA(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g1*g2*Cos(TW)*ZA(gt1,2)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmcVWmVPT  
 
 
Subroutine CouplingAhcHmcVWmVZT(gt1,gt2,g1,g2,ZA,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZA(2,2),TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Sin(TW)*ZA(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g1*g2*Sin(TW)*ZA(gt1,2)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmcVWmVZT  
 
 
Subroutine CouplinghhhhcVWmVWmT(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWmVWmT  
 
 
Subroutine CouplinghhhhVZVZT(gt1,gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZT  
 
 
Subroutine CouplinghhHmVPVWmT(gt1,gt2,g1,g2,ZH,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmVPVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Conjg(ZP(gt2,1))*Cos(TW)*ZH(gt1,1))/2._dp
res = res+(g1*g2*Conjg(ZP(gt2,2))*Cos(TW)*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmVPVWmT  
 
 
Subroutine CouplinghhHmVWmVZT(gt1,gt2,g1,g2,ZH,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Conjg(ZP(gt2,1))*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(g1*g2*Conjg(ZP(gt2,2))*Sin(TW)*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmVWmVZT  
 
 
Subroutine CouplinghhcHmcVWmVPT(gt1,gt2,g1,g2,ZH,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g1*g2*Cos(TW)*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmcVWmVPT  
 
 
Subroutine CouplinghhcHmcVWmVZT(gt1,gt2,g1,g2,ZH,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Sin(TW)*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g1*g2*Sin(TW)*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmcVWmVZT  
 
 
Subroutine CouplingHmcHmVPVPT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*Conjg(ZP(gt1,1))*Cos(TW)**2*ZP(gt2,1))/2._dp
res = res+g1*g2*Conjg(ZP(gt1,1))*Cos(TW)*Sin(TW)*ZP(gt2,1)
res = res+(g2**2*Conjg(ZP(gt1,1))*Sin(TW)**2*ZP(gt2,1))/2._dp
res = res+(g1**2*Conjg(ZP(gt1,2))*Cos(TW)**2*ZP(gt2,2))/2._dp
res = res+g1*g2*Conjg(ZP(gt1,2))*Cos(TW)*Sin(TW)*ZP(gt2,2)
res = res+(g2**2*Conjg(ZP(gt1,2))*Sin(TW)**2*ZP(gt2,2))/2._dp
res = res+2*g1**2*Conjg(ZP(gt1,3))*Cos(TW)**2*ZP(gt2,3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVPT  
 
 
Subroutine CouplingHmcHmVPVZT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Conjg(ZP(gt1,1))*Cos(2._dp*(TW))*ZP(gt2,1))/2._dp
res = res-(g1**2*Conjg(ZP(gt1,1))*Sin(2._dp*(TW))*ZP(gt2,1))/4._dp
res = res+(g2**2*Conjg(ZP(gt1,1))*Sin(2._dp*(TW))*ZP(gt2,1))/4._dp
res = res+(g1*g2*Conjg(ZP(gt1,2))*Cos(2._dp*(TW))*ZP(gt2,2))/2._dp
res = res-(g1**2*Conjg(ZP(gt1,2))*Sin(2._dp*(TW))*ZP(gt2,2))/4._dp
res = res+(g2**2*Conjg(ZP(gt1,2))*Sin(2._dp*(TW))*ZP(gt2,2))/4._dp
res = res-(g1**2*Conjg(ZP(gt1,3))*Sin(2._dp*(TW))*ZP(gt2,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVZT  
 
 
Subroutine CouplingHmcHmcVWmVWmT(gt1,gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Conjg(ZP(gt1,1))*ZP(gt2,1))/2._dp
res = res+(g2**2*Conjg(ZP(gt1,2))*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmcVWmVWmT  
 
 
Subroutine CouplingHmcHmVZVZT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Conjg(ZP(gt1,1))*Cos(TW)**2*ZP(gt2,1))/2._dp
res = res-(g1*g2*Conjg(ZP(gt1,1))*Cos(TW)*Sin(TW)*ZP(gt2,1))
res = res+(g1**2*Conjg(ZP(gt1,1))*Sin(TW)**2*ZP(gt2,1))/2._dp
res = res+(g2**2*Conjg(ZP(gt1,2))*Cos(TW)**2*ZP(gt2,2))/2._dp
res = res-(g1*g2*Conjg(ZP(gt1,2))*Cos(TW)*Sin(TW)*ZP(gt2,2))
res = res+(g1**2*Conjg(ZP(gt1,2))*Sin(TW)**2*ZP(gt2,2))/2._dp
res = res+2*g1**2*Conjg(ZP(gt1,3))*Sin(TW)**2*ZP(gt2,3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZVZT  
 
 
Subroutine CouplingVGVGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGT  
 
 
Subroutine CouplingcVWmVPVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVWmT  
 
 
Subroutine CouplingcVWmVWmVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZT  
 
 
Subroutine CouplingcFdFdAhT(gt1,gt2,gt3,Yd,epsD,ZA,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAhT  
 
 
Subroutine CouplingcFeFeAhT(gt1,gt2,gt3,Ye,epsE,ZA,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epsE(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAhT  
 
 
Subroutine CouplingcFuFuAhT(gt1,gt2,gt3,epsU,Yu,ZA,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAhT  
 
 
Subroutine CouplingcFdFdhhT(gt1,gt2,gt3,Yd,epsD,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhhT  
 
 
Subroutine CouplingcFuFdHmT(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZDL,ZDR,ZUL,               & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),Yd(3,3),epsD(3,3),ZP(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Conjg(ZP(gt3,1))*epsU(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Conjg(ZP(gt3,2))*Yu(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*Conjg(ZP(gt3,1))*ZDR(gt2,j1)*ZUL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(epsD(j1,j2))*Conjg(ZP(gt3,2))*ZDR(gt2,j1)*ZUL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdHmT  
 
 
Subroutine CouplingFvFeHmT(gt1,gt2,gt3,Ye,epsE,Yh,ZP,UV,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),Yh(3,3),ZP(3,3),UV(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFeHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j2))*Conjg(UV(gt1,j1))*Conjg(ZP(gt3,3))*Yh(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZEL(gt2,j1))*Conjg(UV(gt1,j2))*Conjg(ZP(gt3,3))*Yh(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*Conjg(ZP(gt3,1))*ZER(gt2,j1)*UV(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(epsE(j1,j2))*Conjg(ZP(gt3,2))*ZER(gt2,j1)*UV(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFeHmT  
 
 
Subroutine CouplingcFeFehhT(gt1,gt2,gt3,Ye,epsE,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epsE(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehhT  
 
 
Subroutine CouplingcFuFuhhT(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhhT  
 
 
Subroutine CouplingcFdFucHmT(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZDL,ZDR,ZUL,              & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),Yd(3,3),epsD(3,3),ZP(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZP(gt3,1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsD(j1,j2)*ZP(gt3,2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHmT  
 
 
Subroutine CouplingcFeFvcHmT(gt1,gt2,gt3,Ye,epsE,Yh,ZP,UV,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),Yh(3,3),ZP(3,3),UV(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*Ye(j1,j2)*ZP(gt3,1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*epsE(j1,j2)*ZP(gt3,2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yh(j1,j2))*ZEL(gt1,j2)*UV(gt2,j1)*ZP(gt3,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yh(j1,j2))*ZEL(gt1,j1)*UV(gt2,j2)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHmT  
 
 
Subroutine CouplingcFdFdVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVGT  
 
 
Subroutine CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVPT  
 
 
Subroutine CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZT  
 
 
Subroutine CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcVWmT  
 
 
Subroutine CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: UV(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFecVWmT  
 
 
Subroutine CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+g1*Cos(TW)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVPT  
 
 
Subroutine CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZT  
 
 
Subroutine CouplingcFuFuVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVGT  
 
 
Subroutine CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVPT  
 
 
Subroutine CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFuVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFuVWmT  
 
 
Subroutine CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZT  
 
 
Subroutine CouplingFvFvVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Sin(TW))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZT  
 
 
Subroutine CouplingcFeFvVWmT(gt1,gt2,g2,UV,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: UV(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(UV(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvVWmT  
 
 
Subroutine CouplingVGVGVGVGT(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2
res2 = 0._dp 
res3 = 0._dp 
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGT  
 
 
Subroutine CouplingcVWmVPVPVWmT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVPVWm' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVPVWmT  
 
 
Subroutine CouplingcVWmVPVWmVZT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVWmVZ' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)*Sin(TW)
res2 = 0._dp 
res2 = res2-(g2**2*Sin(2._dp*(TW)))
res3 = 0._dp 
res3 = res3-(g2**2*Sin(2._dp*(TW)))
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVWmVZT  
 
 
Subroutine CouplingcVWmcVWmVWmVWmT(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmcVWmVWmVWm' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmcVWmVWmVWmT  
 
 
Subroutine CouplingcVWmVWmVZVZT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZVZT  
 
 
Subroutine CouplingcgGgGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgGgGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgGgGVGT  
 
 
Subroutine CouplingcgWmgAVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgAVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgAVWmT  
 
 
Subroutine CouplingcgWpCgAcVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgAcVWm' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgAcVWmT  
 
 
Subroutine CouplingcgWmgWmVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmVP' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmVPT  
 
 
Subroutine CouplingcgWmgWmVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmVZT  
 
 
Subroutine CouplingcgAgWmcVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWmcVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWmcVWmT  
 
 
Subroutine CouplingcgZgWmcVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWmcVWm' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWmcVWmT  
 
 
Subroutine CouplingcgWpCgWpCVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCVP' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCVPT  
 
 
Subroutine CouplingcgAgWpCVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWpCVWm' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWpCVWmT  
 
 
Subroutine CouplingcgZgWpCVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpCVWm' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpCVWmT  
 
 
Subroutine CouplingcgWpCgWpCVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCVZT  
 
 
Subroutine CouplingcgWmgZVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgZVWm' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgZVWmT  
 
 
Subroutine CouplingcgWpCgZcVWmT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZcVWm' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZcVWmT  
 
 
Subroutine CouplingcgWmgWmAhT(gt3,g2,vd,vu,ZA,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vd,vu,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmAh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*vd*RXiWm*ZA(gt3,1))/4._dp
res = res-(g2**2*vu*RXiWm*ZA(gt3,2))/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmAhT  
 
 
Subroutine CouplingcgWpCgWpCAhT(gt3,g2,vd,vu,ZA,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vd,vu,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCAh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vd*RXiWm*ZA(gt3,1))/4._dp
res = res+(g2**2*vu*RXiWm*ZA(gt3,2))/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCAhT  
 
 
Subroutine CouplingcgZgAhhT(gt3,g1,g2,vd,vu,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgAhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*vd*Cos(2._dp*(TW))*RXiZ*ZH(gt3,1))/4._dp
res = res+(g1**2*vd*RXiZ*Sin(2._dp*(TW))*ZH(gt3,1))/8._dp
res = res-(g2**2*vd*RXiZ*Sin(2._dp*(TW))*ZH(gt3,1))/8._dp
res = res+(g1*g2*vu*Cos(2._dp*(TW))*RXiZ*ZH(gt3,2))/4._dp
res = res+(g1**2*vu*RXiZ*Sin(2._dp*(TW))*ZH(gt3,2))/8._dp
res = res-(g2**2*vu*RXiZ*Sin(2._dp*(TW))*ZH(gt3,2))/8._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgAhhT  
 
 
Subroutine CouplingcgWpCgAHmT(gt3,g1,g2,vd,vu,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgAHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*vd*Conjg(ZP(gt3,1))*Cos(TW)*RXiWm)/4._dp
res = res-(g1*g2*vu*Conjg(ZP(gt3,2))*Cos(TW)*RXiWm)/4._dp
res = res-(g2**2*vd*Conjg(ZP(gt3,1))*RXiWm*Sin(TW))/4._dp
res = res-(g2**2*vu*Conjg(ZP(gt3,2))*RXiWm*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgAHmT  
 
 
Subroutine CouplingcgWmgAcHmT(gt3,g1,g2,vd,vu,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgAcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*vd*Cos(TW)*RXiWm*ZP(gt3,1))/4._dp
res = res-(g2**2*vd*RXiWm*Sin(TW)*ZP(gt3,1))/4._dp
res = res-(g1*g2*vu*Cos(TW)*RXiWm*ZP(gt3,2))/4._dp
res = res-(g2**2*vu*RXiWm*Sin(TW)*ZP(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgAcHmT  
 
 
Subroutine CouplingcgWmgWmhhT(gt3,g2,vd,vu,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vd,vu,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*vd*RXiWm*ZH(gt3,1))/4._dp
res = res-(g2**2*vu*RXiWm*ZH(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmhhT  
 
 
Subroutine CouplingcgZgWmHmT(gt3,g1,g2,vd,vu,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWmHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vd*Conjg(ZP(gt3,1))*Cos(TW)*RXiZ)/4._dp
res = res+(g2**2*vu*Conjg(ZP(gt3,2))*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*vd*Conjg(ZP(gt3,1))*RXiZ*Sin(TW))/4._dp
res = res+(g1*g2*vu*Conjg(ZP(gt3,2))*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWmHmT  
 
 
Subroutine CouplingcgWpCgWpChhT(gt3,g2,vd,vu,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vd,vu,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpChh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*vd*RXiWm*ZH(gt3,1))/4._dp
res = res-(g2**2*vu*RXiWm*ZH(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpChhT  
 
 
Subroutine CouplingcgZgWpCcHmT(gt3,g1,g2,vd,vu,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpCcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vd*Cos(TW)*RXiZ*ZP(gt3,1))/4._dp
res = res+(g1*g2*vd*RXiZ*Sin(TW)*ZP(gt3,1))/4._dp
res = res+(g2**2*vu*Cos(TW)*RXiZ*ZP(gt3,2))/4._dp
res = res+(g1*g2*vu*RXiZ*Sin(TW)*ZP(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpCcHmT  
 
 
Subroutine CouplingcgZgZhhT(gt3,g1,g2,vd,vu,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*vd*Cos(TW)**2*RXiZ*ZH(gt3,1))/4._dp
res = res-(g1*g2*vd*Cos(TW)*RXiZ*Sin(TW)*ZH(gt3,1))/2._dp
res = res-(g1**2*vd*RXiZ*Sin(TW)**2*ZH(gt3,1))/4._dp
res = res-(g2**2*vu*Cos(TW)**2*RXiZ*ZH(gt3,2))/4._dp
res = res-(g1*g2*vu*Cos(TW)*RXiZ*Sin(TW)*ZH(gt3,2))/2._dp
res = res-(g1**2*vu*RXiZ*Sin(TW)**2*ZH(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZhhT  
 
 
Subroutine CouplingcgWpCgZHmT(gt3,g1,g2,vd,vu,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*vd*Conjg(ZP(gt3,1))*Cos(TW)*RXiWm)/4._dp
res = res-(g2**2*vu*Conjg(ZP(gt3,2))*Cos(TW)*RXiWm)/4._dp
res = res+(g1*g2*vd*Conjg(ZP(gt3,1))*RXiWm*Sin(TW))/4._dp
res = res+(g1*g2*vu*Conjg(ZP(gt3,2))*RXiWm*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZHmT  
 
 
Subroutine CouplingcgWmgZcHmT(gt3,g1,g2,vd,vu,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgZcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*vd*Cos(TW)*RXiWm*ZP(gt3,1))/4._dp
res = res+(g1*g2*vd*RXiWm*Sin(TW)*ZP(gt3,1))/4._dp
res = res-(g2**2*vu*Cos(TW)*RXiWm*ZP(gt3,2))/4._dp
res = res+(g1*g2*vu*RXiWm*Sin(TW)*ZP(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgZcHmT  
 
 
Subroutine CouplingsForEffPot4(Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,ZA,ZH,              & 
& Lam10,Lam8,Lam9,ZP,Lamh,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHmcHm,cplhhhhhhhh,              & 
& cplhhhhHmcHm,cplHmHmcHmcHm)

Implicit None 
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,ZA(2,2),ZH(2,2),Lam10

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,ZP(3,3),Lamh

Complex(dp), Intent(out) :: cplAhAhAhAh(2,2,2,2),cplAhAhhhhh(2,2,2,2),cplAhAhHmcHm(2,2,3,3),cplhhhhhhhh(2,2,2,2), & 
& cplhhhhHmcHm(2,2,3,3),cplHmHmcHmcHm(3,3,3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot4'
 
cplAhAhAhAh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhAhAh2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& ZA,cplAhAhAhAh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhhhhh2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& ZH,ZA,cplAhAhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingAhAhHmcHm2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,              & 
& Lam3,Lam2,Lam8,Lam9,ZA,ZP,cplAhAhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call Couplinghhhhhhhh2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplinghhhhHmcHm2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,              & 
& Lam3,Lam2,Lam8,Lam9,ZH,ZP,cplhhhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplHmHmcHmcHm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingHmHmcHmcHm2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,             & 
& Lam3,Lam2,Lam8,Lam9,Lamh,ZP,cplHmHmcHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForEffPot4

Subroutine CouplingsForEffPot3(Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,vu,              & 
& ZH,ZA,Mu,ZP,Lam10,Lam8,Lam9,g3,Yd,epsD,ZDL,ZDR,Ye,epsE,ZEL,ZER,epsU,Yu,ZUL,            & 
& ZUR,Yh,UV,cplAhAhhh,cplAhHmcHm,cplhhhhhh,cplhhHmcHm,cplVGVGVG,cplcFdFdAhL,             & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Implicit None 
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,vd,vu,ZH(2,2),ZA(2,2),Mu,Lam10,g3

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,ZP(3,3),Lam8,Lam9,Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3),            & 
& Ye(3,3),epsE(3,3),ZEL(3,3),ZER(3,3),epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),               & 
& Yh(3,3),UV(3,3)

Complex(dp), Intent(out) :: cplAhAhhh(2,2,2),cplAhHmcHm(2,3,3),cplhhhhhh(2,2,2),cplhhHmcHm(2,3,3),cplVGVGVG,      & 
& cplcFdFdAhL(3,3,2),cplcFdFdAhR(3,3,2),cplcFeFeAhL(3,3,2),cplcFeFeAhR(3,3,2),           & 
& cplcFuFuAhL(3,3,2),cplcFuFuAhR(3,3,2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),           & 
& cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),             & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),       & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot3'
 
cplAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhhh2L(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,              & 
& vu,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhHmcHm2L(gt1,gt2,gt3,Mu,Lam5,Lam4,vd,vu,ZA,ZP,cplAhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call Couplinghhhhhh2L(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,              & 
& vu,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHmcHm2L(gt1,gt2,gt3,Mu,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,            & 
& Lam2,Lam8,Lam9,vd,vu,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVG2L(g3,cplVGVGVG)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdAh2L(gt1,gt2,gt3,Yd,epsD,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)        & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeAh2L(gt1,gt2,gt3,Ye,epsE,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)        & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuAh2L(gt1,gt2,gt3,epsU,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)        & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhh2L(gt1,gt2,gt3,Yd,epsD,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)        & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdHmL = 0._dp 
cplcFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdHm2L(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdHmL(gt1,gt2,gt3)& 
& ,cplcFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFeHmL = 0._dp 
cplFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHm2L(gt1,gt2,gt3,Ye,epsE,Yh,ZP,UV,ZEL,ZER,cplFvFeHmL(gt1,gt2,gt3)    & 
& ,cplFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehh2L(gt1,gt2,gt3,Ye,epsE,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)        & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhh2L(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)        & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucHmL = 0._dp 
cplcFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFucHm2L(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZDL,ZDR,ZUL,ZUR,               & 
& cplcFdFucHmL(gt1,gt2,gt3),cplcFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHmL = 0._dp 
cplcFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcHm2L(gt1,gt2,gt3,Ye,epsE,Yh,ZP,UV,ZEL,ZER,cplcFeFvcHmL(gt1,gt2,gt3)& 
& ,cplcFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVG2L(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVG2L(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForEffPot3

Subroutine CouplingAhAhAhAh2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,               & 
& Lam3,Lam2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,ZA(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-6*Lam1*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam6*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam6*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam6*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam7*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam6*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam7*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam7*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam7*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-6*Lam2*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAh2L  
 
 
Subroutine CouplingAhAhhhhh2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,               & 
& Lam3,Lam2,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,ZH(2,2),ZA(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-2*Lam1*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+Lam5*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+Lam5*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-2*Lam2*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhh2L  
 
 
Subroutine CouplingAhAhHmcHm2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,             & 
& Lam4,Lam3,Lam2,Lam8,Lam9,ZA,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam10,ZA(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-2*Lam1*Conjg(ZP(gt3,1))*ZA(gt1,1)*ZA(gt2,1)*ZP(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*Conjg(ZP(gt3,2))*ZA(gt1,1)*ZA(gt2,1)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*Conjg(ZP(gt3,1))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*Conjg(ZP(gt3,2))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*Conjg(ZP(gt3,2))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*Conjg(ZP(gt3,1))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*Conjg(ZP(gt3,2))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*Conjg(ZP(gt3,2))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*Conjg(ZP(gt3,1))*ZA(gt1,2)*ZA(gt2,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*Conjg(ZP(gt3,2))*ZA(gt1,2)*ZA(gt2,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*Conjg(ZP(gt3,1))*ZA(gt1,1)*ZA(gt2,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*Conjg(ZP(gt3,2))*ZA(gt1,1)*ZA(gt2,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*Conjg(ZP(gt3,1))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*Conjg(ZP(gt3,1))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*Conjg(ZP(gt3,2))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*Conjg(ZP(gt3,1))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*Conjg(ZP(gt3,1))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*Conjg(ZP(gt3,2))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*Conjg(ZP(gt3,1))*ZA(gt1,2)*ZA(gt2,2)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-2*Lam2*Conjg(ZP(gt3,2))*ZA(gt1,2)*ZA(gt2,2)*ZP(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam8*Conjg(ZP(gt3,3))*ZA(gt1,1)*ZA(gt2,1)*ZP(gt4,3))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam10*Conjg(ZP(gt3,3))*ZA(gt1,2)*ZA(gt2,1)*ZP(gt4,3))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam10*Conjg(ZP(gt3,3))*ZA(gt1,1)*ZA(gt2,2)*ZP(gt4,3))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam9*Conjg(ZP(gt3,3))*ZA(gt1,2)*ZA(gt2,2)*ZP(gt4,3))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHm2L  
 
 
Subroutine Couplinghhhhhhhh2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,               & 
& Lam3,Lam2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,ZH(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-6*Lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam7*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*Lam7*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-6*Lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhhh2L  
 
 
Subroutine CouplinghhhhHmcHm2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,             & 
& Lam4,Lam3,Lam2,Lam8,Lam9,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam10,ZH(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-2*Lam1*Conjg(ZP(gt3,1))*ZH(gt1,1)*ZH(gt2,1)*ZP(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*Conjg(ZP(gt3,2))*ZH(gt1,1)*ZH(gt2,1)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*Conjg(ZP(gt3,1))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*Conjg(ZP(gt3,2))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*Conjg(ZP(gt3,2))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*Conjg(ZP(gt3,1))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*Conjg(ZP(gt3,2))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*Conjg(ZP(gt3,2))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*Conjg(ZP(gt3,1))*ZH(gt1,2)*ZH(gt2,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*Conjg(ZP(gt3,2))*ZH(gt1,2)*ZH(gt2,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam6*Conjg(ZP(gt3,1))*ZH(gt1,1)*ZH(gt2,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam3*Conjg(ZP(gt3,2))*ZH(gt1,1)*ZH(gt2,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*Conjg(ZP(gt3,1))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*Conjg(ZP(gt3,1))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*Conjg(ZP(gt3,2))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam4*Conjg(ZP(gt3,1))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam5*Conjg(ZP(gt3,1))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*Conjg(ZP(gt3,2))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam7*Conjg(ZP(gt3,1))*ZH(gt1,2)*ZH(gt2,2)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-2*Lam2*Conjg(ZP(gt3,2))*ZH(gt1,2)*ZH(gt2,2)*ZP(gt4,2)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam8*Conjg(ZP(gt3,3))*ZH(gt1,1)*ZH(gt2,1)*ZP(gt4,3))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam10*Conjg(ZP(gt3,3))*ZH(gt1,2)*ZH(gt2,1)*ZP(gt4,3))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam10*Conjg(ZP(gt3,3))*ZH(gt1,1)*ZH(gt2,2)*ZP(gt4,3))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Lam9*Conjg(ZP(gt3,3))*ZH(gt1,2)*ZH(gt2,2)*ZP(gt4,3))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHmcHm2L  
 
 
Subroutine CouplingHmHmcHmcHm2L(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,            & 
& Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam10

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmHmcHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-4*Lam1*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,1))*ZP(gt3,1)*ZP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam6*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,1))*ZP(gt3,1)*ZP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam6*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,2))*ZP(gt3,1)*ZP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam5*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,2))*ZP(gt3,1)*ZP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam6*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,1))*ZP(gt3,2)*ZP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam3*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,1))*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam4*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,1))*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam3*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,2))*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam4*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,2))*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam7*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,2))*ZP(gt3,2)*ZP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam8*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,1))*ZP(gt3,3)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam10*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,2))*ZP(gt3,3)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam8*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,3))*ZP(gt3,3)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam10*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,3))*ZP(gt3,3)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam6*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,1))*ZP(gt3,1)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam3*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,1))*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam4*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,1))*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam3*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,2))*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam4*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,2))*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam7*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,2))*ZP(gt3,1)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam5*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,1))*ZP(gt3,2)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam7*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,1))*ZP(gt3,2)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Lam7*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,2))*ZP(gt3,2)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-4*Lam2*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,2))*ZP(gt3,2)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam10*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,1))*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam9*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,2))*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam10*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,3))*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam9*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,3))*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam8*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,1))*ZP(gt3,1)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam10*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,2))*ZP(gt3,1)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam8*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,3))*ZP(gt3,1)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam10*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,3))*ZP(gt3,1)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam10*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,1))*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam9*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,2))*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam10*Conjg(ZP(gt1,1))*Conjg(ZP(gt2,3))*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Lam9*Conjg(ZP(gt1,2))*Conjg(ZP(gt2,3))*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-4*Lamh*Conjg(ZP(gt1,3))*Conjg(ZP(gt2,3))*ZP(gt3,3)*ZP(gt4,3)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmHmcHmcHm2L  
 
 
Subroutine CouplingAhAhhh2L(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& vd,vu,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,vd,vu,ZH(2,2),ZA(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*Lam1*vd*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)
res = res-(Lam6*vu*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1))
res = res-(Lam6*vd*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,1))
res = res-(Lam5*vu*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,1))
res = res-(Lam6*vd*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,1))
res = res-(Lam5*vu*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,1))
res = res-(Lam3*vd*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res-(Lam4*vd*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res+Lam5*vd*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)
res = res-(Lam7*vu*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res-(Lam6*vd*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res-(Lam3*vu*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res-(Lam4*vu*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res+Lam5*vu*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)
res = res-(Lam5*vd*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,2))
res = res-(Lam7*vu*ZA(gt1,2)*ZA(gt2,1)*ZH(gt3,2))
res = res-(Lam5*vd*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,2))
res = res-(Lam7*vu*ZA(gt1,1)*ZA(gt2,2)*ZH(gt3,2))
res = res-(Lam7*vd*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2))
res = res-2*Lam2*vu*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhh2L  
 
 
Subroutine CouplingAhHmcHm2L(gt1,gt2,gt3,Mu,Lam5,Lam4,vd,vu,ZA,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Mu,Lam5,vd,vu,ZA(2,2)

Complex(dp), Intent(in) :: Lam4,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(Lam4*vu*Conjg(ZP(gt2,2))*ZA(gt1,1)*ZP(gt3,1))/2._dp
res = res-(Lam5*vu*Conjg(ZP(gt2,2))*ZA(gt1,1)*ZP(gt3,1))/2._dp
res = res-(Lam4*vd*Conjg(ZP(gt2,2))*ZA(gt1,2)*ZP(gt3,1))/2._dp
res = res+(Lam5*vd*Conjg(ZP(gt2,2))*ZA(gt1,2)*ZP(gt3,1))/2._dp
res = res-((Mu*Conjg(ZP(gt2,3))*ZA(gt1,2)*ZP(gt3,1))/sqrt(2._dp))
res = res-(Lam4*vu*Conjg(ZP(gt2,1))*ZA(gt1,1)*ZP(gt3,2))/2._dp
res = res+(Lam5*vu*Conjg(ZP(gt2,1))*ZA(gt1,1)*ZP(gt3,2))/2._dp
res = res+(Mu*Conjg(ZP(gt2,3))*ZA(gt1,1)*ZP(gt3,2))/sqrt(2._dp)
res = res+(Lam4*vd*Conjg(ZP(gt2,1))*ZA(gt1,2)*ZP(gt3,2))/2._dp
res = res-(Lam5*vd*Conjg(ZP(gt2,1))*ZA(gt1,2)*ZP(gt3,2))/2._dp
res = res-((Mu*Conjg(ZP(gt2,2))*ZA(gt1,1)*ZP(gt3,3))/sqrt(2._dp))
res = res+(Mu*Conjg(ZP(gt2,1))*ZA(gt1,2)*ZP(gt3,3))/sqrt(2._dp)
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcHm2L  
 
 
Subroutine Couplinghhhhhh2L(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& vd,vu,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,vd,vu,ZH(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-6*Lam1*vd*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res-3*Lam6*vu*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res-3*Lam6*vd*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)
res = res-(Lam3*vu*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(Lam4*vu*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(Lam5*vu*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-3*Lam6*vd*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)
res = res-(Lam3*vu*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam4*vu*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam5*vu*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam3*vd*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam4*vd*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(Lam5*vd*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-3*Lam7*vu*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)
res = res-3*Lam6*vd*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)
res = res-(Lam3*vu*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam4*vu*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam5*vu*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam3*vd*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam4*vd*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(Lam5*vd*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-3*Lam7*vu*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)
res = res-(Lam3*vd*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(Lam4*vd*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(Lam5*vd*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-3*Lam7*vu*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)
res = res-3*Lam7*vd*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res-6*Lam2*vu*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhh2L  
 
 
Subroutine CouplinghhHmcHm2L(gt1,gt2,gt3,Mu,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,           & 
& Lam3,Lam2,Lam8,Lam9,vd,vu,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Mu,Lam6,Lam5,Lam7,Lam10,vd,vu,ZH(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*Lam1*vd*Conjg(ZP(gt2,1))*ZH(gt1,1)*ZP(gt3,1)
res = res-(Lam6*vu*Conjg(ZP(gt2,1))*ZH(gt1,1)*ZP(gt3,1))
res = res-(Lam6*vd*Conjg(ZP(gt2,2))*ZH(gt1,1)*ZP(gt3,1))
res = res-(Lam4*vu*Conjg(ZP(gt2,2))*ZH(gt1,1)*ZP(gt3,1))/2._dp
res = res-(Lam5*vu*Conjg(ZP(gt2,2))*ZH(gt1,1)*ZP(gt3,1))/2._dp
res = res-(Lam6*vd*Conjg(ZP(gt2,1))*ZH(gt1,2)*ZP(gt3,1))
res = res-(Lam3*vu*Conjg(ZP(gt2,1))*ZH(gt1,2)*ZP(gt3,1))
res = res-(Lam4*vd*Conjg(ZP(gt2,2))*ZH(gt1,2)*ZP(gt3,1))/2._dp
res = res-(Lam5*vd*Conjg(ZP(gt2,2))*ZH(gt1,2)*ZP(gt3,1))/2._dp
res = res-(Lam7*vu*Conjg(ZP(gt2,2))*ZH(gt1,2)*ZP(gt3,1))
res = res-((Mu*Conjg(ZP(gt2,3))*ZH(gt1,2)*ZP(gt3,1))/sqrt(2._dp))
res = res-(Lam6*vd*Conjg(ZP(gt2,1))*ZH(gt1,1)*ZP(gt3,2))
res = res-(Lam4*vu*Conjg(ZP(gt2,1))*ZH(gt1,1)*ZP(gt3,2))/2._dp
res = res-(Lam5*vu*Conjg(ZP(gt2,1))*ZH(gt1,1)*ZP(gt3,2))/2._dp
res = res-(Lam3*vd*Conjg(ZP(gt2,2))*ZH(gt1,1)*ZP(gt3,2))
res = res-(Lam7*vu*Conjg(ZP(gt2,2))*ZH(gt1,1)*ZP(gt3,2))
res = res+(Mu*Conjg(ZP(gt2,3))*ZH(gt1,1)*ZP(gt3,2))/sqrt(2._dp)
res = res-(Lam4*vd*Conjg(ZP(gt2,1))*ZH(gt1,2)*ZP(gt3,2))/2._dp
res = res-(Lam5*vd*Conjg(ZP(gt2,1))*ZH(gt1,2)*ZP(gt3,2))/2._dp
res = res-(Lam7*vu*Conjg(ZP(gt2,1))*ZH(gt1,2)*ZP(gt3,2))
res = res-(Lam7*vd*Conjg(ZP(gt2,2))*ZH(gt1,2)*ZP(gt3,2))
res = res-2*Lam2*vu*Conjg(ZP(gt2,2))*ZH(gt1,2)*ZP(gt3,2)
res = res+(Mu*Conjg(ZP(gt2,2))*ZH(gt1,1)*ZP(gt3,3))/sqrt(2._dp)
res = res-(Lam8*vd*Conjg(ZP(gt2,3))*ZH(gt1,1)*ZP(gt3,3))
res = res-(Lam10*vu*Conjg(ZP(gt2,3))*ZH(gt1,1)*ZP(gt3,3))
res = res-((Mu*Conjg(ZP(gt2,1))*ZH(gt1,2)*ZP(gt3,3))/sqrt(2._dp))
res = res-(Lam10*vd*Conjg(ZP(gt2,3))*ZH(gt1,2)*ZP(gt3,3))
res = res-(Lam9*vu*Conjg(ZP(gt2,3))*ZH(gt1,2)*ZP(gt3,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcHm2L  
 
 
Subroutine CouplingVGVGVG2L(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVG2L  
 
 
Subroutine CouplingcFdFdAh2L(gt1,gt2,gt3,Yd,epsD,ZA,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAh2L  
 
 
Subroutine CouplingcFeFeAh2L(gt1,gt2,gt3,Ye,epsE,ZA,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epsE(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAh2L  
 
 
Subroutine CouplingcFuFuAh2L(gt1,gt2,gt3,epsU,Yu,ZA,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAh2L  
 
 
Subroutine CouplingcFdFdhh2L(gt1,gt2,gt3,Yd,epsD,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhh2L  
 
 
Subroutine CouplingcFuFdHm2L(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZDL,ZDR,ZUL,              & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),Yd(3,3),epsD(3,3),ZP(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Conjg(ZP(gt3,1))*epsU(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Conjg(ZP(gt3,2))*Yu(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*Conjg(ZP(gt3,1))*ZDR(gt2,j1)*ZUL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(epsD(j1,j2))*Conjg(ZP(gt3,2))*ZDR(gt2,j1)*ZUL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdHm2L  
 
 
Subroutine CouplingFvFeHm2L(gt1,gt2,gt3,Ye,epsE,Yh,ZP,UV,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),Yh(3,3),ZP(3,3),UV(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFeHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j2))*Conjg(UV(gt1,j1))*Conjg(ZP(gt3,3))*Yh(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZEL(gt2,j1))*Conjg(UV(gt1,j2))*Conjg(ZP(gt3,3))*Yh(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*Conjg(ZP(gt3,1))*ZER(gt2,j1)*UV(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(epsE(j1,j2))*Conjg(ZP(gt3,2))*ZER(gt2,j1)*UV(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFeHm2L  
 
 
Subroutine CouplingcFeFehh2L(gt1,gt2,gt3,Ye,epsE,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epsE(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehh2L  
 
 
Subroutine CouplingcFuFuhh2L(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhh2L  
 
 
Subroutine CouplingcFdFucHm2L(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZDL,ZDR,ZUL,             & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),Yd(3,3),epsD(3,3),ZP(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZP(gt3,1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsD(j1,j2)*ZP(gt3,2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHm2L  
 
 
Subroutine CouplingcFeFvcHm2L(gt1,gt2,gt3,Ye,epsE,Yh,ZP,UV,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),Yh(3,3),ZP(3,3),UV(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*Ye(j1,j2)*ZP(gt3,1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*epsE(j1,j2)*ZP(gt3,2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yh(j1,j2))*ZEL(gt1,j2)*UV(gt2,j1)*ZP(gt3,3))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yh(j1,j2))*ZEL(gt1,j1)*UV(gt2,j2)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHm2L  
 
 
Subroutine CouplingcFdFdVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVG2L  
 
 
Subroutine CouplingcFuFuVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVG2L  
 
 
Subroutine CouplingsForLoopMasses(Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,              & 
& vu,ZA,g1,g2,TW,Yd,epsD,ZDL,ZDR,Ye,epsE,ZEL,ZER,epsU,Yu,ZUL,ZUR,ZH,Mu,Lam10,            & 
& Lam8,Lam9,ZP,Yh,UV,Lamh,g3,cplAhAhUhh,cplAhUhhVZ,cplcFdFdUhhL,cplcFdFdUhhR,            & 
& cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,     & 
& cplcgZgZUhh,cplUhhhhhh,cplUhhHmcHm,cplUhhHmVWm,cplUhhcVWmVWm,cplUhhVZVZ,               & 
& cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,             & 
& cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,           & 
& cplcFuFuUAhR,cplcgWmgWmUAh,cplcgWpCgWpCUAh,cplUAhhhVZ,cplUAhHmcHm,cplUAhHmVWm,         & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHmcHm,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,             & 
& cplAhcUHmcVWm,cplAhHmcUHm,cplcFdFucUHmL,cplcFdFucUHmR,cplcFeFvcUHmL,cplcFeFvcUHmR,     & 
& cplcgZgWpCcUHm,cplcgWpCgZUHm,cplcgWmgZcUHm,cplcgZgWmUHm,cplhhcUHmcVWm,cplhhHmcUHm,     & 
& cplHmcUHmVP,cplHmcUHmVZ,cplcUHmcVWmVP,cplcUHmcVWmVZ,cplAhAhUHmcUHm,cplhhhhUHmcUHm,     & 
& cplUHmHmcUHmcHm,cplUHmcUHmVPVP,cplUHmcUHmcVWmVWm,cplUHmcUHmVZVZ,cplUFvFecVWmL,         & 
& cplUFvFecVWmR,cplUFvFeHmL,cplUFvFeHmR,cplUFvFvVZL,cplUFvFvVZR,cplcUFdFdAhL,            & 
& cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,         & 
& cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHmL,cplcUFdFucHmR,cplcUFdFuVWmL,      & 
& cplcUFdFuVWmR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFdHmL,    & 
& cplcUFuFdHmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,         & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,         & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvcHmL,        & 
& cplcUFeFvcHmR,cplcUFeFvVWmL,cplcUFeFvVWmR,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,    & 
& cplcgWpCgWpCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ,               & 
& cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,              & 
& cplAhcHmcVWm,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,     & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhcHmcVWm,cplhhcVWmVWm,cplcHmcVWmVP,     & 
& cplcVWmVPVWm,cplcHmcVWmVZ,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHmcHmcVWmVWm,               & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2, & 
& cplcVWmcVWmVWmVWm3)

Implicit None 
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,vd,vu,ZA(2,2),g1,g2,TW,ZH(2,2),Mu,Lam10,g3

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),epsE(3,3),            & 
& ZEL(3,3),ZER(3,3),epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),Lam8,Lam9,ZP(3,3),               & 
& Yh(3,3),UV(3,3),Lamh

Complex(dp), Intent(out) :: cplAhAhUhh(2,2,2),cplAhUhhVZ(2,2),cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),            & 
& cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),       & 
& cplcgWmgWmUhh(2),cplcgWpCgWpCUhh(2),cplcgZgZUhh(2),cplUhhhhhh(2,2,2),cplUhhHmcHm(2,3,3),& 
& cplUhhHmVWm(2,3),cplUhhcVWmVWm(2),cplUhhVZVZ(2),cplAhAhUhhUhh(2,2,2,2),cplUhhUhhhhhh(2,2,2,2),& 
& cplUhhUhhHmcHm(2,2,3,3),cplUhhUhhcVWmVWm(2,2),cplUhhUhhVZVZ(2,2),cplUAhAhhh(2,2,2),    & 
& cplcFdFdUAhL(3,3,2),cplcFdFdUAhR(3,3,2),cplcFeFeUAhL(3,3,2),cplcFeFeUAhR(3,3,2),       & 
& cplcFuFuUAhL(3,3,2),cplcFuFuUAhR(3,3,2),cplcgWmgWmUAh(2),cplcgWpCgWpCUAh(2),           & 
& cplUAhhhVZ(2,2),cplUAhHmcHm(2,3,3),cplUAhHmVWm(2,3),cplUAhUAhAhAh(2,2,2,2),            & 
& cplUAhUAhhhhh(2,2,2,2),cplUAhUAhHmcHm(2,2,3,3),cplUAhUAhcVWmVWm(2,2),cplUAhUAhVZVZ(2,2),& 
& cplAhcUHmcVWm(2,3),cplAhHmcUHm(2,3,3),cplcFdFucUHmL(3,3,3),cplcFdFucUHmR(3,3,3),       & 
& cplcFeFvcUHmL(3,3,3),cplcFeFvcUHmR(3,3,3),cplcgZgWpCcUHm(3),cplcgWpCgZUHm(3),          & 
& cplcgWmgZcUHm(3),cplcgZgWmUHm(3),cplhhcUHmcVWm(2,3),cplhhHmcUHm(2,3,3),cplHmcUHmVP(3,3),& 
& cplHmcUHmVZ(3,3),cplcUHmcVWmVP(3),cplcUHmcVWmVZ(3),cplAhAhUHmcUHm(2,2,3,3),            & 
& cplhhhhUHmcUHm(2,2,3,3),cplUHmHmcUHmcHm(3,3,3,3),cplUHmcUHmVPVP(3,3),cplUHmcUHmcVWmVWm(3,3),& 
& cplUHmcUHmVZVZ(3,3),cplUFvFecVWmL(3,3),cplUFvFecVWmR(3,3),cplUFvFeHmL(3,3,3),          & 
& cplUFvFeHmR(3,3,3),cplUFvFvVZL(3,3),cplUFvFvVZR(3,3),cplcUFdFdAhL(3,3,2),              & 
& cplcUFdFdAhR(3,3,2),cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),         & 
& cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),               & 
& cplcUFdFdVZR(3,3),cplcUFdFucHmL(3,3,3),cplcUFdFucHmR(3,3,3),cplcUFdFuVWmL(3,3),        & 
& cplcUFdFuVWmR(3,3),cplcUFuFuAhL(3,3,2),cplcUFuFuAhR(3,3,2),cplcUFuFdcVWmL(3,3),        & 
& cplcUFuFdcVWmR(3,3),cplcUFuFdHmL(3,3,3),cplcUFuFdHmR(3,3,3),cplcUFuFuhhL(3,3,2),       & 
& cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),             & 
& cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),cplcUFeFeAhL(3,3,2),             & 
& cplcUFeFeAhR(3,3,2),cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFeVPL(3,3),         & 
& cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHmL(3,3,3),            & 
& cplcUFeFvcHmR(3,3,3),cplcUFeFvVWmL(3,3),cplcUFeFvVWmR(3,3),cplAhhhVZ(2,2),             & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcgWmgWmVZ,cplcgWpCgWpCVZ,          & 
& cplhhVZVZ(2),cplHmcHmVZ(3,3),cplHmVWmVZ(3),cplcVWmVWmVZ,cplAhAhVZVZ(2,2),              & 
& cplhhhhVZVZ(2,2),cplHmcHmVZVZ(3,3),cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,    & 
& cplAhcHmcVWm(2,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(3,3),             & 
& cplFvFecVWmR(3,3),cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgZcVWm,           & 
& cplhhcHmcVWm(2,3),cplhhcVWmVWm(2),cplcHmcVWmVP(3),cplcVWmVPVWm,cplcHmcVWmVZ(3),        & 
& cplAhAhcVWmVWm(2,2),cplhhhhcVWmVWm(2,2),cplHmcHmcVWmVWm(3,3),cplcVWmVPVPVWm1,          & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForLoopMasses'
 
cplAhAhUhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhUhhL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,              & 
& vu,ZA,cplAhAhUhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhUhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVZL(gt1,gt2,g1,g2,ZA,TW,cplAhUhhVZ(gt1,gt2))

 End Do 
End Do 


cplcFdFdUhhL = 0._dp 
cplcFdFdUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdUhhL(gt1,gt2,gt3,Yd,epsD,ZDL,ZDR,cplcFdFdUhhL(gt1,gt2,gt3)          & 
& ,cplcFdFdUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUhhL = 0._dp 
cplcFeFeUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeUhhL(gt1,gt2,gt3,Ye,epsE,ZEL,ZER,cplcFeFeUhhL(gt1,gt2,gt3)          & 
& ,cplcFeFeUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUhhL = 0._dp 
cplcFuFuUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuUhhL(gt1,gt2,gt3,epsU,Yu,ZUL,ZUR,cplcFuFuUhhL(gt1,gt2,gt3)          & 
& ,cplcFuFuUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWmgWmUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgWmUhhL(gt3,g2,vd,vu,cplcgWmgWmUhh(gt3))

End Do 


cplcgWpCgWpCUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgWpCUhhL(gt3,g2,vd,vu,cplcgWpCgWpCUhh(gt3))

End Do 


cplcgZgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZUhhL(gt3,g1,g2,vd,vu,TW,cplcgZgZUhh(gt3))

End Do 


cplUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhhhhhL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,              & 
& vu,ZH,cplUhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingUhhHmcHmL(gt1,gt2,gt3,Mu,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,            & 
& Lam2,Lam8,Lam9,vd,vu,ZP,cplUhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingUhhHmVWmL(gt1,gt2,g2,ZP,cplUhhHmVWm(gt1,gt2))

 End Do 
End Do 


cplUhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhcVWmVWmL(gt1,g2,vd,vu,cplUhhcVWmVWm(gt1))

End Do 


cplUhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZL(gt1,g1,g2,vd,vu,TW,cplUhhVZVZ(gt1))

End Do 


cplAhAhUhhUhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhUhhUhhL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,ZA,cplAhAhUhhUhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,ZH,cplUhhUhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingUhhUhhHmcHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,             & 
& Lam3,Lam2,Lam8,Lam9,ZP,cplUhhUhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhcVWmVWmL(gt1,gt2,g2,cplUhhUhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,TW,cplUhhUhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplUAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUAhAhhhL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,              & 
& vu,ZH,ZA,cplUAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdUAhL = 0._dp 
cplcFdFdUAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdUAhL(gt1,gt2,gt3,Yd,epsD,ZDL,ZDR,cplcFdFdUAhL(gt1,gt2,gt3)          & 
& ,cplcFdFdUAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUAhL = 0._dp 
cplcFeFeUAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeUAhL(gt1,gt2,gt3,Ye,epsE,ZEL,ZER,cplcFeFeUAhL(gt1,gt2,gt3)          & 
& ,cplcFeFeUAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUAhL = 0._dp 
cplcFuFuUAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuUAhL(gt1,gt2,gt3,epsU,Yu,ZUL,ZUR,cplcFuFuUAhL(gt1,gt2,gt3)          & 
& ,cplcFuFuUAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWmgWmUAh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgWmUAhL(gt3,g2,vd,vu,cplcgWmgWmUAh(gt3))

End Do 


cplcgWpCgWpCUAh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgWpCUAhL(gt3,g2,vd,vu,cplcgWpCgWpCUAh(gt3))

End Do 


cplUAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhhhVZL(gt1,gt2,g1,g2,ZH,TW,cplUAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplUAhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingUAhHmcHmL(gt1,gt2,gt3,Mu,Lam5,Lam4,vd,vu,ZP,cplUAhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUAhHmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingUAhHmVWmL(gt1,gt2,g2,ZP,cplUAhHmVWm(gt1,gt2))

 End Do 
End Do 


cplUAhUAhAhAh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUAhUAhAhAhL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,ZA,cplUAhUAhAhAh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUAhUAhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUAhUAhhhhhL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,ZH,cplUAhUAhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUAhUAhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingUAhUAhHmcHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,             & 
& Lam3,Lam2,Lam8,Lam9,ZP,cplUAhUAhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUAhUAhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhUAhcVWmVWmL(gt1,gt2,g2,cplUAhUAhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplUAhUAhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhUAhVZVZL(gt1,gt2,g1,g2,TW,cplUAhUAhVZVZ(gt1,gt2))

 End Do 
End Do 


cplAhcUHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingAhcUHmcVWmL(gt1,gt2,g2,ZA,cplAhcUHmcVWm(gt1,gt2))

 End Do 
End Do 


cplAhHmcUHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingAhHmcUHmL(gt1,gt2,gt3,Mu,Lam5,Lam4,vd,vu,ZA,ZP,cplAhHmcUHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucUHmL = 0._dp 
cplcFdFucUHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFucUHmL(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZDL,ZDR,ZUL,ZUR,cplcFdFucUHmL(gt1,gt2,gt3)& 
& ,cplcFdFucUHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcUHmL = 0._dp 
cplcFeFvcUHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcUHmL(gt1,gt2,gt3,Ye,epsE,Yh,UV,ZEL,ZER,cplcFeFvcUHmL(gt1,gt2,gt3)  & 
& ,cplcFeFvcUHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgZgWpCcUHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgZgWpCcUHmL(gt3,g1,g2,vd,vu,TW,cplcgZgWpCcUHm(gt3))

End Do 


cplcgWpCgZUHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgWpCgZUHmL(gt3,g1,g2,vd,vu,TW,cplcgWpCgZUHm(gt3))

End Do 


cplcgWmgZcUHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgWmgZcUHmL(gt3,g1,g2,vd,vu,TW,cplcgWmgZcUHm(gt3))

End Do 


cplcgZgWmUHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgZgWmUHmL(gt3,g1,g2,vd,vu,TW,cplcgZgWmUHm(gt3))

End Do 


cplhhcUHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcUHmcVWmL(gt1,gt2,g2,ZH,cplhhcUHmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhHmcUHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHmcUHmL(gt1,gt2,gt3,Mu,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,            & 
& Lam2,Lam8,Lam9,vd,vu,ZH,ZP,cplhhHmcUHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHmcUHmVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcUHmVPL(gt1,gt2,g1,g2,ZP,TW,cplHmcUHmVP(gt1,gt2))

 End Do 
End Do 


cplHmcUHmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcUHmVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcUHmVZ(gt1,gt2))

 End Do 
End Do 


cplcUHmcVWmVP = 0._dp 
Do gt1 = 1, 3
Call CouplingcUHmcVWmVPL(gt1,g1,g2,vd,vu,TW,cplcUHmcVWmVP(gt1))

End Do 


cplcUHmcVWmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcUHmcVWmVZL(gt1,g1,g2,vd,vu,TW,cplcUHmcVWmVZ(gt1))

End Do 


cplAhAhUHmcUHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingAhAhUHmcUHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,             & 
& Lam3,Lam2,Lam8,Lam9,ZA,cplAhAhUHmcUHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhUHmcUHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplinghhhhUHmcUHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,             & 
& Lam3,Lam2,Lam8,Lam9,ZH,cplhhhhUHmcUHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUHmHmcUHmcHm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingUHmHmcUHmcHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,            & 
& Lam3,Lam2,Lam8,Lam9,Lamh,ZP,cplUHmHmcUHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUHmcUHmVPVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUHmcUHmVPVPL(gt1,gt2,g1,g2,TW,cplUHmcUHmVPVP(gt1,gt2))

 End Do 
End Do 


cplUHmcUHmcVWmVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUHmcUHmcVWmVWmL(gt1,gt2,g2,cplUHmcUHmcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplUHmcUHmVZVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUHmcUHmVZVZL(gt1,gt2,g1,g2,TW,cplUHmcUHmVZVZ(gt1,gt2))

 End Do 
End Do 


cplUFvFecVWmL = 0._dp 
cplUFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUFvFecVWmL(gt1,gt2,g2,ZEL,cplUFvFecVWmL(gt1,gt2),cplUFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplUFvFeHmL = 0._dp 
cplUFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingUFvFeHmL(gt1,gt2,gt3,Ye,epsE,Yh,ZP,ZEL,ZER,cplUFvFeHmL(gt1,gt2,gt3)      & 
& ,cplUFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUFvFvVZL = 0._dp 
cplUFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUFvFvVZL(gt1,gt2,g1,g2,UV,TW,cplUFvFvVZL(gt1,gt2),cplUFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdAhL(gt1,gt2,gt3,Yd,epsD,ZA,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdhhL(gt1,gt2,gt3,Yd,epsD,ZH,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2),cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVZL(gt1,gt2),cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucHmL = 0._dp 
cplcUFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcUFdFucHmL(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZUL,ZUR,cplcUFdFucHmL(gt1,gt2,gt3)& 
& ,cplcUFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFuVWmL = 0._dp 
cplcUFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFuVWmL(gt1,gt2,g2,ZUL,cplcUFdFuVWmL(gt1,gt2),cplcUFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuAhL(gt1,gt2,gt3,epsU,Yu,ZA,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFdcVWmL = 0._dp 
cplcUFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdcVWmL(gt1,gt2,g2,ZDL,cplcUFuFdcVWmL(gt1,gt2),cplcUFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdHmL = 0._dp 
cplcUFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcUFuFdHmL(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZDL,ZDR,cplcUFuFdHmL(gt1,gt2,gt3)& 
& ,cplcUFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuhhL(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2),cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVZL(gt1,gt2),cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFeAhL(gt1,gt2,gt3,Ye,epsE,ZA,ZEL,ZER,cplcUFeFeAhL(gt1,gt2,gt3)       & 
& ,cplcUFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFehhL(gt1,gt2,gt3,Ye,epsE,ZH,ZEL,ZER,cplcUFeFehhL(gt1,gt2,gt3)       & 
& ,cplcUFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2),cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVZL(gt1,gt2),cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcHmL = 0._dp 
cplcUFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcUFeFvcHmL(gt1,gt2,gt3,Ye,epsE,Yh,ZP,UV,cplcUFeFvcHmL(gt1,gt2,gt3)       & 
& ,cplcUFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFvVWmL = 0._dp 
cplcUFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvVWmL(gt1,gt2,g2,UV,cplcUFeFvVWmL(gt1,gt2),cplcUFeFvVWmR(gt1,gt2))

 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZL(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZL(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWmgWmVZ = 0._dp 
Call CouplingcgWmgWmVZL(g2,TW,cplcgWmgWmVZ)



cplcgWpCgWpCVZ = 0._dp 
Call CouplingcgWpCgWpCVZL(g2,TW,cplcgWpCgWpCVZ)



cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZL(gt1,g1,g2,vd,vu,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplHmVWmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVWmVZL(gt1,g1,g2,vd,vu,ZP,TW,cplHmVWmVZ(gt1))

End Do 


cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZL(g2,TW,cplcVWmVWmVZ)



cplAhAhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZL(gt1,gt2,g1,g2,ZA,TW,cplAhAhVZVZ(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZL(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZVZ(gt1,gt2))

 End Do 
End Do 


cplcVWmVWmVZVZ1 = 0._dp 
cplcVWmVWmVZVZ2 = 0._dp 
cplcVWmVWmVZVZ3 = 0._dp 
Call CouplingcVWmVWmVZVZL(g2,TW,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3)



cplAhcHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingAhcHmcVWmL(gt1,gt2,g2,ZA,ZP,cplAhcHmcVWm(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmL(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFecVWmL(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcgWpCgAcVWm = 0._dp 
Call CouplingcgWpCgAcVWmL(g2,TW,cplcgWpCgAcVWm)



cplcgAgWmcVWm = 0._dp 
Call CouplingcgAgWmcVWmL(g2,TW,cplcgAgWmcVWm)



cplcgZgWmcVWm = 0._dp 
Call CouplingcgZgWmcVWmL(g2,TW,cplcgZgWmcVWm)



cplcgWpCgZcVWm = 0._dp 
Call CouplingcgWpCgZcVWmL(g2,TW,cplcgWpCgZcVWm)



cplhhcHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWmL(gt1,gt2,g2,ZH,ZP,cplhhcHmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmL(gt1,g2,vd,vu,ZH,cplhhcVWmVWm(gt1))

End Do 


cplcHmcVWmVP = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWmVPL(gt1,g1,g2,vd,vu,ZP,TW,cplcHmcVWmVP(gt1))

End Do 


cplcVWmVPVWm = 0._dp 
Call CouplingcVWmVPVWmL(g2,TW,cplcVWmVPVWm)



cplcHmcVWmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWmVZL(gt1,g1,g2,vd,vu,ZP,TW,cplcHmcVWmVZ(gt1))

End Do 


cplAhAhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhcVWmVWmL(gt1,gt2,g2,ZA,cplAhAhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplhhhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWmVWmL(gt1,gt2,g2,ZH,cplhhhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplHmcHmcVWmVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmcVWmVWmL(gt1,gt2,g2,ZP,cplHmcHmcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplcVWmVPVPVWm1 = 0._dp 
cplcVWmVPVPVWm2 = 0._dp 
cplcVWmVPVPVWm3 = 0._dp 
Call CouplingcVWmVPVPVWmL(g2,TW,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3)



cplcVWmcVWmVWmVWm1 = 0._dp 
cplcVWmcVWmVWmVWm2 = 0._dp 
cplcVWmcVWmVWmVWm3 = 0._dp 
Call CouplingcVWmcVWmVWmVWmL(g2,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)



Iname = Iname - 1 
End Subroutine CouplingsForLoopMasses

Subroutine CouplingAhAhUhhL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& vd,vu,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,vd,vu,ZA(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-2*Lam1*vd*ZA(gt1,1)*ZA(gt2,1)
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam6*vu*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam6*vd*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam3*vu*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam4*vu*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((2.eq.gt3)) Then 
res = res+Lam5*vu*ZA(gt1,1)*ZA(gt2,1)
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam6*vd*ZA(gt1,2)*ZA(gt2,1))
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam5*vu*ZA(gt1,2)*ZA(gt2,1))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam5*vd*ZA(gt1,2)*ZA(gt2,1))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam7*vu*ZA(gt1,2)*ZA(gt2,1))
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam6*vd*ZA(gt1,1)*ZA(gt2,2))
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam5*vu*ZA(gt1,1)*ZA(gt2,2))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam5*vd*ZA(gt1,1)*ZA(gt2,2))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam7*vu*ZA(gt1,1)*ZA(gt2,2))
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam3*vd*ZA(gt1,2)*ZA(gt2,2))
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam4*vd*ZA(gt1,2)*ZA(gt2,2))
End If 
If ((1.eq.gt3)) Then 
res = res+Lam5*vd*ZA(gt1,2)*ZA(gt2,2)
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam7*vu*ZA(gt1,2)*ZA(gt2,2))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam7*vd*ZA(gt1,2)*ZA(gt2,2))
End If 
If ((2.eq.gt3)) Then 
res = res-2*Lam2*vu*ZA(gt1,2)*ZA(gt2,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUhhL  
 
 
Subroutine CouplingAhUhhVZL(gt1,gt2,g1,g2,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res+(g2*Cos(TW)*ZA(gt1,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(g1*Sin(TW)*ZA(gt1,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(g2*Cos(TW)*ZA(gt1,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(g1*Sin(TW)*ZA(gt1,2))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhUhhVZL  
 
 
Subroutine CouplingcFdFdUhhL(gt1,gt2,gt3,Yd,epsD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdUhhL  
 
 
Subroutine CouplingcFeFeUhhL(gt1,gt2,gt3,Ye,epsE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epsE(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeUhhL  
 
 
Subroutine CouplingcFuFuUhhL(gt1,gt2,gt3,epsU,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuUhhL  
 
 
Subroutine CouplingcgWmgWmUhhL(gt3,g2,vd,vu,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vd,vu

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*vd*RXiWm)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*vu*RXiWm)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmUhhL  
 
 
Subroutine CouplingcgWpCgWpCUhhL(gt3,g2,vd,vu,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vd,vu

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*vd*RXiWm)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*vu*RXiWm)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCUhhL  
 
 
Subroutine CouplingcgZgZUhhL(gt3,g1,g2,vd,vu,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*vd*Cos(TW)**2*RXiZ)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*vu*Cos(TW)**2*RXiZ)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1*g2*vd*Cos(TW)*RXiZ*Sin(TW))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g1*g2*vu*Cos(TW)*RXiZ*Sin(TW))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1**2*vd*RXiZ*Sin(TW)**2)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g1**2*vu*RXiZ*Sin(TW)**2)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZUhhL  
 
 
Subroutine CouplingUhhhhhhL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& vd,vu,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,vd,vu,ZH(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-6*Lam1*vd*ZH(gt2,1)*ZH(gt3,1)
End If 
If ((1.eq.gt1)) Then 
res = res-3*Lam6*vu*ZH(gt2,1)*ZH(gt3,1)
End If 
If ((2.eq.gt1)) Then 
res = res-3*Lam6*vd*ZH(gt2,1)*ZH(gt3,1)
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam3*vu*ZH(gt2,1)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam4*vu*ZH(gt2,1)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam5*vu*ZH(gt2,1)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-3*Lam6*vd*ZH(gt2,2)*ZH(gt3,1)
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam3*vu*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam4*vu*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam5*vu*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam3*vd*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam4*vd*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam5*vd*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-3*Lam7*vu*ZH(gt2,2)*ZH(gt3,1)
End If 
If ((1.eq.gt1)) Then 
res = res-3*Lam6*vd*ZH(gt2,1)*ZH(gt3,2)
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam3*vu*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam4*vu*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam5*vu*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam3*vd*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam4*vd*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam5*vd*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-3*Lam7*vu*ZH(gt2,1)*ZH(gt3,2)
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam3*vd*ZH(gt2,2)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam4*vd*ZH(gt2,2)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam5*vd*ZH(gt2,2)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-3*Lam7*vu*ZH(gt2,2)*ZH(gt3,2)
End If 
If ((2.eq.gt1)) Then 
res = res-3*Lam7*vd*ZH(gt2,2)*ZH(gt3,2)
End If 
If ((2.eq.gt1)) Then 
res = res-6*Lam2*vu*ZH(gt2,2)*ZH(gt3,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhhhhhL  
 
 
Subroutine CouplingUhhHmcHmL(gt1,gt2,gt3,Mu,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,           & 
& Lam3,Lam2,Lam8,Lam9,vd,vu,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Mu,Lam6,Lam5,Lam7,Lam10,vd,vu

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-2*Lam1*vd*Conjg(ZP(gt2,1))*ZP(gt3,1)
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam6*vu*Conjg(ZP(gt2,1))*ZP(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam6*vd*Conjg(ZP(gt2,2))*ZP(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam4*vu*Conjg(ZP(gt2,2))*ZP(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam5*vu*Conjg(ZP(gt2,2))*ZP(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam6*vd*Conjg(ZP(gt2,1))*ZP(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam3*vu*Conjg(ZP(gt2,1))*ZP(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam4*vd*Conjg(ZP(gt2,2))*ZP(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam5*vd*Conjg(ZP(gt2,2))*ZP(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam7*vu*Conjg(ZP(gt2,2))*ZP(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-((Mu*Conjg(ZP(gt2,3))*ZP(gt3,1))/sqrt(2._dp))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam6*vd*Conjg(ZP(gt2,1))*ZP(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam4*vu*Conjg(ZP(gt2,1))*ZP(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam5*vu*Conjg(ZP(gt2,1))*ZP(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam3*vd*Conjg(ZP(gt2,2))*ZP(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam7*vu*Conjg(ZP(gt2,2))*ZP(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res+(Mu*Conjg(ZP(gt2,3))*ZP(gt3,2))/sqrt(2._dp)
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam4*vd*Conjg(ZP(gt2,1))*ZP(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam5*vd*Conjg(ZP(gt2,1))*ZP(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam7*vu*Conjg(ZP(gt2,1))*ZP(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam7*vd*Conjg(ZP(gt2,2))*ZP(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-2*Lam2*vu*Conjg(ZP(gt2,2))*ZP(gt3,2)
End If 
If ((1.eq.gt1)) Then 
res = res+(Mu*Conjg(ZP(gt2,2))*ZP(gt3,3))/sqrt(2._dp)
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam8*vd*Conjg(ZP(gt2,3))*ZP(gt3,3))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam10*vu*Conjg(ZP(gt2,3))*ZP(gt3,3))
End If 
If ((2.eq.gt1)) Then 
res = res-((Mu*Conjg(ZP(gt2,1))*ZP(gt3,3))/sqrt(2._dp))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam10*vd*Conjg(ZP(gt2,3))*ZP(gt3,3))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam9*vu*Conjg(ZP(gt2,3))*ZP(gt3,3))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhHmcHmL  
 
 
Subroutine CouplingUhhHmVWmL(gt1,gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhHmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-(g2*Conjg(ZP(gt2,1)))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(g2*Conjg(ZP(gt2,2)))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhHmVWmL  
 
 
Subroutine CouplingUhhcVWmVWmL(gt1,g2,vd,vu,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,vd,vu

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2**2*vd)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g2**2*vu)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhcVWmVWmL  
 
 
Subroutine CouplingUhhVZVZL(gt1,g1,g2,vd,vu,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2**2*vd*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g2**2*vu*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+g1*g2*vd*Cos(TW)*Sin(TW)
End If 
If ((2.eq.gt1)) Then 
res = res+g1*g2*vu*Cos(TW)*Sin(TW)
End If 
If ((1.eq.gt1)) Then 
res = res+(g1**2*vd*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g1**2*vu*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVZVZL  
 
 
Subroutine CouplingAhAhUhhUhhL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,              & 
& Lam3,Lam2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,ZA(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUhhUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-2*Lam1*ZA(gt1,1)*ZA(gt2,1)
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam6*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam6*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam3*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam4*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res+Lam5*ZA(gt1,1)*ZA(gt2,1)
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam6*ZA(gt1,2)*ZA(gt2,1))
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,1))
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,1))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam7*ZA(gt1,2)*ZA(gt2,1))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam6*ZA(gt1,1)*ZA(gt2,2))
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,2))
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,2))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam7*ZA(gt1,1)*ZA(gt2,2))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam3*ZA(gt1,2)*ZA(gt2,2))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam4*ZA(gt1,2)*ZA(gt2,2))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res+Lam5*ZA(gt1,2)*ZA(gt2,2)
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam7*ZA(gt1,2)*ZA(gt2,2))
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam7*ZA(gt1,2)*ZA(gt2,2))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-2*Lam2*ZA(gt1,2)*ZA(gt2,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUhhUhhL  
 
 
Subroutine CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,              & 
& Lam3,Lam2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,ZH(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-6*Lam1*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-3*Lam6*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-3*Lam6*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam3*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-3*Lam6*ZH(gt3,2)*ZH(gt4,1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam3*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam4*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam5*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam3*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-3*Lam7*ZH(gt3,2)*ZH(gt4,1)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-3*Lam6*ZH(gt3,1)*ZH(gt4,2)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam3*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam4*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam5*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam3*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-3*Lam7*ZH(gt3,1)*ZH(gt4,2)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam3*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam4*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam5*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-3*Lam7*ZH(gt3,2)*ZH(gt4,2)
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-3*Lam7*ZH(gt3,2)*ZH(gt4,2)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-6*Lam2*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhhhhhL  
 
 
Subroutine CouplingUhhUhhHmcHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,            & 
& Lam4,Lam3,Lam2,Lam8,Lam9,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam10

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-2*Lam1*Conjg(ZP(gt3,1))*ZP(gt4,1)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam6*Conjg(ZP(gt3,2))*ZP(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam6*Conjg(ZP(gt3,1))*ZP(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam4*Conjg(ZP(gt3,2))*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam5*Conjg(ZP(gt3,2))*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam6*Conjg(ZP(gt3,1))*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*Conjg(ZP(gt3,2))*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*Conjg(ZP(gt3,2))*ZP(gt4,1))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam3*Conjg(ZP(gt3,1))*ZP(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam7*Conjg(ZP(gt3,2))*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam6*Conjg(ZP(gt3,1))*ZP(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam3*Conjg(ZP(gt3,2))*ZP(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam4*Conjg(ZP(gt3,1))*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam5*Conjg(ZP(gt3,1))*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam7*Conjg(ZP(gt3,2))*ZP(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*Conjg(ZP(gt3,1))*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*Conjg(ZP(gt3,1))*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam7*Conjg(ZP(gt3,2))*ZP(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam7*Conjg(ZP(gt3,1))*ZP(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-2*Lam2*Conjg(ZP(gt3,2))*ZP(gt4,2)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam8*Conjg(ZP(gt3,3))*ZP(gt4,3))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam10*Conjg(ZP(gt3,3))*ZP(gt4,3))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam10*Conjg(ZP(gt3,3))*ZP(gt4,3))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam9*Conjg(ZP(gt3,3))*ZP(gt4,3))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhHmcHmL  
 
 
Subroutine CouplingUhhUhhcVWmVWmL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhcVWmVWmL  
 
 
Subroutine CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhVZVZL  
 
 
Subroutine CouplingUAhAhhhL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,           & 
& vd,vu,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,vd,vu,ZH(2,2),ZA(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-2*Lam1*vd*ZA(gt2,1)*ZH(gt3,1)
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam6*vu*ZA(gt2,1)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam6*vd*ZA(gt2,1)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam5*vu*ZA(gt2,1)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam6*vd*ZA(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam5*vu*ZA(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam3*vd*ZA(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam4*vd*ZA(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res+Lam5*vd*ZA(gt2,2)*ZH(gt3,1)
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam7*vu*ZA(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam6*vd*ZA(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam3*vu*ZA(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam4*vu*ZA(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res+Lam5*vu*ZA(gt2,1)*ZH(gt3,2)
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam5*vd*ZA(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam7*vu*ZA(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam5*vd*ZA(gt2,2)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam7*vu*ZA(gt2,2)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam7*vd*ZA(gt2,2)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-2*Lam2*vu*ZA(gt2,2)*ZH(gt3,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhAhhhL  
 
 
Subroutine CouplingcFdFdUAhL(gt1,gt2,gt3,Yd,epsD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdUAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdUAhL  
 
 
Subroutine CouplingcFeFeUAhL(gt1,gt2,gt3,Ye,epsE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeUAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epsE(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeUAhL  
 
 
Subroutine CouplingcFuFuUAhL(gt1,gt2,gt3,epsU,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuUAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuUAhL  
 
 
Subroutine CouplingcgWmgWmUAhL(gt3,g2,vd,vu,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vd,vu

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmUAh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*vd*RXiWm)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*vu*RXiWm)/4._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmUAhL  
 
 
Subroutine CouplingcgWpCgWpCUAhL(gt3,g2,vd,vu,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vd,vu

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCUAh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(g2**2*vd*RXiWm)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g2**2*vu*RXiWm)/4._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCUAhL  
 
 
Subroutine CouplingUAhhhVZL(gt1,gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2*Cos(TW)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(g1*Sin(TW)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g2*Cos(TW)*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g1*Sin(TW)*ZH(gt2,2))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhhhVZL  
 
 
Subroutine CouplingUAhHmcHmL(gt1,gt2,gt3,Mu,Lam5,Lam4,vd,vu,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Mu,Lam5,vd,vu

Complex(dp), Intent(in) :: Lam4,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(Lam4*vu*Conjg(ZP(gt2,2))*ZP(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam5*vu*Conjg(ZP(gt2,2))*ZP(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam4*vd*Conjg(ZP(gt2,2))*ZP(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(Lam5*vd*Conjg(ZP(gt2,2))*ZP(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-((Mu*Conjg(ZP(gt2,3))*ZP(gt3,1))/sqrt(2._dp))
End If 
If ((1.eq.gt1)) Then 
res = res-(Lam4*vu*Conjg(ZP(gt2,1))*ZP(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(Lam5*vu*Conjg(ZP(gt2,1))*ZP(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(Mu*Conjg(ZP(gt2,3))*ZP(gt3,2))/sqrt(2._dp)
End If 
If ((2.eq.gt1)) Then 
res = res+(Lam4*vd*Conjg(ZP(gt2,1))*ZP(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(Lam5*vd*Conjg(ZP(gt2,1))*ZP(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-((Mu*Conjg(ZP(gt2,2))*ZP(gt3,3))/sqrt(2._dp))
End If 
If ((2.eq.gt1)) Then 
res = res+(Mu*Conjg(ZP(gt2,1))*ZP(gt3,3))/sqrt(2._dp)
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhHmcHmL  
 
 
Subroutine CouplingUAhHmVWmL(gt1,gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhHmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-(g2*Conjg(ZP(gt2,1)))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(g2*Conjg(ZP(gt2,2)))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhHmVWmL  
 
 
Subroutine CouplingUAhUAhAhAhL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,              & 
& Lam3,Lam2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,ZA(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-6*Lam1*ZA(gt3,1)*ZA(gt4,1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-3*Lam6*ZA(gt3,1)*ZA(gt4,1)
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-3*Lam6*ZA(gt3,1)*ZA(gt4,1)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam3*ZA(gt3,1)*ZA(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*ZA(gt3,1)*ZA(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*ZA(gt3,1)*ZA(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-3*Lam6*ZA(gt3,2)*ZA(gt4,1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam3*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam4*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam5*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam3*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-3*Lam7*ZA(gt3,2)*ZA(gt4,1)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-3*Lam6*ZA(gt3,1)*ZA(gt4,2)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam3*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam4*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam5*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam3*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-3*Lam7*ZA(gt3,1)*ZA(gt4,2)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam3*ZA(gt3,2)*ZA(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam4*ZA(gt3,2)*ZA(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam5*ZA(gt3,2)*ZA(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-3*Lam7*ZA(gt3,2)*ZA(gt4,2)
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-3*Lam7*ZA(gt3,2)*ZA(gt4,2)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-6*Lam2*ZA(gt3,2)*ZA(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhAhAhL  
 
 
Subroutine CouplingUAhUAhhhhhL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,              & 
& Lam3,Lam2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,ZH(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-2*Lam1*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam6*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam6*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam3*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+Lam5*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam6*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam5*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam7*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam6*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam5*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam7*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam3*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam4*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+Lam5*ZH(gt3,2)*ZH(gt4,2)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam7*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam7*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-2*Lam2*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhhhhhL  
 
 
Subroutine CouplingUAhUAhHmcHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,            & 
& Lam4,Lam3,Lam2,Lam8,Lam9,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam10

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-2*Lam1*Conjg(ZP(gt3,1))*ZP(gt4,1)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam6*Conjg(ZP(gt3,2))*ZP(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam6*Conjg(ZP(gt3,1))*ZP(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam4*Conjg(ZP(gt3,2))*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam5*Conjg(ZP(gt3,2))*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam6*Conjg(ZP(gt3,1))*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*Conjg(ZP(gt3,2))*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*Conjg(ZP(gt3,2))*ZP(gt4,1))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam3*Conjg(ZP(gt3,1))*ZP(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam7*Conjg(ZP(gt3,2))*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam6*Conjg(ZP(gt3,1))*ZP(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam3*Conjg(ZP(gt3,2))*ZP(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam4*Conjg(ZP(gt3,1))*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam5*Conjg(ZP(gt3,1))*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam7*Conjg(ZP(gt3,2))*ZP(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam4*Conjg(ZP(gt3,1))*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam5*Conjg(ZP(gt3,1))*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam7*Conjg(ZP(gt3,2))*ZP(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam7*Conjg(ZP(gt3,1))*ZP(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-2*Lam2*Conjg(ZP(gt3,2))*ZP(gt4,2)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Lam8*Conjg(ZP(gt3,3))*ZP(gt4,3))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Lam10*Conjg(ZP(gt3,3))*ZP(gt4,3))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam10*Conjg(ZP(gt3,3))*ZP(gt4,3))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Lam9*Conjg(ZP(gt3,3))*ZP(gt4,3))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhHmcHmL  
 
 
Subroutine CouplingUAhUAhcVWmVWmL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhcVWmVWmL  
 
 
Subroutine CouplingUAhUAhVZVZL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhVZVZL  
 
 
Subroutine CouplingAhcUHmcVWmL(gt1,gt2,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcUHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-(g2*ZA(gt1,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(g2*ZA(gt1,2))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcUHmcVWmL  
 
 
Subroutine CouplingAhHmcUHmL(gt1,gt2,gt3,Mu,Lam5,Lam4,vd,vu,ZA,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Mu,Lam5,vd,vu,ZA(2,2)

Complex(dp), Intent(in) :: Lam4,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcUHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(Lam4*vu*Conjg(ZP(gt2,2))*ZA(gt1,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam5*vu*Conjg(ZP(gt2,2))*ZA(gt1,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam4*vu*Conjg(ZP(gt2,1))*ZA(gt1,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(Lam5*vu*Conjg(ZP(gt2,1))*ZA(gt1,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(Mu*Conjg(ZP(gt2,3))*ZA(gt1,1))/sqrt(2._dp)
End If 
If ((3.eq.gt3)) Then 
res = res-((Mu*Conjg(ZP(gt2,2))*ZA(gt1,1))/sqrt(2._dp))
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam4*vd*Conjg(ZP(gt2,2))*ZA(gt1,2))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(Lam5*vd*Conjg(ZP(gt2,2))*ZA(gt1,2))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-((Mu*Conjg(ZP(gt2,3))*ZA(gt1,2))/sqrt(2._dp))
End If 
If ((2.eq.gt3)) Then 
res = res+(Lam4*vd*Conjg(ZP(gt2,1))*ZA(gt1,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam5*vd*Conjg(ZP(gt2,1))*ZA(gt1,2))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res+(Mu*Conjg(ZP(gt2,1))*ZA(gt1,2))/sqrt(2._dp)
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcUHmL  
 
 
Subroutine CouplingcFdFucUHmL(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZDL,ZDR,ZUL,ZUR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucUHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsD(j1,j2))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucUHmL  
 
 
Subroutine CouplingcFeFvcUHmL(gt1,gt2,gt3,Ye,epsE,Yh,UV,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),Yh(3,3),UV(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcUHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*epsE(j1,j2))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*Ye(j1,j2))
End Do 
End Do 
End If 
resR = 0._dp 
If ((3.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yh(j1,j2))*ZEL(gt1,j2)*UV(gt2,j1))
End Do 
End Do 
End If 
If ((3.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yh(j1,j2))*ZEL(gt1,j1)*UV(gt2,j2)
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcUHmL  
 
 
Subroutine CouplingcgZgWpCcUHmL(gt3,g1,g2,vd,vu,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpCcUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(g2**2*vd*Cos(TW)*RXiZ)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g2**2*vu*Cos(TW)*RXiZ)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g2*vd*RXiZ*Sin(TW))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g1*g2*vu*RXiZ*Sin(TW))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpCcUHmL  
 
 
Subroutine CouplingcgWpCgZUHmL(gt3,g1,g2,vd,vu,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*vd*Cos(TW)*RXiWm)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*vu*Cos(TW)*RXiWm)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g2*vd*RXiWm*Sin(TW))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g1*g2*vu*RXiWm*Sin(TW))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZUHmL  
 
 
Subroutine CouplingcgWmgZcUHmL(gt3,g1,g2,vd,vu,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgZcUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*vd*Cos(TW)*RXiWm)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*vu*Cos(TW)*RXiWm)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g2*vd*RXiWm*Sin(TW))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g1*g2*vu*RXiWm*Sin(TW))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgZcUHmL  
 
 
Subroutine CouplingcgZgWmUHmL(gt3,g1,g2,vd,vu,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWmUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(g2**2*vd*Cos(TW)*RXiZ)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g2**2*vu*Cos(TW)*RXiZ)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g2*vd*RXiZ*Sin(TW))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g1*g2*vu*RXiZ*Sin(TW))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWmUHmL  
 
 
Subroutine CouplinghhcUHmcVWmL(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcUHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res+(g2*ZH(gt1,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(g2*ZH(gt1,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcUHmcVWmL  
 
 
Subroutine CouplinghhHmcUHmL(gt1,gt2,gt3,Mu,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,           & 
& Lam3,Lam2,Lam8,Lam9,vd,vu,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: Mu,Lam6,Lam5,Lam7,Lam10,vd,vu,ZH(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcUHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-2*Lam1*vd*Conjg(ZP(gt2,1))*ZH(gt1,1)
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam6*vu*Conjg(ZP(gt2,1))*ZH(gt1,1))
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam6*vd*Conjg(ZP(gt2,2))*ZH(gt1,1))
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam4*vu*Conjg(ZP(gt2,2))*ZH(gt1,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam5*vu*Conjg(ZP(gt2,2))*ZH(gt1,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam6*vd*Conjg(ZP(gt2,1))*ZH(gt1,1))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam4*vu*Conjg(ZP(gt2,1))*ZH(gt1,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam5*vu*Conjg(ZP(gt2,1))*ZH(gt1,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam3*vd*Conjg(ZP(gt2,2))*ZH(gt1,1))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam7*vu*Conjg(ZP(gt2,2))*ZH(gt1,1))
End If 
If ((2.eq.gt3)) Then 
res = res+(Mu*Conjg(ZP(gt2,3))*ZH(gt1,1))/sqrt(2._dp)
End If 
If ((3.eq.gt3)) Then 
res = res+(Mu*Conjg(ZP(gt2,2))*ZH(gt1,1))/sqrt(2._dp)
End If 
If ((3.eq.gt3)) Then 
res = res-(Lam8*vd*Conjg(ZP(gt2,3))*ZH(gt1,1))
End If 
If ((3.eq.gt3)) Then 
res = res-(Lam10*vu*Conjg(ZP(gt2,3))*ZH(gt1,1))
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam6*vd*Conjg(ZP(gt2,1))*ZH(gt1,2))
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam3*vu*Conjg(ZP(gt2,1))*ZH(gt1,2))
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam4*vd*Conjg(ZP(gt2,2))*ZH(gt1,2))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam5*vd*Conjg(ZP(gt2,2))*ZH(gt1,2))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(Lam7*vu*Conjg(ZP(gt2,2))*ZH(gt1,2))
End If 
If ((1.eq.gt3)) Then 
res = res-((Mu*Conjg(ZP(gt2,3))*ZH(gt1,2))/sqrt(2._dp))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam4*vd*Conjg(ZP(gt2,1))*ZH(gt1,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam5*vd*Conjg(ZP(gt2,1))*ZH(gt1,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam7*vu*Conjg(ZP(gt2,1))*ZH(gt1,2))
End If 
If ((2.eq.gt3)) Then 
res = res-(Lam7*vd*Conjg(ZP(gt2,2))*ZH(gt1,2))
End If 
If ((2.eq.gt3)) Then 
res = res-2*Lam2*vu*Conjg(ZP(gt2,2))*ZH(gt1,2)
End If 
If ((3.eq.gt3)) Then 
res = res-((Mu*Conjg(ZP(gt2,1))*ZH(gt1,2))/sqrt(2._dp))
End If 
If ((3.eq.gt3)) Then 
res = res-(Lam10*vd*Conjg(ZP(gt2,3))*ZH(gt1,2))
End If 
If ((3.eq.gt3)) Then 
res = res-(Lam9*vu*Conjg(ZP(gt2,3))*ZH(gt1,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcUHmL  
 
 
Subroutine CouplingHmcUHmVPL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcUHmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res+(g1*Conjg(ZP(gt1,1))*Cos(TW))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(g1*Conjg(ZP(gt1,2))*Cos(TW))/2._dp
End If 
If ((3.eq.gt2)) Then 
res = res+g1*Conjg(ZP(gt1,3))*Cos(TW)
End If 
If ((1.eq.gt2)) Then 
res = res+(g2*Conjg(ZP(gt1,1))*Sin(TW))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(g2*Conjg(ZP(gt1,2))*Sin(TW))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcUHmVPL  
 
 
Subroutine CouplingHmcUHmVZL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcUHmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res+(g2*Conjg(ZP(gt1,1))*Cos(TW))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(g2*Conjg(ZP(gt1,2))*Cos(TW))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(g1*Conjg(ZP(gt1,1))*Sin(TW))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(g1*Conjg(ZP(gt1,2))*Sin(TW))/2._dp
End If 
If ((3.eq.gt2)) Then 
res = res-(g1*Conjg(ZP(gt1,3))*Sin(TW))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcUHmVZL  
 
 
Subroutine CouplingcUHmcVWmVPL(gt1,g1,g2,vd,vu,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUHmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g1*g2*vd*Cos(TW))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g1*g2*vu*Cos(TW))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUHmcVWmVPL  
 
 
Subroutine CouplingcUHmcVWmVZL(gt1,g1,g2,vd,vu,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUHmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-(g1*g2*vd*Sin(TW))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(g1*g2*vu*Sin(TW))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUHmcVWmVZL  
 
 
Subroutine CouplingAhAhUHmcUHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,            & 
& Lam4,Lam3,Lam2,Lam8,Lam9,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam10,ZA(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUHmcUHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-2*Lam1*ZA(gt1,1)*ZA(gt2,1)
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam6*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam6*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam3*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(Lam8*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam6*ZA(gt1,2)*ZA(gt2,1))
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam4*ZA(gt1,2)*ZA(gt2,1))/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,1))/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam4*ZA(gt1,2)*ZA(gt2,1))/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,2)*ZA(gt2,1))/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam7*ZA(gt1,2)*ZA(gt2,1))
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(Lam10*ZA(gt1,2)*ZA(gt2,1))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam6*ZA(gt1,1)*ZA(gt2,2))
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam4*ZA(gt1,1)*ZA(gt2,2))/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,2))/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam4*ZA(gt1,1)*ZA(gt2,2))/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam5*ZA(gt1,1)*ZA(gt2,2))/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam7*ZA(gt1,1)*ZA(gt2,2))
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(Lam10*ZA(gt1,1)*ZA(gt2,2))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam3*ZA(gt1,2)*ZA(gt2,2))
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam7*ZA(gt1,2)*ZA(gt2,2))
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam7*ZA(gt1,2)*ZA(gt2,2))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-2*Lam2*ZA(gt1,2)*ZA(gt2,2)
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(Lam9*ZA(gt1,2)*ZA(gt2,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUHmcUHmL  
 
 
Subroutine CouplinghhhhUHmcUHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,            & 
& Lam4,Lam3,Lam2,Lam8,Lam9,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam10,ZH(2,2)

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhUHmcUHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-2*Lam1*ZH(gt1,1)*ZH(gt2,1)
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(Lam8*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam6*ZH(gt1,2)*ZH(gt2,1))
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam7*ZH(gt1,2)*ZH(gt2,1))
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(Lam10*ZH(gt1,2)*ZH(gt2,1))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam6*ZH(gt1,1)*ZH(gt2,2))
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam4*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam5*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam7*ZH(gt1,1)*ZH(gt2,2))
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(Lam10*ZH(gt1,1)*ZH(gt2,2))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Lam3*ZH(gt1,2)*ZH(gt2,2))
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-(Lam7*ZH(gt1,2)*ZH(gt2,2))
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Lam7*ZH(gt1,2)*ZH(gt2,2))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-2*Lam2*ZH(gt1,2)*ZH(gt2,2)
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(Lam9*ZH(gt1,2)*ZH(gt2,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhUHmcUHmL  
 
 
Subroutine CouplingUHmHmcUHmcHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,           & 
& Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,Lam10

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Lam8,Lam9,Lamh,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUHmHmcUHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-4*Lam1*Conjg(ZP(gt2,1))*ZP(gt4,1)
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-2*Lam6*Conjg(ZP(gt2,2))*ZP(gt4,1)
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-2*Lam6*Conjg(ZP(gt2,1))*ZP(gt4,1)
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-2*Lam5*Conjg(ZP(gt2,2))*ZP(gt4,1)
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*Lam6*Conjg(ZP(gt2,1))*ZP(gt4,1)
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(Lam3*Conjg(ZP(gt2,2))*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(Lam4*Conjg(ZP(gt2,2))*ZP(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(Lam3*Conjg(ZP(gt2,1))*ZP(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(Lam4*Conjg(ZP(gt2,1))*ZP(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*Lam7*Conjg(ZP(gt2,2))*ZP(gt4,1)
End If 
If ((1.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(Lam8*Conjg(ZP(gt2,3))*ZP(gt4,1))
End If 
If ((2.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(Lam10*Conjg(ZP(gt2,3))*ZP(gt4,1))
End If 
If ((3.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(Lam8*Conjg(ZP(gt2,1))*ZP(gt4,1))
End If 
If ((3.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(Lam10*Conjg(ZP(gt2,2))*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-2*Lam6*Conjg(ZP(gt2,1))*ZP(gt4,2)
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-(Lam3*Conjg(ZP(gt2,2))*ZP(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-(Lam4*Conjg(ZP(gt2,2))*ZP(gt4,2))
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-(Lam3*Conjg(ZP(gt2,1))*ZP(gt4,2))
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-(Lam4*Conjg(ZP(gt2,1))*ZP(gt4,2))
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-2*Lam7*Conjg(ZP(gt2,2))*ZP(gt4,2)
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*Lam5*Conjg(ZP(gt2,1))*ZP(gt4,2)
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*Lam7*Conjg(ZP(gt2,2))*ZP(gt4,2)
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*Lam7*Conjg(ZP(gt2,1))*ZP(gt4,2)
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-4*Lam2*Conjg(ZP(gt2,2))*ZP(gt4,2)
End If 
If ((1.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(Lam10*Conjg(ZP(gt2,3))*ZP(gt4,2))
End If 
If ((2.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(Lam9*Conjg(ZP(gt2,3))*ZP(gt4,2))
End If 
If ((3.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(Lam10*Conjg(ZP(gt2,1))*ZP(gt4,2))
End If 
If ((3.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(Lam9*Conjg(ZP(gt2,2))*ZP(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-(Lam8*Conjg(ZP(gt2,3))*ZP(gt4,3))
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-(Lam10*Conjg(ZP(gt2,3))*ZP(gt4,3))
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(Lam10*Conjg(ZP(gt2,3))*ZP(gt4,3))
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(Lam9*Conjg(ZP(gt2,3))*ZP(gt4,3))
End If 
If ((1.eq.gt3).And.(3.eq.gt1)) Then 
res = res-(Lam8*Conjg(ZP(gt2,1))*ZP(gt4,3))
End If 
If ((1.eq.gt3).And.(3.eq.gt1)) Then 
res = res-(Lam10*Conjg(ZP(gt2,2))*ZP(gt4,3))
End If 
If ((2.eq.gt3).And.(3.eq.gt1)) Then 
res = res-(Lam10*Conjg(ZP(gt2,1))*ZP(gt4,3))
End If 
If ((2.eq.gt3).And.(3.eq.gt1)) Then 
res = res-(Lam9*Conjg(ZP(gt2,2))*ZP(gt4,3))
End If 
If ((3.eq.gt1).And.(3.eq.gt3)) Then 
res = res-4*Lamh*Conjg(ZP(gt2,3))*ZP(gt4,3)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUHmHmcUHmcHmL  
 
 
Subroutine CouplingUHmcUHmVPVPL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUHmcUHmVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g1**2*Cos(TW)**2)/2._dp
End If 
If ((3.eq.gt1).And.(3.eq.gt2)) Then 
res = res+2*g1**2*Cos(TW)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g2**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUHmcUHmVPVPL  
 
 
Subroutine CouplingUHmcUHmcVWmVWmL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUHmcUHmcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUHmcUHmcVWmVWmL  
 
 
Subroutine CouplingUHmcUHmVZVZL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUHmcUHmVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(g1*g2*Cos(TW)*Sin(TW))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(g1*g2*Cos(TW)*Sin(TW))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If ((3.eq.gt1).And.(3.eq.gt2)) Then 
res = res+2*g1**2*Sin(TW)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUHmcUHmVZVZL  
 
 
Subroutine CouplingUFvFecVWmL(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZEL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFecVWmL  
 
 
Subroutine CouplingUFvFeHmL(gt1,gt2,gt3,Ye,epsE,Yh,ZP,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),Yh(3,3),ZP(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFeHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL+Conjg(ZEL(gt2,j1))*Conjg(ZP(gt3,3))*Yh(j1,gt1)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-(Conjg(ZEL(gt2,j2))*Conjg(ZP(gt3,3))*Yh(gt1,j2))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,gt1))*Conjg(ZP(gt3,1))*ZER(gt2,j1))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-(Conjg(epsE(j1,gt1))*Conjg(ZP(gt3,2))*ZER(gt2,j1))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFeHmL  
 
 
Subroutine CouplingUFvFvVZL(gt1,gt2,g1,g2,UV,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: UV(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(UV(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(UV(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g2*Cos(TW)*UV(gt2,gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Sin(TW)*UV(gt2,gt1))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFvVZL  
 
 
Subroutine CouplingcUFdFdAhL(gt1,gt2,gt3,Yd,epsD,ZA,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*Yd(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*epsD(gt1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,gt1))*ZDR(gt2,j1)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,gt1))*ZDR(gt2,j1)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdAhL  
 
 
Subroutine CouplingcUFdFdhhL(gt1,gt2,gt3,Yd,epsD,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*Yd(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*epsD(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,gt1))*ZDR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,gt1))*ZDR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdhhL  
 
 
Subroutine CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZDL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZDR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVGL  
 
 
Subroutine CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZDL(gt2,gt1))*Cos(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Cos(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVPL  
 
 
Subroutine CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZDL(gt2,gt1))*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Sin(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVZL  
 
 
Subroutine CouplingcUFdFucHmL(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),Yd(3,3),epsD(3,3),ZP(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFucHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-(Conjg(ZUL(gt2,j2))*Yd(gt1,j2)*ZP(gt3,1))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-(Conjg(ZUL(gt2,j2))*epsD(gt1,j2)*ZP(gt3,2))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-(Conjg(epsU(j1,gt1))*ZUR(gt2,j1)*ZP(gt3,1))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,gt1))*ZUR(gt2,j1)*ZP(gt3,2))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFucHmL  
 
 
Subroutine CouplingcUFdFuVWmL(gt1,gt2,g2,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFuVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZUL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFuVWmL  
 
 
Subroutine CouplingcUFuFuAhL(gt1,gt2,gt3,epsU,Yu,ZA,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*epsU(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*Yu(gt1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(epsU(j1,gt1))*ZUR(gt2,j1)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Yu(j1,gt1))*ZUR(gt2,j1)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuAhL  
 
 
Subroutine CouplingcUFuFdcVWmL(gt1,gt2,g2,ZDL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZDL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdcVWmL  
 
 
Subroutine CouplingcUFuFdHmL(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),Yd(3,3),epsD(3,3),ZP(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-(Conjg(ZDL(gt2,j2))*Conjg(ZP(gt3,1))*epsU(gt1,j2))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-(Conjg(ZDL(gt2,j2))*Conjg(ZP(gt3,2))*Yu(gt1,j2))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,gt1))*Conjg(ZP(gt3,1))*ZDR(gt2,j1))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-(Conjg(epsD(j1,gt1))*Conjg(ZP(gt3,2))*ZDR(gt2,j1))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdHmL  
 
 
Subroutine CouplingcUFuFuhhL(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZUL(gt2,j2))*epsU(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZUL(gt2,j2))*Yu(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(epsU(j1,gt1))*ZUR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Yu(j1,gt1))*ZUR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuhhL  
 
 
Subroutine CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZUL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZUR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVGL  
 
 
Subroutine CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZUL(gt2,gt1))*Cos(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(ZUL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(-2*g1*Cos(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVPL  
 
 
Subroutine CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(ZUL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZUL(gt2,gt1))*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(2*g1*Sin(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVZL  
 
 
Subroutine CouplingcUFeFeAhL(gt1,gt2,gt3,Ye,epsE,ZA,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*Ye(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*epsE(gt1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,gt1))*ZER(gt2,j1)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,gt1))*ZER(gt2,j1)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeAhL  
 
 
Subroutine CouplingcUFeFehhL(gt1,gt2,gt3,Ye,epsE,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*Ye(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*epsE(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,gt1))*ZER(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,gt1))*ZER(gt2,j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFehhL  
 
 
Subroutine CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZEL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+g1*Cos(TW)*ZER(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVPL  
 
 
Subroutine CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZEL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Sin(TW)*ZER(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVZL  
 
 
Subroutine CouplingcUFeFvcHmL(gt1,gt2,gt3,Ye,epsE,Yh,ZP,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),epsE(3,3),Yh(3,3),ZP(3,3),UV(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-(Conjg(UV(gt2,j2))*Ye(gt1,j2)*ZP(gt3,1))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-(Conjg(UV(gt2,j2))*epsE(gt1,j2)*ZP(gt3,2))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-(Conjg(Yh(j1,gt1))*UV(gt2,j1)*ZP(gt3,3))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR+Conjg(Yh(gt1,j2))*UV(gt2,j2)*ZP(gt3,3)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvcHmL  
 
 
Subroutine CouplingcUFeFvVWmL(gt1,gt2,g2,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: UV(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(UV(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvVWmL  
 
 
Subroutine CouplingAhhhVZL(gt1,gt2,g1,g2,ZH,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2*Cos(TW)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = res+(g1*Sin(TW)*ZA(gt1,2)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZL  
 
 
Subroutine CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZL  
 
 
Subroutine CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZL  
 
 
Subroutine CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZL  
 
 
Subroutine CouplingFvFvVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Sin(TW))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZL  
 
 
Subroutine CouplingcgWmgWmVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWmgWmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWmgWmVZL  
 
 
Subroutine CouplingcgWpCgWpCVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgWpCVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgWpCVZL  
 
 
Subroutine CouplinghhVZVZL(gt1,g1,g2,vd,vu,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vd*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*vd*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+(g1**2*vd*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(g2**2*vu*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res+g1*g2*vu*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+(g1**2*vu*Sin(TW)**2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZL  
 
 
Subroutine CouplingHmcHmVZL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Conjg(ZP(gt1,1))*Cos(TW)*ZP(gt2,1))/2._dp
res = res-(g1*Conjg(ZP(gt1,1))*Sin(TW)*ZP(gt2,1))/2._dp
res = res+(g2*Conjg(ZP(gt1,2))*Cos(TW)*ZP(gt2,2))/2._dp
res = res-(g1*Conjg(ZP(gt1,2))*Sin(TW)*ZP(gt2,2))/2._dp
res = res-(g1*Conjg(ZP(gt1,3))*Sin(TW)*ZP(gt2,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZL  
 
 
Subroutine CouplingHmVWmVZL(gt1,g1,g2,vd,vu,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*vd*Conjg(ZP(gt1,1))*Sin(TW))/2._dp
res = res-(g1*g2*vu*Conjg(ZP(gt1,2))*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmVWmVZL  
 
 
Subroutine CouplingcVWmVWmVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZL  
 
 
Subroutine CouplingAhAhVZVZL(gt1,gt2,g1,g2,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1)
res = res+(g1**2*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)**2*ZA(gt1,2)*ZA(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZA(gt1,2)*ZA(gt2,2)
res = res+(g1**2*Sin(TW)**2*ZA(gt1,2)*ZA(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZL  
 
 
Subroutine CouplinghhhhVZVZL(gt1,gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZL  
 
 
Subroutine CouplingHmcHmVZVZL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Conjg(ZP(gt1,1))*Cos(TW)**2*ZP(gt2,1))/2._dp
res = res-(g1*g2*Conjg(ZP(gt1,1))*Cos(TW)*Sin(TW)*ZP(gt2,1))
res = res+(g1**2*Conjg(ZP(gt1,1))*Sin(TW)**2*ZP(gt2,1))/2._dp
res = res+(g2**2*Conjg(ZP(gt1,2))*Cos(TW)**2*ZP(gt2,2))/2._dp
res = res-(g1*g2*Conjg(ZP(gt1,2))*Cos(TW)*Sin(TW)*ZP(gt2,2))
res = res+(g1**2*Conjg(ZP(gt1,2))*Sin(TW)**2*ZP(gt2,2))/2._dp
res = res+2*g1**2*Conjg(ZP(gt1,3))*Sin(TW)**2*ZP(gt2,3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZVZL  
 
 
Subroutine CouplingcVWmVWmVZVZL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVWmVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVWmVZVZL  
 
 
Subroutine CouplingAhcHmcVWmL(gt1,gt2,g2,ZA,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZA(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*ZA(gt1,2)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmcVWmL  
 
 
Subroutine CouplingcFuFdcVWmL(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcVWmL  
 
 
Subroutine CouplingFvFecVWmL(gt1,gt2,g2,UV,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: UV(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFecVWmL  
 
 
Subroutine CouplingcgWpCgAcVWmL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgAcVWm' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgAcVWmL  
 
 
Subroutine CouplingcgAgWmcVWmL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWmcVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWmcVWmL  
 
 
Subroutine CouplingcgZgWmcVWmL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWmcVWm' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWmcVWmL  
 
 
Subroutine CouplingcgWpCgZcVWmL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpCgZcVWm' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpCgZcVWmL  
 
 
Subroutine CouplinghhcHmcVWmL(gt1,gt2,g2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g2*ZH(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmcVWmL  
 
 
Subroutine CouplinghhcVWmVWmL(gt1,g2,vd,vu,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,vd,vu,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vd*ZH(gt1,1))/2._dp
res = res+(g2**2*vu*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWmVWmL  
 
 
Subroutine CouplingcHmcVWmVPL(gt1,g1,g2,vd,vu,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res+(g1*g2*vu*Cos(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmcVWmVPL  
 
 
Subroutine CouplingcVWmVPVWmL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVWm' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVWmL  
 
 
Subroutine CouplingcHmcVWmVZL(gt1,g1,g2,vd,vu,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,TW

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(g1*g2*vu*Sin(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmcVWmVZL  
 
 
Subroutine CouplingAhAhcVWmVWmL(gt1,gt2,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g2**2*ZA(gt1,2)*ZA(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWmVWmL  
 
 
Subroutine CouplinghhhhcVWmVWmL(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWmVWmL  
 
 
Subroutine CouplingHmcHmcVWmVWmL(gt1,gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Conjg(ZP(gt1,1))*ZP(gt2,1))/2._dp
res = res+(g2**2*Conjg(ZP(gt1,2))*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmcVWmVWmL  
 
 
Subroutine CouplingcVWmVPVPVWmL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmVPVPVWm' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmVPVPVWmL  
 
 
Subroutine CouplingcVWmcVWmVWmVWmL(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWmcVWmVWmVWm' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWmcVWmVWmVWmL  
 
 
Subroutine CouplingsForVectorBosons(g1,g2,ZH,ZA,TW,vd,vu,ZP,ZDL,ZUL,UV,               & 
& ZEL,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,               & 
& cplHmcHmVZ,cplHmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,               & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplAhcHmcVWm,cplcFuFdcVWmL,            & 
& cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,    & 
& cplcgWpCgZcVWm,cplhhcHmcVWm,cplhhcVWmVWm,cplcHmcVWmVP,cplcVWmVPVWm,cplcHmcVWmVZ,       & 
& cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHmcHmcVWmVWm,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,         & 
& cplcVWmVPVPVWm3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)

Implicit None 
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZA(2,2),TW,vd,vu

Complex(dp), Intent(in) :: ZP(3,3),ZDL(3,3),ZUL(3,3),UV(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: cplAhhhVZ(2,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcgWmgWmVZ,        & 
& cplcgWpCgWpCVZ,cplhhVZVZ(2),cplHmcHmVZ(3,3),cplHmVWmVZ(3),cplcVWmVWmVZ,cplAhAhVZVZ(2,2),& 
& cplhhhhVZVZ(2,2),cplHmcHmVZVZ(3,3),cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,    & 
& cplAhcHmcVWm(2,3),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(3,3),             & 
& cplFvFecVWmR(3,3),cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgZcVWm,           & 
& cplhhcHmcVWm(2,3),cplhhcVWmVWm(2),cplcHmcVWmVP(3),cplcVWmVPVWm,cplcHmcVWmVZ(3),        & 
& cplAhAhcVWmVWm(2,2),cplhhhhcVWmVWm(2,2),cplHmcHmcVWmVWm(3,3),cplcVWmVPVPVWm1,          & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForVectorBosons'
 
cplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZL(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZL(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWmgWmVZ = 0._dp 
Call CouplingcgWmgWmVZL(g2,TW,cplcgWmgWmVZ)



cplcgWpCgWpCVZ = 0._dp 
Call CouplingcgWpCgWpCVZL(g2,TW,cplcgWpCgWpCVZ)



cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZL(gt1,g1,g2,vd,vu,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplHmVWmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVWmVZL(gt1,g1,g2,vd,vu,ZP,TW,cplHmVWmVZ(gt1))

End Do 


cplcVWmVWmVZ = 0._dp 
Call CouplingcVWmVWmVZL(g2,TW,cplcVWmVWmVZ)



cplAhAhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZL(gt1,gt2,g1,g2,ZA,TW,cplAhAhVZVZ(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZL(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZVZ(gt1,gt2))

 End Do 
End Do 


cplcVWmVWmVZVZ1 = 0._dp 
cplcVWmVWmVZVZ2 = 0._dp 
cplcVWmVWmVZVZ3 = 0._dp 
Call CouplingcVWmVWmVZVZL(g2,TW,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3)



cplAhcHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingAhcHmcVWmL(gt1,gt2,g2,ZA,ZP,cplAhcHmcVWm(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmL(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFecVWmL(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcgWpCgAcVWm = 0._dp 
Call CouplingcgWpCgAcVWmL(g2,TW,cplcgWpCgAcVWm)



cplcgAgWmcVWm = 0._dp 
Call CouplingcgAgWmcVWmL(g2,TW,cplcgAgWmcVWm)



cplcgZgWmcVWm = 0._dp 
Call CouplingcgZgWmcVWmL(g2,TW,cplcgZgWmcVWm)



cplcgWpCgZcVWm = 0._dp 
Call CouplingcgWpCgZcVWmL(g2,TW,cplcgWpCgZcVWm)



cplhhcHmcVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWmL(gt1,gt2,g2,ZH,ZP,cplhhcHmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWmVWmL(gt1,g2,vd,vu,ZH,cplhhcVWmVWm(gt1))

End Do 


cplcHmcVWmVP = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWmVPL(gt1,g1,g2,vd,vu,ZP,TW,cplcHmcVWmVP(gt1))

End Do 


cplcVWmVPVWm = 0._dp 
Call CouplingcVWmVPVWmL(g2,TW,cplcVWmVPVWm)



cplcHmcVWmVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWmVZL(gt1,g1,g2,vd,vu,ZP,TW,cplcHmcVWmVZ(gt1))

End Do 


cplAhAhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhcVWmVWmL(gt1,gt2,g2,ZA,cplAhAhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplhhhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWmVWmL(gt1,gt2,g2,ZH,cplhhhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplHmcHmcVWmVWm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmcVWmVWmL(gt1,gt2,g2,ZP,cplHmcHmcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplcVWmVPVPVWm1 = 0._dp 
cplcVWmVPVPVWm2 = 0._dp 
cplcVWmVPVPVWm3 = 0._dp 
Call CouplingcVWmVPVPVWmL(g2,TW,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3)



cplcVWmcVWmVWmVWm1 = 0._dp 
cplcVWmcVWmVWmVWm2 = 0._dp 
cplcVWmcVWmVWmVWm3 = 0._dp 
Call CouplingcVWmcVWmVWmVWmL(g2,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3)



Iname = Iname - 1 
End Subroutine CouplingsForVectorBosons

Subroutine CouplingsForSMfermions(Yd,epsD,ZA,ZDL,ZDR,ZH,g3,g1,g2,TW,epsU,             & 
& Yu,ZP,ZUL,ZUR,Ye,epsE,ZEL,ZER,Yh,UV,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,            & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFucHmL,cplcUFdFucHmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFuFuAhL,     & 
& cplcUFuFuAhR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFdHmL,cplcUFuFdHmR,cplcUFuFuhhL,     & 
& cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,         & 
& cplcUFuFuVZR,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,         & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvcHmL,cplcUFeFvcHmR,cplcUFeFvVWmL,      & 
& cplcUFeFvVWmR)

Implicit None 
Real(dp), Intent(in) :: ZA(2,2),ZH(2,2),g3,g1,g2,TW

Complex(dp), Intent(in) :: Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3),epsU(3,3),Yu(3,3),ZP(3,3),ZUL(3,3),               & 
& ZUR(3,3),Ye(3,3),epsE(3,3),ZEL(3,3),ZER(3,3),Yh(3,3),UV(3,3)

Complex(dp), Intent(out) :: cplcUFdFdAhL(3,3,2),cplcUFdFdAhR(3,3,2),cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),      & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFucHmL(3,3,3),cplcUFdFucHmR(3,3,3),         & 
& cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),cplcUFuFuAhL(3,3,2),cplcUFuFuAhR(3,3,2),         & 
& cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),cplcUFuFdHmL(3,3,3),cplcUFuFdHmR(3,3,3),       & 
& cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFeFeAhL(3,3,2),cplcUFeFeAhR(3,3,2),cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),       & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFvcHmL(3,3,3),cplcUFeFvcHmR(3,3,3),cplcUFeFvVWmL(3,3),cplcUFeFvVWmR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForSMfermions'
 
cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdAhL(gt1,gt2,gt3,Yd,epsD,ZA,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdhhL(gt1,gt2,gt3,Yd,epsD,ZH,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2),cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVZL(gt1,gt2),cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucHmL = 0._dp 
cplcUFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcUFdFucHmL(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZUL,ZUR,cplcUFdFucHmL(gt1,gt2,gt3)& 
& ,cplcUFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFuVWmL = 0._dp 
cplcUFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFuVWmL(gt1,gt2,g2,ZUL,cplcUFdFuVWmL(gt1,gt2),cplcUFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuAhL(gt1,gt2,gt3,epsU,Yu,ZA,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFdcVWmL = 0._dp 
cplcUFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdcVWmL(gt1,gt2,g2,ZDL,cplcUFuFdcVWmL(gt1,gt2),cplcUFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdHmL = 0._dp 
cplcUFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcUFuFdHmL(gt1,gt2,gt3,epsU,Yu,Yd,epsD,ZP,ZDL,ZDR,cplcUFuFdHmL(gt1,gt2,gt3)& 
& ,cplcUFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuhhL(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2),cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVZL(gt1,gt2),cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFeAhL(gt1,gt2,gt3,Ye,epsE,ZA,ZEL,ZER,cplcUFeFeAhL(gt1,gt2,gt3)       & 
& ,cplcUFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFehhL(gt1,gt2,gt3,Ye,epsE,ZH,ZEL,ZER,cplcUFeFehhL(gt1,gt2,gt3)       & 
& ,cplcUFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2),cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVZL(gt1,gt2),cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcHmL = 0._dp 
cplcUFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcUFeFvcHmL(gt1,gt2,gt3,Ye,epsE,Yh,ZP,UV,cplcUFeFvcHmL(gt1,gt2,gt3)       & 
& ,cplcUFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFvVWmL = 0._dp 
cplcUFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvVWmL(gt1,gt2,g2,UV,cplcUFeFvVWmL(gt1,gt2),cplcUFeFvVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForSMfermions

Subroutine CouplingsForTadpoles(Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,vu,             & 
& ZA,g1,g2,TW,Yd,epsD,ZDL,ZDR,Ye,epsE,ZEL,ZER,epsU,Yu,ZUL,ZUR,ZH,Mu,Lam10,               & 
& Lam8,Lam9,ZP,cplAhAhUhh,cplAhUhhVZ,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,             & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,      & 
& cplUhhhhhh,cplUhhHmcHm,cplUhhHmVWm,cplUhhcVWmVWm,cplUhhVZVZ,cplAhAhUhhUhh,             & 
& cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ)

Implicit None 
Real(dp), Intent(in) :: Lam6,Lam5,Lam7,vd,vu,ZA(2,2),g1,g2,TW,ZH(2,2),Mu,Lam10

Complex(dp), Intent(in) :: Lam1,Lam4,Lam3,Lam2,Yd(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),epsE(3,3),            & 
& ZEL(3,3),ZER(3,3),epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),Lam8,Lam9,ZP(3,3)

Complex(dp), Intent(out) :: cplAhAhUhh(2,2,2),cplAhUhhVZ(2,2),cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),            & 
& cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),       & 
& cplcgWmgWmUhh(2),cplcgWpCgWpCUhh(2),cplcgZgZUhh(2),cplUhhhhhh(2,2,2),cplUhhHmcHm(2,3,3),& 
& cplUhhHmVWm(2,3),cplUhhcVWmVWm(2),cplUhhVZVZ(2),cplAhAhUhhUhh(2,2,2,2),cplUhhUhhhhhh(2,2,2,2),& 
& cplUhhUhhHmcHm(2,2,3,3),cplUhhUhhcVWmVWm(2,2),cplUhhUhhVZVZ(2,2)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForTadpoles'
 
cplAhAhUhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhUhhL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,              & 
& vu,ZA,cplAhAhUhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhUhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVZL(gt1,gt2,g1,g2,ZA,TW,cplAhUhhVZ(gt1,gt2))

 End Do 
End Do 


cplcFdFdUhhL = 0._dp 
cplcFdFdUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdUhhL(gt1,gt2,gt3,Yd,epsD,ZDL,ZDR,cplcFdFdUhhL(gt1,gt2,gt3)          & 
& ,cplcFdFdUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUhhL = 0._dp 
cplcFeFeUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeUhhL(gt1,gt2,gt3,Ye,epsE,ZEL,ZER,cplcFeFeUhhL(gt1,gt2,gt3)          & 
& ,cplcFeFeUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUhhL = 0._dp 
cplcFuFuUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuUhhL(gt1,gt2,gt3,epsU,Yu,ZUL,ZUR,cplcFuFuUhhL(gt1,gt2,gt3)          & 
& ,cplcFuFuUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWmgWmUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWmgWmUhhL(gt3,g2,vd,vu,cplcgWmgWmUhh(gt3))

End Do 


cplcgWpCgWpCUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpCgWpCUhhL(gt3,g2,vd,vu,cplcgWpCgWpCUhh(gt3))

End Do 


cplcgZgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZUhhL(gt3,g1,g2,vd,vu,TW,cplcgZgZUhh(gt3))

End Do 


cplUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhhhhhL(gt1,gt2,gt3,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,Lam2,vd,              & 
& vu,ZH,cplUhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingUhhHmcHmL(gt1,gt2,gt3,Mu,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,Lam3,            & 
& Lam2,Lam8,Lam9,vd,vu,ZP,cplUhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingUhhHmVWmL(gt1,gt2,g2,ZP,cplUhhHmVWm(gt1,gt2))

 End Do 
End Do 


cplUhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhcVWmVWmL(gt1,g2,vd,vu,cplUhhcVWmVWm(gt1))

End Do 


cplUhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZL(gt1,g1,g2,vd,vu,TW,cplUhhVZVZ(gt1))

End Do 


cplAhAhUhhUhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhUhhUhhL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,ZA,cplAhAhUhhUhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam1,Lam4,Lam3,               & 
& Lam2,ZH,cplUhhUhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingUhhUhhHmcHmL(gt1,gt2,gt3,gt4,Lam6,Lam5,Lam7,Lam10,Lam1,Lam4,             & 
& Lam3,Lam2,Lam8,Lam9,ZP,cplUhhUhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhcVWmVWm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhcVWmVWmL(gt1,gt2,g2,cplUhhUhhcVWmVWm(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,TW,cplUhhUhhVZVZ(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForTadpoles

End Module Couplings_Zee 
