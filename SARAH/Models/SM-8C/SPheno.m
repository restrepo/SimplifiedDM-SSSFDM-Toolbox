OnlyLowEnergySPheno = True;


MINPAR={{1,LambdaIN},
        {2,LambdaHCinput},
        {3,LambdaHSinput},
        {4,LambdaSinput},
        {5,LambdaCSinput},
        {6,eSinput}, 
        {7,eHinput}, 
        {8,eCinput}, 
        {10,vSinput}
};


ParametersToSolveTadpoles = {mu2, MS};

BoundaryLowScaleInput={
 {v,Sqrt[4 mz2/(g1^2+g2^2)]},
 {vS,vSin},
 {L,LambdaIN},
 {LS,LambdaSinput},
 {LHc,LambdaHCinput},
 {LHs,LambdaHSinput},
 {LCs,LambdaCSinput},
 {eS,eSinput},
 {eC,eCinput},
 {eH,eHinput}
};

 

ListDecayParticles = {Fu,Fe,Fd,hh};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};



