OnlyLowEnergySPheno = True;

MINPAR={{1,LambdaIN}};


ParametersToSolveTadpoles = {mu2};

BoundaryLowScaleInput={
(* {v,Sqrt[4 mz2/(g1^2+g2^2)]}, *)
 {\[Lambda],LambdaIN}
};



ListDecayParticles = {Fu,Fe,Fd,hh};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};
