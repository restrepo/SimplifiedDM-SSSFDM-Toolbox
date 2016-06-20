OnlyLowEnergySPheno = True;

MINPAR={
  {1,lambda1INPUT},
  {2,MDFINPUT}
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
  {lambda1,lambda1INPUT},
  {MDF,MDFINPUT}
};

ListDecayParticles = {Fu,Fe,Fd,Fv,VZ,VWp,hh,Chi,Fre};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"},{Chi,"Chi.f90"},{Fre,"Fre.f90"}};

(*ConditionGUTscale = g1 == g2;*)

DefaultInputValues ={
  lambda1INPUT -> 0.13,
  MDFINPUT -> 200.
  };
