OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1IN},
        {2,LamSHIN},
        {3,LamSIN},
        {4,MSinput}
        };


ParametersToSolveTadpoles = {mu2};

BoundaryLowScaleInput={
  (* { v,Sqrt[4 mz2/(g1^2+g2^2)]}, *) 
  {Lambda1,Lambda1IN},
  {LamSH,LamSHIN},
  {LamS,LamSIN},
  {MS2, MSInput}
};




ListDecayParticles = {Fu,Fe,Fd,hh};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

FlagLoopContributions = True;  

(*Benchmark point with Omega h^2=0.1 and Sigma_SI=1E-9 pb *)
DefaultInputValues ={Lambda1IN -> 0.255, LamSHIN -> 0.1, LamSIN -> 0, MSinput -> 96774};
