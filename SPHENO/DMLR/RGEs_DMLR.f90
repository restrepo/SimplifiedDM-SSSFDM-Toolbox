! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 13:57 on 24.3.2016   
! ----------------------------------------------------------------------  
 
 
Module RGEs_DMLR 
 
Use Control 
Use Model_Data_DMLR 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters107(g,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12)

Implicit None 
Real(dp), Intent(in) :: g(107) 
Real(dp),Intent(out) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,MU12

Complex(dp),Intent(out) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters107' 
 
gBL= g(1) 
g2= g(2) 
gR= g(3) 
g3= g(4) 
RHO2= g(5) 
RHO1= g(6) 
ALP1= g(7) 
LAM1= g(8) 
ALP3= g(9) 
ALP2= g(10) 
LAM4= g(11) 
LAM2= g(12) 
LAM3= g(13) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YDR(i1,i2) = Cmplx( g(SumI+14), g(SumI+15), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YL1(i1,i2) = Cmplx( g(SumI+32), g(SumI+33), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ1(i1,i2) = Cmplx( g(SumI+50), g(SumI+51), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YL2(i1,i2) = Cmplx( g(SumI+68), g(SumI+69), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ2(i1,i2) = Cmplx( g(SumI+86), g(SumI+87), dp) 
End Do 
 End Do 
 
M23= g(104) 
mu32= g(105) 
MU22= g(106) 
MU12= g(107) 
Do i1=1,107 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters107

Subroutine ParametersToG107(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,               & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,g)

Implicit None 
Real(dp), Intent(out) :: g(107) 
Real(dp), Intent(in) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,MU12

Complex(dp), Intent(in) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG107' 
 
g(1) = gBL  
g(2) = g2  
g(3) = gR  
g(4) = g3  
g(5) = RHO2  
g(6) = RHO1  
g(7) = ALP1  
g(8) = LAM1  
g(9) = ALP3  
g(10) = ALP2  
g(11) = LAM4  
g(12) = LAM2  
g(13) = LAM3  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+14) = Real(YDR(i1,i2), dp) 
g(SumI+15) = Aimag(YDR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+32) = Real(YL1(i1,i2), dp) 
g(SumI+33) = Aimag(YL1(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+50) = Real(YQ1(i1,i2), dp) 
g(SumI+51) = Aimag(YQ1(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+68) = Real(YL2(i1,i2), dp) 
g(SumI+69) = Aimag(YL2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+86) = Real(YQ2(i1,i2), dp) 
g(SumI+87) = Aimag(YQ2(i1,i2)) 
End Do 
End Do 

g(104) = M23  
g(105) = mu32  
g(106) = MU22  
g(107) = MU12  
Iname = Iname - 1 
 
End Subroutine ParametersToG107

Subroutine rge107(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: gBL,betagBL1,betagBL2,DgBL,g2,betag21,betag22,Dg2,gR,betagR1,             & 
& betagR2,DgR,g3,betag31,betag32,Dg3,RHO2,betaRHO21,betaRHO22,DRHO2,RHO1,betaRHO11,      & 
& betaRHO12,DRHO1,ALP1,betaALP11,betaALP12,DALP1,LAM1,betaLAM11,betaLAM12,               & 
& DLAM1,ALP3,betaALP31,betaALP32,DALP3,ALP2,betaALP21,betaALP22,DALP2,LAM4,              & 
& betaLAM41,betaLAM42,DLAM4,LAM2,betaLAM21,betaLAM22,DLAM2,LAM3,betaLAM31,               & 
& betaLAM32,DLAM3,M23,betaM231,betaM232,DM23,mu32,betamu321,betamu322,Dmu32,             & 
& MU22,betaMU221,betaMU222,DMU22,MU12,betaMU121,betaMU122,DMU12
Complex(dp) :: YDR(3,3),betaYDR1(3,3),betaYDR2(3,3),DYDR(3,3),adjYDR(3,3)             & 
& ,YL1(3,3),betaYL11(3,3),betaYL12(3,3),DYL1(3,3),adjYL1(3,3),YQ1(3,3),betaYQ11(3,3)     & 
& ,betaYQ12(3,3),DYQ1(3,3),adjYQ1(3,3),YL2(3,3),betaYL21(3,3),betaYL22(3,3)              & 
& ,DYL2(3,3),adjYL2(3,3),YQ2(3,3),betaYQ21(3,3),betaYQ22(3,3),DYQ2(3,3),adjYQ2(3,3)
Iname = Iname +1 
NameOfUnit(Iname) = 'rge107' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters107(gy,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,             & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12)

Call Adjungate(YDR,adjYDR)
Call Adjungate(YL1,adjYL1)
Call Adjungate(YQ1,adjYQ1)
Call Adjungate(YL2,adjYL2)
Call Adjungate(YQ2,adjYQ2)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! gBL 
!-------------------- 
 
betagBL1  = 0

 
 
If (TwoLoopRGE) Then 
betagBL2 = 0

 
DgBL = oo16pi2*( betagBL1 + oo16pi2 * betagBL2 ) 

 
Else 
DgBL = oo16pi2* betagBL1 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! gR 
!-------------------- 
 
betagR1  = 0

 
 
If (TwoLoopRGE) Then 
betagR2 = 0

 
DgR = oo16pi2*( betagR1 + oo16pi2 * betagR2 ) 

 
Else 
DgR = oo16pi2* betagR1 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! RHO2 
!-------------------- 
 
betaRHO21  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO22 = 0

 
DRHO2 = oo16pi2*( betaRHO21 + oo16pi2 * betaRHO22 ) 

 
Else 
DRHO2 = oo16pi2* betaRHO21 
End If 
 
 
!-------------------- 
! RHO1 
!-------------------- 
 
betaRHO11  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO12 = 0

 
DRHO1 = oo16pi2*( betaRHO11 + oo16pi2 * betaRHO12 ) 

 
Else 
DRHO1 = oo16pi2* betaRHO11 
End If 
 
 
!-------------------- 
! ALP1 
!-------------------- 
 
betaALP11  = 0

 
 
If (TwoLoopRGE) Then 
betaALP12 = 0

 
DALP1 = oo16pi2*( betaALP11 + oo16pi2 * betaALP12 ) 

 
Else 
DALP1 = oo16pi2* betaALP11 
End If 
 
 
!-------------------- 
! LAM1 
!-------------------- 
 
betaLAM11  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM12 = 0

 
DLAM1 = oo16pi2*( betaLAM11 + oo16pi2 * betaLAM12 ) 

 
Else 
DLAM1 = oo16pi2* betaLAM11 
End If 
 
 
!-------------------- 
! ALP3 
!-------------------- 
 
betaALP31  = 0

 
 
If (TwoLoopRGE) Then 
betaALP32 = 0

 
DALP3 = oo16pi2*( betaALP31 + oo16pi2 * betaALP32 ) 

 
Else 
DALP3 = oo16pi2* betaALP31 
End If 
 
 
!-------------------- 
! ALP2 
!-------------------- 
 
betaALP21  = 0

 
 
If (TwoLoopRGE) Then 
betaALP22 = 0

 
DALP2 = oo16pi2*( betaALP21 + oo16pi2 * betaALP22 ) 

 
Else 
DALP2 = oo16pi2* betaALP21 
End If 
 
 
!-------------------- 
! LAM4 
!-------------------- 
 
betaLAM41  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM42 = 0

 
DLAM4 = oo16pi2*( betaLAM41 + oo16pi2 * betaLAM42 ) 

 
Else 
DLAM4 = oo16pi2* betaLAM41 
End If 
 
 
!-------------------- 
! LAM2 
!-------------------- 
 
betaLAM21  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM22 = 0

 
DLAM2 = oo16pi2*( betaLAM21 + oo16pi2 * betaLAM22 ) 

 
Else 
DLAM2 = oo16pi2* betaLAM21 
End If 
 
 
!-------------------- 
! LAM3 
!-------------------- 
 
betaLAM31  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM32 = 0

 
DLAM3 = oo16pi2*( betaLAM31 + oo16pi2 * betaLAM32 ) 

 
Else 
DLAM3 = oo16pi2* betaLAM31 
End If 
 
 
!-------------------- 
! YDR 
!-------------------- 
 
betaYDR1  = 0

 
 
If (TwoLoopRGE) Then 
betaYDR2 = 0

 
DYDR = oo16pi2*( betaYDR1 + oo16pi2 * betaYDR2 ) 

 
Else 
DYDR = oo16pi2* betaYDR1 
End If 
 
 
Call Chop(DYDR) 

!-------------------- 
! YL1 
!-------------------- 
 
betaYL11  = 0

 
 
If (TwoLoopRGE) Then 
betaYL12 = 0

 
DYL1 = oo16pi2*( betaYL11 + oo16pi2 * betaYL12 ) 

 
Else 
DYL1 = oo16pi2* betaYL11 
End If 
 
 
Call Chop(DYL1) 

!-------------------- 
! YQ1 
!-------------------- 
 
betaYQ11  = 0

 
 
If (TwoLoopRGE) Then 
betaYQ12 = 0

 
DYQ1 = oo16pi2*( betaYQ11 + oo16pi2 * betaYQ12 ) 

 
Else 
DYQ1 = oo16pi2* betaYQ11 
End If 
 
 
Call Chop(DYQ1) 

!-------------------- 
! YL2 
!-------------------- 
 
betaYL21  = 0

 
 
If (TwoLoopRGE) Then 
betaYL22 = 0

 
DYL2 = oo16pi2*( betaYL21 + oo16pi2 * betaYL22 ) 

 
Else 
DYL2 = oo16pi2* betaYL21 
End If 
 
 
Call Chop(DYL2) 

!-------------------- 
! YQ2 
!-------------------- 
 
betaYQ21  = 0

 
 
If (TwoLoopRGE) Then 
betaYQ22 = 0

 
DYQ2 = oo16pi2*( betaYQ21 + oo16pi2 * betaYQ22 ) 

 
Else 
DYQ2 = oo16pi2* betaYQ21 
End If 
 
 
Call Chop(DYQ2) 

!-------------------- 
! M23 
!-------------------- 
 
betaM231  = 0

 
 
If (TwoLoopRGE) Then 
betaM232 = 0

 
DM23 = oo16pi2*( betaM231 + oo16pi2 * betaM232 ) 

 
Else 
DM23 = oo16pi2* betaM231 
End If 
 
 
!-------------------- 
! mu32 
!-------------------- 
 
betamu321  = 0

 
 
If (TwoLoopRGE) Then 
betamu322 = 0

 
Dmu32 = oo16pi2*( betamu321 + oo16pi2 * betamu322 ) 

 
Else 
Dmu32 = oo16pi2* betamu321 
End If 
 
 
!-------------------- 
! MU22 
!-------------------- 
 
betaMU221  = 0

 
 
If (TwoLoopRGE) Then 
betaMU222 = 0

 
DMU22 = oo16pi2*( betaMU221 + oo16pi2 * betaMU222 ) 

 
Else 
DMU22 = oo16pi2* betaMU221 
End If 
 
 
!-------------------- 
! MU12 
!-------------------- 
 
betaMU121  = 0

 
 
If (TwoLoopRGE) Then 
betaMU122 = 0

 
DMU12 = oo16pi2*( betaMU121 + oo16pi2 * betaMU122 ) 

 
Else 
DMU12 = oo16pi2* betaMU121 
End If 
 
 
Call ParametersToG107(DgBL,Dg2,DgR,Dg3,DRHO2,DRHO1,DALP1,DLAM1,DALP3,DALP2,           & 
& DLAM4,DLAM2,DLAM3,DYDR,DYL1,DYQ1,DYL2,DYQ2,DM23,Dmu32,DMU22,DMU12,f)

Iname = Iname - 1 
 
End Subroutine rge107  

Subroutine GToParameters110(g,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,             & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR)

Implicit None 
Real(dp), Intent(in) :: g(110) 
Real(dp),Intent(out) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp),Intent(out) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters110' 
 
gBL= g(1) 
g2= g(2) 
gR= g(3) 
g3= g(4) 
RHO2= g(5) 
RHO1= g(6) 
ALP1= g(7) 
LAM1= g(8) 
ALP3= g(9) 
ALP2= g(10) 
LAM4= g(11) 
LAM2= g(12) 
LAM3= g(13) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YDR(i1,i2) = Cmplx( g(SumI+14), g(SumI+15), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YL1(i1,i2) = Cmplx( g(SumI+32), g(SumI+33), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ1(i1,i2) = Cmplx( g(SumI+50), g(SumI+51), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YL2(i1,i2) = Cmplx( g(SumI+68), g(SumI+69), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ2(i1,i2) = Cmplx( g(SumI+86), g(SumI+87), dp) 
End Do 
 End Do 
 
M23= g(104) 
mu32= g(105) 
MU22= g(106) 
MU12= g(107) 
vd= g(108) 
vu= g(109) 
vR= g(110) 
Do i1=1,110 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters110

Subroutine ParametersToG110(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,               & 
& LAM4,LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR,g)

Implicit None 
Real(dp), Intent(out) :: g(110) 
Real(dp), Intent(in) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,M23,mu32,MU22,              & 
& MU12,vd,vu,vR

Complex(dp), Intent(in) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG110' 
 
g(1) = gBL  
g(2) = g2  
g(3) = gR  
g(4) = g3  
g(5) = RHO2  
g(6) = RHO1  
g(7) = ALP1  
g(8) = LAM1  
g(9) = ALP3  
g(10) = ALP2  
g(11) = LAM4  
g(12) = LAM2  
g(13) = LAM3  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+14) = Real(YDR(i1,i2), dp) 
g(SumI+15) = Aimag(YDR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+32) = Real(YL1(i1,i2), dp) 
g(SumI+33) = Aimag(YL1(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+50) = Real(YQ1(i1,i2), dp) 
g(SumI+51) = Aimag(YQ1(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+68) = Real(YL2(i1,i2), dp) 
g(SumI+69) = Aimag(YL2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+86) = Real(YQ2(i1,i2), dp) 
g(SumI+87) = Aimag(YQ2(i1,i2)) 
End Do 
End Do 

g(104) = M23  
g(105) = mu32  
g(106) = MU22  
g(107) = MU12  
g(108) = vd  
g(109) = vu  
g(110) = vR  
Iname = Iname - 1 
 
End Subroutine ParametersToG110

Subroutine rge110(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: gBL,betagBL1,betagBL2,DgBL,g2,betag21,betag22,Dg2,gR,betagR1,             & 
& betagR2,DgR,g3,betag31,betag32,Dg3,RHO2,betaRHO21,betaRHO22,DRHO2,RHO1,betaRHO11,      & 
& betaRHO12,DRHO1,ALP1,betaALP11,betaALP12,DALP1,LAM1,betaLAM11,betaLAM12,               & 
& DLAM1,ALP3,betaALP31,betaALP32,DALP3,ALP2,betaALP21,betaALP22,DALP2,LAM4,              & 
& betaLAM41,betaLAM42,DLAM4,LAM2,betaLAM21,betaLAM22,DLAM2,LAM3,betaLAM31,               & 
& betaLAM32,DLAM3,M23,betaM231,betaM232,DM23,mu32,betamu321,betamu322,Dmu32,             & 
& MU22,betaMU221,betaMU222,DMU22,MU12,betaMU121,betaMU122,DMU12,vd,betavd1,              & 
& betavd2,Dvd,vu,betavu1,betavu2,Dvu,vR,betavR1,betavR2,DvR
Complex(dp) :: YDR(3,3),betaYDR1(3,3),betaYDR2(3,3),DYDR(3,3),adjYDR(3,3)             & 
& ,YL1(3,3),betaYL11(3,3),betaYL12(3,3),DYL1(3,3),adjYL1(3,3),YQ1(3,3),betaYQ11(3,3)     & 
& ,betaYQ12(3,3),DYQ1(3,3),adjYQ1(3,3),YL2(3,3),betaYL21(3,3),betaYL22(3,3)              & 
& ,DYL2(3,3),adjYL2(3,3),YQ2(3,3),betaYQ21(3,3),betaYQ22(3,3),DYQ2(3,3),adjYQ2(3,3)
Iname = Iname +1 
NameOfUnit(Iname) = 'rge110' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters110(gy,gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,             & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,M23,mu32,MU22,MU12,vd,vu,vR)

Call Adjungate(YDR,adjYDR)
Call Adjungate(YL1,adjYL1)
Call Adjungate(YQ1,adjYQ1)
Call Adjungate(YL2,adjYL2)
Call Adjungate(YQ2,adjYQ2)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! gBL 
!-------------------- 
 
betagBL1  = 0

 
 
If (TwoLoopRGE) Then 
betagBL2 = 0

 
DgBL = oo16pi2*( betagBL1 + oo16pi2 * betagBL2 ) 

 
Else 
DgBL = oo16pi2* betagBL1 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! gR 
!-------------------- 
 
betagR1  = 0

 
 
If (TwoLoopRGE) Then 
betagR2 = 0

 
DgR = oo16pi2*( betagR1 + oo16pi2 * betagR2 ) 

 
Else 
DgR = oo16pi2* betagR1 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! RHO2 
!-------------------- 
 
betaRHO21  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO22 = 0

 
DRHO2 = oo16pi2*( betaRHO21 + oo16pi2 * betaRHO22 ) 

 
Else 
DRHO2 = oo16pi2* betaRHO21 
End If 
 
 
!-------------------- 
! RHO1 
!-------------------- 
 
betaRHO11  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO12 = 0

 
DRHO1 = oo16pi2*( betaRHO11 + oo16pi2 * betaRHO12 ) 

 
Else 
DRHO1 = oo16pi2* betaRHO11 
End If 
 
 
!-------------------- 
! ALP1 
!-------------------- 
 
betaALP11  = 0

 
 
If (TwoLoopRGE) Then 
betaALP12 = 0

 
DALP1 = oo16pi2*( betaALP11 + oo16pi2 * betaALP12 ) 

 
Else 
DALP1 = oo16pi2* betaALP11 
End If 
 
 
!-------------------- 
! LAM1 
!-------------------- 
 
betaLAM11  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM12 = 0

 
DLAM1 = oo16pi2*( betaLAM11 + oo16pi2 * betaLAM12 ) 

 
Else 
DLAM1 = oo16pi2* betaLAM11 
End If 
 
 
!-------------------- 
! ALP3 
!-------------------- 
 
betaALP31  = 0

 
 
If (TwoLoopRGE) Then 
betaALP32 = 0

 
DALP3 = oo16pi2*( betaALP31 + oo16pi2 * betaALP32 ) 

 
Else 
DALP3 = oo16pi2* betaALP31 
End If 
 
 
!-------------------- 
! ALP2 
!-------------------- 
 
betaALP21  = 0

 
 
If (TwoLoopRGE) Then 
betaALP22 = 0

 
DALP2 = oo16pi2*( betaALP21 + oo16pi2 * betaALP22 ) 

 
Else 
DALP2 = oo16pi2* betaALP21 
End If 
 
 
!-------------------- 
! LAM4 
!-------------------- 
 
betaLAM41  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM42 = 0

 
DLAM4 = oo16pi2*( betaLAM41 + oo16pi2 * betaLAM42 ) 

 
Else 
DLAM4 = oo16pi2* betaLAM41 
End If 
 
 
!-------------------- 
! LAM2 
!-------------------- 
 
betaLAM21  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM22 = 0

 
DLAM2 = oo16pi2*( betaLAM21 + oo16pi2 * betaLAM22 ) 

 
Else 
DLAM2 = oo16pi2* betaLAM21 
End If 
 
 
!-------------------- 
! LAM3 
!-------------------- 
 
betaLAM31  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM32 = 0

 
DLAM3 = oo16pi2*( betaLAM31 + oo16pi2 * betaLAM32 ) 

 
Else 
DLAM3 = oo16pi2* betaLAM31 
End If 
 
 
!-------------------- 
! YDR 
!-------------------- 
 
betaYDR1  = 0

 
 
If (TwoLoopRGE) Then 
betaYDR2 = 0

 
DYDR = oo16pi2*( betaYDR1 + oo16pi2 * betaYDR2 ) 

 
Else 
DYDR = oo16pi2* betaYDR1 
End If 
 
 
Call Chop(DYDR) 

!-------------------- 
! YL1 
!-------------------- 
 
betaYL11  = 0

 
 
If (TwoLoopRGE) Then 
betaYL12 = 0

 
DYL1 = oo16pi2*( betaYL11 + oo16pi2 * betaYL12 ) 

 
Else 
DYL1 = oo16pi2* betaYL11 
End If 
 
 
Call Chop(DYL1) 

!-------------------- 
! YQ1 
!-------------------- 
 
betaYQ11  = 0

 
 
If (TwoLoopRGE) Then 
betaYQ12 = 0

 
DYQ1 = oo16pi2*( betaYQ11 + oo16pi2 * betaYQ12 ) 

 
Else 
DYQ1 = oo16pi2* betaYQ11 
End If 
 
 
Call Chop(DYQ1) 

!-------------------- 
! YL2 
!-------------------- 
 
betaYL21  = 0

 
 
If (TwoLoopRGE) Then 
betaYL22 = 0

 
DYL2 = oo16pi2*( betaYL21 + oo16pi2 * betaYL22 ) 

 
Else 
DYL2 = oo16pi2* betaYL21 
End If 
 
 
Call Chop(DYL2) 

!-------------------- 
! YQ2 
!-------------------- 
 
betaYQ21  = 0

 
 
If (TwoLoopRGE) Then 
betaYQ22 = 0

 
DYQ2 = oo16pi2*( betaYQ21 + oo16pi2 * betaYQ22 ) 

 
Else 
DYQ2 = oo16pi2* betaYQ21 
End If 
 
 
Call Chop(DYQ2) 

!-------------------- 
! M23 
!-------------------- 
 
betaM231  = 0

 
 
If (TwoLoopRGE) Then 
betaM232 = 0

 
DM23 = oo16pi2*( betaM231 + oo16pi2 * betaM232 ) 

 
Else 
DM23 = oo16pi2* betaM231 
End If 
 
 
!-------------------- 
! mu32 
!-------------------- 
 
betamu321  = 0

 
 
If (TwoLoopRGE) Then 
betamu322 = 0

 
Dmu32 = oo16pi2*( betamu321 + oo16pi2 * betamu322 ) 

 
Else 
Dmu32 = oo16pi2* betamu321 
End If 
 
 
!-------------------- 
! MU22 
!-------------------- 
 
betaMU221  = 0

 
 
If (TwoLoopRGE) Then 
betaMU222 = 0

 
DMU22 = oo16pi2*( betaMU221 + oo16pi2 * betaMU222 ) 

 
Else 
DMU22 = oo16pi2* betaMU221 
End If 
 
 
!-------------------- 
! MU12 
!-------------------- 
 
betaMU121  = 0

 
 
If (TwoLoopRGE) Then 
betaMU122 = 0

 
DMU12 = oo16pi2*( betaMU121 + oo16pi2 * betaMU122 ) 

 
Else 
DMU12 = oo16pi2* betaMU121 
End If 
 
 
!-------------------- 
! vd 
!-------------------- 
 
betavd1  = 0

 
 
If (TwoLoopRGE) Then 
betavd2 = 0

 
Dvd = oo16pi2*( betavd1 + oo16pi2 * betavd2 ) 

 
Else 
Dvd = oo16pi2* betavd1 
End If 
 
 
!-------------------- 
! vu 
!-------------------- 
 
betavu1  = 0

 
 
If (TwoLoopRGE) Then 
betavu2 = 0

 
Dvu = oo16pi2*( betavu1 + oo16pi2 * betavu2 ) 

 
Else 
Dvu = oo16pi2* betavu1 
End If 
 
 
!-------------------- 
! vR 
!-------------------- 
 
betavR1  = 0

 
 
If (TwoLoopRGE) Then 
betavR2 = 0

 
DvR = oo16pi2*( betavR1 + oo16pi2 * betavR2 ) 

 
Else 
DvR = oo16pi2* betavR1 
End If 
 
 
Call ParametersToG110(DgBL,Dg2,DgR,Dg3,DRHO2,DRHO1,DALP1,DLAM1,DALP3,DALP2,           & 
& DLAM4,DLAM2,DLAM3,DYDR,DYL1,DYQ1,DYL2,DYQ2,DM23,Dmu32,DMU22,DMU12,Dvd,Dvu,DvR,f)

Iname = Iname - 1 
 
End Subroutine rge110  

End Module RGEs_DMLR 
 
