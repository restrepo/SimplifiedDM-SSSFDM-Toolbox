OnlyLowEnergySPheno = True;

MINPAR={
  {1,lambda1Input},
  {2,lambda2Input},
  {3,lambda3Input},
  {4,lambda4Input},
  {5,lambda5Input},
  {6,mEt2Input}
};

ParametersToSolveTadpoles = {mH2};

BoundaryLowScaleInput={
  {v, vSM},
  {Ye, YeSM},
  {Yd, YdSM},
  {Yu, YuSM},
  {g1, g1SM},
  {g2, g2SM},
  {g3, g3SM},
  {lambda1,lambda1Input},
  {lambda2,lambda2Input},
  {lambda3,lambda3Input},
  {lambda4,lambda4Input},
  {lambda5,lambda5Input},
  {mEt2,mEt2Input}
};

ListDecayParticles = {Fu,Fe,Fd,Fv,VZ,VWp,hh,etR,etI,etp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

(*ConditionGUTscale = g1 == g2;*)

DefaultInputValues ={
  lambda1Input -> 0.534,
  lambda2Input -> 0.,
  lambda3Input -> 0.,
  lambda4Input -> 0.,
  lambda5Input -> -10^(-5),
    mEt2Input -> 100.
		    };
