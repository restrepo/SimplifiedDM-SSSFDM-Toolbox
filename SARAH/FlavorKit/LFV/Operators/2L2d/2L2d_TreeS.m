(* Code automatically generated by 'PreSARAH' *) 
(* Expressions for amplitudes are obtained by FeynArts/FormCalc *) 
(* This file is supposed to be loaded and used by SARAH *) 
(* Created at 11:31 on 4.11.2014 *) 
 
 
PrintDebug["   ... ",TreeS2L2d]; 
NamesParticles =  {ChargedLepton, bar[ChargedLepton], DownQuark, bar[DownQuark]}; 
 NamesOperators =  {TSOllddSLL, TSOllddSRR, TSOllddSRL, TSOllddSLR, TSOllddVRR, TSOllddVLL, TSOllddVRL, TSOllddVLR, TSOllddTLL, TSOllddTLR, TSOllddTRL, TSOllddTRR}; 
 NeglectInsertionOrderTree[TreeS2L2d] =  {}; 
NeglectCrossedDiagrams[TreeS2L2d] = False; 
NameProcess = TreeS2L2d; 
 
Generate[TreeS2L2d][file_]:=Block[{i,j,k}, 
 

 (* Creating all possible processes; extract information about involved masses/couplings *) 


(* ------------------------------- *)
(* {ChargedLepton, bar[ChargedLepton], DownQuark, bar[DownQuark]} *)
(* ------------------------------- *)
 
GetInformtion4FermionProcess[ChargedLepton,bar[ChargedLepton],DownQuark,bar[DownQuark],TreeS2L2d,file]; 
NeededMassesAll=Intersection[NeededMasses];
NeededCouplingsAll=Intersection[NeededCouplings];
WriteCodeObservablePreSARAH[TreeS2L2d][NeededMassesAll,NeededCouplingsAll,TreeContributionsScalar,TreeContributionsVector,WaveContributionsScalar,WaveContributionsVector,WaveContributionsPhoton,PenguinContributionsScalar,PenguinContributionsVector,PenguinContributionsPhoton,BoxContributions,file]; 
NeededMassAllSaved[TreeS2L2d] = masses 
]; 

