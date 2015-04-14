OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1IN},
        {2,LamSHIN},
        {3,LamSIN},
        {4,MSinput}
        };


ParametersToSolveTadpoles = {mu2};

BoundaryLowScaleInput={
   {v, vSM}, 
 {Ye, YeSM*vSM},
 {Yd, YdSM*vSM},
 {Yu, YuSM*vSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
  {Lambda1,Lambda1IN},
  {LamSH,LamSHIN},
  {LamS,LamSIN},
  {MS2, MSInput}
};




ListDecayParticles = {Fu,Fe,Fd,hh};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

FlagLoopContributions = True;  

(*Benchmark point with Omega h^2=0.1 and Sigma_SI=1E-9 pb *)
DefaultInputValues ={Lambda1IN -> 0.255, LamSHIN -> 0.05, LamSIN -> 0, MSinput -> 96774};
