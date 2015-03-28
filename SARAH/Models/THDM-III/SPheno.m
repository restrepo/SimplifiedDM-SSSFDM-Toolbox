OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1IN},
        {2,Lambda2IN},
        {3,Lambda3IN},
        {4,Lambda4IN},
        {5,Lambda5IN},
        {6,Lambda6IN},
        {7,Lambda7IN},
        {9,M12input},
        {10,TanBeta} };

RealParameters = {TanBeta};

ParametersToSolveTadpoles = {M112,M222};

BoundaryLowScaleInput={
 {Lambda1,Lambda1IN},
 {Lambda2,Lambda2IN},
 {Lambda3,Lambda3IN},
 {Lambda4,Lambda4IN},
 {Lambda5,Lambda5IN},
 {Lambda6,Lambda6IN},
 {Lambda7,Lambda7IN},
 {M12, M12input}
};




ListDecayParticles = {Fu,Fe,Fd,hh,Ah,Hm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};




