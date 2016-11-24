! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:42 on 23.11.2016   
! ----------------------------------------------------------------------  
 
 
Module RGEs_SimplifiedDMSSSFDM 
 
Use Control 
Use Model_Data_SimplifiedDMSSSFDM 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters70(g,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MDF,MS2,mu2)

Implicit None 
Real(dp), Intent(in) :: g(70) 
Real(dp),Intent(out) :: g1,g2,g3,Ys(3),MDF,MS2

Complex(dp),Intent(out) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters70' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
LS= Cmplx(g(4),g(5),dp) 
LSH= Cmplx(g(6),g(7),dp) 
Lam= Cmplx(g(8),g(9),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+10), g(SumI+11), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
SumI = (i1-1) 
Ys(i1) =  g(SumI+28) 
End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+31), g(SumI+32), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+49), g(SumI+50), dp) 
End Do 
 End Do 
 
MDF= g(67) 
MS2= g(68) 
mu2= Cmplx(g(69),g(70),dp) 
Do i1=1,70 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters70

Subroutine ParametersToG70(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MDF,MS2,mu2,g)

Implicit None 
Real(dp), Intent(out) :: g(70) 
Real(dp), Intent(in) :: g1,g2,g3,Ys(3),MDF,MS2

Complex(dp), Intent(in) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG70' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(LS,dp)  
g(5) = Aimag(LS)  
g(6) = Real(LSH,dp)  
g(7) = Aimag(LSH)  
g(8) = Real(Lam,dp)  
g(9) = Aimag(Lam)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+10) = Real(Yu(i1,i2), dp) 
g(SumI+11) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
SumI = (i1-1) 
g(SumI+28) = Ys(i1) 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+31) = Real(Yd(i1,i2), dp) 
g(SumI+32) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+49) = Real(Ye(i1,i2), dp) 
g(SumI+50) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(67) = MDF  
g(68) = MS2  
g(69) = Real(mu2,dp)  
g(70) = Aimag(mu2)  
Iname = Iname - 1 
 
End Subroutine ParametersToG70

Subroutine rge70(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,Ys(3),betaYs1(3),betaYs2(3),DYs(3),MDF,betaMDF1,betaMDF2,DMDF,MS2,betaMS21,        & 
& betaMS22,DMS2
Complex(dp) :: LS,betaLS1,betaLS2,DLS,LSH,betaLSH1,betaLSH2,DLSH,Lam,betaLam1,        & 
& betaLam2,DLam,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yd(3,3)            & 
& ,betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3)       & 
& ,DYe(3,3),adjYe(3,3),mu2,betamu21,betamu22,Dmu2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge70' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters70(gy,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MDF,MS2,mu2)

Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 0

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
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
! LS 
!-------------------- 
 
betaLS1  = 0

 
 
If (TwoLoopRGE) Then 
betaLS2 = 0

 
DLS = oo16pi2*( betaLS1 + oo16pi2 * betaLS2 ) 

 
Else 
DLS = oo16pi2* betaLS1 
End If 
 
 
Call Chop(DLS) 

!-------------------- 
! LSH 
!-------------------- 
 
betaLSH1  = 0

 
 
If (TwoLoopRGE) Then 
betaLSH2 = 0

 
DLSH = oo16pi2*( betaLSH1 + oo16pi2 * betaLSH2 ) 

 
Else 
DLSH = oo16pi2* betaLSH1 
End If 
 
 
Call Chop(DLSH) 

!-------------------- 
! Lam 
!-------------------- 
 
betaLam1  = 0

 
 
If (TwoLoopRGE) Then 
betaLam2 = 0

 
DLam = oo16pi2*( betaLam1 + oo16pi2 * betaLam2 ) 

 
Else 
DLam = oo16pi2* betaLam1 
End If 
 
 
Call Chop(DLam) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = 0

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Ys 
!-------------------- 
 
betaYs1  = 0

 
 
If (TwoLoopRGE) Then 
betaYs2 = 0

 
DYs = oo16pi2*( betaYs1 + oo16pi2 * betaYs2 ) 

 
Else 
DYs = oo16pi2* betaYs1 
End If 
 
 
!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = 0

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = 0

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! MDF 
!-------------------- 
 
betaMDF1  = 0

 
 
If (TwoLoopRGE) Then 
betaMDF2 = 0

 
DMDF = oo16pi2*( betaMDF1 + oo16pi2 * betaMDF2 ) 

 
Else 
DMDF = oo16pi2* betaMDF1 
End If 
 
 
!-------------------- 
! MS2 
!-------------------- 
 
betaMS21  = 0

 
 
If (TwoLoopRGE) Then 
betaMS22 = 0

 
DMS2 = oo16pi2*( betaMS21 + oo16pi2 * betaMS22 ) 

 
Else 
DMS2 = oo16pi2* betaMS21 
End If 
 
 
!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = 0

 
 
If (TwoLoopRGE) Then 
betamu22 = 0

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

Call ParametersToG70(Dg1,Dg2,Dg3,DLS,DLSH,DLam,DYu,DYs,DYd,DYe,DMDF,DMS2,Dmu2,f)

Iname = Iname - 1 
 
End Subroutine rge70  

Subroutine GToParameters71(g,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MDF,MS2,mu2,v)

Implicit None 
Real(dp), Intent(in) :: g(71) 
Real(dp),Intent(out) :: g1,g2,g3,Ys(3),MDF,MS2,v

