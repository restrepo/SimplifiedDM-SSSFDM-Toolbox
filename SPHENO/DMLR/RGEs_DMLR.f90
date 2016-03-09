! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 15:43 on 9.3.2016   
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


Subroutine GToParameters91(g,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,               & 
& BETA2,LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12)

Implicit None 
Real(dp), Intent(in) :: g(91) 
Real(dp),Intent(out) :: gBL,g2,gR,g3,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,M23,MU12

Complex(dp),Intent(out) :: rh3,YDR(3,3),YL1(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters91' 
 
gBL= g(1) 
g2= g(2) 
gR= g(3) 
g3= g(4) 
RHO2= g(5) 
RHO1= g(6) 
rh3= Cmplx(g(7),g(8),dp) 
ALP3= g(9) 
ALP1= g(10) 
LAM1= g(11) 
BETA2= g(12) 
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
YDL(i1,i2) = Cmplx( g(SumI+50), g(SumI+51), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ1(i1,i2) = Cmplx( g(SumI+68), g(SumI+69), dp) 
End Do 
 End Do 
 
M23= g(86) 
mudl2= Cmplx(g(87),g(88),dp) 
mudr2= Cmplx(g(89),g(90),dp) 
MU12= g(91) 
Do i1=1,91 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters91

Subroutine ParametersToG91(gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,           & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,g)

Implicit None 
Real(dp), Intent(out) :: g(91) 
Real(dp), Intent(in) :: gBL,g2,gR,g3,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,M23,MU12

Complex(dp), Intent(in) :: rh3,YDR(3,3),YL1(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG91' 
 
g(1) = gBL  
g(2) = g2  
g(3) = gR  
g(4) = g3  
g(5) = RHO2  
g(6) = RHO1  
g(7) = Real(rh3,dp)  
g(8) = Aimag(rh3)  
g(9) = ALP3  
g(10) = ALP1  
g(11) = LAM1  
g(12) = BETA2  
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
g(SumI+50) = Real(YDL(i1,i2), dp) 
g(SumI+51) = Aimag(YDL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+68) = Real(YQ1(i1,i2), dp) 
g(SumI+69) = Aimag(YQ1(i1,i2)) 
End Do 
End Do 

g(86) = M23  
g(87) = Real(mudl2,dp)  
g(88) = Aimag(mudl2)  
g(89) = Real(mudr2,dp)  
g(90) = Aimag(mudr2)  
g(91) = MU12  
Iname = Iname - 1 
 
End Subroutine ParametersToG91

Subroutine rge91(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: gBL,betagBL1,betagBL2,DgBL,g2,betag21,betag22,Dg2,gR,betagR1,             & 
& betagR2,DgR,g3,betag31,betag32,Dg3,RHO2,betaRHO21,betaRHO22,DRHO2,RHO1,betaRHO11,      & 
& betaRHO12,DRHO1,ALP3,betaALP31,betaALP32,DALP3,ALP1,betaALP11,betaALP12,               & 
& DALP1,LAM1,betaLAM11,betaLAM12,DLAM1,BETA2,betaBETA21,betaBETA22,DBETA2,               & 
& LAM3,betaLAM31,betaLAM32,DLAM3,M23,betaM231,betaM232,DM23,MU12,betaMU121,              & 
& betaMU122,DMU12
Complex(dp) :: rh3,betarh31,betarh32,Drh3,YDR(3,3),betaYDR1(3,3),betaYDR2(3,3)        & 
& ,DYDR(3,3),adjYDR(3,3),YL1(3,3),betaYL11(3,3),betaYL12(3,3),DYL1(3,3),adjYL1(3,3)      & 
& ,YDL(3,3),betaYDL1(3,3),betaYDL2(3,3),DYDL(3,3),adjYDL(3,3),YQ1(3,3),betaYQ11(3,3)     & 
& ,betaYQ12(3,3),DYQ1(3,3),adjYQ1(3,3),mudl2,betamudl21,betamudl22,Dmudl2,               & 
& mudr2,betamudr21,betamudr22,Dmudr2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge91' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters91(gy,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12)

Call Adjungate(YDR,adjYDR)
Call Adjungate(YL1,adjYL1)
Call Adjungate(YDL,adjYDL)
Call Adjungate(YQ1,adjYQ1)


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
! rh3 
!-------------------- 
 
betarh31  = 0

 
 
If (TwoLoopRGE) Then 
betarh32 = 0

 
Drh3 = oo16pi2*( betarh31 + oo16pi2 * betarh32 ) 

 
Else 
Drh3 = oo16pi2* betarh31 
End If 
 
 
Call Chop(Drh3) 

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
! BETA2 
!-------------------- 
 
betaBETA21  = 0

 
 
If (TwoLoopRGE) Then 
betaBETA22 = 0

 
DBETA2 = oo16pi2*( betaBETA21 + oo16pi2 * betaBETA22 ) 

 
Else 
DBETA2 = oo16pi2* betaBETA21 
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
! YDL 
!-------------------- 
 
betaYDL1  = 0

 
 
If (TwoLoopRGE) Then 
betaYDL2 = 0

 
DYDL = oo16pi2*( betaYDL1 + oo16pi2 * betaYDL2 ) 

 
Else 
DYDL = oo16pi2* betaYDL1 
End If 
 
 
Call Chop(DYDL) 

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
! mudl2 
!-------------------- 
 
betamudl21  = 0

 
 
If (TwoLoopRGE) Then 
betamudl22 = 0

 
Dmudl2 = oo16pi2*( betamudl21 + oo16pi2 * betamudl22 ) 

 
Else 
Dmudl2 = oo16pi2* betamudl21 
End If 
 
 
Call Chop(Dmudl2) 

!-------------------- 
! mudr2 
!-------------------- 
 
betamudr21  = 0

 
 
If (TwoLoopRGE) Then 
betamudr22 = 0

 
Dmudr2 = oo16pi2*( betamudr21 + oo16pi2 * betamudr22 ) 

 
Else 
Dmudr2 = oo16pi2* betamudr21 
End If 
 
 
Call Chop(Dmudr2) 

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
 
 
Call ParametersToG91(DgBL,Dg2,DgR,Dg3,DRHO2,DRHO1,Drh3,DALP3,DALP1,DLAM1,             & 
& DBETA2,DLAM3,DYDR,DYL1,DYDL,DYQ1,DM23,Dmudl2,Dmudr2,DMU12,f)

Iname = Iname - 1 
 
End Subroutine rge91  

Subroutine GToParameters95(g,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,               & 
& BETA2,LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr)

Implicit None 
Real(dp), Intent(in) :: g(95) 
Real(dp),Intent(out) :: gBL,g2,gR,g3,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,M23,MU12,v1,v2,vtl,vtr

Complex(dp),Intent(out) :: rh3,YDR(3,3),YL1(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters95' 
 
gBL= g(1) 
g2= g(2) 
gR= g(3) 
g3= g(4) 
RHO2= g(5) 
RHO1= g(6) 
rh3= Cmplx(g(7),g(8),dp) 
ALP3= g(9) 
ALP1= g(10) 
LAM1= g(11) 
BETA2= g(12) 
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
YDL(i1,i2) = Cmplx( g(SumI+50), g(SumI+51), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ1(i1,i2) = Cmplx( g(SumI+68), g(SumI+69), dp) 
End Do 
 End Do 
 
M23= g(86) 
mudl2= Cmplx(g(87),g(88),dp) 
mudr2= Cmplx(g(89),g(90),dp) 
MU12= g(91) 
v1= g(92) 
v2= g(93) 
vtl= g(94) 
vtr= g(95) 
Do i1=1,95 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters95

Subroutine ParametersToG95(gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,           & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr,g)

Implicit None 
Real(dp), Intent(out) :: g(95) 
Real(dp), Intent(in) :: gBL,g2,gR,g3,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,M23,MU12,v1,v2,vtl,vtr

Complex(dp), Intent(in) :: rh3,YDR(3,3),YL1(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG95' 
 
g(1) = gBL  
g(2) = g2  
g(3) = gR  
g(4) = g3  
g(5) = RHO2  
g(6) = RHO1  
g(7) = Real(rh3,dp)  
g(8) = Aimag(rh3)  
g(9) = ALP3  
g(10) = ALP1  
g(11) = LAM1  
g(12) = BETA2  
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
g(SumI+50) = Real(YDL(i1,i2), dp) 
g(SumI+51) = Aimag(YDL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+68) = Real(YQ1(i1,i2), dp) 
g(SumI+69) = Aimag(YQ1(i1,i2)) 
End Do 
End Do 

g(86) = M23  
g(87) = Real(mudl2,dp)  
g(88) = Aimag(mudl2)  
g(89) = Real(mudr2,dp)  
g(90) = Aimag(mudr2)  
g(91) = MU12  
g(92) = v1  
g(93) = v2  
g(94) = vtl  
g(95) = vtr  
Iname = Iname - 1 
 
End Subroutine ParametersToG95

Subroutine rge95(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: gBL,betagBL1,betagBL2,DgBL,g2,betag21,betag22,Dg2,gR,betagR1,             & 
& betagR2,DgR,g3,betag31,betag32,Dg3,RHO2,betaRHO21,betaRHO22,DRHO2,RHO1,betaRHO11,      & 
& betaRHO12,DRHO1,ALP3,betaALP31,betaALP32,DALP3,ALP1,betaALP11,betaALP12,               & 
& DALP1,LAM1,betaLAM11,betaLAM12,DLAM1,BETA2,betaBETA21,betaBETA22,DBETA2,               & 
& LAM3,betaLAM31,betaLAM32,DLAM3,M23,betaM231,betaM232,DM23,MU12,betaMU121,              & 
& betaMU122,DMU12,v1,betav11,betav12,Dv1,v2,betav21,betav22,Dv2,vtl,betavtl1,            & 
& betavtl2,Dvtl,vtr,betavtr1,betavtr2,Dvtr
Complex(dp) :: rh3,betarh31,betarh32,Drh3,YDR(3,3),betaYDR1(3,3),betaYDR2(3,3)        & 
& ,DYDR(3,3),adjYDR(3,3),YL1(3,3),betaYL11(3,3),betaYL12(3,3),DYL1(3,3),adjYL1(3,3)      & 
& ,YDL(3,3),betaYDL1(3,3),betaYDL2(3,3),DYDL(3,3),adjYDL(3,3),YQ1(3,3),betaYQ11(3,3)     & 
& ,betaYQ12(3,3),DYQ1(3,3),adjYQ1(3,3),mudl2,betamudl21,betamudl22,Dmudl2,               & 
& mudr2,betamudr21,betamudr22,Dmudr2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge95' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters95(gy,gBL,g2,gR,g3,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,BETA2,              & 
& LAM3,YDR,YL1,YDL,YQ1,M23,mudl2,mudr2,MU12,v1,v2,vtl,vtr)

Call Adjungate(YDR,adjYDR)
Call Adjungate(YL1,adjYL1)
Call Adjungate(YDL,adjYDL)
Call Adjungate(YQ1,adjYQ1)


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
! rh3 
!-------------------- 
 
betarh31  = 0

 
 
If (TwoLoopRGE) Then 
betarh32 = 0

 
Drh3 = oo16pi2*( betarh31 + oo16pi2 * betarh32 ) 

 
Else 
Drh3 = oo16pi2* betarh31 
End If 
 
 
Call Chop(Drh3) 

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
! BETA2 
!-------------------- 
 
betaBETA21  = 0

 
 
If (TwoLoopRGE) Then 
betaBETA22 = 0

 
DBETA2 = oo16pi2*( betaBETA21 + oo16pi2 * betaBETA22 ) 

 
Else 
DBETA2 = oo16pi2* betaBETA21 
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
! YDL 
!-------------------- 
 
betaYDL1  = 0

 
 
If (TwoLoopRGE) Then 
betaYDL2 = 0

 
DYDL = oo16pi2*( betaYDL1 + oo16pi2 * betaYDL2 ) 

 
Else 
DYDL = oo16pi2* betaYDL1 
End If 
 
 
Call Chop(DYDL) 

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
! mudl2 
!-------------------- 
 
betamudl21  = 0

 
 
If (TwoLoopRGE) Then 
betamudl22 = 0

 
Dmudl2 = oo16pi2*( betamudl21 + oo16pi2 * betamudl22 ) 

 
Else 
Dmudl2 = oo16pi2* betamudl21 
End If 
 
 
Call Chop(Dmudl2) 

!-------------------- 
! mudr2 
!-------------------- 
 
betamudr21  = 0

 
 
If (TwoLoopRGE) Then 
betamudr22 = 0

 
Dmudr2 = oo16pi2*( betamudr21 + oo16pi2 * betamudr22 ) 

 
Else 
Dmudr2 = oo16pi2* betamudr21 
End If 
 
 
Call Chop(Dmudr2) 

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
! v1 
!-------------------- 
 
betav11  = 0

 
 
If (TwoLoopRGE) Then 
betav12 = 0

 
Dv1 = oo16pi2*( betav11 + oo16pi2 * betav12 ) 

 
Else 
Dv1 = oo16pi2* betav11 
End If 
 
 
!-------------------- 
! v2 
!-------------------- 
 
betav21  = 0

 
 
If (TwoLoopRGE) Then 
betav22 = 0

 
Dv2 = oo16pi2*( betav21 + oo16pi2 * betav22 ) 

 
Else 
Dv2 = oo16pi2* betav21 
End If 
 
 
!-------------------- 
! vtl 
!-------------------- 
 
betavtl1  = 0

 
 
If (TwoLoopRGE) Then 
betavtl2 = 0

 
Dvtl = oo16pi2*( betavtl1 + oo16pi2 * betavtl2 ) 

 
Else 
Dvtl = oo16pi2* betavtl1 
End If 
 
 
!-------------------- 
! vtr 
!-------------------- 
 
betavtr1  = 0

 
 
If (TwoLoopRGE) Then 
betavtr2 = 0

 
Dvtr = oo16pi2*( betavtr1 + oo16pi2 * betavtr2 ) 

 
Else 
Dvtr = oo16pi2* betavtr1 
End If 
 
 
Call ParametersToG95(DgBL,Dg2,DgR,Dg3,DRHO2,DRHO1,Drh3,DALP3,DALP1,DLAM1,             & 
& DBETA2,DLAM3,DYDR,DYL1,DYDL,DYQ1,DM23,Dmudl2,Dmudr2,DMU12,Dv1,Dv2,Dvtl,Dvtr,f)

Iname = Iname - 1 
 
End Subroutine rge95  

End Module RGEs_DMLR 
 
