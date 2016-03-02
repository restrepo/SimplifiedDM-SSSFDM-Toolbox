! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.7.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 20:17 on 1.3.2016   
! ----------------------------------------------------------------------  
 
 
Module RGEs_darkLR 
 
Use Control 
Use Model_Data_darkLR 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters155(g,gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,               & 
& LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,           & 
& YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,mur2)

Implicit None 
Real(dp), Intent(in) :: g(155) 
Real(dp),Intent(out) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12

Complex(dp),Intent(out) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters155' 
 
gBL= g(1) 
g2= g(2) 
gR= g(3) 
g3= g(4) 
alp= g(5) 
RHO2= g(6) 
RHO1= g(7) 
rh3= Cmplx(g(8),g(9),dp) 
ALP3= g(10) 
ALP1= g(11) 
LAM1= g(12) 
etall= Cmplx(g(13),g(14),dp) 
etalr= Cmplx(g(15),g(16),dp) 
laml= Cmplx(g(17),g(18),dp) 
lamlr= Cmplx(g(19),g(20),dp) 
betl= Cmplx(g(21),g(22),dp) 
err2= Cmplx(g(23),g(24),dp) 
etarl= Cmplx(g(25),g(26),dp) 
etarr= Cmplx(g(27),g(28),dp) 
lamr= Cmplx(g(29),g(30),dp) 
betr= Cmplx(g(31),g(32),dp) 
err1= Cmplx(g(33),g(34),dp) 
BETA2= g(35) 
LAM3= g(36) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ2(i1,i2) = Cmplx( g(SumI+37), g(SumI+38), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YDR(i1,i2) = Cmplx( g(SumI+55), g(SumI+56), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YL1(i1,i2) = Cmplx( g(SumI+73), g(SumI+74), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
yq3(i1,i2) = Cmplx( g(SumI+91), g(SumI+92), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YDL(i1,i2) = Cmplx( g(SumI+109), g(SumI+110), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ1(i1,i2) = Cmplx( g(SumI+127), g(SumI+128), dp) 
End Do 
 End Do 
 
xiLR= g(145) 
xiR= g(146) 
mudl2= Cmplx(g(147),g(148),dp) 
mudr2= Cmplx(g(149),g(150),dp) 
MU12= g(151) 
mul2= Cmplx(g(152),g(153),dp) 
mur2= Cmplx(g(154),g(155),dp) 
Do i1=1,155 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters155

Subroutine ParametersToG155(gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,            & 
& etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,            & 
& YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,mur2,g)

Implicit None 
Real(dp), Intent(out) :: g(155) 
Real(dp), Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12

Complex(dp), Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG155' 
 
g(1) = gBL  
g(2) = g2  
g(3) = gR  
g(4) = g3  
g(5) = alp  
g(6) = RHO2  
g(7) = RHO1  
g(8) = Real(rh3,dp)  
g(9) = Aimag(rh3)  
g(10) = ALP3  
g(11) = ALP1  
g(12) = LAM1  
g(13) = Real(etall,dp)  
g(14) = Aimag(etall)  
g(15) = Real(etalr,dp)  
g(16) = Aimag(etalr)  
g(17) = Real(laml,dp)  
g(18) = Aimag(laml)  
g(19) = Real(lamlr,dp)  
g(20) = Aimag(lamlr)  
g(21) = Real(betl,dp)  
g(22) = Aimag(betl)  
g(23) = Real(err2,dp)  
g(24) = Aimag(err2)  
g(25) = Real(etarl,dp)  
g(26) = Aimag(etarl)  
g(27) = Real(etarr,dp)  
g(28) = Aimag(etarr)  
g(29) = Real(lamr,dp)  
g(30) = Aimag(lamr)  
g(31) = Real(betr,dp)  
g(32) = Aimag(betr)  
g(33) = Real(err1,dp)  
g(34) = Aimag(err1)  
g(35) = BETA2  
g(36) = LAM3  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+37) = Real(YQ2(i1,i2), dp) 
g(SumI+38) = Aimag(YQ2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+55) = Real(YDR(i1,i2), dp) 
g(SumI+56) = Aimag(YDR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+73) = Real(YL1(i1,i2), dp) 
g(SumI+74) = Aimag(YL1(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+91) = Real(yq3(i1,i2), dp) 
g(SumI+92) = Aimag(yq3(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+109) = Real(YDL(i1,i2), dp) 
g(SumI+110) = Aimag(YDL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+127) = Real(YQ1(i1,i2), dp) 
g(SumI+128) = Aimag(YQ1(i1,i2)) 
End Do 
End Do 

g(145) = xiLR  
g(146) = xiR  
g(147) = Real(mudl2,dp)  
g(148) = Aimag(mudl2)  
g(149) = Real(mudr2,dp)  
g(150) = Aimag(mudr2)  
g(151) = MU12  
g(152) = Real(mul2,dp)  
g(153) = Aimag(mul2)  
g(154) = Real(mur2,dp)  
g(155) = Aimag(mur2)  
Iname = Iname - 1 
 
End Subroutine ParametersToG155

Subroutine rge155(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: gBL,betagBL1,betagBL2,DgBL,g2,betag21,betag22,Dg2,gR,betagR1,             & 
& betagR2,DgR,g3,betag31,betag32,Dg3,alp,betaalp1,betaalp2,Dalp,RHO2,betaRHO21,          & 
& betaRHO22,DRHO2,RHO1,betaRHO11,betaRHO12,DRHO1,ALP3,betaALP31,betaALP32,               & 
& DALP3,ALP1,betaALP11,betaALP12,DALP1,LAM1,betaLAM11,betaLAM12,DLAM1,BETA2,             & 
& betaBETA21,betaBETA22,DBETA2,LAM3,betaLAM31,betaLAM32,DLAM3,xiLR,betaxiLR1,            & 
& betaxiLR2,DxiLR,xiR,betaxiR1,betaxiR2,DxiR,MU12,betaMU121,betaMU122,DMU12
Complex(dp) :: rh3,betarh31,betarh32,Drh3,etall,betaetall1,betaetall2,Detall,         & 
& etalr,betaetalr1,betaetalr2,Detalr,laml,betalaml1,betalaml2,Dlaml,lamlr,               & 
& betalamlr1,betalamlr2,Dlamlr,betl,betabetl1,betabetl2,Dbetl,err2,betaerr21,            & 
& betaerr22,Derr2,etarl,betaetarl1,betaetarl2,Detarl,etarr,betaetarr1,betaetarr2,        & 
& Detarr,lamr,betalamr1,betalamr2,Dlamr,betr,betabetr1,betabetr2,Dbetr,err1,             & 
& betaerr11,betaerr12,Derr1,YQ2(3,3),betaYQ21(3,3),betaYQ22(3,3),DYQ2(3,3)               & 
& ,adjYQ2(3,3),YDR(3,3),betaYDR1(3,3),betaYDR2(3,3),DYDR(3,3),adjYDR(3,3),               & 
& YL1(3,3),betaYL11(3,3),betaYL12(3,3),DYL1(3,3),adjYL1(3,3),yq3(3,3),betayq31(3,3)      & 
& ,betayq32(3,3),Dyq3(3,3),adjyq3(3,3),YDL(3,3),betaYDL1(3,3),betaYDL2(3,3)              & 
& ,DYDL(3,3),adjYDL(3,3),YQ1(3,3),betaYQ11(3,3),betaYQ12(3,3),DYQ1(3,3),adjYQ1(3,3)      & 
& ,mudl2,betamudl21,betamudl22,Dmudl2,mudr2,betamudr21,betamudr22,Dmudr2,mul2,           & 
& betamul21,betamul22,Dmul2,mur2,betamur21,betamur22,Dmur2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge155' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters155(gy,gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,               & 
& etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,            & 
& YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,mur2)

Call Adjungate(YQ2,adjYQ2)
Call Adjungate(YDR,adjYDR)
Call Adjungate(YL1,adjYL1)
Call Adjungate(yq3,adjyq3)
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
! alp 
!-------------------- 
 
betaalp1  = 0

 
 
If (TwoLoopRGE) Then 
betaalp2 = 0

 
Dalp = oo16pi2*( betaalp1 + oo16pi2 * betaalp2 ) 

 
Else 
Dalp = oo16pi2* betaalp1 
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
! etall 
!-------------------- 
 
betaetall1  = 0

 
 
If (TwoLoopRGE) Then 
betaetall2 = 0

 
Detall = oo16pi2*( betaetall1 + oo16pi2 * betaetall2 ) 

 
Else 
Detall = oo16pi2* betaetall1 
End If 
 
 
Call Chop(Detall) 

!-------------------- 
! etalr 
!-------------------- 
 
betaetalr1  = 0

 
 
If (TwoLoopRGE) Then 
betaetalr2 = 0

 
Detalr = oo16pi2*( betaetalr1 + oo16pi2 * betaetalr2 ) 

 
Else 
Detalr = oo16pi2* betaetalr1 
End If 
 
 
Call Chop(Detalr) 

!-------------------- 
! laml 
!-------------------- 
 
betalaml1  = 0

 
 
If (TwoLoopRGE) Then 
betalaml2 = 0

 
Dlaml = oo16pi2*( betalaml1 + oo16pi2 * betalaml2 ) 

 
Else 
Dlaml = oo16pi2* betalaml1 
End If 
 
 
Call Chop(Dlaml) 

!-------------------- 
! lamlr 
!-------------------- 
 
betalamlr1  = 0

 
 
If (TwoLoopRGE) Then 
betalamlr2 = 0

 
Dlamlr = oo16pi2*( betalamlr1 + oo16pi2 * betalamlr2 ) 

 
Else 
Dlamlr = oo16pi2* betalamlr1 
End If 
 
 
Call Chop(Dlamlr) 

!-------------------- 
! betl 
!-------------------- 
 
betabetl1  = 0

 
 
If (TwoLoopRGE) Then 
betabetl2 = 0

 
Dbetl = oo16pi2*( betabetl1 + oo16pi2 * betabetl2 ) 

 
Else 
Dbetl = oo16pi2* betabetl1 
End If 
 
 
Call Chop(Dbetl) 

!-------------------- 
! err2 
!-------------------- 
 
betaerr21  = 0

 
 
If (TwoLoopRGE) Then 
betaerr22 = 0

 
Derr2 = oo16pi2*( betaerr21 + oo16pi2 * betaerr22 ) 

 
Else 
Derr2 = oo16pi2* betaerr21 
End If 
 
 
Call Chop(Derr2) 

!-------------------- 
! etarl 
!-------------------- 
 
betaetarl1  = 0

 
 
If (TwoLoopRGE) Then 
betaetarl2 = 0

 
Detarl = oo16pi2*( betaetarl1 + oo16pi2 * betaetarl2 ) 

 
Else 
Detarl = oo16pi2* betaetarl1 
End If 
 
 
Call Chop(Detarl) 

!-------------------- 
! etarr 
!-------------------- 
 
betaetarr1  = 0

 
 
If (TwoLoopRGE) Then 
betaetarr2 = 0

 
Detarr = oo16pi2*( betaetarr1 + oo16pi2 * betaetarr2 ) 

 
Else 
Detarr = oo16pi2* betaetarr1 
End If 
 
 
Call Chop(Detarr) 

!-------------------- 
! lamr 
!-------------------- 
 
betalamr1  = 0

 
 
If (TwoLoopRGE) Then 
betalamr2 = 0

 
Dlamr = oo16pi2*( betalamr1 + oo16pi2 * betalamr2 ) 

 
Else 
Dlamr = oo16pi2* betalamr1 
End If 
 
 
Call Chop(Dlamr) 

!-------------------- 
! betr 
!-------------------- 
 
betabetr1  = 0

 
 
If (TwoLoopRGE) Then 
betabetr2 = 0

 
Dbetr = oo16pi2*( betabetr1 + oo16pi2 * betabetr2 ) 

 
Else 
Dbetr = oo16pi2* betabetr1 
End If 
 
 
Call Chop(Dbetr) 

!-------------------- 
! err1 
!-------------------- 
 
betaerr11  = 0

 
 
If (TwoLoopRGE) Then 
betaerr12 = 0

 
Derr1 = oo16pi2*( betaerr11 + oo16pi2 * betaerr12 ) 

 
Else 
Derr1 = oo16pi2* betaerr11 
End If 
 
 
Call Chop(Derr1) 

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
! yq3 
!-------------------- 
 
betayq31  = 0

 
 
If (TwoLoopRGE) Then 
betayq32 = 0

 
Dyq3 = oo16pi2*( betayq31 + oo16pi2 * betayq32 ) 

 
Else 
Dyq3 = oo16pi2* betayq31 
End If 
 
 
Call Chop(Dyq3) 

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
! xiLR 
!-------------------- 
 
betaxiLR1  = 0

 
 
If (TwoLoopRGE) Then 
betaxiLR2 = 0

 
DxiLR = oo16pi2*( betaxiLR1 + oo16pi2 * betaxiLR2 ) 

 
Else 
DxiLR = oo16pi2* betaxiLR1 
End If 
 
 
!-------------------- 
! xiR 
!-------------------- 
 
betaxiR1  = 0

 
 
If (TwoLoopRGE) Then 
betaxiR2 = 0

 
DxiR = oo16pi2*( betaxiR1 + oo16pi2 * betaxiR2 ) 

 
Else 
DxiR = oo16pi2* betaxiR1 
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
! mul2 
!-------------------- 
 
betamul21  = 0

 
 
If (TwoLoopRGE) Then 
betamul22 = 0

 
Dmul2 = oo16pi2*( betamul21 + oo16pi2 * betamul22 ) 

 
Else 
Dmul2 = oo16pi2* betamul21 
End If 
 
 
Call Chop(Dmul2) 

!-------------------- 
! mur2 
!-------------------- 
 
betamur21  = 0

 
 
If (TwoLoopRGE) Then 
betamur22 = 0

 
Dmur2 = oo16pi2*( betamur21 + oo16pi2 * betamur22 ) 

 
Else 
Dmur2 = oo16pi2* betamur21 
End If 
 
 
Call Chop(Dmur2) 

Call ParametersToG155(DgBL,Dg2,DgR,Dg3,Dalp,DRHO2,DRHO1,Drh3,DALP3,DALP1,             & 
& DLAM1,Detall,Detalr,Dlaml,Dlamlr,Dbetl,Derr2,Detarl,Detarr,Dlamr,Dbetr,Derr1,          & 
& DBETA2,DLAM3,DYQ2,DYDR,DYL1,Dyq3,DYDL,DYQ1,DxiLR,DxiR,Dmudl2,Dmudr2,DMU12,             & 
& Dmul2,Dmur2,f)

Iname = Iname - 1 
 
End Subroutine rge155  

Subroutine GToParameters161(g,gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,               & 
& LAM1,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,           & 
& YQ2,YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr)

Implicit None 
Real(dp), Intent(in) :: g(161) 
Real(dp),Intent(out) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr

Complex(dp),Intent(out) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters161' 
 
gBL= g(1) 
g2= g(2) 
gR= g(3) 
g3= g(4) 
alp= g(5) 
RHO2= g(6) 
RHO1= g(7) 
rh3= Cmplx(g(8),g(9),dp) 
ALP3= g(10) 
ALP1= g(11) 
LAM1= g(12) 
etall= Cmplx(g(13),g(14),dp) 
etalr= Cmplx(g(15),g(16),dp) 
laml= Cmplx(g(17),g(18),dp) 
lamlr= Cmplx(g(19),g(20),dp) 
betl= Cmplx(g(21),g(22),dp) 
err2= Cmplx(g(23),g(24),dp) 
etarl= Cmplx(g(25),g(26),dp) 
etarr= Cmplx(g(27),g(28),dp) 
lamr= Cmplx(g(29),g(30),dp) 
betr= Cmplx(g(31),g(32),dp) 
err1= Cmplx(g(33),g(34),dp) 
BETA2= g(35) 
LAM3= g(36) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ2(i1,i2) = Cmplx( g(SumI+37), g(SumI+38), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YDR(i1,i2) = Cmplx( g(SumI+55), g(SumI+56), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YL1(i1,i2) = Cmplx( g(SumI+73), g(SumI+74), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
yq3(i1,i2) = Cmplx( g(SumI+91), g(SumI+92), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YDL(i1,i2) = Cmplx( g(SumI+109), g(SumI+110), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ1(i1,i2) = Cmplx( g(SumI+127), g(SumI+128), dp) 
End Do 
 End Do 
 
xiLR= g(145) 
xiR= g(146) 
mudl2= Cmplx(g(147),g(148),dp) 
mudr2= Cmplx(g(149),g(150),dp) 
MU12= g(151) 
mul2= Cmplx(g(152),g(153),dp) 
mur2= Cmplx(g(154),g(155),dp) 
v1= g(156) 
v2= g(157) 
vtl= g(158) 
vtr= g(159) 
vhl= g(160) 
vhr= g(161) 
Do i1=1,161 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters161

Subroutine ParametersToG161(gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,            & 
& etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,            & 
& YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr,g)

Implicit None 
Real(dp), Intent(out) :: g(161) 
Real(dp), Intent(in) :: gBL,g2,gR,g3,alp,RHO2,RHO1,ALP3,ALP1,LAM1,BETA2,LAM3,xiLR,xiR,MU12,v1,v2,             & 
& vtl,vtr,vhl,vhr

Complex(dp), Intent(in) :: rh3,etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,YQ2(3,3),             & 
& YDR(3,3),YL1(3,3),yq3(3,3),YDL(3,3),YQ1(3,3),mudl2,mudr2,mul2,mur2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG161' 
 
g(1) = gBL  
g(2) = g2  
g(3) = gR  
g(4) = g3  
g(5) = alp  
g(6) = RHO2  
g(7) = RHO1  
g(8) = Real(rh3,dp)  
g(9) = Aimag(rh3)  
g(10) = ALP3  
g(11) = ALP1  
g(12) = LAM1  
g(13) = Real(etall,dp)  
g(14) = Aimag(etall)  
g(15) = Real(etalr,dp)  
g(16) = Aimag(etalr)  
g(17) = Real(laml,dp)  
g(18) = Aimag(laml)  
g(19) = Real(lamlr,dp)  
g(20) = Aimag(lamlr)  
g(21) = Real(betl,dp)  
g(22) = Aimag(betl)  
g(23) = Real(err2,dp)  
g(24) = Aimag(err2)  
g(25) = Real(etarl,dp)  
g(26) = Aimag(etarl)  
g(27) = Real(etarr,dp)  
g(28) = Aimag(etarr)  
g(29) = Real(lamr,dp)  
g(30) = Aimag(lamr)  
g(31) = Real(betr,dp)  
g(32) = Aimag(betr)  
g(33) = Real(err1,dp)  
g(34) = Aimag(err1)  
g(35) = BETA2  
g(36) = LAM3  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+37) = Real(YQ2(i1,i2), dp) 
g(SumI+38) = Aimag(YQ2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+55) = Real(YDR(i1,i2), dp) 
g(SumI+56) = Aimag(YDR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+73) = Real(YL1(i1,i2), dp) 
g(SumI+74) = Aimag(YL1(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+91) = Real(yq3(i1,i2), dp) 
g(SumI+92) = Aimag(yq3(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+109) = Real(YDL(i1,i2), dp) 
g(SumI+110) = Aimag(YDL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+127) = Real(YQ1(i1,i2), dp) 
g(SumI+128) = Aimag(YQ1(i1,i2)) 
End Do 
End Do 

g(145) = xiLR  
g(146) = xiR  
g(147) = Real(mudl2,dp)  
g(148) = Aimag(mudl2)  
g(149) = Real(mudr2,dp)  
g(150) = Aimag(mudr2)  
g(151) = MU12  
g(152) = Real(mul2,dp)  
g(153) = Aimag(mul2)  
g(154) = Real(mur2,dp)  
g(155) = Aimag(mur2)  
g(156) = v1  
g(157) = v2  
g(158) = vtl  
g(159) = vtr  
g(160) = vhl  
g(161) = vhr  
Iname = Iname - 1 
 
End Subroutine ParametersToG161

Subroutine rge161(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: gBL,betagBL1,betagBL2,DgBL,g2,betag21,betag22,Dg2,gR,betagR1,             & 
& betagR2,DgR,g3,betag31,betag32,Dg3,alp,betaalp1,betaalp2,Dalp,RHO2,betaRHO21,          & 
& betaRHO22,DRHO2,RHO1,betaRHO11,betaRHO12,DRHO1,ALP3,betaALP31,betaALP32,               & 
& DALP3,ALP1,betaALP11,betaALP12,DALP1,LAM1,betaLAM11,betaLAM12,DLAM1,BETA2,             & 
& betaBETA21,betaBETA22,DBETA2,LAM3,betaLAM31,betaLAM32,DLAM3,xiLR,betaxiLR1,            & 
& betaxiLR2,DxiLR,xiR,betaxiR1,betaxiR2,DxiR,MU12,betaMU121,betaMU122,DMU12,             & 
& v1,betav11,betav12,Dv1,v2,betav21,betav22,Dv2,vtl,betavtl1,betavtl2,Dvtl,              & 
& vtr,betavtr1,betavtr2,Dvtr,vhl,betavhl1,betavhl2,Dvhl,vhr,betavhr1,betavhr2,Dvhr
Complex(dp) :: rh3,betarh31,betarh32,Drh3,etall,betaetall1,betaetall2,Detall,         & 
& etalr,betaetalr1,betaetalr2,Detalr,laml,betalaml1,betalaml2,Dlaml,lamlr,               & 
& betalamlr1,betalamlr2,Dlamlr,betl,betabetl1,betabetl2,Dbetl,err2,betaerr21,            & 
& betaerr22,Derr2,etarl,betaetarl1,betaetarl2,Detarl,etarr,betaetarr1,betaetarr2,        & 
& Detarr,lamr,betalamr1,betalamr2,Dlamr,betr,betabetr1,betabetr2,Dbetr,err1,             & 
& betaerr11,betaerr12,Derr1,YQ2(3,3),betaYQ21(3,3),betaYQ22(3,3),DYQ2(3,3)               & 
& ,adjYQ2(3,3),YDR(3,3),betaYDR1(3,3),betaYDR2(3,3),DYDR(3,3),adjYDR(3,3),               & 
& YL1(3,3),betaYL11(3,3),betaYL12(3,3),DYL1(3,3),adjYL1(3,3),yq3(3,3),betayq31(3,3)      & 
& ,betayq32(3,3),Dyq3(3,3),adjyq3(3,3),YDL(3,3),betaYDL1(3,3),betaYDL2(3,3)              & 
& ,DYDL(3,3),adjYDL(3,3),YQ1(3,3),betaYQ11(3,3),betaYQ12(3,3),DYQ1(3,3),adjYQ1(3,3)      & 
& ,mudl2,betamudl21,betamudl22,Dmudl2,mudr2,betamudr21,betamudr22,Dmudr2,mul2,           & 
& betamul21,betamul22,Dmul2,mur2,betamur21,betamur22,Dmur2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge161' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters161(gy,gBL,g2,gR,g3,alp,RHO2,RHO1,rh3,ALP3,ALP1,LAM1,               & 
& etall,etalr,laml,lamlr,betl,err2,etarl,etarr,lamr,betr,err1,BETA2,LAM3,YQ2,            & 
& YDR,YL1,yq3,YDL,YQ1,xiLR,xiR,mudl2,mudr2,MU12,mul2,mur2,v1,v2,vtl,vtr,vhl,vhr)

Call Adjungate(YQ2,adjYQ2)
Call Adjungate(YDR,adjYDR)
Call Adjungate(YL1,adjYL1)
Call Adjungate(yq3,adjyq3)
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
! alp 
!-------------------- 
 
betaalp1  = 0

 
 
If (TwoLoopRGE) Then 
betaalp2 = 0

 
Dalp = oo16pi2*( betaalp1 + oo16pi2 * betaalp2 ) 

 
Else 
Dalp = oo16pi2* betaalp1 
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
! etall 
!-------------------- 
 
betaetall1  = 0

 
 
If (TwoLoopRGE) Then 
betaetall2 = 0

 
Detall = oo16pi2*( betaetall1 + oo16pi2 * betaetall2 ) 

 
Else 
Detall = oo16pi2* betaetall1 
End If 
 
 
Call Chop(Detall) 

!-------------------- 
! etalr 
!-------------------- 
 
betaetalr1  = 0

 
 
If (TwoLoopRGE) Then 
betaetalr2 = 0

 
Detalr = oo16pi2*( betaetalr1 + oo16pi2 * betaetalr2 ) 

 
Else 
Detalr = oo16pi2* betaetalr1 
End If 
 
 
Call Chop(Detalr) 

!-------------------- 
! laml 
!-------------------- 
 
betalaml1  = 0

 
 
If (TwoLoopRGE) Then 
betalaml2 = 0

 
Dlaml = oo16pi2*( betalaml1 + oo16pi2 * betalaml2 ) 

 
Else 
Dlaml = oo16pi2* betalaml1 
End If 
 
 
Call Chop(Dlaml) 

!-------------------- 
! lamlr 
!-------------------- 
 
betalamlr1  = 0

 
 
If (TwoLoopRGE) Then 
betalamlr2 = 0

 
Dlamlr = oo16pi2*( betalamlr1 + oo16pi2 * betalamlr2 ) 

 
Else 
Dlamlr = oo16pi2* betalamlr1 
End If 
 
 
Call Chop(Dlamlr) 

!-------------------- 
! betl 
!-------------------- 
 
betabetl1  = 0

 
 
If (TwoLoopRGE) Then 
betabetl2 = 0

 
Dbetl = oo16pi2*( betabetl1 + oo16pi2 * betabetl2 ) 

 
Else 
Dbetl = oo16pi2* betabetl1 
End If 
 
 
Call Chop(Dbetl) 

!-------------------- 
! err2 
!-------------------- 
 
betaerr21  = 0

 
 
If (TwoLoopRGE) Then 
betaerr22 = 0

 
Derr2 = oo16pi2*( betaerr21 + oo16pi2 * betaerr22 ) 

 
Else 
Derr2 = oo16pi2* betaerr21 
End If 
 
 
Call Chop(Derr2) 

!-------------------- 
! etarl 
!-------------------- 
 
betaetarl1  = 0

 
 
If (TwoLoopRGE) Then 
betaetarl2 = 0

 
Detarl = oo16pi2*( betaetarl1 + oo16pi2 * betaetarl2 ) 

 
Else 
Detarl = oo16pi2* betaetarl1 
End If 
 
 
Call Chop(Detarl) 

!-------------------- 
! etarr 
!-------------------- 
 
betaetarr1  = 0

 
 
If (TwoLoopRGE) Then 
betaetarr2 = 0

 
Detarr = oo16pi2*( betaetarr1 + oo16pi2 * betaetarr2 ) 

 
Else 
Detarr = oo16pi2* betaetarr1 
End If 
 
 
Call Chop(Detarr) 

!-------------------- 
! lamr 
!-------------------- 
 
betalamr1  = 0

 
 
If (TwoLoopRGE) Then 
betalamr2 = 0

 
Dlamr = oo16pi2*( betalamr1 + oo16pi2 * betalamr2 ) 

 
Else 
Dlamr = oo16pi2* betalamr1 
End If 
 
 
Call Chop(Dlamr) 

!-------------------- 
! betr 
!-------------------- 
 
betabetr1  = 0

 
 
If (TwoLoopRGE) Then 
betabetr2 = 0

 
Dbetr = oo16pi2*( betabetr1 + oo16pi2 * betabetr2 ) 

 
Else 
Dbetr = oo16pi2* betabetr1 
End If 
 
 
Call Chop(Dbetr) 

!-------------------- 
! err1 
!-------------------- 
 
betaerr11  = 0

 
 
If (TwoLoopRGE) Then 
betaerr12 = 0

 
Derr1 = oo16pi2*( betaerr11 + oo16pi2 * betaerr12 ) 

 
Else 
Derr1 = oo16pi2* betaerr11 
End If 
 
 
Call Chop(Derr1) 

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
! yq3 
!-------------------- 
 
betayq31  = 0

 
 
If (TwoLoopRGE) Then 
betayq32 = 0

 
Dyq3 = oo16pi2*( betayq31 + oo16pi2 * betayq32 ) 

 
Else 
Dyq3 = oo16pi2* betayq31 
End If 
 
 
Call Chop(Dyq3) 

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
! xiLR 
!-------------------- 
 
betaxiLR1  = 0

 
 
If (TwoLoopRGE) Then 
betaxiLR2 = 0

 
DxiLR = oo16pi2*( betaxiLR1 + oo16pi2 * betaxiLR2 ) 

 
Else 
DxiLR = oo16pi2* betaxiLR1 
End If 
 
 
!-------------------- 
! xiR 
!-------------------- 
 
betaxiR1  = 0

 
 
If (TwoLoopRGE) Then 
betaxiR2 = 0

 
DxiR = oo16pi2*( betaxiR1 + oo16pi2 * betaxiR2 ) 

 
Else 
DxiR = oo16pi2* betaxiR1 
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
! mul2 
!-------------------- 
 
betamul21  = 0

 
 
If (TwoLoopRGE) Then 
betamul22 = 0

 
Dmul2 = oo16pi2*( betamul21 + oo16pi2 * betamul22 ) 

 
Else 
Dmul2 = oo16pi2* betamul21 
End If 
 
 
Call Chop(Dmul2) 

!-------------------- 
! mur2 
!-------------------- 
 
betamur21  = 0

 
 
If (TwoLoopRGE) Then 
betamur22 = 0

 
Dmur2 = oo16pi2*( betamur21 + oo16pi2 * betamur22 ) 

 
Else 
Dmur2 = oo16pi2* betamur21 
End If 
 
 
Call Chop(Dmur2) 

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
 
 
!-------------------- 
! vhl 
!-------------------- 
 
betavhl1  = 0

 
 
If (TwoLoopRGE) Then 
betavhl2 = 0

 
Dvhl = oo16pi2*( betavhl1 + oo16pi2 * betavhl2 ) 

 
Else 
Dvhl = oo16pi2* betavhl1 
End If 
 
 
!-------------------- 
! vhr 
!-------------------- 
 
betavhr1  = 0

 
 
If (TwoLoopRGE) Then 
betavhr2 = 0

 
Dvhr = oo16pi2*( betavhr1 + oo16pi2 * betavhr2 ) 

 
Else 
Dvhr = oo16pi2* betavhr1 
End If 
 
 
Call ParametersToG161(DgBL,Dg2,DgR,Dg3,Dalp,DRHO2,DRHO1,Drh3,DALP3,DALP1,             & 
& DLAM1,Detall,Detalr,Dlaml,Dlamlr,Dbetl,Derr2,Detarl,Detarr,Dlamr,Dbetr,Derr1,          & 
& DBETA2,DLAM3,DYQ2,DYDR,DYL1,Dyq3,DYDL,DYQ1,DxiLR,DxiR,Dmudl2,Dmudr2,DMU12,             & 
& Dmul2,Dmur2,Dv1,Dv2,Dvtl,Dvtr,Dvhl,Dvhr,f)

Iname = Iname - 1 
 
End Subroutine rge161  

End Module RGEs_darkLR 
 
