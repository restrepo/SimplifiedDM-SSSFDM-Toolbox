! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.7.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 20:17 on 1.3.2016   
! ----------------------------------------------------------------------  
 
 
Module SusyDecays_darkLR
 
Use Control 
Use DecayFunctions 
Use LoopCouplings_darkLR 
Use CouplingsForDecays_darkLR 
Use Model_Data_darkLR 
Use Mathematics, Only: Li2 
 
 Contains 
 
  
Subroutine FuTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr,MAh(6),MAh2(6),MFd(6),MFd2(6),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),Mhh(6),Mhh2(6),MHpm(6),MHpm2(6),MHppmm(2),MHppmm2(2),MVWLm,             & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(6,6),UCC(2,2),UP(6,6),ZH(6,6)

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2,UV(6,6),            & 
& ZDR(6,6),ZER(3,3),ZUR(3,3),ZDL(6,6),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),cplcFuFdcHpmL(3,6,6),cplcFuFdcHpmR(3,6,6),      & 
& cplcFuFdcVWLmL(3,6),cplcFuFdcVWLmR(3,6),cplcFuFdcVWRmL(3,6),cplcFuFdcVWRmR(3,6),       & 
& cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FuTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFu(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fu_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,cplcFuFuAhL,cplcFuFuAhR,cplcFuFdcHpmL,      & 
& cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fu, Ah
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=3, 6
m1out = MFu(gt1)
m2out = MAh(gt2)
coupL = cplcFuFuAhL(i1,gt1,gt2)
coupR = cplcFuFuAhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fd, conj[Hpm]
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=3, 6
m1out = MFd(gt1)
m2out = MHpm(gt2)
coupL = cplcFuFdcHpmL(i1,gt1,gt2)
coupR = cplcFuFdcHpmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.3) Then 
  BR_tHb = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fd, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MFd(gt1)
m2out = MVWLm
coupL = cplcFuFdcVWLmL(i1,gt1)
coupR = cplcFuFdcVWLmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.3) Then 
  BR_tWb = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fd, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MFd(gt1)
