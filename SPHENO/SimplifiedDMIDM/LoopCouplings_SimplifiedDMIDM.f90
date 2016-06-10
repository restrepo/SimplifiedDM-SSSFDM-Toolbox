! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 10:56 on 10.6.2016   
! ----------------------------------------------------------------------  
 
 
Module LoopCouplings_SimplifiedDMIDM 
 
Use Control 
Use Couplings_SimplifiedDMIDM 
Use Mathematics 
Use LoopFunctions 
Use StandardModel 
 
 Contains 
 
Subroutine CoupHiggsToPhoton(mHiggs,inG,ratetp,ratFd,ratFe,ratFu,ratHp,               & 
& ratVWp,Metp,MFd,MFe,MFu,MHp,MVWp,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratetp,ratFd(3),ratFe(3),ratFu(3),ratHp,ratVWp

Real(dp),Intent(in) :: Metp,MFd(3),MFe(3),MFu(3),MHp,MVWp

Integer, Intent(in) :: inG 
Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
coup = coup + 1*(-1)**2*ratHp*A_zero(mH2p/MHp**2)
HPPloopHp = HPPloopHp+1*(-1)**2*ratHp*A_zero(mH2p/MHp**2)
coup = coup + 1*(1)**2*ratetp*A_zero(mH2p/Metp**2)
HPPloopetp = HPPloopetp+1*(1)**2*ratetp*A_zero(mH2p/Metp**2)
coup = coup + 1*(1)**2*ratVWp*A_one(mH2p/MVWp**2)
HPPloopVWp = HPPloopVWp+1*(1)**2*ratVWp*A_one(mH2p/MVWp**2)
Do i1 = 1 , 3
coup = coup + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
HPPloopFd(i1) = HPPloopFd(i1) + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
HPPloopFu(i1) = HPPloopFu(i1) + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + 1*(-1)**2*ratFe(i1)*A_onehalf(mH2p/MFe(i1)**2)
HPPloopFe(i1) = HPPloopFe(i1)+1*(-1)**2*ratFe(i1)*A_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupHiggsToPhoton

Subroutine CoupHiggsToGluon(mHiggs,inG,ratFd,ratFu,MFd,MFu,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFu(3)

Real(dp),Intent(in) :: MFd(3),MFu(3)

Integer, Intent(in) :: inG 
Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 = 1 , 3
coup = coup + 1*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + 1*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupHiggsToGluon

Subroutine CoupHiggsToPhotonSM(mHiggs,Metp,MFd,MFe,MFu,MHp,MVWp,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: Metp,MFd(3),MFe(3),MFu(3),MHp,MVWp

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
coup = coup + 1*(1)**2*A_one(mH2p/MVWp**2)
Do i1 =1, 3 
coup = coup + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*A_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + 1*(-1)**2*A_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupHiggsToPhotonSM 

Subroutine CoupHiggsToGluonSM(mHiggs,MFd,MFu,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFu(3)

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3 
coup = coup + 1*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + 1*A_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupHiggsToGluonSM 

Subroutine CoupPseudoHiggsToPhoton(mHiggs,inG,ratetp,ratFd,ratFe,ratFu,               & 
& ratHp,ratVWp,Metp,MFd,MFe,MFu,MHp,MVWp,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratetp,ratFd(3),ratFe(3),ratFu(3),ratHp,ratVWp

Real(dp),Intent(in) :: Metp,MFd(3),MFe(3),MFu(3),MHp,MVWp

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Integer, Intent(in) :: inG 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFe(i1),gNLO)*1*(-1)**2*ratFe(i1)*AP_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToPhoton

Subroutine CoupPseudoHiggsToGluon(mHiggs,inG,ratFd,ratFu,MFd,MFu,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFu(3)

Real(dp),Intent(in) :: MFd(3),MFu(3)

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Integer, Intent(in) :: inG 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + 1*ratFd(i1)*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 1*ratFu(i1)*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupPseudoHiggsToGluon

Subroutine CoupPseudoHiggsToPhotonSM(mHiggs,Metp,MFd,MFe,MFu,MHp,MVWp,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: Metp,MFd(3),MFe(3),MFu(3),MHp,MVWp

Real(dp), Intent(in) :: mHiggs,gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2**AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2**AP_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFe(i1),gNLO)*1*(-1)**2**AP_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToPhotonSM 

Subroutine CoupPseudoHiggsToGluonSM(mHiggs,MFd,MFu,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFu(3)

Real(dp), Intent(in) :: mHiggs,gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + 1*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 1*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupPseudoHiggsToGluonSM 

Complex(dp) Function cNLO_onehalf(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
Real(dp)::tau 
tau=mH**2/(4._dp*mQ**2) 
If (g.lt.0._dp) Then 
  cNLO_onehalf = 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cNLO_onehalf = 1._dp - oo4pi2*g**2  
  Else if (mH.gt.(2._dp*mQ)) Then 
   If (tau.lt.100._dp) Then 
    If (tau.lt.1.1_dp) Then 
      cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.033208159703536+7.10655096733206*tau-88.20900604676405*tau**2+598.6773733788388*tau**3-1967.3257953814561*tau**4+& 
       & 3247.6715405319346*tau**5-2330.127086890616*tau**6+677.9294006001846*tau**8-142.7923161120851*tau**10)& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-&
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    Else 
      cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.6170280814404576+0.40530581525102677/tau**3-0.33530992103515084/tau**2+3.9718559902660684/tau-0.000111953515865919*tau+& 
       & 9.129881821626589e-6*tau*Log(tau)+0.1338033886479311*Log(4*tau)-1.121902907800696e-12*tau**2*Log(tau**2))& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-& 
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    End if 
   Else ! mQ->0 
     cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*&
      & (-(2._dp*Log(mH**2/mQ**2))/3._dp+(Pi**2-(Log(mH**2/mQ**2))**2)/18._dp+2*log(mH**2/4/mQ**2)&
      &+(0._dp,1._dp)*Pi/3*((Log(mH**2/mQ**2))/3+2._dp))
    End if 
  Else ! mQ~mH 
    cNLO_onehalf = 1._dp 
  End if 
End if 
End Function cNLO_onehalf 
 
Complex(dp) Function cANLO_onehalf(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
Real(dp)::tau 
tau=mH**2/(4._dp*mQ**2) 
If (g.lt.0._dp) Then 
  cANLO_onehalf = 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cANLO_onehalf = 1._dp  
  Else if (mH.gt.(2._dp*mQ)) Then 
   If (tau.lt.100._dp) Then 
    If (tau.lt.1.1_dp) Then 
      cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.033208159703536+7.10655096733206*tau-88.20900604676405*tau**2+598.6773733788388*tau**3-1967.3257953814561*tau**4+& 
       & 3247.6715405319346*tau**5-2330.127086890616*tau**6+677.9294006001846*tau**8-142.7923161120851*tau**10)& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-&
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    Else 
      cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.6170280814404576+0.40530581525102677/tau**3-0.33530992103515084/tau**2+3.9718559902660684/tau-0.000111953515865919*tau+& 
       & 9.129881821626589e-6*tau*Log(tau)+0.1338033886479311*Log(4*tau)-1.121902907800696e-12*tau**2*Log(tau**2))& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-& 
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    End if 
   Else ! mQ->0 
     cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*&
      & (-(2._dp*Log(mH**2/mQ**2))/3._dp+(Pi**2-(Log(mH**2/mQ**2))**2)/18._dp+2*log(mH**2/4/mQ**2)&
      &+(0._dp,1._dp)*Pi/3*((Log(mH**2/mQ**2))/3+2._dp))
    End if 
  Else ! mQ~mH 
    cANLO_onehalf = 1._dp 
  End if 
End if 
End Function cANLO_onehalf 
 
Real(dp) Function cNLO_zero(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
If (g.lt.0._dp) Then 
   cNLO_zero= 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cNLO_zero = 1._dp + 2._dp*oo3pi2*g**2  
  Else  
    cNLO_zero = 1._dp 
  End if 
End if 
End Function cNLO_zero 
End Module LoopCouplings_SimplifiedDMIDM 
 
