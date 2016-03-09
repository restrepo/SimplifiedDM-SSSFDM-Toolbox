! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 10:16 on 9.3.2016   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_DMLR 
 
Use Model_Data_DMLR 
Use SUSYMasses_DMLR 
Use RGEs_DMLR 
Use Control 

Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,           & 
& BETA2,LAM3,YDR,YL1,YDL,YQ1,mudl2,mudr2,MU12,v1,v2,vtl,vtr,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: gBL,g2,gR,g3,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,MU12,v1,v2,vtl,vtr

Complex(dp),Intent(inout) :: rh3,YDR(3,3),YL1(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2

Complex(dp), Intent(in) :: Tad1Loop(4)

! For numerical routines 
Real(dp) :: gC(94)
logical :: broycheck 
Real(dp) :: broyx(4)

If (HighScaleModel.Eq."LOW") Then 
MU12 = (-2*LAM1*(v1**4 - v2**4) + ALP3*v2**2*vtl**2 + 2*BETA2*v1**2*vtl*vtr + ALP3*v2**2*vtr**2 -& 
&  ALP1*(v1**2 - v2**2)*(vtl**2 + vtr**2) + 2*v1*Tad1Loop(1) - 2*v2*Tad1Loop(2))/(2._dp*(v1**2 - v2**2))
LAM3 = -((ALP3*v1*v2*vtl**2 + 2*BETA2*v1*v2*vtl*vtr + ALP3*v1*v2*vtr**2 + 2*v2*Tad1Loop(1) - & 
&  2*v1*Tad1Loop(2))/(4*v1**3*v2 - 4*v1*v2**3))
mudl2 = -(ALP3*v2**2*vtl + ALP1*(v1**2 + v2**2)*vtl + 2*RHO1*vtl**3 - BETA2*v1**2*vtr +       & 
&  rh3*vtl*vtr**2 - 2*Tad1Loop(3))/(2._dp*vtl)
mudr2 = -(-(BETA2*v1**2*vtl) + ALP3*v2**2*vtr + ALP1*(v1**2 + v2**2)*vtr + rh3*vtl**2*vtr +   & 
&  2*RHO1*vtr**3 - 2*Tad1Loop(4))/(2._dp*vtr)

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
 Else 
MU12 = (-2*LAM1*(v1**4 - v2**4) + ALP3*v2**2*vtl**2 + 2*BETA2*v1**2*vtl*vtr + ALP3*v2**2*vtr**2 -& 
&  ALP1*(v1**2 - v2**2)*(vtl**2 + vtr**2) + 2*v1*Tad1Loop(1) - 2*v2*Tad1Loop(2))/(2._dp*(v1**2 - v2**2))
LAM3 = -((ALP3*v1*v2*vtl**2 + 2*BETA2*v1*v2*vtl*vtr + ALP3*v1*v2*vtr**2 + 2*v2*Tad1Loop(1) - & 
&  2*v1*Tad1Loop(2))/(4*v1**3*v2 - 4*v1*v2**3))
mudl2 = -(ALP3*v2**2*vtl + ALP1*(v1**2 + v2**2)*vtl + 2*RHO1*vtl**3 - BETA2*v1**2*vtr +       & 
&  rh3*vtl*vtr**2 - 2*Tad1Loop(3))/(2._dp*vtl)
mudr2 = -(-(BETA2*v1**2*vtl) + ALP3*v2**2*vtr + ALP1*(v1**2 + v2**2)*vtr + rh3*vtl**2*vtr +   & 
&  2*RHO1*vtr**3 - 2*Tad1Loop(4))/(2._dp*vtr)

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
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,               & 
& BETA2,LAM3,YDR,YL1,YDL,YQ1,mudl2,mudr2,MU12,v1,v2,vtl,vtr,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: gBL,g2,gR,g3,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,MU12,v1,v2,vtl,vtr

Complex(dp),Intent(in) :: rh3,YDR(3,3),YL1(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2

Complex(dp), Intent(in) :: Tad1Loop(4)

Real(dp), Intent(out) :: TadpoleValues(4)

TadpoleValues(1) = Real((v1*(2._dp*(MU12) + 2*LAM1*v1**2 + 2*(LAM1 + 2._dp*(LAM3))    & 
& *v2**2 + ALP1*vtl**2 - 2*BETA2*vtl*vtr + ALP1*vtr**2))/2._dp - Tad1Loop(1),dp) 
TadpoleValues(2) = Real((v2*(2._dp*(MU12) + 2*(LAM1 + 2._dp*(LAM3))*v1**2 + 2*LAM1*v2**2 + ALP1*vtl**2 + ALP3*vtl**2 + ALP1*vtr**2 + ALP3*vtr**2))& 
& /2._dp - Tad1Loop(2),dp) 
TadpoleValues(3) = Real((2*RHO1*vtl**3 - BETA2*v1**2*vtr + vtl*(2._dp*(mudl2)         & 
&  + ALP1*v1**2 + (ALP1 + ALP3)*v2**2 + rh3*vtr**2))/2._dp - Tad1Loop(3),dp) 
TadpoleValues(4) = Real((v1**2*(-(BETA2*vtl) + ALP1*vtr) + vtr*(2._dp*(mudr2)         & 
&  + (ALP1 + ALP3)*v2**2 + rh3*vtl**2 + 2*RHO1*vtr**2))/2._dp - Tad1Loop(4),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_DMLR 
 
