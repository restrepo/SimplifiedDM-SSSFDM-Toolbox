(* Code automatically generated by 'PreSARAH' *) 
(* Expressions for amplitudes are obtained by FeynArts/FormCalc *) 
(* This file is supposed to be loaded and used by SARAH *) 
(* Created at 18:49 on 4.3.2015 *) 
 
 
PrintDebug["   ... ",TreeS4L]; 
NamesParticles =  {ChargedLepton, bar[ChargedLepton], ChargedLepton, bar[ChargedLepton]}; 
 NamesOperators =  {TSO4lSLL, TSO4lSRR, TSO4lSRL, TSO4lSLR, TSO4lVRR, TSO4lVLL, TSO4lVRL, TSO4lVLR, TSO4lTLL, TSO4lTLR, TSO4lTRL, TSO4lTRR}; 
 NeglectInsertionOrderTree[TreeS4L] =  {}; 
NeglectCrossedDiagrams[TreeS4L] = True; 
NameProcess = TreeS4L; 
 
Generate[TreeS4L][file_]:=Block[{i,j,k}, 
 

 (* Creating all possible processes; extract information about involved masses/couplings *) 


(* ------------------------------- *)
(* {ChargedLepton, bar[ChargedLepton], ChargedLepton, bar[ChargedLepton]} *)
(* ------------------------------- *)
 
GetInformtion4FermionProcess[ChargedLepton,bar[ChargedLepton],ChargedLepton,bar[ChargedLepton],TreeS4L,file]; 
NeededMassesAll=Intersection[NeededMasses];
NeededCouplingsAll=Intersection[NeededCouplings];
WriteCodeObservablePreSARAH[TreeS4L][NeededMassesAll,NeededCouplingsAll,TreeContributionsScalar,TreeContributionsVector,WaveContributionsScalar,WaveContributionsVector,WaveContributionsPhoton,PenguinContributionsScalar,PenguinContributionsVector,PenguinContributionsPhoton,BoxContributions,file]; 
NeededMassAllSaved[TreeS4L] = masses 
]; 

