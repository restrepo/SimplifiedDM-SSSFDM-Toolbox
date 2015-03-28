OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1INPUT},
        {2,Lambda2INPUT},
        {3,Lambda3INPUT},
        {10, g1pINPUT},
        {11, g1p1INPUT},
        {12, g11pINPUT},
        {20, vXinput} };

ParametersToSolveTadpoles = {MuP,mu2};


BoundaryLowScaleInput={
 {g1p,g1pINPUT},
 {g11p,g11pINPUT},
 {g1p1,g1p1INPUT},
 {L1, Lambda1INPUT},
 {L2, Lambda2INPUT},
 {L3, Lambda3INPUT},
 {Yv, LHInput[Yv]},
 {Yx, LHInput[Yx]},
 {vX,vXinput}
};


BoundaryLowScaleInput={
 {vSM,Sqrt[4 mz2/(g1^2+g2^2)]},
 {vX,Sqrt[4 mz2/(g1^2+g2^2)]}
};


ListDecayParticles = {Fu,Fe,Fd,Fv,hh,VZp};
ListDecayParticles3B = {{Fv,"Fv.f90"},{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

