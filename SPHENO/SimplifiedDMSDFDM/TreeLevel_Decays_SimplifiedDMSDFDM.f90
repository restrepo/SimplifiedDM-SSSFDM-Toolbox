! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 15:48 on 26.7.2016   
! ----------------------------------------------------------------------  
 
 
Module TreeLevelDecays_SimplifiedDMSDFDM
 
Use Control 
Use DecayFunctions 
Use LoopCouplings_SimplifiedDMSDFDM 
Use CouplingsForDecays_SimplifiedDMSDFDM 
Use Model_Data_SimplifiedDMSDFDM 
Use Mathematics, Only: Li2 
 
 Contains 
 
  
Subroutine FuTwoBodyDecay(i_in,deltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lamd,lamu,MDF,v,MAh,MAh2,MChi(3),MChi2(3),MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFre,MFre2,MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZZ(2,2)

Complex(dp),Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),Mn,mH2,ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),              & 
& ZEL(3,3),ZUL(3,3),ZW(2,2),ZX(3,3)

Complex(dp) :: cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),& 
& cplcFuFuVZR(3,3)

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
Call CouplingsFor_Fu_decays_2B(m_in,i1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,cplcFuFdVWpL,   & 
& cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fd, VWp
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFd(gt1)
m2out = MVWp
coupL = cplcFuFdVWpL(i1,gt1)
coupR = cplcFuFdVWpR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.3) Then 
  BR_tWb = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, hh
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = Mhh
coupL = cplcFuFuhhL(i1,gt1)
coupR = cplcFuFuhhR(i1,gt1)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
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
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FuTwoBodyDecay
 
 
Subroutine FeTwoBodyDecay(i_in,deltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lamd,lamu,MDF,v,MAh,MAh2,MChi(3),MChi2(3),MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFre,MFre2,MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZZ(2,2)

Complex(dp),Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),Mn,mH2,ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),              & 
& ZEL(3,3),ZUL(3,3),ZW(2,2),ZX(3,3)

Complex(dp) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcVWpL(3,3),& 
& cplcFeFvcVWpR(3,3)

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
Call CouplingsFor_Fe_decays_2B(m_in,i1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,cplcFeFehhL,    & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcVWpL,cplcFeFvcVWpR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fe, hh
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFe(gt1)
m2out = Mhh
coupL = cplcFeFehhL(i1,gt1)
coupR = cplcFeFehhR(i1,gt1)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
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
! Fv, conj[VWp]
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = 0.
m2out = MVWp
coupL = cplcFeFvcVWpL(i1,gt1)
coupR = cplcFeFvcVWpR(i1,gt1)
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
 
End Subroutine FeTwoBodyDecay
 
 
Subroutine FdTwoBodyDecay(i_in,deltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lamd,lamu,MDF,v,MAh,MAh2,MChi(3),MChi2(3),MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFre,MFre2,MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZZ(2,2)

Complex(dp),Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),Mn,mH2,ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),              & 
& ZEL(3,3),ZUL(3,3),ZW(2,2),ZX(3,3)

