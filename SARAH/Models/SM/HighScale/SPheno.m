OnlyLowEnergySPheno = False;
MINPAR={{1,LambdaIN}};


ParametersToSolveTadpoles = {mu2};


RenormalizationScaleFirstGuess=100^2;
RenormalizationScale = v^2;
ConditionGUTscale = g1 == g2;

BoundaryHighScale = { {\[Lambda],LambdaIN} };
BoundaryEWSBScale = {};
BoundaryRenScale={ };

(* BoundaryLowScaleInput={
 {v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {\[Lambda],LambdaIN}
}; *)



ListDecayParticles = {Fu,Fe,Fd,hh};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues ={LambdaIN -> 0.27};