Complex(dp),Intent(out) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters71' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
LS= Cmplx(g(4),g(5),dp) 
LSH= Cmplx(g(6),g(7),dp) 
Lam= Cmplx(g(8),g(9),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+10), g(SumI+11), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
SumI = (i1-1) 
Ys(i1) =  g(SumI+28) 
End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+31), g(SumI+32), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+49), g(SumI+50), dp) 
End Do 
 End Do 
 
MDF= g(67) 
MS2= g(68) 
mu2= Cmplx(g(69),g(70),dp) 
v= g(71) 
Do i1=1,71 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters71

Subroutine ParametersToG71(g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MDF,MS2,mu2,v,g)

Implicit None 
Real(dp), Intent(out) :: g(71) 
Real(dp), Intent(in) :: g1,g2,g3,Ys(3),MDF,MS2,v

Complex(dp), Intent(in) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG71' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(LS,dp)  
g(5) = Aimag(LS)  
g(6) = Real(LSH,dp)  
g(7) = Aimag(LSH)  
g(8) = Real(Lam,dp)  
g(9) = Aimag(Lam)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+10) = Real(Yu(i1,i2), dp) 
g(SumI+11) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
SumI = (i1-1) 
g(SumI+28) = Ys(i1) 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+31) = Real(Yd(i1,i2), dp) 
g(SumI+32) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+49) = Real(Ye(i1,i2), dp) 
g(SumI+50) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(67) = MDF  
g(68) = MS2  
g(69) = Real(mu2,dp)  
g(70) = Aimag(mu2)  
g(71) = v  
Iname = Iname - 1 
 
End Subroutine ParametersToG71

Subroutine rge71(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,Ys(3),betaYs1(3),betaYs2(3),DYs(3),MDF,betaMDF1,betaMDF2,DMDF,MS2,betaMS21,        & 
& betaMS22,DMS2,v,betav1,betav2,Dv
Complex(dp) :: LS,betaLS1,betaLS2,DLS,LSH,betaLSH1,betaLSH2,DLSH,Lam,betaLam1,        & 
& betaLam2,DLam,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yd(3,3)            & 
& ,betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3)       & 
& ,DYe(3,3),adjYe(3,3),mu2,betamu21,betamu22,Dmu2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge71' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters71(gy,g1,g2,g3,LS,LSH,Lam,Yu,Ys,Yd,Ye,MDF,MS2,mu2,v)

Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 0

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
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
! LS 
!-------------------- 
 
betaLS1  = 0

 
 
If (TwoLoopRGE) Then 
betaLS2 = 0

 
DLS = oo16pi2*( betaLS1 + oo16pi2 * betaLS2 ) 

 
Else 
DLS = oo16pi2* betaLS1 
End If 
 
 
Call Chop(DLS) 

!-------------------- 
! LSH 
!-------------------- 
 
betaLSH1  = 0

 
 
If (TwoLoopRGE) Then 
betaLSH2 = 0

 
DLSH = oo16pi2*( betaLSH1 + oo16pi2 * betaLSH2 ) 

 
Else 
DLSH = oo16pi2* betaLSH1 
End If 
 
 
Call Chop(DLSH) 

!-------------------- 
! Lam 
!-------------------- 
 
betaLam1  = 0

 
 
If (TwoLoopRGE) Then 
betaLam2 = 0

 
DLam = oo16pi2*( betaLam1 + oo16pi2 * betaLam2 ) 

 
Else 
DLam = oo16pi2* betaLam1 
End If 
 
 
Call Chop(DLam) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = 0

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Ys 
!-------------------- 
 
betaYs1  = 0

 
 
If (TwoLoopRGE) Then 
betaYs2 = 0

 
DYs = oo16pi2*( betaYs1 + oo16pi2 * betaYs2 ) 

 
Else 
DYs = oo16pi2* betaYs1 
End If 
 
 
!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = 0

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = 0

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! MDF 
!-------------------- 
 
betaMDF1  = 0

 
 
If (TwoLoopRGE) Then 
betaMDF2 = 0

 
DMDF = oo16pi2*( betaMDF1 + oo16pi2 * betaMDF2 ) 

 
Else 
DMDF = oo16pi2* betaMDF1 
End If 
 
 
!-------------------- 
! MS2 
!-------------------- 
 
betaMS21  = 0

 
 
If (TwoLoopRGE) Then 
betaMS22 = 0

 
DMS2 = oo16pi2*( betaMS21 + oo16pi2 * betaMS22 ) 

 
Else 
DMS2 = oo16pi2* betaMS21 
End If 
 
 
!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = 0

 
 
If (TwoLoopRGE) Then 
betamu22 = 0

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

!-------------------- 
! v 
!-------------------- 
 
betav1  = 0

 
 
If (TwoLoopRGE) Then 
betav2 = 0

 
Dv = oo16pi2*( betav1 + oo16pi2 * betav2 ) 

 
Else 
Dv = oo16pi2* betav1 
End If 
 
 
Call ParametersToG71(Dg1,Dg2,Dg3,DLS,DLSH,DLam,DYu,DYs,DYd,DYe,DMDF,DMS2,             & 
& Dmu2,Dv,f)

Iname = Iname - 1 
 
End Subroutine rge71  

End Module RGEs_SimplifiedDMSSSFDM 
 