Complex(dp) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3)

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
m_in = MFd(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fd_decays_2B(m_in,i1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,cplcFdFdhhL,    & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucVWpL,cplcFdFucVWpR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fd, hh
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFd(gt1)
m2out = Mhh
coupL = cplcFdFdhhL(i1,gt1)
coupR = cplcFdFdhhR(i1,gt1)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fd, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
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
! Fu, conj[VWp]
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = MVWp
coupL = cplcFdFucVWpL(i1,gt1)
coupR = cplcFdFucVWpR(i1,gt1)
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
 
 
Subroutine FvTwoBodyDecay(i_in,deltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lamd,lamu,MDF,v,MAh,MAh2,MChi(3),MChi2(3),MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFre,MFre2,MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZZ(2,2)

Complex(dp),Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),Mn,mH2,ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),              & 
& ZEL(3,3),ZUL(3,3),ZW(2,2),ZX(3,3)

Complex(dp) :: cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

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
m_in = 0. 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fv_decays_2B(m_in,i1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,cplcFvFeVWpL,   & 
& cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fe, VWp
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFe(gt1)
m2out = MVWp
coupL = cplcFvFeVWpL(i1,gt1)
coupR = cplcFvFeVWpR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fv, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = 0.
m2out = MVZ
coupL = cplcFvFvVZL(i1,gt1)
coupR = cplcFvFvVZR(i1,gt1)
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
 
 
Subroutine VZTwoBodyDecay(i_in,deltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lamd,lamu,MDF,v,MAh,MAh2,MChi(3),MChi2(3),MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFre,MFre2,MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZZ(2,2)

Complex(dp),Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),Mn,mH2,ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),              & 
& ZEL(3,3),ZUL(3,3),ZW(2,2),ZX(3,3)

Complex(dp) :: cplChiChiVZL(3,3),cplChiChiVZR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFreFreVZL,cplcFreFreVZR,cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),        & 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplhhVZVZ,cplcVWpVWpVZ

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
Call CouplingsFor_VZ_decays_2B(m_in,i1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,cplChiChiVZL,   & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFreFreVZL,            & 
& cplcFreFreVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,               & 
& cplcVWpVWpVZ,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Chi, Chi
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2= gt1, 3
m1out = MChi(gt1)
m2out = MChi(gt2)
coupL = cplChiChiVZL(gt1,gt2)
coupR = cplChiChiVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
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
! bar[Fre], Fre
! ----------------------------------------------

 
m1out = MFre
m2out = MFre
coupL = cplcFreFreVZL
coupR = cplcFreFreVZR
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
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
! bar[Fv], Fv
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = 0.
m2out = 0.
coupL = cplcFvFvVZL(gt1,gt2)
coupR = cplcFvFvVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VZ
! ----------------------------------------------

 
m1out = Mhh
m2out = MVZ
coup = cplhhVZVZ
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWp, conj[VWp]
! ----------------------------------------------

 
m1out = MVWp
m2out = MVWp
coup = cplcVWpVWpVZ
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
 
 
Subroutine VWpTwoBodyDecay(i_in,deltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lamd,lamu,MDF,v,MAh,MAh2,MChi(3),MChi2(3),MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFre,MFre2,MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZZ(2,2)

Complex(dp),Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),Mn,mH2,ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),              & 
& ZEL(3,3),ZUL(3,3),ZW(2,2),ZX(3,3)

Complex(dp) :: cplcFreChicVWpL(3),cplcFreChicVWpR(3),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),          & 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplhhcVWpVWp,cplcVWpVWpVZ

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'VWpTwoBodyDecay'
 
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
m_in = MVWp 
Call CouplingsFor_VWp_decays_2B(m_in,i1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,             & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,cplcFreChicVWpL,& 
& cplcFreChicVWpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,               & 
& cplhhcVWpVWp,cplcVWpVWpVZ,deltaM)

i_count = 1 

 
! ----------------------------------------------
! bar[Fre], Chi
! ----------------------------------------------

 
  Do gt2=1, 3
m1out = MFre
m2out = MChi(gt2)
coupL = cplcFreChicVWpL(gt2)
coupR = cplcFreChicVWpR(gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
End Do 
 

 
! ----------------------------------------------
! bar[Fd], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFd(gt1)
m2out = MFu(gt2)
coupL = cplcFdFucVWpL(gt1,gt2)
coupR = cplcFdFucVWpR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fv
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = 0.
coupL = cplcFeFvcVWpL(gt1,gt2)
coupR = cplcFeFvcVWpR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VWp
! ----------------------------------------------

 
m1out = Mhh
m2out = MVWp
coup = cplhhcVWpVWp
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWp, VZ
! ----------------------------------------------

 
m1out = MVWp
m2out = MVZ
coup = cplcVWpVWpVZ
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
 
End Subroutine VWpTwoBodyDecay
 
 
Subroutine hhTwoBodyDecay(i_in,deltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lamd,lamu,MDF,v,MAh,MAh2,MChi(3),MChi2(3),MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFre,MFre2,MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZZ(2,2)

Complex(dp),Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),Mn,mH2,ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),              & 
& ZEL(3,3),ZUL(3,3),ZW(2,2),ZX(3,3)

Complex(dp) :: cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cplChiChihhL(3,3),cplChiChihhR(3,3),& 
& cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFuFuhhL(3,3),  & 
& cplcFuFuhhR(3,3),cplhhhhhh,cplhhcVWpVWp,cplhhVZVZ

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
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
m_in = Mhh 
Call CouplingsFor_hh_decays_2B(m_in,i1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,cplHiggsPP,     & 
& cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplhhhhhh,cplhhcVWpVWp,    & 
& cplhhVZVZ,deltaM)

