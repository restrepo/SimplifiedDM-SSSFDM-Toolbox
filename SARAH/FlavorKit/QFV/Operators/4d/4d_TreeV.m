(* Code automatically generated by 'PreSARAH' *) 
(* Expressions for amplitudes are obtained by FeynArts/FormCalc *) 
(* This file is supposed to be loaded and used by SARAH *) 
(* Created at 19:49 on 4.3.2015 *) 
 
 
PrintDebug["   ... ",TreeV4d]; 
NamesParticles =  {DownQuark, bar[DownQuark], DownQuark, bar[DownQuark]}; 
 NamesOperators =  {TVO4dSLL, TVO4dSRR, TVO4dSRL, TVO4dSLR, TVO4dVRR, TVO4dVLL, TVO4dVRL, TVO4dVLR, TVO4dTLL, TVO4dTLR, TVO4dTRL, TVO4dTRR}; 
 NeglectInsertionOrderTree[TreeV4d] =  {}; 
NeglectCrossedDiagrams[TreeV4d] = False; 
NameProcess = TreeV4d; 
 
ColorFlow = ColorDelta[1, 2] ColorDelta[3, 4]; 
 
Generate[TreeV4d][file_]:=Block[{i,j,k}, 
 

 (* Creating all possible processes; extract information about involved masses/couplings *) 


(* ------------------------------- *)
(* {DownQuark, bar[DownQuark], DownQuark, bar[DownQuark]} *)
(* ------------------------------- *)
 
GetInformtion4FermionProcess[DownQuark,bar[DownQuark],DownQuark,bar[DownQuark],TreeV4d,file]; 
NeededMassesAll=Intersection[NeededMasses];
NeededCouplingsAll=Intersection[NeededCouplings];
WriteCodeObservablePreSARAH[TreeV4d][NeededMassesAll,NeededCouplingsAll,TreeContributionsScalar,TreeContributionsVector,WaveContributionsScalar,WaveContributionsVector,WaveContributionsPhoton,PenguinContributionsScalar,PenguinContributionsVector,PenguinContributionsPhoton,BoxContributions,file]; 
NeededMassAllSaved[TreeV4d] = masses 
]; 

