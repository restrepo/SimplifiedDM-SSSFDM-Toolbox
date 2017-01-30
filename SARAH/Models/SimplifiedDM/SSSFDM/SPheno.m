OnlyLowEnergySPheno = True;

MINPAR={{1,Lambda1IN},
        {2,LamSHIN},
        {3,LamSIN},
        {4,MS2Input},
        {5,MSFIN}
       };


ParametersToSolveTadpoles = {mu2};

BoundaryLowScaleInput={
 {v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {Lambda1,Lambda1IN},
  {LamSH,LamSHIN},
  {LamS,LamSIN},
  {MS2, MS2Input},
  {Ys,LHInput[Ys]},
  {MSF, MSFIN}
 (*{MTF,LHInput[MTF]}*)
};

ListDecayParticles = {Fu,Fe,Fd,hh, Fre,ss};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}, {Fre,"Fre.f90"}};

DefaultInputValues ={Lambda1IN -> 0.255,MSFIN -> 200,
		     LamSHIN -> 0., LamSIN -> 0,
		     MS2Input -> 200., Ys[1] -> 0.01};