m2out = MVWRm
coupL = cplcFuFdcVWRmL(i1,gt1)
coupR = cplcFuFdcVWRmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, hh
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 6
m1out = MFu(gt1)
m2out = Mhh(gt2)
coupL = cplcFuFuhhL(i1,gt1,gt2)
coupR = cplcFuFuhhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fu, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = MVZ
coupL = cplcFuFuVZL(i1,gt1)
coupR = cplcFuFuVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, VZR
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = MVZR
coupL = cplcFuFuVZRL(i1,gt1)
coupR = cplcFuFuVZRR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FuTwoBodyDecay
 
 
Subroutine FeTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr,MAh(6),MAh2(6),MFd(6),MFd2(6),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),Mhh(6),Mhh2(6),MHpm(6),MHpm2(6),MHppmm(2),MHppmm2(2),MVWLm,             & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(6,6),UCC(2,2),UP(6,6),ZH(6,6)

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2,UV(6,6),            & 
& ZDR(6,6),ZER(3,3),ZUR(3,3),ZDL(6,6),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),          & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFecFeHppmmL(3,3,2),& 
& cplcFecFeHppmmR(3,3,2)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FeTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFe(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fe_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFecFeHppmmL,         & 
& cplcFecFeHppmmR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fe, Ah
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=3, 6
m1out = MFe(gt1)
m2out = MAh(gt2)
coupL = cplcFeFeAhL(i1,gt1,gt2)
coupR = cplcFeFeAhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, hh
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 6
m1out = MFe(gt1)
m2out = Mhh(gt2)
coupL = cplcFeFehhL(i1,gt1,gt2)
coupR = cplcFeFehhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFe(gt1)
m2out = MVZ
coupL = cplcFeFeVZL(i1,gt1)
coupR = cplcFeFeVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fe, VZR
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFe(gt1)
m2out = MVZR
coupL = cplcFeFeVZRL(i1,gt1)
coupR = cplcFeFeVZRR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! bar[Fe], Hppmm
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 2
m1out = MFe(gt1)
m2out = MHppmm(gt2)
coupL = cplcFecFeHppmmL(i1,gt1,gt2)
coupR = cplcFecFeHppmmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FeTwoBodyDecay
 
 
Subroutine FdTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr,MAh(6),MAh2(6),MFd(6),MFd2(6),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),Mhh(6),Mhh2(6),MHpm(6),MHpm2(6),MHppmm(2),MHppmm2(2),MVWLm,             & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(6,6),UCC(2,2),UP(6,6),ZH(6,6)

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2,UV(6,6),            & 
& ZDR(6,6),ZER(3,3),ZUR(3,3),ZDL(6,6),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplcFdFdAhL(6,6,6),cplcFdFdAhR(6,6,6),cplcFdFdhhL(6,6,6),cplcFdFdhhR(6,6,6),          & 
& cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZRL(6,6),cplcFdFdVZRR(6,6),cplcFdFuHpmL(6,3,6),& 
& cplcFdFuHpmR(6,3,6),cplcFdFuVWLmL(6,3),cplcFdFuVWLmR(6,3),cplcFdFuVWRmL(6,3),          & 
& cplcFdFuVWRmR(6,3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FdTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 6
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.6) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFd(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fd_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFdFuHpmL,            & 
& cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fd, Ah
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=3, 6
m1out = MFd(gt1)
m2out = MAh(gt2)
coupL = cplcFdFdAhL(i1,gt1,gt2)
coupR = cplcFdFdAhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fd, hh
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 6
m1out = MFd(gt1)
m2out = Mhh(gt2)
coupL = cplcFdFdhhL(i1,gt1,gt2)
coupR = cplcFdFdhhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fd, VZ
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MFd(gt1)
m2out = MVZ
coupL = cplcFdFdVZL(i1,gt1)
coupR = cplcFdFdVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fd, VZR
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MFd(gt1)
m2out = MVZR
coupL = cplcFdFdVZRL(i1,gt1)
coupR = cplcFdFdVZRR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, Hpm
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=3, 6
m1out = MFu(gt1)
m2out = MHpm(gt2)
coupL = cplcFdFuHpmL(i1,gt1,gt2)
coupR = cplcFdFuHpmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fu, VWLm
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = MVWLm
coupL = cplcFdFuVWLmL(i1,gt1)
coupR = cplcFdFuVWLmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, VWRm
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = MVWRm
coupL = cplcFdFuVWRmL(i1,gt1)
coupR = cplcFdFuVWRmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FdTwoBodyDecay
 
 
Subroutine hhTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr,MAh(6),MAh2(6),MFd(6),MFd2(6),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),Mhh(6),Mhh2(6),MHpm(6),MHpm2(6),MHppmm(2),MHppmm2(2),MVWLm,             & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(6,6),UCC(2,2),UP(6,6),ZH(6,6)

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2,UV(6,6),            & 
& ZDR(6,6),ZER(3,3),ZUR(3,3),ZDL(6,6),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplHiggsPP(6),cplHiggsGG(6),cplHiggsZZvirt(6),cplHiggsWWvirt(6),cplAhAhhh(6,6,6),     & 
& cplAhhhVZ(6,6),cplAhhhVZR(6,6),cplcFdFdhhL(6,6,6),cplcFdFdhhR(6,6,6),cplcFeFehhL(3,3,6),& 
& cplcFeFehhR(3,3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplFvFvhhL(6,6,6),            & 
& cplFvFvhhR(6,6,6),cplhhhhhh(6,6,6),cplhhHpmcHpm(6,6,6),cplhhHpmcVWLm(6,6),             & 
& cplhhHpmcVWRm(6,6),cplhhHppmmcHppmm(6,2,2),cplhhcVWLmVWLm(6),cplhhcVWRmVWLm(6),        & 
& cplhhcVWRmVWRm(6),cplhhVZVZ(6),cplhhVZVZR(6),cplhhVZRVZR(6)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Real(dp) :: alpha3 
Iname = Iname + 1 
NameOfUnit(Iname) = 'hhTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 6
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.6) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = Mhh(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_hh_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,       & 
& cplHiggsWWvirt,cplAhAhhh,cplAhhhVZ,cplAhhhVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,      & 
& cplhhHpmcVWLm,cplhhHpmcVWRm,cplhhHppmmcHppmm,cplhhcVWLmVWLm,cplhhcVWRmVWLm,            & 
& cplhhcVWRmVWRm,cplhhVZVZ,cplhhVZVZR,cplhhVZRVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! VP, VP
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo128pi3 * Abs(cplHiggsPP(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VG, VG
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo36pi3 * Abs(cplHiggsGG(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
If (m_in.le.2._dp*m1out) Then 
coupReal = cplHiggsZZvirt(i1)
Call ScalarToVectorBosonsVR(m_in,m1out,coupReal,gam) 
Else 
gam = 0._dp 
End if 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, VWLm
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWLm
If (m_in.le.2._dp*m1out) Then 
coupReal = cplHiggsWWvirt(i1)
Call ScalarToVectorBosonsVR(m_in,m1out,coupReal,gam) 
Else 
gam = 0._dp 
End if 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Ah, Ah
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2= gt1, 6
m1out = MAh(gt1)
m2out = MAh(gt2)
coup = cplAhAhhh(gt1,gt2,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.gt2) Then 
  BRHAA(i1,gt1) = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Ah, VZ
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MAh(gt1)
m2out = MVZ
coup = cplAhhhVZ(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Ah, VZR
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MAh(gt1)
m2out = MVZR
coup = cplAhhhVZR(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 6
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdhhL(gt1,gt2,i1)
coupR = cplcFdFdhhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFehhL(gt1,gt2,i1)
coupR = cplcFeFehhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuhhL(gt1,gt2,i1)
coupR = cplcFuFuhhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fv
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2= gt1, 6
m1out = MFv(gt1)
m2out = MFv(gt2)
coupL = cplFvFvhhL(gt1,gt2,i1)
coupR = cplFvFvhhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, hh
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2= gt1, 6
m1out = Mhh(gt1)
m2out = Mhh(gt2)
coup = cplhhhhhh(i1,gt1,gt2)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.gt2) Then 
  BRHHH(i1,gt1) = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! conj[Hpm], Hpm
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2=3, 6
m1out = MHpm(gt1)
m2out = MHpm(gt2)
coup = cplhhHpmcHpm(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVWLm
coup = cplhhHpmcVWLm(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVWRm
coup = cplhhHpmcVWRm(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hppmm], Hppmm
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2=1, 2
m1out = MHppmm(gt1)
m2out = MHppmm(gt2)
coup = cplhhHppmmcHppmm(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! VWLm, conj[VWLm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWLm
coup = cplhhcVWLmVWLm(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWRm
coup = cplhhcVWRmVWLm(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVWRm
coup = cplhhcVWRmVWRm(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
coup = cplhhVZVZ(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZR
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZR
coup = cplhhVZVZR(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZR, VZR
! ----------------------------------------------

 
m1out = MVZR
m2out = MVZR
coup = cplhhVZRVZR(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  BRHHH(i1,:) = BRHHH(i1,:)/gT(i1) 
  BRHAA(i1,:) = BRHAA(i1,:)/gT(i1) 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
Contains 
 
  Real(dp) Function FFqcd(mf, mA, alpha_s)
  Implicit None
   Real(dp) , Intent(in) :: mf, mA, alpha_s
   Real(dp) :: fac, beta, beta2, ratio, R_beta_1, Ln_R_beta_1, Ln_beta

   FFqcd = 0._dp
   ratio = mf / mA
   If (ratio.Ge.0.5_dp) Return ! decay is kinematically forbitten

   If (ratio.Ge.0.495_dp) Return ! Coloumb singularity

    beta2 = 1._dp - 4._dp * ratio**2
    beta = Sqrt(beta2)
    
    R_beta_1 = (1. - beta) / (1._dp + beta)
    Ln_beta = Log(beta)
    Ln_R_beta_1 = Log(R_beta_1)

    fac = (3._dp + 34._dp * beta2 - 13._dp * beta**4) / (16._dp * beta**3)  &
      &     * (-Ln_R_beta_1)                                                &
      & + 0.375_dp * (7._dp - beta2) - 3._dp * Log(4._dp/(1._dp - beta**2)) &
      & - 4._dp * Ln_beta                                                   &
      & + (1._dp + beta**2)                                                 &
      &       * ( 4._dp * Li2(R_beta_1) + 2._dp * Li2(- R_beta_1)           &
      &         + Ln_R_beta_1 * ( 3._dp * Log(2._dp/(1._dp + beta))         &
      &                         + 2._dp * Ln_beta )  ) / beta

    fac = fac - 3._dp * Log(ratio)  ! absorb large logarithms in mass

    FFqcd = 1._dp + 5._dp * alpha_s * fac * oo3pi 

  End  Function FFqcd
End Subroutine hhTwoBodyDecay
 
 
Subroutine FvTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr,MAh(6),MAh2(6),MFd(6),MFd2(6),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),Mhh(6),Mhh2(6),MHpm(6),MHpm2(6),MHppmm(2),MHppmm2(2),MVWLm,             & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(6,6),UCC(2,2),UP(6,6),ZH(6,6)

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2,UV(6,6),            & 
& ZDR(6,6),ZER(3,3),ZUR(3,3),ZDL(6,6),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplFvFvAhL(6,6,6),cplFvFvAhR(6,6,6),cplFvFvhhL(6,6,6),cplFvFvhhR(6,6,6),              & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FvTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 6
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.6) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFv(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fv_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,           & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,cplFvFvVZRR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fv, Ah
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=3, 6
m1out = MFv(gt1)
m2out = MAh(gt2)
coupL = cplFvFvAhL(i1,gt1,gt2)
coupR = cplFvFvAhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, hh
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 6
m1out = MFv(gt1)
m2out = Mhh(gt2)
coupL = cplFvFvhhL(i1,gt1,gt2)
coupR = cplFvFvhhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, VZ
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MFv(gt1)
m2out = MVZ
coupL = cplFvFvVZL(i1,gt1)
coupR = cplFvFvVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fv, VZR
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = MFv(gt1)
m2out = MVZR
coupL = cplFvFvVZRL(i1,gt1)
coupR = cplFvFvVZRR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FvTwoBodyDecay
 
 
Subroutine VZTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr,MAh(6),MAh2(6),MFd(6),MFd2(6),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),Mhh(6),Mhh2(6),MHpm(6),MHpm2(6),MHppmm(2),MHppmm2(2),MVWLm,             & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(6,6),UCC(2,2),UP(6,6),ZH(6,6)

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2,UV(6,6),            & 
& ZDR(6,6),ZER(3,3),ZUR(3,3),ZDL(6,6),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplAhhhVZ(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplhhVZVZ(6),        & 
& cplhhVZVZR(6),cplHpmcHpmVZ(6,6),cplHpmcVWLmVZ(6),cplHpmcVWRmVZ(6),cplHppmmcHppmmVZ(2,2),& 
& cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'VZTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = MVZ 
Call CouplingsFor_VZ_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,          & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,       & 
& cplhhVZVZR,cplHpmcHpmVZ,cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplHppmmcHppmmVZ,cplcVWLmVWLmVZ,   & 
& cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,deltaM)

i_count = 1 

 
! ----------------------------------------------
! hh, Ah
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=3, 6
m1out = Mhh(gt1)
m2out = MAh(gt2)
coup = cplAhhhVZ(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 6
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdVZL(gt1,gt2)
coupR = cplcFdFdVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFeVZL(gt1,gt2)
coupR = cplcFeFeVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuVZL(gt1,gt2)
coupR = cplcFuFuVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fv
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2= gt1, 6
m1out = MFv(gt1)
m2out = MFv(gt2)
coupL = cplFvFvVZL(gt1,gt2)
coupR = cplFvFvVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VZ
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = Mhh(gt1)
m2out = MVZ
coup = cplhhVZVZ(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VZR
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = Mhh(gt1)
m2out = MVZR
coup = cplhhVZVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hpm], Hpm
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2=3, 6
m1out = MHpm(gt1)
m2out = MHpm(gt2)
coup = cplHpmcHpmVZ(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVWLm
coup = cplHpmcVWLmVZ(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVWRm
coup = cplHpmcVWRmVZ(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hppmm], Hppmm
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2=1, 2
m1out = MHppmm(gt1)
m2out = MHppmm(gt2)
coup = cplHppmmcHppmmVZ(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! VWLm, conj[VWLm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWLm
coup = cplcVWLmVWLmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWRm
coup = cplcVWRmVWLmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVWRm
coup = cplcVWRmVWRmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine VZTwoBodyDecay
 
 
Subroutine VZRTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr,MAh(6),MAh2(6),MFd(6),MFd2(6),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),Mhh(6),Mhh2(6),MHpm(6),MHpm2(6),MHppmm(2),MHppmm2(2),MVWLm,             & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(6,6),UCC(2,2),UP(6,6),ZH(6,6)

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2,UV(6,6),            & 
& ZDR(6,6),ZER(3,3),ZUR(3,3),ZDL(6,6),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplAhhhVZR(6,6),cplcFdFdVZRL(6,6),cplcFdFdVZRR(6,6),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),cplhhVZVZR(6),   & 
& cplhhVZRVZR(6),cplHpmcHpmVZR(6,6),cplHpmcVWLmVZR(6),cplHpmcVWRmVZR(6),cplHppmmcHppmmVZR(2,2),& 
& cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'VZRTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = MVZR 
Call CouplingsFor_VZR_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,             & 
& err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,               & 
& xiR,mudl2,mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,cplAhhhVZR,cplcFdFdVZRL,          & 
& cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvVZRL,          & 
& cplFvFvVZRR,cplhhVZVZR,cplhhVZRVZR,cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,        & 
& cplHppmmcHppmmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! hh, Ah
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=3, 6
m1out = Mhh(gt1)
m2out = MAh(gt2)
coup = cplAhhhVZR(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 6
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdVZRL(gt1,gt2)
coupR = cplcFdFdVZRR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFeVZRL(gt1,gt2)
coupR = cplcFeFeVZRR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuVZRL(gt1,gt2)
coupR = cplcFuFuVZRR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fv
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2= gt1, 6
m1out = MFv(gt1)
m2out = MFv(gt2)
coupL = cplFvFvVZRL(gt1,gt2)
coupR = cplFvFvVZRR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VZ
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = Mhh(gt1)
m2out = MVZ
coup = cplhhVZVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VZR
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = Mhh(gt1)
m2out = MVZR
coup = cplhhVZRVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hpm], Hpm
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2=3, 6
m1out = MHpm(gt1)
m2out = MHpm(gt2)
coup = cplHpmcHpmVZR(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVWLm
coup = cplHpmcVWLmVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVWRm
coup = cplHpmcVWRmVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hppmm], Hppmm
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2=1, 2
m1out = MHppmm(gt1)
m2out = MHppmm(gt2)
coup = cplHppmmcHppmmVZR(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! VWLm, conj[VWLm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWLm
coup = cplcVWLmVWLmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWRm
coup = cplcVWRmVWLmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVWRm
coup = cplcVWRmVWRmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine VZRTwoBodyDecay
 
 
Subroutine HppmmTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,             & 
& err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,               & 
& xiR,mudl2,mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr,MAh(6),MAh2(6),MFd(6),MFd2(6),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),Mhh(6),Mhh2(6),MHpm(6),MHpm2(6),MHppmm(2),MHppmm2(2),MVWLm,             & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(6,6),UCC(2,2),UP(6,6),ZH(6,6)

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2,UV(6,6),            & 
& ZDR(6,6),ZER(3,3),ZUR(3,3),ZDL(6,6),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplAhHppmmcHppmm(6,2,2),cplFeFecHppmmL(3,3,2),cplFeFecHppmmR(3,3,2),cplhhHppmmcHppmm(6,2,2),& 
& cplHpmHpmcHppmm(6,6,2),cplHpmcHppmmVWLm(6,2),cplHpmcHppmmVWRm(6,2),cplHppmmcHppmmVZ(2,2),& 
& cplHppmmcHppmmVZR(2,2),cplcHppmmVWLmVWLm(2),cplcHppmmVWLmVWRm(2),cplcHppmmVWRmVWRm(2)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'HppmmTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 2
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.2) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,2

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,2

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MHppmm(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Hppmm_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,             & 
& err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,               & 
& xiR,mudl2,mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,cplAhHppmmcHppmm,cplFeFecHppmmL,  & 
& cplFeFecHppmmR,cplhhHppmmcHppmm,cplHpmHpmcHppmm,cplHpmcHppmmVWLm,cplHpmcHppmmVWRm,     & 
& cplHppmmcHppmmVZ,cplHppmmcHppmmVZR,cplcHppmmVWLmVWLm,cplcHppmmVWLmVWRm,cplcHppmmVWRmVWRm,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Hppmm, Ah
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2=3, 6
m1out = MHppmm(gt1)
m2out = MAh(gt2)
coup = cplAhHppmmcHppmm(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2= gt1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplFeFecHppmmL(gt1,gt2,i1)
coupR = cplFeFecHppmmR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hppmm, hh
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2=1, 6
m1out = MHppmm(gt1)
m2out = Mhh(gt2)
coup = cplhhHppmmcHppmm(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, Hpm
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2= gt1, 6
m1out = MHpm(gt1)
m2out = MHpm(gt2)
coup = cplHpmHpmcHppmm(gt1,gt2,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, VWLm
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVWLm
coup = cplHpmcHppmmVWLm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VWRm
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVWRm
coup = cplHpmcHppmmVWRm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hppmm, VZ
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = MHppmm(gt1)
m2out = MVZ
coup = cplHppmmcHppmmVZ(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hppmm, VZR
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = MHppmm(gt1)
m2out = MVZR
coup = cplHppmmcHppmmVZR(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VWLm, VWLm
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWLm
coup = cplcHppmmVWLmVWLm(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, VWRm
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWRm
coup = cplcHppmmVWLmVWRm(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, VWRm
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVWRm
coup = cplcHppmmVWRmVWRm(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine HppmmTwoBodyDecay
 
 
Subroutine HpmTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr,MAh(6),MAh2(6),MFd(6),MFd2(6),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),Mhh(6),Mhh2(6),MHpm(6),MHpm2(6),MHppmm(2),MHppmm2(2),MVWLm,             & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(6,6),UCC(2,2),UP(6,6),ZH(6,6)

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2,UV(6,6),            & 
& ZDR(6,6),ZER(3,3),ZUR(3,3),ZDL(6,6),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplAhHpmcHpm(6,6,6),cplAhcHpmVWLm(6,6),cplAhcHpmVWRm(6,6),cplcFuFdcHpmL(3,6,6),       & 
& cplcFuFdcHpmR(3,6,6),cplhhHpmcHpm(6,6,6),cplhhcHpmVWLm(6,6),cplhhcHpmVWRm(6,6),        & 
& cplHpmcHpmVZ(6,6),cplHpmcHpmVZR(6,6),cplHppmmcHpmcHpm(2,6,6),cplHppmmcHpmcVWLm(2,6),   & 
& cplHppmmcHpmcVWRm(2,6),cplcHpmVWLmVZ(6),cplcHpmVWLmVZR(6),cplcHpmVWRmVZ(6),            & 
& cplcHpmVWRmVZR(6)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'HpmTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 3 
  i_end = 6
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.6) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MHpm(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Hpm_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,             & 
& err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,               & 
& xiR,mudl2,mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,cplAhHpmcHpm,cplAhcHpmVWLm,       & 
& cplAhcHpmVWRm,cplcFuFdcHpmL,cplcFuFdcHpmR,cplhhHpmcHpm,cplhhcHpmVWLm,cplhhcHpmVWRm,    & 
& cplHpmcHpmVZ,cplHpmcHpmVZR,cplHppmmcHpmcHpm,cplHppmmcHpmcVWLm,cplHppmmcHpmcVWRm,       & 
& cplcHpmVWLmVZ,cplcHpmVWLmVZR,cplcHpmVWRmVZ,cplcHpmVWRmVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Hpm, Ah
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2=3, 6
m1out = MHpm(gt1)
m2out = MAh(gt2)
coup = cplAhHpmcHpm(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Ah, VWLm
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MAh(gt1)
m2out = MVWLm
coup = cplAhcHpmVWLm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Ah, VWRm
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MAh(gt1)
m2out = MVWRm
coup = cplAhcHpmVWRm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! bar[Fu], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 6
m1out = MFu(gt1)
m2out = MFd(gt2)
coupL = cplcFuFdcHpmL(gt1,gt2,i1)
coupR = cplcFuFdcHpmR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If ((gt1.eq.2).and.(gt2.eq.3)) Then 
  BR_Hcb(i1) = gPartial(i1,i_count) 
End if 
If ((gt1.eq.2).and.(gt2.eq.2)) Then 
  BR_Hcs(i1) = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, hh
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2=1, 6
m1out = MHpm(gt1)
m2out = Mhh(gt2)
coup = cplhhHpmcHpm(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VWLm
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = Mhh(gt1)
m2out = MVWLm
coup = cplhhcHpmVWLm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VWRm
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = Mhh(gt1)
m2out = MVWRm
coup = cplhhcHpmVWRm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VZ
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVZ
coup = cplHpmcHpmVZ(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VZR
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVZR
coup = cplHpmcHpmVZR(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hpm], Hppmm
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2=1, 2
m1out = MHpm(gt1)
m2out = MHppmm(gt2)
coup = cplHppmmcHpmcHpm(gt2,i1,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hppmm, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = MHppmm(gt1)
m2out = MVWLm
coup = cplHppmmcHpmcVWLm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hppmm, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = MHppmm(gt1)
m2out = MVWRm
coup = cplHppmmcHpmcVWRm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VWLm, VZ
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVZ
coup = cplcHpmVWLmVZ(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, VZR
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVZR
coup = cplcHpmVWLmVZR(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, VZ
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVZ
coup = cplcHpmVWRmVZ(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, VZR
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVZR
coup = cplcHpmVWRmVZR(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine HpmTwoBodyDecay
 
 
Subroutine AhTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr,MAh(6),MAh2(6),MFd(6),MFd2(6),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),Mhh(6),Mhh2(6),MHpm(6),MHpm2(6),MHppmm(2),MHppmm2(2),MVWLm,             & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(6,6),UCC(2,2),UP(6,6),ZH(6,6)

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2,UV(6,6),            & 
& ZDR(6,6),ZER(3,3),ZUR(3,3),ZDL(6,6),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplPseudoHiggsPP(6),cplPseudoHiggsGG(6),cplAhAhhh(6,6,6),cplcFdFdAhL(6,6,6),          & 
& cplcFdFdAhR(6,6,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),cplcFuFuAhL(3,3,6),           & 
& cplcFuFuAhR(3,3,6),cplFvFvAhL(6,6,6),cplFvFvAhR(6,6,6),cplAhhhVZ(6,6),cplAhhhVZR(6,6), & 
& cplAhHpmcHpm(6,6,6),cplAhHpmcVWLm(6,6),cplAhHpmcVWRm(6,6),cplAhHppmmcHppmm(6,2,2),     & 
& cplAhcVWRmVWLm(6)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Real(dp) :: alpha3 
Iname = Iname + 1 
NameOfUnit(Iname) = 'AhTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 3 
  i_end = 6
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.6) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,6

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MAh(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Ah_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,             & 
& MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,gBL,             & 
& g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,err2,            & 
& etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,          & 
& mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,cplPseudoHiggsPP,cplPseudoHiggsGG,          & 
& cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,cplAhhhVZR,cplAhHpmcHpm,cplAhHpmcVWLm,cplAhHpmcVWRm,   & 
& cplAhHppmmcHppmm,cplAhcVWRmVWLm,deltaM)

i_count = 1 

 
! ----------------------------------------------
! VP, VP
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo128pi3 * Abs(cplPseudoHiggsPP(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VG, VG
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo36pi3 * Abs(cplPseudoHiggsGG(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! hh, Ah
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=3, 6
m1out = Mhh(gt1)
m2out = MAh(gt2)
coup = cplAhAhhh(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2=1, 6
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdAhL(gt1,gt2,i1)
coupR = cplcFdFdAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFeAhL(gt1,gt2,i1)
coupR = cplcFeFeAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuAhL(gt1,gt2,i1)
coupR = cplcFuFuAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fv
! ----------------------------------------------

 
Do gt1= 1, 6
  Do gt2= gt1, 6
m1out = MFv(gt1)
m2out = MFv(gt2)
coupL = cplFvFvAhL(gt1,gt2,i1)
coupR = cplFvFvAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VZ
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = Mhh(gt1)
m2out = MVZ
coup = cplAhhhVZ(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VZR
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = Mhh(gt1)
m2out = MVZR
coup = cplAhhhVZR(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hpm], Hpm
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2=3, 6
m1out = MHpm(gt1)
m2out = MHpm(gt2)
coup = cplAhHpmcHpm(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVWLm
coup = cplAhHpmcVWLm(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVWRm
coup = cplAhHpmcVWRm(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hppmm], Hppmm
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2=1, 2
m1out = MHppmm(gt1)
m2out = MHppmm(gt2)
coup = cplAhHppmmcHppmm(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! VWLm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWRm
coup = cplAhcVWRmVWLm(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  BRAHH(i1,:) = BRAHH(i1,:)/gT(i1) 
  BRAAA(i1,:) = BRAAA(i1,:)/gT(i1) 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
Contains 
 
 Real(dp) Function FFqcd(mf, mA, alpha_s)
  implicit none
   Real(dp) , Intent(in) :: mf, mA, alpha_s
   Real(dp) :: fac, beta, beta2, ratio, R_beta_1, Ln_R_beta_1, Ln_beta

   FFqcd = 0._dp
   ratio = mf / mA
   if (ratio.ge.0.5_dp) return ! decay is kinematically forbitten

   if (ratio.ge.0.495_dp) return ! Coloumb singularity

    beta2 = 1._dp - 4._dp * ratio**2
    beta = Sqrt(beta2)
    
    R_beta_1 = (1. - beta) / (1._dp + beta)
    Ln_beta = Log(beta)
    Ln_R_beta_1 = Log(R_beta_1)

    fac = (19._dp + 2._dp * beta2 + 3._dp * beta**4) / (16._dp * beta)      &
      &     * (-Ln_R_beta_1)                                                &
      & + 0.375_dp * (7._dp - beta2) - 3._dp * Log(4._dp/(1._dp - beta**2)) &
      & - 4._dp * Ln_beta                                                   &
      & + (1._dp + beta**2)                                                 &
      &       * ( 4._dp * Li2(R_beta_1) + 2._dp * Li2(- R_beta_1)           &
      &         + Ln_R_beta_1 * ( 3._dp * Log(2._dp/(1._dp + beta))         &
      &                         + 2._dp * Ln_beta )  ) / beta
    fac =  fac - 3._dp * Log(ratio)  ! absorb large logarithms in mass

    FFqcd = 1._dp + 5._dp * alpha_s * fac * oo3pi 

  end  Function FFqcd
End Subroutine AhTwoBodyDecay
 
 
Subroutine VWLmTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,             & 
& err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,               & 
& xiR,mudl2,mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr,MAh(6),MAh2(6),MFd(6),MFd2(6),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),Mhh(6),Mhh2(6),MHpm(6),MHpm2(6),MHppmm(2),MHppmm2(2),MVWLm,             & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(6,6),UCC(2,2),UP(6,6),ZH(6,6)

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2,UV(6,6),            & 
& ZDR(6,6),ZER(3,3),ZUR(3,3),ZDL(6,6),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplAhHpmcVWLm(6,6),cplAhcVWLmVWRm(6),cplcFuFdcVWLmL(3,6),cplcFuFdcVWLmR(3,6),         & 
& cplhhHpmcVWLm(6,6),cplhhcVWLmVWLm(6),cplhhcVWLmVWRm(6),cplHpmcVWLmVZ(6),               & 
& cplHpmcVWLmVZR(6),cplHppmmcHpmcVWLm(2,6),cplHppmmcVWLmcVWLm(2),cplHppmmcVWLmcVWRm(2),  & 
& cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'VWLmTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = MVWLm 
Call CouplingsFor_VWLm_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,             & 
& err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,               & 
& xiR,mudl2,mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,cplAhHpmcVWLm,cplAhcVWLmVWRm,     & 
& cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplhhHpmcVWLm,cplhhcVWLmVWLm,cplhhcVWLmVWRm,             & 
& cplHpmcVWLmVZ,cplHpmcVWLmVZR,cplHppmmcHpmcVWLm,cplHppmmcVWLmcVWLm,cplHppmmcVWLmcVWRm,  & 
& cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Hpm, Ah
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2=3, 6
m1out = MHpm(gt1)
m2out = MAh(gt2)
coup = cplAhHpmcVWLm(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Ah, VWRm
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MAh(gt1)
m2out = MVWRm
coup = cplAhcVWLmVWRm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! bar[Fu], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 6
m1out = MFu(gt1)
m2out = MFd(gt2)
coupL = cplcFuFdcVWLmL(gt1,gt2)
coupR = cplcFuFdcVWLmR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, hh
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2=1, 6
m1out = MHpm(gt1)
m2out = Mhh(gt2)
coup = cplhhHpmcVWLm(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VWLm
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = Mhh(gt1)
m2out = MVWLm
coup = cplhhcVWLmVWLm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VWRm
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = Mhh(gt1)
m2out = MVWRm
coup = cplhhcVWLmVWRm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VZ
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVZ
coup = cplHpmcVWLmVZ(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VZR
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVZR
coup = cplHpmcVWLmVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hpm], Hppmm
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2=1, 2
m1out = MHpm(gt1)
m2out = MHppmm(gt2)
coup = cplHppmmcHpmcVWLm(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hppmm, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = MHppmm(gt1)
m2out = MVWLm
coup = cplHppmmcVWLmcVWLm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hppmm, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = MHppmm(gt1)
m2out = MVWRm
coup = cplHppmmcVWLmcVWRm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VWLm, VZ
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVZ
coup = cplcVWLmVWLmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, VZR
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVZR
coup = cplcVWLmVWLmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, VZ
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVZ
coup = cplcVWLmVWRmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, VZR
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVZR
coup = cplcVWLmVWRmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine VWLmTwoBodyDecay
 
 
Subroutine VWRmTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,             & 
& err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,               & 
& xiR,mudl2,mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr,MAh(6),MAh2(6),MFd(6),MFd2(6),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),Mhh(6),Mhh2(6),MHpm(6),MHpm2(6),MHppmm(2),MHppmm2(2),MVWLm,             & 
& MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(6,6),UCC(2,2),UP(6,6),ZH(6,6)

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2,UV(6,6),            & 
& ZDR(6,6),ZER(3,3),ZUR(3,3),ZDL(6,6),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Complex(dp) :: cplAhHpmcVWRm(6,6),cplAhcVWRmVWLm(6),cplcFuFdcVWRmL(3,6),cplcFuFdcVWRmR(3,6),         & 
& cplhhHpmcVWRm(6,6),cplhhcVWRmVWLm(6),cplhhcVWRmVWRm(6),cplHpmcVWRmVZ(6),               & 
& cplHpmcVWRmVZR(6),cplHppmmcHpmcVWRm(2,6),cplHppmmcVWLmcVWRm(2),cplHppmmcVWRmcVWRm(2),  & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'VWRmTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = MVWRm 
Call CouplingsFor_VWRm_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MHppmm,MHppmm2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& MVZ,MVZ2,MVZR,MVZR2,PhiW,UV,TW,UC,UCC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,etall,etalr,laml,lamlr,betl,             & 
& err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,               & 
& xiR,mudl2,mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,cplAhHpmcVWRm,cplAhcVWRmVWLm,     & 
& cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplhhHpmcVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,             & 
& cplHpmcVWRmVZ,cplHpmcVWRmVZR,cplHppmmcHpmcVWRm,cplHppmmcVWLmcVWRm,cplHppmmcVWRmcVWRm,  & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Hpm, Ah
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2=3, 6
m1out = MHpm(gt1)
m2out = MAh(gt2)
coup = cplAhHpmcVWRm(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Ah, VWLm
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MAh(gt1)
m2out = MVWLm
coup = cplAhcVWRmVWLm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! bar[Fu], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 6
m1out = MFu(gt1)
m2out = MFd(gt2)
coupL = cplcFuFdcVWRmL(gt1,gt2)
coupR = cplcFuFdcVWRmR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, hh
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2=1, 6
m1out = MHpm(gt1)
m2out = Mhh(gt2)
coup = cplhhHpmcVWRm(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VWLm
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = Mhh(gt1)
m2out = MVWLm
coup = cplhhcVWRmVWLm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VWRm
! ----------------------------------------------

 
Do gt1= 1, 6
m1out = Mhh(gt1)
m2out = MVWRm
coup = cplhhcVWRmVWRm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VZ
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVZ
coup = cplHpmcVWRmVZ(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VZR
! ----------------------------------------------

 
Do gt1= 3, 6
m1out = MHpm(gt1)
m2out = MVZR
coup = cplHpmcVWRmVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hpm], Hppmm
! ----------------------------------------------

 
Do gt1= 3, 6
  Do gt2=1, 2
m1out = MHpm(gt1)
m2out = MHppmm(gt2)
coup = cplHppmmcHpmcVWRm(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hppmm, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = MHppmm(gt1)
m2out = MVWLm
coup = cplHppmmcVWLmcVWRm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hppmm, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = MHppmm(gt1)
m2out = MVWRm
coup = cplHppmmcVWRmcVWRm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VWLm, VZ
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVZ
coup = cplcVWRmVWLmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, VZR
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVZR
coup = cplcVWRmVWLmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, VZ
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVZ
coup = cplcVWRmVWRmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, VZR
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVZR
coup = cplcVWRmVWRmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine VWRmTwoBodyDecay
 
 
Subroutine ScalarToTwoVectorbosonsNew(mS,mV1,mV2,coup,width)
  implicit none
   real(dp), intent(in) :: mS,mV1,mV2
   real(dp), intent(out) :: width
   complex(dp), intent(in) :: coup

   real(dp) :: mSsq,mV1sq, mV2sq,kappa

   if ( abs(mS).le.( abs(mV1)+abs(mV2) ) ) then
    width = 0._dp

   elseif (mV1.eq.0._dp) then
    write(ErrCan,*) 'Server warning, in subroutine ScalarToTwoVectorbosons'
    write(ErrCan,*) 'm_V1 = 0, setting width to 0'
    width = 0._dp

   elseif (mV2.eq.0._dp) then
    write(ErrCan,*) 'Server warning, in subroutine ScalarToTwoVectorbosons'
    write(ErrCan,*) 'm_V2 = 0, setting width to 0'
    width = 0._dp


   elseif (Abs(coup).eq.0._dp) then
    width = 0._dp

   else
    mSsq = mS * mS
    mV1sq = mV1**2
    mV2sq = mV2**2
    kappa = Sqrt( (mSsq-mV1sq-mV2sq)**2 - 4._dp * mV1sq*mV2sq )/(mS**3)
    width = coup**2/(4._dp*mV1sq*mV2sq)*(mV1sq**2 + 10._dp*mV1sq*mV2sq - &
             & 2._dp*(mV1sq+mV2sq)*mSsq + mV2sq**2 +mSsq**2)
    width = oo16Pi*width*kappa

   endif

  End Subroutine ScalarToTwoVectorbosonsNew

Subroutine FermionToFermionVectorBosonMassless(mFin,mFout,mV,coupL,coupR,width)
  implicit none
   real(dp), intent(in) :: mFin,mFout,mV
   real(dp), intent(out) :: width
   complex(dp), intent(in) :: coupL, coupR


   if ( abs(mFin).le.( abs(mFout)+abs(mV) ) ) then
    width = 0._dp

   else

    width = 0.5_dp*oo16Pi*(Abs(coupL)**2 + Abs(coupR)**2)*mFin**3


   endif

  End Subroutine FermionToFermionVectorBosonMassless

End Module SusyDecays_darkLR 
 