WriteCodeObservablePreSARAH[TreeS2L2d][masses_,couplings_,treeScalar_,treeVector_,waveScalar_,waveVector_,wavePhoton_,penguinScalar_,penguinVector_,penguinPhoton_,box_,file_] :=Block[{i,j,k,fermions,scalars}, 
 
NeededMassesAllSaved[TreeS2L2d] = masses; 
NeededCouplingsAllSaved[TreeS2L2d] = couplings; 
NeededCombinations[TreeS2L2d] = {{2, 1, 1, 1}, {3, 1, 1, 1}, {3, 2, 1, 1}, {2, 1, 2, 2}, {3, 1, 2, 2}, {3, 2, 2, 2}}; 
PrintDebug["     writing SPheno code for ",TreeS2L2d]; 
MakeSubroutineTitle["CalculateTreeS2L2d",Flatten[{masses,couplings}],{"gt1","gt2","gt3","gt4","OnlySM"}, 
{"TSOllddSLL", "TSOllddSRR", "TSOllddSRL", "TSOllddSLR", "TSOllddVRR", "TSOllddVLL", "TSOllddVRL", "TSOllddVLR", "TSOllddTLL", "TSOllddTLR", "TSOllddTRL", "TSOllddTRR"},file]; 
WriteString[file,"! ---------------------------------------------------------------- \n"]; 
WriteString[file,"! Code based on automatically generated SARAH extensions by 'PreSARAH' \n"]; 
WriteString[file,"! Expressions for amplitudes are obtained by FeynArts/FormCalc \n"]; 
WriteString[file,"! Based on user input for process TreeS2L2d \n"]; 
WriteString[file,"! 'PreSARAH' output has been generated  at 11:31 on 4.11.2014 \n"]; 
WriteString[file,"! ---------------------------------------------------------------- \n \n"]; 
 
 
WriteString[file,"Implicit None \n"]; 
MakeVariableList[Flatten[{couplings,masses}],",Intent(in)",file];
WriteString[file,"Integer,Intent(in) :: gt1, gt2,gt3,gt4 \n"];
WriteString[file,"Logical, Intent(in) :: OnlySM \n"];
WriteString[file,"Integer :: iprop, i1, i2, i3, i4 \n"];
WriteString[file,"Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 \n"];
WriteString[file,"Complex(dp), Intent(out) :: TSOllddSLL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSOllddSRR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSOllddSRL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSOllddSLR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSOllddVRR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSOllddVLL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSOllddVRL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSOllddVLR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSOllddTLL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSOllddTLR \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSOllddTRL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: TSOllddTRR \n"]; 
WriteString[file,"Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R \n"];
WriteString[file,"Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  \n"];
WriteString[file,"Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  \n"];
WriteString[file,"Complex(dp) ::  chargefactor  \n"];
WriteString[file,"Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R \n\n"];

WriteString[file,"Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 \n\n"];

WriteString[file,"Iname=Iname+1 \n"];
WriteString[file,"NameOfUnit(Iname)='CalculateTreeS2L2d' \n
"];
 
AddCalcSquaredMasses[masses,file]; 
(* Initaliziation *)
WriteString[file,"Finite=1._dp \n"];
WriteString[file,"MassEx1="<>SPhenoMass[ChargedLepton,gt1]<>"  \n"];
WriteString[file,"MassEx12="<>SPhenoMassSq[ChargedLepton,gt1]<>" \n"];
WriteString[file,"MassEx2="<>SPhenoMass[bar[ChargedLepton],gt2]<>"  \n"];
WriteString[file,"MassEx22="<>SPhenoMassSq[bar[ChargedLepton],gt2]<>" \n"];
WriteString[file,"MassEx3="<>SPhenoMass[DownQuark,gt3]<>"  \n"];
WriteString[file,"MassEx32="<>SPhenoMassSq[DownQuark,gt3]<>" \n"];
WriteString[file,"MassEx4="<>SPhenoMass[bar[DownQuark],gt4]<>"  \n"];
WriteString[file,"MassEx42="<>SPhenoMassSq[bar[DownQuark],gt4]<>" \n"];
WriteString[file,"! ------------------------------ \n "];
WriteString[file,"! Amplitudes for external states \n "];
WriteString[file,"! {ChargedLepton, bar[ChargedLepton], DownQuark, bar[DownQuark]} \n "];
WriteString[file,"! ------------------------------ \n \n"];
WriteString[sphenoTeX,"\\section{External states: $"<>TeXOutput[{ChargedLepton[{gt1}], bar[ChargedLepton][{gt2}], DownQuark[{gt3}], bar[DownQuark][{gt4}]}]<>"$} \n"];
WriteString[file,"TSOllddSLL=0._dp \n"]; 
WriteString[file,"TSOllddSRR=0._dp \n"]; 
WriteString[file,"TSOllddSRL=0._dp \n"]; 
WriteString[file,"TSOllddSLR=0._dp \n"]; 
WriteString[file,"TSOllddVRR=0._dp \n"]; 
WriteString[file,"TSOllddVLL=0._dp \n"]; 
WriteString[file,"TSOllddVRL=0._dp \n"]; 
WriteString[file,"TSOllddVLR=0._dp \n"]; 
WriteString[file,"TSOllddTLL=0._dp \n"]; 
WriteString[file,"TSOllddTLR=0._dp \n"]; 
WriteString[file,"TSOllddTRL=0._dp \n"]; 
WriteString[file,"TSOllddTRR=0._dp \n"]; 
WriteDiagramsObservable[TreeS2L2d,treeScalar, {}, {},  {}, {}, {}, {}, file];
WriteString[file,"Iname=Iname-1\n\n"]; 
WriteString[file,"End Subroutine CalculateTreeS2L2d \n\n"]; 
]; 
AddTreeResultPreSARAH[TreeS2L2d][prop_,top_,type_,file_]:=Block[{}, 

 (* This routine returns the generic expression for the amplitude of a given triangle diagram *) 
 
Switch[prop,
V, (* Vector penguins *) 
Return[]; (* not necessary *) ,
S, (* Scalar penguins *) 
 Switch[top,  (* Check topology *) 
  1, 
	 	 WriteStringFLB[file,"  TSOllddSLL=TSOllddSLL+ 157.91367041742973*coup1L*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddSLL= & "<> StringReplace["16 coup1L coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddSRR=TSOllddSRR+ 157.91367041742973*coup1R*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddSRR= & "<> StringReplace["16 coup1R coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddSRL=TSOllddSRL+ 157.91367041742973*coup1R*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddSRL= & "<> StringReplace["16 coup1R coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddSLR=TSOllddSLR+ 157.91367041742973*coup1L*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddSLR= & "<> StringReplace["16 coup1L coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddVRR=TSOllddVRR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddVRR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddVLL=TSOllddVLL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddVLL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddVRL=TSOllddVRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddVRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddVLR=TSOllddVLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddVLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddTLL=TSOllddTLL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddTLL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddTLR=TSOllddTLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddTLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddTRL=TSOllddTRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddTRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddTRR=TSOllddTRR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddTRR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
  2, 
	 	 WriteStringFLB[file,"  TSOllddSLL=TSOllddSLL+ -78.95683520871486*coup1L*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddSLL= & "<> StringReplace["-8 coup1L coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddSRR=TSOllddSRR+ -78.95683520871486*coup1R*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddSRR= & "<> StringReplace["-8 coup1R coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddSRL=TSOllddSRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddSRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddSLR=TSOllddSLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddSLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddVRR=TSOllddVRR+ 78.95683520871486*coup1R*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddVRR= & "<> StringReplace["8 coup1R coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddVLL=TSOllddVLL+ 78.95683520871486*coup1L*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddVLL= & "<> StringReplace["8 coup1L coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddVRL=TSOllddVRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddVRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddVLR=TSOllddVLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddVLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddTLL=TSOllddTLL+ -19.739208802178716*coup1L*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddTLL= & "<> StringReplace["-2 coup1L coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddTLR=TSOllddTLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddTLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddTRL=TSOllddTRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddTRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddTRR=TSOllddTRR+ -19.739208802178716*coup1R*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddTRR= & "<> StringReplace["-2 coup1R coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
  3, 
	 	 WriteStringFLB[file,"  TSOllddSLL=TSOllddSLL+ -78.95683520871486*coup1L*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddSLL= & "<> StringReplace["-8 coup1L coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddSRR=TSOllddSRR+ -78.95683520871486*coup1R*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddSRR= & "<> StringReplace["-8 coup1R coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddSRL=TSOllddSRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddSRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddSLR=TSOllddSLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddSLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddVRR=TSOllddVRR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddVRR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddVLL=TSOllddVLL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddVLL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddVRL=TSOllddVRL+ -78.95683520871486*coup1R*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddVRL= & "<> StringReplace["-8 coup1R coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddVLR=TSOllddVLR+ -78.95683520871486*coup1L*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddVLR= & "<> StringReplace["-8 coup1L coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddTLL=TSOllddTLL+ 19.739208802178716*coup1L*coup2L*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddTLL= & "<> StringReplace["2 coup1L coup2L IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddTLR=TSOllddTLR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddTLR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddTRL=TSOllddTRL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddTRL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  TSOllddTRR=TSOllddTRR+ 19.739208802178716*coup1R*coup2R*IMP2\n" ];
	 	 WriteString[sphenoTeX,"  TSOllddTRR= & "<> StringReplace["2 coup1R coup2R IMP2 Pi^2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
];]; 
]; 


