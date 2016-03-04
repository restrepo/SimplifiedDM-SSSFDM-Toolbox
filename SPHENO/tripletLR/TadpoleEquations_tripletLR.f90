! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.7.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 22:08 on 3.3.2016   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_tripletLR 
 
Use Model_Data_tripletLR 
Use SUSYMasses_tripletLR 
Use RGEs_tripletLR 
Use Control 

Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,               & 
& ALP2,LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,             & 
& vd,vu,vR,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,LAMT2,M1,             & 
& M23,mu32,MU22,MU12,vd,vu,vR

Complex(dp),Intent(inout) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp), Intent(in) :: Tad1Loop(3)

! For numerical routines 
Real(dp) :: gC(113)
logical :: broycheck 
Real(dp) :: broyx(3)

If (HighScaleModel.Eq."LOW") Then 
MU12 = (2*LAM1*vd**4 - 4*LAM4*vd**3*vu + 4*LAM4*vd*vu**3 - 2*LAM1*vu**4 + ALP1*vd**2*vR**2 - & 
&  ALP1*vu**2*vR**2 - ALP3*vu**2*vR**2 - 2*vd*Tad1Loop(1) + 2*vu*Tad1Loop(2))/(2*vd**2 - 2*vu**2)
MU22 = (2*LAM4*vd**4 - 8*LAM2*vd**3*vu - 4*LAM3*vd**3*vu + 8*LAM2*vd*vu**3 + 4*LAM3*vd*vu**3 -& 
&  2*LAM4*vu**4 + 2*ALP2*vd**2*vR**2 - ALP3*vd*vu*vR**2 - 2*ALP2*vu**2*vR**2 -           & 
&  2*vu*Tad1Loop(1) + 2*vd*Tad1Loop(2))/(4*vd**2 - 4*vu**2)
mu32 = (-4*ALP2*vd*vu*vR + ALP3*vu**2*vR + ALP1*(vd**2 + vu**2)*vR + 2*RHO1*vR**3 -          & 
&  2*Tad1Loop(3))/(2._dp*vR)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (MU12.ne.MU12) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU12" 
   Call TerminateProgram  
 End If 
 If (MU22.ne.MU22) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU22" 
   Call TerminateProgram  
 End If 
 If (mu32.ne.mu32) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mu32" 
   Call TerminateProgram  
 End If 
 Else 
MU12 = (2*LAM1*vd**4 - 4*LAM4*vd**3*vu + 4*LAM4*vd*vu**3 - 2*LAM1*vu**4 + ALP1*vd**2*vR**2 - & 
&  ALP1*vu**2*vR**2 - ALP3*vu**2*vR**2 - 2*vd*Tad1Loop(1) + 2*vu*Tad1Loop(2))/(2*vd**2 - 2*vu**2)
MU22 = (2*LAM4*vd**4 - 8*LAM2*vd**3*vu - 4*LAM3*vd**3*vu + 8*LAM2*vd*vu**3 + 4*LAM3*vd*vu**3 -& 
&  2*LAM4*vu**4 + 2*ALP2*vd**2*vR**2 - ALP3*vd*vu*vR**2 - 2*ALP2*vu**2*vR**2 -           & 
&  2*vu*Tad1Loop(1) + 2*vd*Tad1Loop(2))/(4*vd**2 - 4*vu**2)
mu32 = (-4*ALP2*vd*vu*vR + ALP3*vu**2*vR + ALP1*(vd**2 + vu**2)*vR + 2*RHO1*vR**3 -          & 
&  2*Tad1Loop(3))/(2._dp*vR)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (MU12.ne.MU12) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU12" 
   Call TerminateProgram  
 End If 
 If (MU22.ne.MU22) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU22" 
   Call TerminateProgram  
 End If 
 If (mu32.ne.mu32) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mu32" 
   Call TerminateProgram  
 End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,              & 
& LAM4,LAM2,LAM3,LAMT1,YDR,YL1,YQ1,LAMT2,YL2,YQ2,M1,M23,mu32,MU22,MU12,vd,               & 
& vu,vR,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,LAMT1,LAMT2,M1,             & 
& M23,mu32,MU22,MU12,vd,vu,vR

Complex(dp),Intent(in) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Complex(dp), Intent(in) :: Tad1Loop(3)

Real(dp), Intent(out) :: TadpoleValues(3)

TadpoleValues(1) = Real(LAM1*vd**3 - 3*LAM4*vd**2*vu - (vd*(2._dp*(MU12)              & 
&  - 2*(LAM1 + 4._dp*(LAM2) + 2._dp*(LAM3))*vu**2 - ALP1*vR**2))/2._dp - vu*(-2._dp*(MU22)& 
&  + LAM4*vu**2 + ALP2*vR**2) - Tad1Loop(1),dp) 
TadpoleValues(2) = Real((-2*LAM4*vd**3 + 2*(LAM1 + 4._dp*(LAM2) + 2._dp*(LAM3))       & 
& *vd**2*vu + vd*(4._dp*(MU22) - 6*LAM4*vu**2 - 2*ALP2*vR**2) + vu*(-2._dp*(MU12)        & 
&  + 2*LAM1*vu**2 + (ALP1 + ALP3)*vR**2))/2._dp - Tad1Loop(2),dp) 
TadpoleValues(3) = Real((vR*(-2._dp*(mu32) + ALP1*vd**2 - 4*ALP2*vd*vu + (ALP1 + ALP3)& 
& *vu**2 + 2*RHO1*vR**2))/2._dp - Tad1Loop(3),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_tripletLR 
 
