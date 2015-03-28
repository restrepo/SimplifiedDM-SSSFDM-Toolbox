(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



GenerateFineTuning:=Block[{k},

(*
Print["--------------------------------------"];
Print["Writing FineTuning Routines "];
Print["--------------------------------------"];
*)

Print[StyleForm["Write routines to calcualte fine-tuning","Section",FontSize->12]];

sphenoFT=OpenWrite[ToFileName[$sarahCurrentSPhenoDir,"FineTuning_"<>ModelName<>".f90"]];

WriteCopyRight[sphenoFT];

WriteString[sphenoFT,"Module FineTuning_"<>ModelName<>" \n \n"];
WriteString[sphenoFT, "Use Control \n"];
WriteString[sphenoFT, "Use LoopFunctions \n"];
WriteString[sphenoFT, "Use Mathematics \n"];
WriteString[sphenoFT, "Use Model_Data_"<>ModelName<>" \n"];
WriteString[sphenoFT, "Use RGEs_"<>ModelName<>" \n"];
WriteString[sphenoFT, "Use LoopMasses_"<>ModelName<>" \n"];
WriteString[sphenoFT, "Use SusyMasses_"<>ModelName<>" \n"];
WriteString[sphenoFT, "Use Couplings_"<>ModelName<>" \n"];
WriteString[sphenoFT,"Use Tadpoles_"<>ModelName<>" \n "];
If[Head[RegimeNr]===Integer,
WriteString[sphenoFT, "Use ShiftParameters_"<>ModelName<>" \n"];
];

WriteString[sphenoFT, "Use StandardModel \n \n"];

WriteString[sphenoFT, "Contains \n\n"];

WriteFineTuning;
GenerateBoundaryFT;

If[ImplementThresholds===True,
For[k=1, k<= Length[Thresholds],
WriteBoundaryDownFT[k];
WriteBoundaryUpFT[k];
k++;];
];


WriteString[sphenoFT,"End Module FineTuning_"<>ModelName<>" \n"];
Close[sphenoFT];
];




WriteFineTuning:=Block[{i,j,temp,pos,name,tlist},
(* Print["Write FT routines"]; *)

tlist = listAllParametersAndVEVs;
temp={};
For[i=1,i<=Length[tlist],
name=ToExpression[SPhenoForm[tlist[[i]]]<>"input"];
pos=Position[SPhenoParameters,tlist[[i]]][[1,1]];
SPhenoParameters=Join[SPhenoParameters,{(SPhenoParameters[[pos]] /. tlist[[i]]->name)}];
If[FreeQ[realVar,tlist[[i]]]==False,
realVar=Join[realVar,{name}];
];
temp=Join[temp,{name}];
i++;
];

MakeSubroutineTitle["FineTuning",temp, {},{"mGut","kont"},sphenoFT];

WriteString[sphenoFT,"Implicit None \n"];
MakeVariableList[temp,",Intent(in)",sphenoFT];
WriteString[sphenoFT,"Real(dp), Intent(in) :: mGUT \n"];
WriteString[sphenoFT,"Integer, Intent(inout) :: kont \n"];
WriteString[sphenoFT,"Integer :: i1, Fpar \n"];
WriteString[sphenoFT,"Real(dp) :: delta0,gA("<>ToString[numberAll]<>"), gB("<>ToString[numberAll] <>"), gC("<>ToString[numberAllwithVEVs]<>"), gRef("<>ToString[numberAll]<>"), gDiff("<>ToString[numberAll]<>")\n"];
WriteString[sphenoFT,"Real(dp) :: MZ2ref, MZ2current, variation, stepsize, dt, tz, factor \n"];
WriteString[sphenoFT,"Real(dp) :: vdref, vuref, maxdiff \n"];
WriteString[sphenoFT,"Real(dp) :: m_lo, m_hi \n"];
WriteString[sphenoFT,"Logical :: NumericalProblem \n"];
MakeVariableList[listAllParametersAndVEVs,"",sphenoFT];
WriteString[sphenoFT, "Complex(dp) :: Tad1Loop("<>ToString[SA`NrTadpoleEquations]<>"), dmz2, mudim \n\n"];
MakeVariableList[NewMassParameters,"",sphenoFT];
MakeVariableList[Union[Flatten[{NeededCouplingsUnmixed}]],"",sphenoFT];

WriteString[sphenoFT,"Write(*,*) \"Calculate FineTuning\" \n"];

WriteString[sphenoFT,"NumericalProblem = .False. \n"];
WriteString[sphenoFT,"Tad1Loop = 0._dp \n"];
WriteString[sphenoFT,"stepsize = 1.0E-5_dp \n \n"];
WriteString[sphenoFT,"delta0 = stepsize/1000._dp\n \n"];
WriteString[sphenoFT,"variation = 1._dp + stepsize \n \n"];

WriteString[sphenoFT,"mudim = GetRenormalizationScale() \n \n"];

For[i=1,i<=Length[listAllParametersAndVEVs],
WriteString[sphenoFT,SPhenoForm[listAllParametersAndVEVs[[i]]]<>" = "<>SPhenoForm[listAllParametersAndVEVs[[i]]]<>"input \n"];
i++;];



WriteString[sphenoFT,"! ------------------------- \n"];
WriteString[sphenoFT,"! Initialization \n"];
WriteString[sphenoFT,"! ----------------------- \n \n"];

WriteString[sphenoFT,"Fpar = 0 \n"];

WriteGUTnormalization[sphenoFT];

(*
WriteString[sphenoFT,"! Run to MZ and get all tree-level values at that scale \n"];
*)
MakeCall["ParametersToG"<>ToString[numberAllwithVEVs],listAllParametersAndVEVs,{},{"gC"},sphenoFT];
(*
WriteString[sphenoFT,"tz= Log(sqrt(mudim)/MZ)\n"];
WriteString[sphenoFT,"dt=-tz/50._dp\n"];
WriteString[sphenoFT,"Call odeint(gC,"<>ToString[numberAllwithVEVs]<>",tz,0._dp,delta0,dt,0._dp,rge"<>ToString[numberAllwithVEVs]<>",kont)\n"];
*)
MakeCall["GToParameters"<>ToString[numberAllwithVEVs],listAllParametersAndVEVs,{"gC"},{},sphenoFT];

WriteRemoveGUTnormalization[sphenoFT];

(*
For[i=1,i<=Length[listVEVs],
WriteString[sphenoFT,SPhenoForm[listVEVs[[i]]] <>" = "<>SPhenoForm[listVEVs[[i]]]<>"MZ \n"];
i++;];
*)

MakeCall["SolveTadpoleEquations",listAllParametersAndVEVs,{},{"Tad1Loop"},sphenoFT];

WriteString[sphenoFT,"! First Run to GUT scale and back to get reference \n"];

WriteString[sphenoFT,"Do i1=1,100 \n"];
WriteRunningUpFT;
WriteString[sphenoFT,"Call BoundaryFT(gA,gB,0,variation)\n"];
WriteRunningDownFT;

WriteString[sphenoFT,"gDiff=Abs(gB-gRef) \n"];
WriteString[sphenoFT,"Where (Abs(gRef).Gt.0._dp) gDiff=gDiff/Abs(gRef) \n"];
WriteString[sphenoFT,"maxdiff=Maxval(gDiff) \n"];

WriteString[sphenoFT,"If (Abs(maxdiff).gt.delta0) Then \n"];
WriteString[sphenoFT,"gRef = gB \n"];
MakeCall["SolveTadpoleEquations",listAllParametersAndVEVs,{},{"Tad1Loop"},sphenoFT];
WriteString[sphenoFT,"Else \n"];
WriteString[sphenoFT,"Exit \n"];
WriteString[sphenoFT,"End if \n"];
WriteString[sphenoFT,"End Do \n"];

WriteString[sphenoFT,"\n ! Calculate VEVs \n"];
MakeCall["SolveTadpoleEquationsVEVs",listAllParametersAndVEVs,{},{"Tad1Loop"},sphenoFT];

WriteString[sphenoFT,"\n\n ! Calculate reference value for MZ  \n"];
WriteString[sphenoFT,"MZ2ref = 1._dp/4._dp*("<>SPhenoForm[hyperchargeCoupling]<>"**2 + "<>SPhenoForm[leftCoupling]<> "**2)*("
SPhenoForm[VEVSM1]<>"**2 + "<>SPhenoForm[VEVSM2]<>"**2) \n"];

WriteString[sphenoFT,"vdref = "<>SPhenoForm[VEVSM1]<>"\n"];
WriteString[sphenoFT,"vuref = "<>SPhenoForm[VEVSM2]<>"\n"];

WriteString[sphenoFT,"If (OneLoopFT) Then \n"];
WriteString[sphenoFT,"\n ! One-Loop correction \n"];
MakeCall["TreeMasses",Join[NewMassParameters,Join[listVEVs,listAllParameters]],{},{".False.","kont"},sphenoFT];
MakeCall["CouplingsForVectorBosons" , Join[parametersZW,namesZW],{},{},sphenoFT];
MakeCall["Pi1Loop"<>ToString[VectorZ],Flatten[{massesZ,couplingsZ}],{"MZ2ref"},{"kont","dmZ2"},sphenoFT];
WriteString[sphenoFT,"MZ2ref = MZ2ref+Real(dmz2,dp) \n"];
WriteString[sphenoFT,"End if \n"];

WriteString[sphenoFT,"If (i1.gt.99) Then \n"];
WriteString[sphenoFT," NumericalProblem = .true. \n"];
WriteString[sphenoFT,"Write(*,*) \"RGEs haven't converged with needed precission\" \n"];
WriteString[sphenoFT,"End if \n"];

WriteString[sphenoFT,"If (MZ2ref.lt.1000._dp) Then \n"];
WriteString[sphenoFT," NumericalProblem = .true. \n"];
WriteString[sphenoFT,"Write(*,*) \"Numerical problem in solving tadpole equations with respect to VEVs.\" \n"];
WriteString[sphenoFT,"End if \n"];


(*
WriteString[sphenoFT,"\n ! Save starting parameters \n"];
WriteString[sphenoFT,"gA = gB \n"];
*)

WriteString[sphenoFT,"\n\n"];
WriteString[sphenoFT,"! ----------------------------- \n"];
WriteString[sphenoFT,"! Calculate Fine-Tuning \n"];
WriteString[sphenoFT,"! -------------------------- \n \n"];
WriteString[sphenoFT,"Do i1=1,"<>ToString[Length[FineTuningParameters]]<>" \n \n"];
WriteString[sphenoFT,"! RGE running \n"];
WriteString[sphenoFT,"Fpar = i1 \n"];

For[i=1,i<=Length[listVEVs],
WriteString[sphenoFT,SPhenoForm[listVEVs[[i]]] <>" = "<>SPhenoForm[listVEVs[[i]]]<>"MZ \n"];
i++;];

(*
WriteString[sphenoFT,"tz=Log(mZ/mGUT)\n"];
WriteString[sphenoFT,"dt=-tz/50._dp\n"];
WriteString[sphenoFT,"Call odeint(gA,"<>ToString[numberAll]<>",tz,0._dp,delta0,dt,0._dp,rge"<>ToString[numberAll]<>",kont)\n"];
*)
WriteString[sphenoFT,"Call BoundaryFT(gA,gB,i1,variation)\n"];
WriteRunningDownFT;

WriteString[sphenoFT,"Select Case(i1) \n"];
For[i=1,i<=Length[FineTuningParameters],
WriteString[sphenoFT,"  Case("<>ToString[i]<>") \n"];
WriteString[sphenoFT,"    factor = "<>SPhenoForm[FineTuningParameters[[i,2]]]<>" \n"];
i++;];
WriteString[sphenoFT,"End Select \n"];



WriteString[sphenoFT,"\n\n ! Calculate VEVs \n"];
MakeCall["SolveTadpoleEquationsVEVs",listAllParametersAndVEVs,{},{"Tad1Loop"},sphenoFT];

(*
MakeCall["SolveTadpoleEquationsVEVsSM",listAllParametersAndVEVs,{},{"Tad1Loop"},sphenoFT];
*)
WriteString[sphenoFT,"\n\n ! Calculate FineTuning \n"];
WriteString[sphenoFT,"MZ2current = 1._dp/4._dp*("<>SPhenoForm[hyperchargeCoupling]<>"**2 + "<>SPhenoForm[leftCoupling]<> "**2)*("
SPhenoForm[VEVSM1]<>"**2 + "<>SPhenoForm[VEVSM2]<>"**2) \n"];


WriteString[sphenoFT,"If (OneLoopFT) Then \n"];
WriteString[sphenoFT,"\n ! One-Loop correction \n"];
MakeCall["TreeMasses",Join[NewMassParameters,Join[listVEVs,listAllParameters]],{},{".False.","kont"},sphenoFT];
MakeCall["CouplingsForVectorBosons" , Join[parametersZW,namesZW],{},{},sphenoFT];
MakeCall["Pi1Loop"<>ToString[VectorZ],Flatten[{massesZ,couplingsZ}],{"MZ2current"},{"kont","dmZ2"},sphenoFT];
WriteString[sphenoFT,"MZ2current = MZ2current + Real(dmz2,dp) \n"];
WriteString[sphenoFT,"End if \n"];

(*
WriteString[sphenoFT,"FineTuningResults(i1) = 0.5_dp*Abs((MZ2current-MZ2ref)/(MZ2ref))/stepsize*factor \n"];


WriteString[sphenoFT,"\n\n ! Calculate VEVs \n"];
MakeCall["SolveTadpoleEquationsVEVs",listAllParametersAndVEVs,{},{"Tad1Loop"},sphenoFT];

WriteString[sphenoFT,"\n\n ! Calculate FineTuning \n"];
WriteString[sphenoFT,"MZ2current = 1._dp/4._dp*("<>SPhenoForm[hyperchargeCoupling]<>"**2 + "<>SPhenoForm[leftCoupling]<> "**2)*("
SPhenoForm[VEVSM1]<>"**2 + "<>SPhenoForm[VEVSM2]<>"**2) \n"];
*)
WriteString[sphenoFT,"If ((MZ2Current.lt.5000._dp).or.(MZ2Current.gt.10000._dp)) Then \n"];
WriteString[sphenoFT,"Write(*,*) \" Large deviation in Z mass in fine-tuning routine: \", sqrt(MZ2Current) \n"];
WriteString[sphenoFT,"Write(*,*) \" That's most likely a numerical problem! \" \n"];
WriteString[sphenoFT," NumericalProblem = .true. \n"];
WriteString[sphenoFT,"End If \n"];

WriteString[sphenoFT,"If (NumericalProblem) Then \n"];
WriteString[sphenoFT," FineTuningResultsAllVEVs(i1) = -1._dp \n"];
WriteString[sphenoFT,"Else \n"];
WriteString[sphenoFT," FineTuningResultsAllVEVs(i1) = 0.5_dp*Abs((MZ2current-MZ2ref)/(MZ2ref))/stepsize*factor \n"];
WriteString[sphenoFT,"End If \n"];

WriteString[sphenoFT,"! Write(*,*) sqrt((Real(vu-vuref,dp)**2+Real(vd-vdref,dp)**2)/(vdref**2+vuref**2))/stepsize*factor \n"];


WriteString[sphenoFT,"End Do \n"];

WriteString[sphenoFT,"End Subroutine FineTuning \n"];
];


GenerateBoundaryFT:=Block[{i,j,k},

(* Print["Write BoundaryFT"]; *)

WriteString[sphenoFT,"Subroutine BoundaryFT(gA,gB,FTpar,variation) \n"];

WriteString[sphenoFT,"Implicit None \n"];
WriteString[sphenoFT,"Real(dp),Intent(in)::gA(:)\n"];
WriteString[sphenoFT,"Real(dp),Intent(out)::gB(:)\n"];
WriteString[sphenoFT,"Integer, Intent(in) :: FTpar\n"];
WriteString[sphenoFT,"Real(dp), Intent(in) :: variation \n"];
WriteString[sphenoFT,"Complex(dp) :: savePar \n"];
WriteString[sphenoFT,"Integer::i1,i2\n"];
MakeVariableList[Transpose[LowScaleList][[1]],"",sphenoFT];
If[Length[HighScaleList]>1,
MakeVariableList[Transpose[HighScaleList][[1]],"",sphenoFT];
];


WriteString[sphenoFT,"Iname=Iname+1\n"];
WriteString[sphenoFT,"NameOfUnit(Iname)='BoundaryFT'\n"];

If[SA`KineticMixingParameters=!={},
WriteString[sphenoFT,"KineticMixing = KineticMixingSave \n"];
];

MakeCall["GToParameters"<>ToString[numberAll],listAllParameters,{"gA"},{},sphenoFT];

WriteString[sphenoFT,"Select Case(FTpar) \n"];
For[i=1,i<=Length[FineTuningParameters],
If[FreeQ[MINPAR,FineTuningParameters[[i,1]]] == False || FreeQ[EXTPAR,FineTuningParameters[[i,1]]] == False ||  FreeQ[Join[lowScaleIn,highScaleIn],FineTuningParameters[[i,1]] /. A_[b___Integer]->A]==False, 
WriteString[sphenoFT,"Case ("<>ToString[i]<>") \n"];
WriteString[sphenoFT,"   savePar = "<>SPhenoForm[FineTuningParameters[[i,1]]]<>" \n"];
WriteString[sphenoFT,"   "<>SPhenoForm[FineTuningParameters[[i,1]]]<>" = variation*"<>SPhenoForm[FineTuningParameters[[i,1]]]<>" \n"];
];
i++;];
WriteString[sphenoFT,"End Select \n"];


If[SeveralBoundaryConditions===False,
For[i=1,i<=Length[BoundaryHighScale],
If[BoundaryHighScale[[i,2]]=!= RUNNING && FreeQ[ParametersToSolveTadpoles,BoundaryHighScale[[i,1]]] && FreeQ[Table[BetaGauge[[j,1]],{j,1,Length[BetaGauge]}],BoundaryHighScale[[i,1]]],
If[FreeQ[BoundaryHighScale[[i,2]],DIAGONAL]==True,
WriteString[sphenoFT,SPhenoForm[BoundaryHighScale[[i,1]]]<>" = " <> SPhenoForm[BoundaryHighScale[[i,2]]]<>"\n"];,
WriteString[sphenoFT,SPhenoForm[BoundaryHighScale[[i,1]]]<>" = 0._dp \n"];
WriteString[sphenoFT,"Do i1=1,"<>ToString[getDimSPheno[BoundaryHighScale[[i,1]]][[1]]]<>"\n"];
WriteString[sphenoFT,SPhenoForm[BoundaryHighScale[[i,1]]]<>"(i1,i1) = " <> SPhenoForm[BoundaryHighScale[[i,2]] /. DIAGONAL->1]<>"\n"];
WriteString[sphenoFT,"End Do\n"];
];
];
i++;];,


WriteString[sphenoFT,"Select Case(BoundaryCondition) \n"];
For[j=1,j<=Length[BoundaryHighScale],
WriteString[sphenoFT,"Case ("<>ToString[j]<>") \n"];
For[i=1,i<=Length[BoundaryHighScale[[j]]],
If[BoundaryHighScale[[j,i,2]]=!= RUNNING && FreeQ[ParametersToSolveTadpoles,BoundaryHighScale[[j,i,1]]] && FreeQ[Table[BetaGauge[[k,1]],{k,1,Length[BetaGauge]}],BoundaryHighScale[[j,i,1]]],
If[FreeQ[BoundaryHighScale[[j,i,2]],DIAGONAL]==True,
WriteString[sphenoFT,SPhenoForm[BoundaryHighScale[[j,i,1]]]<>" = " <> SPhenoForm[BoundaryHighScale[[j,i,2]]]<>"\n"];,
WriteString[sphenoFT,SPhenoForm[BoundaryHighScale[[j,i,1]]]<>" = 0._dp \n"];
WriteString[sphenoFT,"Do i1=1,"<>ToString[getDimSPheno[BoundaryHighScale[[j,i,1]]][[1]]]<>"\n"];
WriteString[sphenoFT,SPhenoForm[BoundaryHighScale[[j,i,1]]]<>"(i1,i1) = " <> SPhenoForm[BoundaryHighScale[[j,i,2]] /. DIAGONAL->1]<>"\n"];
WriteString[sphenoFT,"End Do\n"];
];
];
i++;];
j++;];
WriteString[sphenoFT,"End Select \n"];
];

WriteString[sphenoFT,"Select Case(FTpar) \n"];
For[i=1,i<=Length[FineTuningParameters],
WriteString[sphenoFT,"Case ("<>ToString[i]<>") \n"];
If[FreeQ[MINPAR,FineTuningParameters[[i,1]]] == False || FreeQ[EXTPAR,FineTuningParameters[[i,1]]] == False ||  FreeQ[Join[lowScaleIn,highScaleIn],FineTuningParameters[[i,1]] /. A_[b___Integer]->A]==False,
WriteString[sphenoFT,"   "<>SPhenoForm[FineTuningParameters[[i,1]]]<>" = savePar \n"];,
WriteString[sphenoFT,"   "<>SPhenoForm[FineTuningParameters[[i,1]]]<>" = variation*"<>SPhenoForm[FineTuningParameters[[i,1]]]<>" \n"];
];
i++;];
WriteString[sphenoFT,"End Select \n"];


MakeCall["ParametersToG"<>ToString[numberAll],listAllParameters,{},{"gB"},sphenoFT];

WriteString[sphenoFT,"Iname=Iname-1\n"];

WriteString[sphenoFT,"End Subroutine BoundaryFT \n \n"];
];


WriteRunningUpFT:=Block[{i,j,k},

WriteGUTnormalization[sphenoFT];
MakeCall["ParametersToG"<>ToString[numberAll],listAllParameters,{},{"gA"},sphenoFT];

If[ImplementThresholds===False,
(* Without Thresholds *)
(* WriteString[sphenoFT,"tz=Log(mz/mGUT)\n"]; *)
WriteString[sphenoFT,"tz=Log(sqrt(mudim)/mGUT)\n"];
WriteString[sphenoFT,"dt=-tz/50._dp\n"];
WriteString[sphenoFT,"Call odeint(gA,"<>ToString[numberAll]<>",tz,0._dp,0.001_dp*delta0,dt,0._dp,rge"<>ToString[numberAll]<>",kont)\n"];,
(* With Thresholds *)
(* WriteString[sphenoFT,"m_lo=mZ \n"]; *)
WriteString[sphenoFT,"m_lo= sqrt(mudim) \n"];
For[k=1, k<= Length[Thresholds],
WriteString[sphenoFT,"\n\n ! --------- Running up to "<>ToString[k]<>". threshold scale --------- \n"];
WriteString[sphenoFT,"If ("<>SPhenoForm[Thresholds[[k,1]]]<>".lt.Abs(mgut)) Then\n"];
WriteString[sphenoFT,"IncludeThresholdsAtScale = TwoLoopRGE \n"];
WriteString[sphenoFT,"m_hi="<>SPhenoForm[Thresholds[[k,1]]]<>"\n"];
WriteString[sphenoFT,"Else \n"];
WriteString[sphenoFT,"m_hi=Abs(mgut)\n"];
WriteString[sphenoFT," IncludeThresholdsAtScale = .False. \n"];
WriteString[sphenoFT,"Endif \n"];
WriteString[sphenoFT,"tz=Log(Abs(m_lo/m_hi))\n"];
WriteString[sphenoFT,"dt=-tz/50._dp\n"];
WriteString[sphenoFT,"Call odeint(gA,"<>ToString[numberAll]<>",tz,0._dp,0.001_dp*delta0,dt,0._dp,rge"<>ToString[numberAll]<>",kont)\n"];
WriteString[sphenoFT,"m_lo=m_hi\n"];
MakeCall["BoundaryConditionUpFT_"<>ToString[k],{},{"gA","IncludeThresholdsAtScale"},{},sphenoFT];
k++;];
WriteString[sphenoFT,"\n\n ! --------- Running up to GUT scale --------- \n"];
WriteString[sphenoFT,"tz=Log(m_lo/mGUT)\n"];
WriteString[sphenoFT,"dt=-tz/50._dp\n"];
WriteString[sphenoFT,"Call odeint(gA,"<>ToString[numberAll]<>",tz,0._dp,0.001_dp*delta0,dt,0._dp,rge"<>ToString[numberAll]<>",kont)\n"];

];
];

WriteRunningDownFT:=Block[{i,j,k,pos},
If[ImplementThresholds===False,
(* Without Thresholds *)
(* WriteString[sphenoFT,"tz=Log(mz/mGUT)\n"]; *)
WriteString[sphenoFT,"tz=Log(sqrt(mudim)/mGUT)\n"];
WriteString[sphenoFT,"dt=tz/50._dp\n"];
WriteString[sphenoFT,"Call odeint(gB,"<>ToString[numberAll]<>",0._dp,tz,0.001_dp*delta0,dt,0._dp,rge"<>ToString[numberAll]<>",kont)\n"];,

(* With Thresholds *)
WriteString[sphenoFT,"m_hi=mGUT \n"];

For[i=1,i<=Length[ThresholdMasses[[-1]]],
WriteString[sphenoFT,"NumberGenerations"<>SPhenoForm[ThresholdMasses[[-1,i,1]]]  <>" = " <>ToString[ThresholdMasses[[-1,i,2]]]<> "\n"];
If[FreeQ[NeededOtherFields,ThresholdMasses[[-1,i,1]]]==False,
pos=Position[NeededOtherFields,ThresholdMasses[[-1,i,1]]][[1,1]];
WriteString[sphenoFT,"NumberGenerations"<>SPhenoForm[NeededOtherFields[[pos,2]]]  <>" = " <>ToString[ThresholdMasses[[-1,i,2]]]<> "\n"];
];
i++;];
WriteString[sphenoFT,"ThresholdCrossed = "<>ToString[Length[Thresholds]]<>"\n\n"];

For[k=Length[Thresholds],k>=1,
WriteString[sphenoFT,"\n\n ! --------- Running down to "<>ToString[k]<>". threshold scale --------- \n"];
WriteString[sphenoFT,"If ("<>SPhenoForm[Thresholds[[k,1]]]<>".Lt.Abs(m_hi)) Then\n"];
WriteString[sphenoFT,"IncludeThresholdsAtScale = TwoLoopRGE \n"];
WriteString[sphenoFT,"m_lo="<>SPhenoForm[Thresholds[[k,1]]]<>"\n"];
WriteString[sphenoFT,"Else \n"];
WriteString[sphenoFT," IncludeThresholdsAtScale = .False. \n"];
WriteString[sphenoFT,"m_lo=Abs(m_hi)\n"];
WriteString[sphenoFT,"Endif \n"];
WriteString[sphenoFT,"tz=Log(Abs(m_lo/m_hi))\n"];
WriteString[sphenoFT,"dt=-tz/50._dp\n"];
WriteString[sphenoFT,"Call odeint(gB,"<>ToString[numberAll]<>",0._dp,tz,0.001_dp*delta0,dt,0._dp,rge"<>ToString[numberAll]<>",kont)\n"];
WriteString[sphenoFT,"m_hi=m_lo\n"];
MakeCall["BoundaryConditionDownFT_"<>ToString[k],{},{"gB","IncludeThresholdsAtScale","variation","Fpar"},{},sphenoFT];
k--;];
(* WriteString[sphenoFT,"\n\n ! ------- Running down to mz scale ------- \n"]; *)
(* WriteString[sphenoFT,"tz=Log(mz/m_hi)\n"]; *)
WriteString[sphenoFT,"\n\n ! ------- Running down to SUSY scale ------- \n"];
WriteString[sphenoFT,"tz=Log(sqrt(mudim)/m_hi)\n"];
WriteString[sphenoFT,"dt=tz/50._dp\n"];
WriteString[sphenoFT,"Call odeint(gB,"<>ToString[numberAll]<>",0._dp,tz,0.001_dp*delta0,dt,0._dp,rge"<>ToString[numberAll]<>",kont)\n"];
];
MakeCall["GToParameters"<>ToString[numberAll],listAllParameters,{"gB"},{},sphenoFT];
WriteRemoveGUTnormalization[sphenoFT];
];




WriteBoundaryUpFT[nr_]:=Block[{i,j,k,j2},
k=nr;
MakeSubroutineTitle["BoundaryConditionUpFT_"<>ToString[nr],{},{"gA","Shifts"},{},sphenoFT];
WriteString[sphenoFT,"Implicit None \n"];
WriteString[sphenoFT,"Real(dp), Intent(inout) :: gA(:) \n"];
WriteString[sphenoFT,"Logical, Intent(in) :: Shifts \n"];
MakeVariableList[listAllParameters,"", sphenoFT];
WriteString[sphenoFT,"Integer :: i1,i2,i3,i4 \n \n"];

MakeCall["GToParameters"<>ToString[numberAll],listAllParameters,{"gA"},{},sphenoFT];

For[i=1,i<=Length[BetaGauge],
WriteString[sphenoFT,SPhenoForm[BetaGauge[[i,1]]]<>"_up_"<>ToString[nr] <>" = "<>SPhenoForm[BetaGauge[[i,1]]]<>"\n"];
i++;];

WriteString[sphenoFT,"If (Shifts) Then\n"];
For[i=1,i<=Length[Gauge],
For[j=1,j<=Length[ThresholdMasses[[k]]],
If[getGenSF[ThresholdMasses[[k,j,1]]]>1,
For[j2=ThresholdMasses[[k,j,2]],j2<= ThresholdMasses[[k,j,3]],
tempDynkin=SA`Dynkin[ThresholdMasses[[k,j,1]],i]*MulFactor[ThresholdMasses[[k,j,1]],i];
If[NumericQ[tempDynkin] && tempDynkin =!=0,
WriteString[sphenoFT,SPhenoForm[BetaGauge[[i,1]] ]<>" = "<> SPhenoForm[BetaGauge[[i,1]]]<>"*(1._dp - oo16pi2*"<>SPhenoForm[BetaGauge[[i,1]]]<>"**2* & \n"];
WriteString[sphenoFT,"  & "<>SPhenoForm[tempDynkin]<>"*Log(MassOf"<>SPhenoForm[ThresholdMasses[[k,j,1]]]<>"("<>ToString[j2]<>")/"<>SPhenoForm[Thresholds[[k,1]]] <>")) \n"];

WriteString[sphenoFT,SPhenoForm[BetaMi[[i,1]] ]<>" = "<> SPhenoForm[BetaMi[[i,1]]]<>"*(1._dp - oo16pi2*"<>SPhenoForm[BetaGauge[[i,1]]]<>"**2* & \n"];
WriteString[sphenoFT,"  & "<>SPhenoForm[tempDynkin]<>"*Log(MassOf"<>SPhenoForm[ThresholdMasses[[k,j,1]]]<>"("<>ToString[j2]<>")/"<>SPhenoForm[Thresholds[[k,1]]] <>")) \n"];

];
j2++;];,
tempDynkin=SA`Dynkin[ThresholdMasses[[k,j,1]],i]*MulFactor[ThresholdMasses[[k,j,1]],i];
If[NumericQ[tempDynkin] && tempDynkin =!=0,
WriteString[sphenoFT,SPhenoForm[BetaGauge[[i,1]] ]<>" = "<> SPhenoForm[BetaGauge[[i,1]]]<>"*(1._dp - oo16pi2*"<>SPhenoForm[BetaGauge[[i,1]]]<>"**2* & \n"];
WriteString[sphenoFT,"  & "<>SPhenoForm[tempDynkin]<>"*Log(MassOf"<>SPhenoForm[ThresholdMasses[[k,j,1]]]<>"/"<>SPhenoForm[Thresholds[[k,1]]] <>")) \n"];

WriteString[sphenoFT,SPhenoForm[BetaMi[[i,1]] ]<>" = "<> SPhenoForm[BetaMi[[i,1]]]<>"*(1._dp - oo16pi2*"<>SPhenoForm[BetaGauge[[i,1]]]<>"**2* & \n"];
WriteString[sphenoFT,"  & "<>SPhenoForm[tempDynkin]<>"*Log(MassOf"<>SPhenoForm[ThresholdMasses[[k,j,1]]]<>"/"<>SPhenoForm[Thresholds[[k,1]]] <>")) \n"];
];
];
j++;];
i++;];
WriteString[sphenoFT,"End If\n"];


For[i=1,i<=Length[ThresholdCouplings],
Switch[Length[getDimSPheno[ThresholdCouplings[[i]]]],
3, ind = "("<>ToString[nr]<>",:,:,:)";,
2, ind = "("<>ToString[nr]<>",:,:)";,
1, ind = "("<>ToString[nr]<>",:)";,
0, ind ="("<>ToString[nr]<>")";
];
WriteString[sphenoFT, SPhenoForm[ThresholdCouplings[[i]]] <>" = "<>SPhenoForm[ThresholdCouplings[[i]]]<>"_save"<>ind <>"\n"];
i++];

For[i=1,i<=Length[ThresholdMasses[[nr]]],
WriteString[sphenoFT,"NumberGenerations"<>SPhenoForm[ThresholdMasses[[nr,i,1]]]  <>" = " <>ToString[ThresholdMasses[[nr,i,2]]]<> "\n"];
If[FreeQ[NeededOtherFields,ThresholdMasses[[nr,i,1]]]==False,
pos=Position[NeededOtherFields,ThresholdMasses[[nr,i,1]]][[1,1]];
WriteString[sphenoFT,"NumberGenerations"<>SPhenoForm[NeededOtherFields[[pos,2]]]  <>" = " <>ToString[ThresholdMasses[[nr,i,2]]]<> "\n"];
];
i++;];


For[i=1,i<=Length[BoundaryConditionsDown[[nr]]],
If[FreeQ[BoundaryConditionsDown[[nr,i,1]],index1],
WriteString[sphenoFT,SPhenoForm[BoundaryConditionsDown[[nr,i,1]]] <>" = "<>StringReplace[SPhenoForm[BoundaryConditionsDown[[nr,i,1]]],{SPhenoForm[BoundaryConditionsDown[[nr,i,1]] /. A_[b__Integer]->A]->SPhenoForm[BoundaryConditionsDown[[nr,i,1]] /. A_[b__Integer]->A]<>"_down_"<>ToString[nr]}] <>"\n "];,
dims = getDimSPheno[BoundaryConditionsDown[[nr,i,1]]/. a_[b__]->a];
pos = Position[BoundaryConditionsDown[[nr,i,1]],index1][[1,1]];
WriteString[sphenoFT,"Do i1=1,"<>ToString[dims[[pos]]] <>"\n"];
If[FreeQ[BoundaryConditionsDown[[nr,i,1]],index2]==False,
pos = Position[BoundaryConditionsDown[[nr,i,1]],index2][[1,1]];
WriteString[sphenoFT,"Do i2=1,"<>ToString[dims[[pos]]] <>"\n"];
];
If[FreeQ[BoundaryConditionsDown[[nr,i,1]],index3]==False,
pos = Position[BoundaryConditionsDown[[nr,i,1]],index3][[1,1]];
WriteString[sphenoFT,"Do i3=1,"<>ToString[dims[[pos]]] <>"\n"];
];

WriteString[sphenoFT,SPhenoForm[BoundaryConditionsDown[[nr,i,1]]/.{index1->i1,index2->i2,index3->i3}] <>" = "<>StringReplace[SPhenoForm[BoundaryConditionsDown[[nr,i,1]] /.{index1->i1,index2->i2,index3->i3}],SPhenoForm[Head[BoundaryConditionsDown[[nr,i,1]]]]->SPhenoForm[Head[BoundaryConditionsDown[[nr,i,1]]]]<>"_down_"<>ToString[nr]] <>"\n "];


WriteString[sphenoFT,"End Do \n"];
If[FreeQ[BoundaryConditionsDown[[nr,i,1]],index2]==False,
WriteString[sphenoFT,"End Do \n"];
];
If[FreeQ[BoundaryConditionsDown[[nr,i,1]],index3]==False,
WriteString[sphenoFT,"End Do \n"];
];
];
i++;];


For[i=1,i<=Length[BoundaryConditionsUp[[nr]]],
If[FreeQ[BoundaryConditionsUp[[nr,i,1]],index1],
WriteString[sphenoFT,SPhenoForm[BoundaryConditionsUp[[nr,i,1]]] <> " = " <> SPhenoForm[BoundaryConditionsUp[[nr,i,2]]/. {fGMSB[x_]->1,gGMSB[x_]->1}] <>"\n "];,
dims = getDimSPheno[BoundaryConditionsUp[[nr,i,1]]/. a_[b__]->a];
pos = Position[BoundaryConditionsUp[[nr,i,1]],index1][[1,1]];
WriteString[sphenoFT,"Do i1=1,"<>ToString[dims[[pos]]] <>"\n"];
If[FreeQ[BoundaryConditionsUp[[nr,i,1]],index2]==False,
pos = Position[BoundaryConditionsUp[[nr,i,1]],index2][[1,1]];
WriteString[sphenoFT,"Do i2=1,"<>ToString[dims[[pos]]] <>"\n"];
];
If[FreeQ[BoundaryConditionsUp[[nr,i,1]],index3]==False,
pos = Position[BoundaryConditionsUp[[nr,i,1]],index3][[1,1]];
WriteString[sphenoFT,"Do i3=1,"<>ToString[dims[[pos]]] <>"\n"];
];

WriteString[sphenoFT,SPhenoForm[BoundaryConditionsUp[[nr,i,1]] /.{index1->i1,index2->i2,index3->i3}] <> " = " <> SPhenoForm[BoundaryConditionsUp[[nr,i,2]]/.{index1->i1,index2->i2,index3->i3}/. {fGMSB[x_]->1,gGMSB[x_]->1}] <>"\n "];

WriteString[sphenoFT,"End Do \n"];
If[FreeQ[BoundaryConditionsUp[[nr,i,1]],index2]==False,
WriteString[sphenoFT,"End Do \n"];
];
If[FreeQ[BoundaryConditionsUp[[nr,i,1]],index3]==False,
WriteString[sphenoFT,"End Do \n"];
];
];
i++;];

WriteString[sphenoFT,"ThresholdCrossed = "<>ToString[nr]<>"\n\n"];

MakeCall["ParametersToG"<>ToString[numberAll],listAllParameters,{},{"gA"},sphenoFT];

WriteString[sphenoFT,"End Subroutine BoundaryConditionUpFT_"<>ToString[nr]<>"\n\n"];
];



WriteBoundaryDownFT[nr_]:=Block[{i,j,j2,dim,k,name,name1,name2,pos,ind},
k=nr;
MakeSubroutineTitle["BoundaryConditionDownFT_"<>ToString[nr],{},{"gB","Shifts","variation","FTpar"},{},sphenoFT];
WriteString[sphenoFT,"Implicit None \n"];
WriteString[sphenoFT,"Real(dp), Intent(inout) :: gB(:) \n"];
WriteString[sphenoFT,"Logical, Intent(in) :: Shifts \n"];
WriteString[sphenoFT,"Integer, Intent(in) :: FTpar \n"];
WriteString[sphenoFT,"Real(dp), Intent(in) :: variation \n"];
WriteString[sphenoFT,"Real(dp) :: savePar , test(2)\n"];
MakeVariableList[listAllParameters,"", sphenoFT];
WriteString[sphenoFT,"Integer :: i1,i2,i3,i4, kont \n \n"];

For[i=1,i<=Length[ThresholdParticles],
WriteString[sphenoFT,"Real(dp) :: EW"<> ToString[ThresholdParticles[[i]]]<>"("<> ToString[getGenSF[ThresholdParticles[[i]]]]<>") \n"];
WriteString[sphenoFT,"Complex(dp) :: dummy"<> ToString[ThresholdParticles[[i]]]<>"("<>ToString[getGenSF[ThresholdParticles[[i]]]]<>","<> ToString[getGenSF[ThresholdParticles[[i]]]]<>") \n"];
i++;];

WriteString[sphenoSugra, "Real(dp) ::  test(2) \n\n"];

WriteString[sphenoFT,"Select Case(FTpar) \n"];
For[i=1,i<=Length[FineTuningParameters],
If[FreeQ[MINPAR,FineTuningParameters[[i,1]]] == False || FreeQ[EXTPAR,FineTuningParameters[[i,1]]] == False ||  FreeQ[Join[lowScaleIn,highScaleIn],FineTuningParameters[[i,1]] /. A_[b___Integer]->A]==False,
WriteString[sphenoFT,"Case ("<>ToString[i]<>") \n"];
WriteString[sphenoFT,"   savePar = "<>SPhenoForm[FineTuningParameters[[i,1]]]<>" \n"];
WriteString[sphenoFT,"   "<>SPhenoForm[FineTuningParameters[[i,1]]]<>" = variation*"<>SPhenoForm[FineTuningParameters[[i,1]]]<>" \n"];
];
i++;];
WriteString[sphenoFT,"End Select \n"];

MakeCall["GToParameters"<>ToString[numberAll],listAllParameters,{"gB"},{},sphenoFT];

For[i=1,i<=Length[ThresholdMasses[[nr]]],
If[getGenSF[ThresholdMasses[[nr,i,1]]]>1,
dim=ToString[getGenSF[ThresholdMasses[[nr,i,1]]]];
name = ToString[ThresholdMasses[[nr,i,1]]];
pos = Position[BilinearSuperpotential,ThresholdMasses[[nr,i,1]]][[1,1]];
name1=name;
name2=DeleteCases[BilinearSuperpotential[[pos]][[2]],ThresholdMasses[[nr,i,1]]];
If[name2==={},name2=name1;,name2=ToString[name2[[1]]];];
WriteString[sphenoFT,"dummy"<>name1<>" = 0._dp \n"];
WriteString[sphenoFT,"dummy"<>name2<>" = 0._dp \n"];
WriteString[sphenoFT,"EW"<>name<>" = 0._dp \n"];
If[getGenSF[ThresholdMasses[[nr,i,1]]]-(Length[Thresholds]-nr)>1,
ind ="1:"<>ToString[getGenSF[ThresholdMasses[[nr,i,1]]]-(Length[Thresholds]-nr)];
WriteString[sphenoFT,"Call EigenSystem(MatMul(Transpose(Conjg("<>SPhenoForm[ThresholdMasses[[nr,i,4]]] <>"("<>ind<>","<>ind<>"))),"<>SPhenoForm[ThresholdMasses[[nr,i,4]]] <>"("<>ind<>","<>ind<>")),EW"<>name<>"("<>ind<>"),dummy"<>name1<>"("<>ind<>","<>ind<>"),kont,test) \n"];
WriteString[sphenoFT,"Call EigenSystem(MatMul("<>SPhenoForm[ThresholdMasses[[nr,i,4]]] <>"("<>ind<>","<>ind<>"),Transpose(Conjg("<>SPhenoForm[ThresholdMasses[[nr,i,4]]] <>"("<>ind<>","<>ind<>")))),EW"<>name<>"("<>ind<>"),dummy"<>name2<>"("<>ind<>","<>ind<>"),kont,test) \n"];,
WriteString[sphenoFT,"EW"<>name<>"(1) = Abs("<>SPhenoForm[ThresholdMasses[[nr,i,4]]] <>"(1,1))**2 \n"];
WriteString[sphenoFT,"dummy"<>name1<>"(1,1) = 1._dp \n"];
WriteString[sphenoFT,"dummy"<>name2<>"(1,1) = 1._dp \n"];
];
];
i++;];

For[i=1,i<=Length[ThresholdInvolvedCouplings[[nr]]],
If[ThresholdInvolvedCouplings[[nr,i,2]]==1,
WriteString[sphenoSugra,SPhenoForm[ThresholdInvolvedCouplings[[nr,i,1]]]<>" = MatMul(Conjg(dummy"<>ToString[RE[ThresholdInvolvedCouplings[[nr,i,5]]]]<>"),"<>SPhenoForm[ThresholdInvolvedCouplings[[nr,i,1]]] <>") \n"];,
WriteString[sphenoSugra,SPhenoForm[ThresholdInvolvedCouplings[[nr,i,1]]]<>" = MatMul("<>SPhenoForm[ThresholdInvolvedCouplings[[nr,i,1]]] <>",Transpose(dummy"<>ToString[RE[ThresholdInvolvedCouplings[[nr,i,5]]]]<>")) \n"];
];
i++;];


WriteString[sphenoFT,"If (Shifts) Then\n"];
For[i=1,i<=Length[Gauge],
For[j=1,j<=Length[ThresholdMasses[[k]]],
If[getGenSF[ThresholdMasses[[k,j,1]]]>1,
For[j2=ThresholdMasses[[k,j,2]],j2<= ThresholdMasses[[k,j,3]],
tempDynkin=SA`Dynkin[ThresholdMasses[[k,j,1]],i]*MulFactor[ThresholdMasses[[k,j,1]],i];
If[NumericQ[tempDynkin] && tempDynkin =!=0,
WriteString[sphenoFT,SPhenoForm[BetaGauge[[i,1]] ]<>" = "<> SPhenoForm[BetaGauge[[i,1]]]<>"*(1._dp + oo16pi2*"<>SPhenoForm[BetaGauge[[i,1]]]<>"**2* & \n"];
WriteString[sphenoFT,"  & "<>SPhenoForm[tempDynkin]<>"*Log(MassOf"<>SPhenoForm[ThresholdMasses[[k,j,1]]]<>"("<>ToString[j2]<>")/"<>SPhenoForm[Thresholds[[k,1]]] <>")) \n"];

WriteString[sphenoFT,SPhenoForm[BetaMi[[i,1]] ]<>" = "<> SPhenoForm[BetaMi[[i,1]]]<>"*(1._dp + oo16pi2*"<>SPhenoForm[BetaGauge[[i,1]]]<>"**2* & \n"];
WriteString[sphenoFT,"  & "<>SPhenoForm[tempDynkin]<>"*Log(MassOf"<>SPhenoForm[ThresholdMasses[[k,j,1]]]<>"("<>ToString[j2]<>")/"<>SPhenoForm[Thresholds[[k,1]]] <>")) \n"];
];
j2++;];,
tempDynkin=SA`Dynkin[ThresholdMasses[[k,j,1]],i]*MulFactor[ThresholdMasses[[k,j,1]],i];
If[NumericQ[tempDynkin] && tempDynkin =!=0,
WriteString[sphenoFT,SPhenoForm[BetaGauge[[i,1]] ]<>" = "<> SPhenoForm[BetaGauge[[i,1]]]<>"*(1._dp + oo16pi2*"<>SPhenoForm[BetaGauge[[i,1]]]<>"**2* & \n"];
WriteString[sphenoFT,"  & "<>SPhenoForm[tempDynkin]<>"*Log(MassOf"<>SPhenoForm[ThresholdMasses[[k,j,1]]]<>"/"<>SPhenoForm[Thresholds[[k,1]]] <>")) \n"];

WriteString[sphenoFT,SPhenoForm[BetaMi[[i,1]] ]<>" = "<> SPhenoForm[BetaMi[[i,1]]]<>"*(1._dp + oo16pi2*"<>SPhenoForm[BetaGauge[[i,1]]]<>"**2* & \n"];
WriteString[sphenoFT,"  & "<>SPhenoForm[tempDynkin]<>"*Log(MassOf"<>SPhenoForm[ThresholdMasses[[k,j,1]]]<>"/"<>SPhenoForm[Thresholds[[k,1]]] <>")) \n"];
];

];

j++;];
i++;];
WriteString[sphenoFT,"End If \n \n"];

(*
For[i=1,i<=Length[ThresholdCouplings],
Switch[Length[getDimSPheno[ThresholdCouplings[[i]]]],
3, ind = "("<>ToString[nr-1]<>",:,:,:)";,
2, ind = "("<>ToString[nr-1]<>",:,:)";,
1, ind = "("<>ToString[nr-1]<>",:)";,
0, ind ="("<>ToString[nr-1]<>")";
];
If[nr>1,
WriteString[sphenoFT, SPhenoForm[ThresholdCouplings[[i]]] <>" = "<>SPhenoForm[ThresholdCouplings[[i]]]<>"_save"<>ind <>"\n"];,
WriteString[sphenoFT, SPhenoForm[ThresholdCouplings[[i]]] <>" = 0._dp \n"];
];
i++];
*)

For[i=1,i<=Length[BetaGauge],
WriteString[sphenoFT,SPhenoForm[BetaGauge[[i,1]]] <>" = "<>SPhenoForm[BetaGauge[[i,1]]]<>"_up_"<>ToString[nr]<>"\n"];
i++;];

For[i=1,i<=Length[ThresholdMasses[[nr]]],
WriteString[sphenoFT,"NumberGenerations"<>SPhenoForm[ThresholdMasses[[nr,i,1]]]  <>" = " <>ToString[ThresholdMasses[[nr,i,2]]-1]<> "\n"];
If[FreeQ[NeededOtherFields,ThresholdMasses[[nr,i,1]]]==False,
pos=Position[NeededOtherFields,ThresholdMasses[[nr,i,1]]][[1,1]];
WriteString[sphenoFT,"NumberGenerations"<>SPhenoForm[NeededOtherFields[[pos,2]]]  <>" = " <>ToString[ThresholdMasses[[nr,i,2]]-1]<> "\n"];
];
i++;];

For[i=1,i<=Length[BoundaryConditionsDown[[nr]]],
If[FreeQ[BoundaryConditionsDown[[nr,i,1]],index1],
WriteString[sphenoFT,StringReplace[SPhenoForm[BoundaryConditionsDown[[nr,i,1]]],{SPhenoForm[BoundaryConditionsDown[[nr,i,1]] /. A_[b__Integer]->A]->SPhenoForm[BoundaryConditionsDown[[nr,i,1]] /. A_[b__Integer]->A]<>"_down_"<>ToString[nr]}] <> " = " <> SPhenoForm[BoundaryConditionsDown[[nr,i,1]]] <>"\n "];
WriteString[sphenoFT,SPhenoForm[BoundaryConditionsDown[[nr,i,1]]] <> " = " <> SPhenoForm[BoundaryConditionsDown[[nr,i,2]] /. {fGMSB[x_]->1,gGMSB[x_]->1}] <>"\n "];,
dims = getDimSPheno[BoundaryConditionsDown[[nr,i,1]]/. a_[b__]->a];
pos = Position[BoundaryConditionsDown[[nr,i,1]],index1][[1,1]];
WriteString[sphenoFT,"Do i1=1,"<>ToString[dims[[pos]]] <>"\n"];
If[FreeQ[BoundaryConditionsDown[[nr,i,1]],index2]==False,
pos = Position[BoundaryConditionsDown[[nr,i,1]],index2][[1,1]];
WriteString[sphenoFT,"Do i2=1,"<>ToString[dims[[pos]]] <>"\n"];
];
If[FreeQ[BoundaryConditionsDown[[nr,i,1]],index3]==False,
pos = Position[BoundaryConditionsDown[[nr,i,1]],index3][[1,1]];
WriteString[sphenoFT,"Do i3=1,"<>ToString[dims[[pos]]] <>"\n"];
];

WriteString[sphenoFT,StringReplace[SPhenoForm[BoundaryConditionsDown[[nr,i,1]] /.{index1->i1,index2->i2,index3->i3}],SPhenoForm[Head[BoundaryConditionsDown[[nr,i,1]]]]->SPhenoForm[Head[BoundaryConditionsDown[[nr,i,1]]]]<>"_down_"<>ToString[nr]] <> " = " <> SPhenoForm[BoundaryConditionsDown[[nr,i,1]]/.{index1->i1,index2->i2,index3->i3}] <>"\n "];


WriteString[sphenoFT,SPhenoForm[BoundaryConditionsDown[[nr,i,1]] /.{index1->i1,index2->i2,index3->i3}] <> " = " <> SPhenoForm[BoundaryConditionsDown[[nr,i,2]]/.{index1->i1,index2->i2,index3->i3}/. {fGMSB[x_]->1,gGMSB[x_]->1}] <>"\n "];

WriteString[sphenoFT,"End Do \n"];
If[FreeQ[BoundaryConditionsDown[[nr,i,1]],index2]==False,
WriteString[sphenoFT,"End Do \n"];
];
If[FreeQ[BoundaryConditionsDown[[nr,i,1]],index3]==False,
WriteString[sphenoFT,"End Do \n"];
];
];
i++;];


For[i=1,i<=Length[ThresholdInvolvedCouplings[[nr]]],
If[ThresholdInvolvedCouplings[[nr,i,2]]===ALL,
ind="";,
Switch[ThresholdInvolvedCouplings[[nr,i,3]],
3, 
  Switch[ThresholdInvolvedCouplings[[nr,i,2]],
1,ind = "("<>ToString[ThresholdInvolvedCouplings[[nr,i,4]]] <>",:,:)";,
2,ind = "(:,"<>ToString[ThresholdInvolvedCouplings[[nr,i,4]]]<>",:)";,
3,ind = "(:,:,"<>ToString[ThresholdInvolvedCouplings[[nr,i,4]]] <>")";
];,
2, 
Switch[ThresholdInvolvedCouplings[[nr,i,2]],
1, ind = "("<>ToString[ThresholdInvolvedCouplings[[nr,i,4]]] <>",:)";,
2, ind = "(:,"<>ToString[ThresholdInvolvedCouplings[[nr,i,4]]] <>")";
];,
1, ind = "("<>ToString[ThresholdInvolvedCouplings[[nr,i,4]]] <>")";
];
];
WriteString[sphenoFT,SPhenoForm[ThresholdInvolvedCouplings[[nr,i,1]]]<>ind<>" = 0._dp \n"];
i++;];

WriteString[sphenoFT,"ThresholdCrossed = "<>ToString[nr-1]<>"\n\n"];

MakeCall["ParametersToG"<>ToString[numberAll],listAllParameters,{},{"gB"},sphenoFT];

WriteString[sphenoFT,"Select Case(FTpar) \n"];
For[i=1,i<=Length[FineTuningParameters],
WriteString[sphenoFT,"Case ("<>ToString[i]<>") \n"];
If[FreeQ[MINPAR,FineTuningParameters[[i,1]]] == False || FreeQ[EXTPAR,FineTuningParameters[[i,1]]] == False ||  FreeQ[Join[lowScaleIn,highScaleIn],FineTuningParameters[[i,1]] /. A_[b___Integer]->A]==False,
WriteString[sphenoFT,"   "<>SPhenoForm[FineTuningParameters[[i,1]]]<>" = savePar \n"];,
WriteString[sphenoFT,"   "<>SPhenoForm[FineTuningParameters[[i,1]]]<>" = variation*"<>SPhenoForm[FineTuningParameters[[i,1]]]<>" \n"];
];
i++;];
WriteString[sphenoFT,"End Select \n"];




WriteString[sphenoFT,"End Subroutine BoundaryConditionDownFT_"<>ToString[nr]<>"\n\n"];
];