WriteCodeObservablePreSARAH[TreeS4L][masses_,couplings_,treeScalar_,treeVector_,waveScalar_,waveVector_,wavePhoton_,penguinScalar_,penguinVector_,penguinPhoton_,box_,file_] :=Block[{i,j,k,fermions,scalars}, 
 
NeededMassesAllSaved[TreeS4L] = masses; 
NeededCouplingsAllSaved[TreeS4L] = couplings; 
NeededCombinations[TreeS4L] = {{2, 1, 1, 1}, {3, 1, 1, 1}, {3, 2, 2, 2}, {3, 2, 1, 2}, {3, 1, 2, 1}}; 
PrintDebug["     writing SPheno code for ",TreeS4L]; 
MakeSubroutineTitle["CalculateTreeS4L",Flatten[{masses,couplings}],{"gt1","gt2","gt3","gt4","OnlySM"}, 
{"TSO4lSLL", "TSO4lSRR", "TSO4lSRL", "TSO4lSLR", "TSO4lVRR", "TSO4lVLL", "TSO4lVRL", "TSO4lVLR", "TSO4lTLL", "TSO4lTLR", "TSO4lTRL", "TSO4lTRR"},file]; 
WriteString[file,"! ---------------------------------------------------------------- \n"]; 
WriteString[file,"! Code based on automatically generated SARAH extensions by 'PreSARAH' \n"]; 
WriteString[file,"! Expressions for amplitudes are obtained by FeynArts/FormCalc \n"]; 
WriteString[file,"! Based on user input for process TreeS4L \n"]; 
WriteString[file,"! 'PreSARAH' output has been generated  at 18:49 on 4.3.2015 \n"]; 
WriteString[file,"! ---------------------------------------------------------------- \n \n"]; 
 
 
WriteString[file,"Implicit None \n"]; 
MakeVariableList[Flatten[{couplings,masses}],",Intent(in)",file];
WriteString[file,"Integer,Intent(in) :: gt1, gt2,gt3,gt4 \n"];
WriteString[file,"Logical, Intent(in) :: OnlySM \n"];
WriteString[file,"Integer :: iprop, i1, i2, i3, i4 \n"];
WriteString[file,"Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 \n"];
WriteString[file,"Complex(dp), Intent(out) :: TSO4lSLL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSO4lSRR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSO4lSRL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSO4lSLR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSO4lVRR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSO4lVLL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSO4lVRL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSO4lVLR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSO4lTLL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSO4lTLR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSO4lTRL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSO4lTRR \n"]; 
WriteString[file,"Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R \n"];
WriteString[file,"Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  \n"];
WriteString[file,"Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  \n"];
WriteString[file,"Complex(dp) ::  chargefactor  \n"];
WriteString[file,"Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R \n\n"];

WriteString[file,"Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 \n\n"];

WriteString[file,"Iname=Iname+1 \n"];
WriteString[file,"NameOfUnit(Iname)='CalculateTreeS4L' \n
"];
 
AddCalcSquaredMasses[masses,file]; 
(* Initaliziation *)
WriteString[file,"Finite=1._dp \n"];
WriteString[file,"MassEx1="<>SPhenoMass[ChargedLepton,gt1]<>"  \n"];
WriteString[file,"MassEx12="<>SPhenoMassSq[ChargedLepton,gt1]<>" \n"];
WriteString[file,"MassEx2="<>SPhenoMass[bar[ChargedLepton],gt2]<>"  \n"];
WriteString[file,"MassEx22="<>SPhenoMassSq[bar[ChargedLepton],gt2]<>" \n"];
WriteString[file,"MassEx3="<>SPhenoMass[ChargedLepton,gt3]<>"  \n"];
WriteString[file,"MassEx32="<>SPhenoMassSq[ChargedLepton,gt3]<>" \n"];
WriteString[file,"MassEx4="<>SPhenoMass[bar[ChargedLepton],gt4]<>"  \n"];
WriteString[file,"MassEx42="<>SPhenoMassSq[bar[ChargedLepton],gt4]<>" \n"];
WriteString[file,"! ------------------------------ \n "];
WriteString[file,"! Amplitudes for external states \n "];
WriteString[file,"! {ChargedLepton, bar[ChargedLepton], ChargedLepton, bar[ChargedLepton]} \n "];
WriteString[file,"! ------------------------------ \n \n"];
WriteString[sphenoTeX,"\\section{External states: $"<>TeXOutput[{ChargedLepton[{gt1}], bar[ChargedLepton][{gt2}], ChargedLepton[{gt3}], bar[ChargedLepton][{gt4}]}]<>"$} \n"];
WriteString[file,"TSO4lSLL=0._dp \n"]; 
WriteString[file,"TSO4lSRR=0._dp \n"]; 
WriteString[file,"TSO4lSRL=0._dp \n"]; 
WriteString[file,"TSO4lSLR=0._dp \n"]; 
WriteString[file,"TSO4lVRR=0._dp \n"]; 
WriteString[file,"TSO4lVLL=0._dp \n"]; 
WriteString[file,"TSO4lVRL=0._dp \n"]; 
WriteString[file,"TSO4lVLR=0._dp \n"]; 
WriteString[file,"TSO4lTLL=0._dp \n"]; 
WriteString[file,"TSO4lTLR=0._dp \n"]; 
WriteString[file,"TSO4lTRL=0._dp \n"]; 
WriteString[file,"TSO4lTRR=0._dp \n"]; 
WriteDiagramsObservable[TreeS4L,treeScalar, {}, {},  {}, {}, {}, {}, file];
WriteString[file,"Iname=Iname-1\n\n"]; 
WriteString[file,"End Subroutine CalculateTreeS4L \n\n"]; 
]; 
AddTreeResultPreSARAH[TreeS4L][prop_,top_,type_,file_]:=Block[{}, 

 (* This routine returns the generic expression for the amplitude of a given triangle diagram *) 
 
Switch[prop,
V, (* Vector penguins *) 
Return[]; (* not necessary *) ,
S, (* Scalar penguins *) 
 Switch[top,  (* Check topology *) 
  1, 
	 	 WriteStringFLB[file,"  TSO4lSLL=TSO4lSLL+ 157.91367041742973*coup1L*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lSLL= & "<> StringReplace["16 coup1L coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lSRR=TSO4lSRR+ 157.91367041742973*coup1R*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lSRR= & "<> StringReplace["16 coup1R coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lSRL=TSO4lSRL+ 157.91367041742973*coup1R*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lSRL= & "<> StringReplace["16 coup1R coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lSLR=TSO4lSLR+ 157.91367041742973*coup1L*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lSLR= & "<> StringReplace["16 coup1L coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lVRR=TSO4lVRR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lVRR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lVLL=TSO4lVLL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lVLL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lVRL=TSO4lVRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lVRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lVLR=TSO4lVLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lVLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lTLL=TSO4lTLL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lTLL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lTLR=TSO4lTLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lTLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lTRL=TSO4lTRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lTRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lTRR=TSO4lTRR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lTRR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
  2, 
	 	 WriteStringFLB[file,"  TSO4lSLL=TSO4lSLL+ -78.95683520871486*coup1L*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lSLL= & "<> StringReplace["-8 coup1L coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lSRR=TSO4lSRR+ -78.95683520871486*coup1R*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lSRR= & "<> StringReplace["-8 coup1R coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lSRL=TSO4lSRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lSRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lSLR=TSO4lSLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lSLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lVRR=TSO4lVRR+ 78.95683520871486*coup1R*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lVRR= & "<> StringReplace["8 coup1R coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lVLL=TSO4lVLL+ 78.95683520871486*coup1L*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lVLL= & "<> StringReplace["8 coup1L coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lVRL=TSO4lVRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lVRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lVLR=TSO4lVLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lVLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lTLL=TSO4lTLL+ -19.739208802178716*coup1L*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lTLL= & "<> StringReplace["-2 coup1L coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lTLR=TSO4lTLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lTLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lTRL=TSO4lTRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lTRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lTRR=TSO4lTRR+ -19.739208802178716*coup1R*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lTRR= & "<> StringReplace["-2 coup1R coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
  3, 
	 	 WriteStringFLB[file,"  TSO4lSLL=TSO4lSLL+ -78.95683520871486*coup1L*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lSLL= & "<> StringReplace["-8 coup1L coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lSRR=TSO4lSRR+ -78.95683520871486*coup1R*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lSRR= & "<> StringReplace["-8 coup1R coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lSRL=TSO4lSRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lSRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lSLR=TSO4lSLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lSLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lVRR=TSO4lVRR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lVRR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lVLL=TSO4lVLL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lVLL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lVRL=TSO4lVRL+ -78.95683520871486*coup1R*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lVRL= & "<> StringReplace["-8 coup1R coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lVLR=TSO4lVLR+ -78.95683520871486*coup1L*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lVLR= & "<> StringReplace["-8 coup1L coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lTLL=TSO4lTLL+ 19.739208802178716*coup1L*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lTLL= & "<> StringReplace["2 coup1L coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lTLR=TSO4lTLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lTLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lTRL=TSO4lTRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lTRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSO4lTRR=TSO4lTRR+ 19.739208802178716*coup1R*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSO4lTRR= & "<> StringReplace["2 coup1R coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
];]; 
]; 


