OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1IN}
        };


ParametersToSolveTadpoles = {mu2};

(*BoundaryLowScaleInput={
  {Lambda1,Lambda1IN}
};*)

(*In the old toolbox uncoment the previous block and comment the next one*)

BoundaryLowScaleInput={
 {Lambda1,Lambda1IN},
 {v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}
};

(* Include block MSOFTIN also in not _low LesHouches input *)
(*BoundaryEWSBScale={
  {MS2, LHInput[MS2]},
  {Mn, LHInput[Mn]}
};*)


ListDecayParticles = {Fu,hh, Nv0, Fre};
ListDecayParticles3B = {{Fu,"Fu.f90"},
			{Nv0,"Nv0.f90"},
                        {Fre,"Fre.f90"}};

FlagLoopContributions = True;  

DefaultInputValues ={Lambda1IN -> 0.28(*, LSH[1,1]->1E-2,LSH[2,2]->1E-2,MS2[1,1]->1E3,MS2[2,2]->1E3,YR1[1,1]->1E-2,YR1[2,2]->1E-2,YR2[1,1]->1E-2,YR2[2,2]->1E-2,YR3->1E-2,Mn->1E2,MDF->550.*)};

