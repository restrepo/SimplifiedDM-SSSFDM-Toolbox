OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1Input},
        {2,Lambda2Input},
        {3,Lambda3Input},
        {4,Lambda4Input},
        {5,Lambda5Input},
        {6,Lambda6Input},
        {7,Lambda7Input},
	{8,Lambda8Input},
	{9,Lambda9Input},
	{10,Lambda10Input},
	{11,LambdahInput},
        {12,M12input},
	{13,Mhinput},
	{14,Muinput},
        {15,TanBeta} };

RealParameters = {TanBeta};

ParametersToSolveTadpoles = {M112,M222};

BoundaryLowScaleInput={
 {Lambda1,Lambda1Input},
 {Lambda2,Lambda2Input},
 {Lambda3,Lambda3Input},
 {Lambda4,Lambda4Input},
 {Lambda5,Lambda5Input},
 {Lambda6,Lambda6Input},
 {Lambda7,Lambda7Input},
 {Lambda8,Lambda8Input},
 {Lambda9,Lambda9Input},
 {Lambda10,Lambda10Input},
 {Lambdah,LambdahInput},
 {M12, M12input},
 {Mh, Mhinput},
 {Mu, Muinput},
 {v1,vSM*Cos[ArcTan[TanBeta]]},
 {v2,vSM*Sin[ArcTan[TanBeta]]},
 {Ye, YeSM*vSM/v1- v2/v1*epsE},
 {Yd, YdSM*vSM/v1- v2/v1*epsD},
 {Yu, YuSM*vSM/v2- v1/v2*epsU},
 {Yh, LHInput[Yh]},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}
};




ListDecayParticles = {Fu,Fe,Fd,Fv,hh,Ah,Hm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};


DefaultInputValues ={Lambda1Input -> 0.1, Lambda2Input -> 0.13, Lambda3Input -> 1.1, Lambda4Input ->-0.5, Lambda5Input ->0.5,  M12input -> 40000, Mhinput -> 10000, Muinput -> 100, TanBeta->50};
