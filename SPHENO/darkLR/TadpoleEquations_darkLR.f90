! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.7.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 20:21 on 1.3.2016   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_darkLR 
 
Use Model_Data_darkLR 
Use SUSYMasses_darkLR 
Use RGEs_darkLR 
Use Control 

Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,            & 
& LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,           & 
& YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,             & 
& vhl,vhr,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr

Complex(dp),Intent(inout) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2

Complex(dp), Intent(in) :: Tad1Loop(6)

! For numerical routines 
Real(dp) :: gC(161)
logical :: broycheck 
Real(dp) :: broyx(6)

If (HighScaleModel.Eq."LOW") Then 
MU12 = (-2*LAM1*(v1**4 - v2**4) + betl*(-v1**2 + v2**2)*vhl**2 - betr*v1**2*vhr**2 +         & 
&  betr*v2**2*vhr**2 - ALP1*v1**2*vtl**2 + ALP1*v2**2*vtl**2 + ALP3*v2**2*vtl**2 -       & 
&  alp*v2*vhl*vhr*vtr + 2*BETA2*v1**2*vtl*vtr - ALP1*v1**2*vtr**2 + ALP1*v2**2*vtr**2 +  & 
&  ALP3*v2**2*vtr**2 + sqrt(2._dp)*v2*vhl*vhr*xiLR + 2*v1*Tad1Loop(1) - 2*v2*Tad1Loop(2))/(2._dp*(v1**2 - v2**2))
LAM3 = -((ALP3*v1*v2*vtl**2 - alp*v1*vhl*vhr*vtr + 2*BETA2*v1*v2*vtl*vtr + ALP3*v1*v2*vtr**2 +& 
&  sqrt(2._dp)*v1*vhl*vhr*xiLR + 2*v2*Tad1Loop(1) - 2*v1*Tad1Loop(2))/(4*v1**3*v2 -      & 
&  4*v1*v2**3))
mudl2 = -(ALP3*v2**2*vtl + ALP1*(v1**2 + v2**2)*vtl + etall*vhl**2*vtl + etarl*vhr**2*vtl +   & 
&  2*RHO1*vtl**3 - BETA2*v1**2*vtr + rh3*vtl*vtr**2 - 2*Tad1Loop(4))/(2._dp*vtl)
mudr2 = -(-(alp*v2*vhl*vhr) - BETA2*v1**2*vtl + ALP1*v1**2*vtr + ALP1*v2**2*vtr +             & 
&  ALP3*v2**2*vtr + etalr*vhl**2*vtr - err2*vhr**2*vtr + etarr*vhr**2*vtr +              & 
&  rh3*vtl**2*vtr + 2*RHO1*vtr**3 - sqrt(2._dp)*vhr**2*xiR - 2*Tad1Loop(6))/(2._dp*vtr)
mul2 = -(betl*(v1**2 + v2**2)*vhl + 2*laml*vhl**3 + lamlr*vhl*vhr**2 + etall*vhl*vtl**2 -    & 
&  alp*v2*vhr*vtr + etalr*vhl*vtr**2 + sqrt(2._dp)*v2*vhr*xiLR - 2*Tad1Loop(3))/(2._dp*vhl)
mur2 = -(betr*(v1**2 + v2**2)*vhr + lamlr*vhl**2*vhr + 2*lamr*vhr**3 + etarl*vhr*vtl**2 -    & 
&  alp*v2*vhl*vtr - err2*vhr*vtr**2 + etarr*vhr*vtr**2 + sqrt(2._dp)*v2*vhl*xiLR -       & 
&  2*sqrt(2._dp)*vhr*vtr*xiR - 2*Tad1Loop(5))/(2._dp*vhr)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (MU12.ne.MU12) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU12" 
   Call TerminateProgram  
 End If 
 If (LAM3.ne.LAM3) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for LAM3" 
   Call TerminateProgram  
 End If 
 If (Real(mudl2,dp).ne.Real(mudl2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mudl2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mudl2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mudl2" 
   !Call TerminateProgram  
   mudl2 = Real(mudl2,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(mudr2,dp).ne.Real(mudr2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mudr2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mudr2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mudr2" 
   !Call TerminateProgram  
   mudr2 = Real(mudr2,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(mul2,dp).ne.Real(mul2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mul2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mul2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mul2" 
   !Call TerminateProgram  
   mul2 = Real(mul2,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(mur2,dp).ne.Real(mur2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mur2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mur2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mur2" 
   !Call TerminateProgram  
   mur2 = Real(mur2,dp) 
  SignOfMuChanged= .True. 
End If 
 Else 
MU12 = (-2*LAM1*(v1**4 - v2**4) + betl*(-v1**2 + v2**2)*vhl**2 - betr*v1**2*vhr**2 +         & 
&  betr*v2**2*vhr**2 - ALP1*v1**2*vtl**2 + ALP1*v2**2*vtl**2 + ALP3*v2**2*vtl**2 -       & 
&  alp*v2*vhl*vhr*vtr + 2*BETA2*v1**2*vtl*vtr - ALP1*v1**2*vtr**2 + ALP1*v2**2*vtr**2 +  & 
&  ALP3*v2**2*vtr**2 + sqrt(2._dp)*v2*vhl*vhr*xiLR + 2*v1*Tad1Loop(1) - 2*v2*Tad1Loop(2))/(2._dp*(v1**2 - v2**2))
LAM3 = -((ALP3*v1*v2*vtl**2 - alp*v1*vhl*vhr*vtr + 2*BETA2*v1*v2*vtl*vtr + ALP3*v1*v2*vtr**2 +& 
&  sqrt(2._dp)*v1*vhl*vhr*xiLR + 2*v2*Tad1Loop(1) - 2*v1*Tad1Loop(2))/(4*v1**3*v2 -      & 
&  4*v1*v2**3))
mudl2 = -(ALP3*v2**2*vtl + ALP1*(v1**2 + v2**2)*vtl + etall*vhl**2*vtl + etarl*vhr**2*vtl +   & 
&  2*RHO1*vtl**3 - BETA2*v1**2*vtr + rh3*vtl*vtr**2 - 2*Tad1Loop(4))/(2._dp*vtl)
mudr2 = -(-(alp*v2*vhl*vhr) - BETA2*v1**2*vtl + ALP1*v1**2*vtr + ALP1*v2**2*vtr +             & 
&  ALP3*v2**2*vtr + etalr*vhl**2*vtr - err2*vhr**2*vtr + etarr*vhr**2*vtr +              & 
&  rh3*vtl**2*vtr + 2*RHO1*vtr**3 - sqrt(2._dp)*vhr**2*xiR - 2*Tad1Loop(6))/(2._dp*vtr)
mul2 = -(betl*(v1**2 + v2**2)*vhl + 2*laml*vhl**3 + lamlr*vhl*vhr**2 + etall*vhl*vtl**2 -    & 
&  alp*v2*vhr*vtr + etalr*vhl*vtr**2 + sqrt(2._dp)*v2*vhr*xiLR - 2*Tad1Loop(3))/(2._dp*vhl)
mur2 = -(betr*(v1**2 + v2**2)*vhr + lamlr*vhl**2*vhr + 2*lamr*vhr**3 + etarl*vhr*vtl**2 -    & 
&  alp*v2*vhl*vtr - err2*vhr*vtr**2 + etarr*vhr*vtr**2 + sqrt(2._dp)*v2*vhl*xiLR -       & 
&  2*sqrt(2._dp)*vhr*vtr*xiR - 2*Tad1Loop(5))/(2._dp*vhr)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (MU12.ne.MU12) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU12" 
   Call TerminateProgram  
 End If 
 If (LAM3.ne.LAM3) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for LAM3" 
   Call TerminateProgram  
 End If 
 If (Real(mudl2,dp).ne.Real(mudl2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mudl2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mudl2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mudl2" 
   !Call TerminateProgram  
   mudl2 = Real(mudl2,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(mudr2,dp).ne.Real(mudr2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mudr2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mudr2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mudr2" 
   !Call TerminateProgram  
   mudr2 = Real(mudr2,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(mul2,dp).ne.Real(mul2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mul2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mul2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mul2" 
   !Call TerminateProgram  
   mul2 = Real(mul2,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(mur2,dp).ne.Real(mur2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mur2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mur2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mur2" 
   !Call TerminateProgram  
   mur2 = Real(mur2,dp) 
  SignOfMuChanged= .True. 
End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,           & 
& etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,            & 
& YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,             & 
& vhr,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr

Complex(dp),Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2

Complex(dp), Intent(in) :: Tad1Loop(6)

Real(dp), Intent(out) :: TadpoleValues(6)

TadpoleValues(1) = Real((v1*(2._dp*(MU12) + 2*LAM1*v1**2 + 2*(LAM1 + 2._dp*(LAM3))    & 
& *v2**2 + betl*vhl**2 + betr*vhr**2 + ALP1*vtl**2 - 2*BETA2*vtl*vtr + ALP1*vtr**2))     & 
& /2._dp - Tad1Loop(1),dp) 
TadpoleValues(2) = Real((2*LAM1*v2**3 + v2*(2._dp*(MU12) + 2*(LAM1 + 2._dp*(LAM3))    & 
& *v1**2 + betl*vhl**2 + betr*vhr**2 + ALP1*vtl**2 + ALP3*vtl**2 + ALP1*vtr**2 + ALP3*vtr**2)& 
&  + vhl*vhr*(-(alp*vtr) + sqrt(2._dp)*xiLR))/2._dp - Tad1Loop(2),dp) 
TadpoleValues(3) = Real((2*RHO1*vtl**3 - BETA2*v1**2*vtr + vtl*(2._dp*(mudl2)         & 
&  + ALP1*v1**2 + (ALP1 + ALP3)*v2**2 + etall*vhl**2 + etarl*vhr**2 + rh3*vtr**2))       & 
& /2._dp - Tad1Loop(4),dp) 
TadpoleValues(4) = Real((-(alp*v2*vhl*vhr) - BETA2*v1**2*vtl + 2*mudr2*vtr + ALP1*v1**2*vtr + (ALP1 + ALP3)& 
& *v2**2*vtr + etalr*vhl**2*vtr + rh3*vtl**2*vtr + 2*RHO1*vtr**3 - vhr**2*((err2 - etarr)& 
& *vtr + sqrt(2._dp)*xiR))/2._dp - Tad1Loop(6),dp) 
TadpoleValues(5) = Real((2*laml*vhl**3 + vhl*(2._dp*(mul2) + betl*v1**2 + betl*v2**2 + lamlr*vhr**2 + etall*vtl**2 + etalr*vtr**2)& 
&  + v2*vhr*(-(alp*vtr) + sqrt(2._dp)*xiLR))/2._dp - Tad1Loop(3),dp) 
TadpoleValues(6) = Real((betr*v2**2*vhr + v2*vhl*(-(alp*vtr) + sqrt(2._dp)            & 
& *xiLR) + vhr*(2._dp*(mur2) + betr*v1**2 + lamlr*vhl**2 + 2*lamr*vhr**2 + etarl*vtl**2 - err2*vtr**2 + etarr*vtr**2 - 2*sqrt(2._dp)& 
& *vtr*xiR))/2._dp - Tad1Loop(5),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_darkLR 
 