!alpha3 = AlphaSDR(m_in,MFd,MFu) 
alpha3 = g3running**2/(4._dp*Pi) 
i_count = 1 

 
! ----------------------------------------------
! VP, VP
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo128pi3 * Abs(cplHiggsPP)**2 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VG, VG
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo36pi3 * Abs(cplHiggsGG)**2 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
If (m_in.le.2._dp*m1out) Then 
coupReal = cplHiggsZZvirt
Call ScalarToVectorBosonsVR(m_in,m1out,coupReal,gam) 
Else 
gam = 0._dp 
End if 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWp, VWp
! ----------------------------------------------

 
m1out = MVWp
m2out = MVWp
If (m_in.le.2._dp*m1out) Then 
coupReal = cplHiggsWWvirt
Call ScalarToVectorBosonsVR(m_in,m1out,coupReal,gam) 
Else 
gam = 0._dp 
End if 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Chi, Chi
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2= gt1, 3
m1out = MChi(gt1)
m2out = MChi(gt2)
coupL = cplChiChihhL(gt1,gt2)
coupR = cplChiChihhR(gt1,gt2)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdhhL(gt1,gt2)
coupR = cplcFdFdhhR(gt1,gt2)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gam = gam * FFqcd(m1out,m_in,alpha3) 
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
coupL = cplcFeFehhL(gt1,gt2)
coupR = cplcFeFehhR(gt1,gt2)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
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
coupL = cplcFuFuhhL(gt1,gt2)
coupR = cplcFuFuhhR(gt1,gt2)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gam = gam * FFqcd(m1out,m_in,alpha3) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, hh
! ----------------------------------------------

 
m1out = Mhh
m2out = Mhh
coup = cplhhhhhh
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
  BRHHH(1,1) = gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWp, conj[VWp]
! ----------------------------------------------

 
m1out = MVWp
m2out = MVWp
coup = cplhhcVWpVWp
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
coup = cplhhVZVZ
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  BRHHH(1,1) = BRHHH(1,1)/gT 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
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
 
 
Subroutine ChiTwoBodyDecay(i_in,deltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lamd,lamu,MDF,v,MAh,MAh2,MChi(3),MChi2(3),MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFre,MFre2,MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZZ(2,2)

Complex(dp),Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),Mn,mH2,ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),              & 
& ZEL(3,3),ZUL(3,3),ZW(2,2),ZX(3,3)

Complex(dp) :: cplChiChihhL(3,3),cplChiChihhR(3,3),cplChiChiVZL(3,3),cplChiChiVZR(3,3),              & 
& cplChiFreVWpL(3),cplChiFreVWpR(3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'ChiTwoBodyDecay'
 
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
m_in = MChi(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Chi_decays_2B(m_in,i1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,             & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFreVWpL,cplChiFreVWpR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Chi, hh
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MChi(gt1)
m2out = Mhh
coupL = cplChiChihhL(i1,gt1)
coupR = cplChiChihhR(i1,gt1)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Chi, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MChi(gt1)
m2out = MVZ
coupL = cplChiChiVZL(i1,gt1)
coupR = cplChiChiVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fre, VWp
! ----------------------------------------------

 
m1out = MFre
m2out = MVWp
coupL = cplChiFreVWpL(i1)
coupR = cplChiFreVWpR(i1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine ChiTwoBodyDecay
 
 
Subroutine FreTwoBodyDecay(i_in,deltaM,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lamd,lamu,MDF,v,MAh,MAh2,MChi(3),MChi2(3),MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFre,MFre2,MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZZ(2,2)

Complex(dp),Intent(in) :: lam1,Yu(3,3),Yd(3,3),Ye(3,3),Mn,mH2,ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),              & 
& ZEL(3,3),ZUL(3,3),ZW(2,2),ZX(3,3)

Complex(dp) :: cplcFreChicVWpL(3),cplcFreChicVWpR(3),cplcFreFreVZL,cplcFreFreVZR

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FreTwoBodyDecay'
 
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
m_in = MFre 
Call CouplingsFor_Fre_decays_2B(m_in,i1,MAh,MAh2,MChi,MChi2,MFd,MFd2,MFe,             & 
& MFe2,MFre,MFre2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,             & 
& ZUR,ZDL,ZEL,ZUL,ZW,ZX,ZZ,g1,g2,g3,lam1,Yu,Yd,Ye,lamd,lamu,Mn,MDF,mH2,v,cplcFreChicVWpL,& 
& cplcFreChicVWpR,cplcFreFreVZL,cplcFreFreVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Chi, conj[VWp]
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MChi(gt1)
m2out = MVWp
coupL = cplcFreChicVWpL(gt1)
coupR = cplcFreChicVWpR(gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fre, VZ
! ----------------------------------------------

 
m1out = MFre
m2out = MVZ
coupL = cplcFreFreVZL
coupR = cplcFreFreVZR
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine FreTwoBodyDecay
 
 
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

End Module TreeLevelDecays_SimplifiedDMSDFDM 
 