WriteCodeObservablePreSARAH[TreeV4d][masses_,couplings_,treeScalar_,treeVector_,waveScalar_,waveVector_,wavePhoton_,penguinScalar_,penguinVector_,penguinPhoton_,box_,file_] :=Block[{i,j,k,fermions,scalars}, 
 
NeededMassesAllSaved[TreeV4d] = masses; 
NeededCouplingsAllSaved[TreeV4d] = couplings; 
NeededCombinations[TreeV4d] = {{3, 1, 3, 1}, {3, 2, 3, 2}, {2, 1, 2, 1}}; 
PrintDebug["     writing SPheno code for ",TreeV4d]; 
MakeSubroutineTitle["CalculateTreeV4d",Flatten[{masses,couplings}],{"gt1","gt2","gt3","gt4","OnlySM"}, 
{"TVO4dSLL", "TVO4dSRR", "TVO4dSRL", "TVO4dSLR", "TVO4dVRR", "TVO4dVLL", "TVO4dVRL", "TVO4dVLR", "TVO4dTLL", "TVO4dTLR", "TVO4dTRL", "TVO4dTRR"},file]; 
WriteString[file,"! ---------------------------------------------------------------- \n"]; 
WriteString[file,"! Code based on automatically generated SARAH extensions by 'PreSARAH' \n"]; 
WriteString[file,"! Expressions for amplitudes are obtained by FeynArts/FormCalc \n"]; 
WriteString[file,"! Based on user input for process TreeV4d \n"]; 
WriteString[file,"! 'PreSARAH' output has been generated  at 19:49 on 4.3.2015 \n"]; 
WriteString[file,"! ---------------------------------------------------------------- \n \n"]; 
 
 
WriteString[file,"Implicit None \n"]; 
MakeVariableList[Flatten[{couplings,masses}],",Intent(in)",file];
WriteString[file,"Integer,Intent(in) :: gt1, gt2,gt3,gt4 \n"];
WriteString[file,"Logical, Intent(in) :: OnlySM \n"];
WriteString[file,"Integer :: iprop, i1, i2, i3, i4 \n"];
WriteString[file,"Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 \n"];
WriteString[file,"Complex(dp), Intent(out) :: TVO4dSLL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TVO4dSRR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TVO4dSRL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TVO4dSLR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TVO4dVRR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TVO4dVLL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TVO4dVRL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TVO4dVLR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TVO4dTLL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TVO4dTLR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TVO4dTRL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TVO4dTRR \n"]; 
WriteString[file,"Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R \n"];
WriteString[file,"Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  \n"];
WriteString[file,"Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  \n"];
WriteString[file,"Complex(dp) ::  chargefactor  \n"];
WriteString[file,"Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R \n\n"];

WriteString[file,"Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 \n\n"];

WriteString[file,"Iname=Iname+1 \n"];
WriteString[file,"NameOfUnit(Iname)='CalculateTreeV4d' \n
"];
 
AddCalcSquaredMasses[masses,file]; 
(* Initaliziation *)
WriteString[file,"Finite=1._dp \n"];
WriteString[file,"MassEx1="<>SPhenoMass[DownQuark,gt1]<>"  \n"];
WriteString[file,"MassEx12="<>SPhenoMassSq[DownQuark,gt1]<>" \n"];
WriteString[file,"MassEx2="<>SPhenoMass[bar[DownQuark],gt2]<>"  \n"];
WriteString[file,"MassEx22="<>SPhenoMassSq[bar[DownQuark],gt2]<>" \n"];
WriteString[file,"MassEx3="<>SPhenoMass[DownQuark,gt3]<>"  \n"];
WriteString[file,"MassEx32="<>SPhenoMassSq[DownQuark,gt3]<>" \n"];
WriteString[file,"MassEx4="<>SPhenoMass[bar[DownQuark],gt4]<>"  \n"];
WriteString[file,"MassEx42="<>SPhenoMassSq[bar[DownQuark],gt4]<>" \n"];
WriteString[file,"! ------------------------------ \n "];
WriteString[file,"! Amplitudes for external states \n "];
WriteString[file,"! {DownQuark, bar[DownQuark], DownQuark, bar[DownQuark]} \n "];
WriteString[file,"! ------------------------------ \n \n"];
WriteString[sphenoTeX,"\\section{External states: $"<>TeXOutput[{DownQuark[{gt1}], bar[DownQuark][{gt2}], DownQuark[{gt3}], bar[DownQuark][{gt4}]}]<>"$} \n"];
WriteString[file,"TVO4dSLL=0._dp \n"]; 
WriteString[file,"TVO4dSRR=0._dp \n"]; 
WriteString[file,"TVO4dSRL=0._dp \n"]; 
WriteString[file,"TVO4dSLR=0._dp \n"]; 
WriteString[file,"TVO4dVRR=0._dp \n"]; 
WriteString[file,"TVO4dVLL=0._dp \n"]; 
WriteString[file,"TVO4dVRL=0._dp \n"]; 
WriteString[file,"TVO4dVLR=0._dp \n"]; 
WriteString[file,"TVO4dTLL=0._dp \n"]; 
WriteString[file,"TVO4dTLR=0._dp \n"]; 
WriteString[file,"TVO4dTRL=0._dp \n"]; 
WriteString[file,"TVO4dTRR=0._dp \n"]; 
WriteDiagramsObservable[TreeV4d,{}, treeVector, {},  {}, {}, {}, {}, file];
WriteString[file,"Iname=Iname-1\n\n"]; 
WriteString[file,"End Subroutine CalculateTreeV4d \n\n"]; 
]; 
AddTreeResultPreSARAH[TreeV4d][prop_,top_,type_,file_]:=Block[{}, 

 (* This routine returns the generic expression for the amplitude of a given triangle diagram *) 
 
Switch[prop,
V, (* Vector penguins *) 
 Switch[top,  (* Check topology *) 
  1, 
	 	 WriteStringFLB[file,"  TVO4dSLL=TVO4dSLL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dSLL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dSRR=TVO4dSRR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dSRR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dSRL=TVO4dSRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dSRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dSLR=TVO4dSLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dSLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dVRR=TVO4dVRR+ -157.91367041742973*coup1R*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dVRR= & "<> StringReplace["-16 coup1R coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dVLL=TVO4dVLL+ -157.91367041742973*coup1L*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dVLL= & "<> StringReplace["-16 coup1L coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dVRL=TVO4dVRL+ -157.91367041742973*coup1R*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dVRL= & "<> StringReplace["-16 coup1R coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dVLR=TVO4dVLR+ -157.91367041742973*coup1L*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dVLR= & "<> StringReplace["-16 coup1L coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dTLL=TVO4dTLL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dTLL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dTLR=TVO4dTLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dTLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dTRL=TVO4dTRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dTRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dTRR=TVO4dTRR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dTRR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
  2, 
	 	 WriteStringFLB[file,"  TVO4dSLL=TVO4dSLL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dSLL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dSRR=TVO4dSRR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dSRR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dSRL=TVO4dSRL+ -315.82734083485946*coup1L*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dSRL= & "<> StringReplace["-32 coup1L coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dSLR=TVO4dSLR+ -315.82734083485946*coup1R*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dSLR= & "<> StringReplace["-32 coup1R coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dVRR=TVO4dVRR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dVRR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dVLL=TVO4dVLL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dVLL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dVRL=TVO4dVRL+ -157.91367041742973*coup1L*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dVRL= & "<> StringReplace["-16 coup1L coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dVLR=TVO4dVLR+ -157.91367041742973*coup1R*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dVLR= & "<> StringReplace["-16 coup1R coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dTLL=TVO4dTLL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dTLL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dTLR=TVO4dTLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dTLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dTRL=TVO4dTRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dTRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dTRR=TVO4dTRR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dTRR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
  3, 
	 	 WriteStringFLB[file,"  TVO4dSLL=TVO4dSLL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dSLL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dSRR=TVO4dSRR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dSRR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dSRL=TVO4dSRL+ 315.82734083485946*coup1R*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dSRL= & "<> StringReplace["32 coup1R coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dSLR=TVO4dSLR+ 315.82734083485946*coup1L*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dSLR= & "<> StringReplace["32 coup1L coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dVRR=TVO4dVRR+ -157.91367041742973*coup1R*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dVRR= & "<> StringReplace["-16 coup1R coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dVLL=TVO4dVLL+ -157.91367041742973*coup1L*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dVLL= & "<> StringReplace["-16 coup1L coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dVRL=TVO4dVRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dVRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dVLR=TVO4dVLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dVLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dTLL=TVO4dTLL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dTLL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dTLR=TVO4dTLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dTLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dTRL=TVO4dTRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dTRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TVO4dTRR=TVO4dTRR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TVO4dTRR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
];,
S, (* Scalar penguins *) 
Return[]; (* not necessary *) ]; 
]; 


