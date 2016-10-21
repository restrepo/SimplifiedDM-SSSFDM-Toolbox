OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1IN},
        {2,LamSHIN},
        {3,LamSIN},
        {4,MSinput},
	{5,MDFinput}
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
  {MS2, MSInput},
  {MDF,MDFinput},
  {Ys,LHInput[Ys]}

};




ListDecayParticles = {Fu,Fe,Fd,Fre,hh,ss};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

FlagLoopContributions = True;  

DefaultInputValues ={Lambda1IN -> 0.28, LamSHIN -> 0.01, LamSIN -> 0, MSinput -> 200,
		    MDFinput -> 400,Ysinput[a_] -> 0.1};
