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



Options[MakeWHIZARD]={WOGauge->WO`WOUnitarity,AutoGauge->True,Exclude->{SSSS},WriteOmega->True, WriteWHIZARD->True, ReadLists->False,Version->"2.2.0", WOModelName->Automatic, MaximalCouplingsPerFile->150};

MakeWHIZARD[opt___ ]:=MakeWHIZARDFunc[WOGauge/.{opt}/.Options[MakeWHIZARD],AutoGauge/.{opt}/.Options[MakeWHIZARD],Exclude/.{opt}/.Options[MakeWHIZARD],WriteOmega/.{opt}/.Options[MakeWHIZARD],WriteWHIZARD/.{opt}/.Options[MakeWHIZARD],ReadLists/.{opt}/.Options[MakeWHIZARD],Version/.{opt}/.Options[MakeWHIZARD],WOModelName/.{opt}/.Options[MakeWHIZARD],MaximalCouplingsPerFile/.{opt}/.Options[MakeWHIZARD]];


MakeWHIZARDFunc[ChosenGauge_,AGauge_,Exclude_, WriteOmega_, WriteWHIZARD_,ReadLists_,WOVersion_,ModelNameInput_,maxNumber_]:=Block[{i,j,k,temp,res,pos,names,j1,j2,j3,j4,(* $Path={$sarahPackageDir}}, *) $Path={$sarahNonPublicDir},startedtime},
(*
Print["-------------------------------------"];
Print[" Creating WHIZARD/Omega Model Files  "];
Print["-------------------------------------"];
*)

Print[StyleForm["Generate WHIZARD/Omega model files","Section"]];

startedtime=TimeUsed[];
subGluonIndex={ct1->act1,ct2->act2,ct3->act3,ct4->act4};

CurrentEigenstates=Last[NameOfStates];

SA`CurrentStates=CurrentEigenstates;

(*
If[FreeQ[NameOfStates,InitalizedVertexCalculaton]==True,
Message[ModelFile::NoVertices];,
*)

If[FreeQ[NameOfStates,InitalizedVertexCalculaton]==True,
Print["Have to calculate the vertices first..."];
ModelOutput[Last[NameOfStates]];
];


$sarahCurrentWODir=ToFileName[{$sarahCurrentOutputDir,"WHIZARD_Omega"}];
$sarahCurrentOmegaDir=ToFileName[{$sarahCurrentWODir,"omega"}];
$sarahCurrentWhizardDir=ToFileName[{$sarahCurrentWODir,"whizard"}];

If[FileExistsQ[$sarahCurrentWODir]=!=True,
CreateDirectory[$sarahCurrentWODir];
];
If[FileExistsQ[$sarahCurrentOmegaDir]=!=True,
CreateDirectory[$sarahCurrentOmegaDir];
];
If[FileExistsQ[$sarahCurrentWhizardDir]=!=True,
CreateDirectory[$sarahCurrentWhizardDir];
];
Get[ToFileName[ToFileName[{$sarahPackageDir,"WhizardOmega"}],"WOMathematicaInterface.m"]];
WO`InterfacePath=ToFileName[{$sarahPackageDir,"WhizardOmega"}];

SetAttributes[ME,{Orderless}];

massless=Massless[CurrentEigenstates];

CreateWOForm;
StringReCH;
CreateCForm[True];

CreatePartListWO;
CreateParamListWO;

Generation8 = Gluon;

subGenInd={};
For[i=1,i<=Length[PART[S]],
subGenInd = Join[subGenInd,{ToExpression["indexGen"<>ToString[PART[S][[i,1]]]]-> ToExpression["Generation"<>ToString[PART[S][[i,2]]]]}];
 i++;];
For[i=1,i<=Length[PART[F]],
If[FreeQ[Gauginos,PART[F]],
subGenInd = Join[subGenInd,{ToExpression["indexGen"<>ToString[PART[F][[i,1]]]]-> ToExpression["Generation"<>ToString[PART[F][[i,2]]]]}];
];
 i++;];
For[i=1,i<=Length[PART[V]],
If[FreeQ[SGauge,PART[V][[i,1]]],
subGenInd = Join[subGenInd,{ToExpression["indexGen"<>ToString[PART[V][[i,1]]]]-> ToExpression["Generation"<>ToString[PART[V][[i,2]]]]}];
];
 i++;];


subFR = {
fSU3[a_,b_,c_]:>f[a/.subGluonIndex,b/.subGluonIndex,c/.subGluonIndex],
f[a_,b_,c_]:>f[a/.subGluonIndex,b/.subGluonIndex,c/.subGluonIndex],
fSU2[a__]->Eps[a],
Mom[a_[{gt1,c___}],b_]->FV[1,b],
Mom[a_[{gt2,c___}],b_]->FV[2,b],
Mom[a_[{gt3,c___}],b_]->FV[3,b],
Mom[a_[{gt4,c___}],b_]->FV[4,b],

Mom[conj[a_[{gt1,c___}]],b_]->FV[1,b],
Mom[conj[a_[{gt2,c___}]],b_]->FV[2,b],
Mom[conj[a_[{gt3,c___}]],b_]->FV[3,b],
Mom[conj[a_[{gt4,c___}]],b_]->FV[4,b],


Mom[a_[{lt1,c___}],b_]->FV[1,b],
Mom[a_[{lt2,c___}],b_]->FV[2,b],
Mom[a_[{lt3,c___}],b_]->FV[3,b],
Mom[a_[{lt4,c___}],b_]->FV[4,b],

Mom[a_[{ct1,c___}],b_]->FV[1,b],
Mom[a_[{ct2,c___}],b_]->FV[2,b],
Mom[a_[{ct3,c___}],b_]->FV[3,b],
Mom[a_[{ct4,c___}],b_]->FV[4,b],


Mom[conj[a_[{lt1,c___}]],b_]->FV[1,b],
Mom[conj[a_[{lt2,c___}]],b_]->FV[2,b],
Mom[conj[a_[{lt3,c___}]],b_]->FV[3,b],
Mom[conj[a_[{lt4,c___}]],b_]->FV[4,b],

Mom[conj[a_[{ct1,c___}]],b_]->FV[1,b],
Mom[conj[a_[{ct2,c___}]],b_]->FV[2,b],
Mom[conj[a_[{ct3,c___}]],b_]->FV[3,b],
Mom[conj[a_[{ct4,c___}]],b_]->FV[4,b],

ThetaStep[a__]->1,

g[a__]->ME[a],
gamma[a_]-> Ga[a,Index[Spin,Ext[1]],Index[Spin,Ext[2]]],
Lam[a_,b_,c_]:>2 T[a/.subGluonIndex,b,c],

CG[SU[3],{{1,0},{1,1},{0,1}}][a_,b_,c_]->2T[b/.subGluonIndex,c,a],
CG[SU[3],{{0,1},{1,1},{1,0}}][a_,b_,c_]->2T[b/.subGluonIndex,a,c],
CG[SU[3],{{1,1},{1,0},{0,1}}][a_,b_,c_]->2T[a/.subGluonIndex,c,b],
CG[SU[3],{{1,1},{0,1},{1,0}}][a_,b_,c_]->2T[a/.subGluonIndex,b,c],
CG[SU[3],{{1,0},{0,1},{1,1}}][a_,b_,c_]->2T[c/.subGluonIndex,b,a],
CG[SU[3],{{0,1},{1,0},{1,1}}][a_,b_,c_]->2T[c/.subGluonIndex,a,b],

conj[T[a_,b_,c_]]->T[a,c,b],


T[a_,b_,c_]:> T[a/.subGluonIndex,b,c],
LorentzProduct[a__]-> TensDot[Dot@@a],
PR->ProjM[Index[Spin,Ext[1]],Index[Spin,Ext[2]]],
PL->ProjP[Index[Spin,Ext[1]],Index[Spin,Ext[2]]]
};

subIndizesWO = {

ct1-> Index[Colour,Ext[1]],
ct2-> Index[Colour,Ext[2]],
ct3-> Index[Colour,Ext[3]],
ct4-> Index[Colour,Ext[4]],

lt1-> Index[Lorentz,Ext[1]],
lt2-> Index[Lorentz,Ext[2]],
lt3-> Index[Lorentz,Ext[3]],
lt4-> Index[Lorentz,Ext[4]],

act1->Index[Gluon,Ext[1]],
act2->Index[Gluon,Ext[2]],
act3->Index[Gluon,Ext[3]],
act4->Index[Gluon,Ext[4]],

generation -> Index[Generation],
color -> Index[Colour],
lorentz-> Index[Lorentz],
adjcolor->Index[Gluon]
};


res={};

If[ReadLists===False,
For[i=1,i<=Length[ITypes],
If[FreeQ[Exclude,ITypes[[i,1]]],
temp = SA`VertexList[ITypes[[i,1]]]//. subFR //. subIndizesWO;
For[j=1,j<=Length[temp],
names = temp[[j,1]];
switchPol=False;
If[ITypes[[i,1]]===FFS ||ITypes[[i,1]]===FFV,
If[Head[temp[[j,1,1]]]===bar && Head[temp[[j,1,2]]]===bar,
names[[2]]=CC[bar[names[[2]]]];,
If[Head[temp[[j,1,1]]]=!=bar && Head[temp[[j,1,2]]]=!=bar && AntiField[temp[[j,1,1]]]=!=temp[[j,1,1]],
names[[1]]=CC[bar[names[[1]]]]; 
];
];
];

subIndizesGen = Table[(genf[k] /. subIndFinal[k,k])->Index[(ToExpression["indexGen"<>ToString[getBlank[temp[[j,1,k]]]]]),k],{k,1,Length[temp[[j,1]]]}];
subIndizesGen = subIndizesGen //. subGenInd;
subIndizesGen ={};
Switch[ITypes[[i,1]],
FFS,
	res =  Join[res,{{names, (temp[[j,2,1]]*temp[[j,2,2]]+temp[[j,3,1]]*temp[[j,3,2]])//. subIndizesGen}}]//.{ProjM->ProjPS,ProjP->ProjMS} //.{ProjMS->ProjP,ProjPS->ProjM};,
FFV,
	res =  Join[res,{{names, -(temp[[j,2,1]]*temp[[j,2,2]]+temp[[j,3,1]]*temp[[j,3,2]])//. subIndizesGen}}] //. TensDot[Ga[a_,b_,c_],A_[b_,c_]]->TensDot[Ga[a],A][b,c] //.{ProjM->ProjPS,ProjP->ProjMS} //.{ProjMS->ProjP,ProjPS->ProjM}; ,
SSV,
	res =  Join[res,{{names, -(temp[[j,2,1]]*temp[[j,2,2]]) //. subFR//. subIndizesGen //. Mom[names[[1]],a__]->FV[1,a]//. Mom[names[[2]],a__]->FV[2,a]}}];,
SSSS,
	res =  Join[res,{{names, temp[[j,2,1]]//. subIndizesGen}}];,
SVV,
	res =  Join[res,{{names, temp[[j,2,1]]*temp[[j,2,2]]//. subIndizesGen}}];,
SSVV,
	res =  Join[res,{{names, temp[[j,2,1]]*temp[[j,2,2]]//. subIndizesGen //. sum[a_,b_,c_,d_ T[y1___,a_,y2___]]:>(d T[y1,a,y2]/. (a -> Index[Colour,x,ToExpression[StringTake[ToString[a],{2}]]])) /. Delta[a_,j1]->1 /. Delta[a_,j2]->1}}];,
SSS,
	res =  Join[res,{{names, temp[[j,2,1]]//. subIndizesGen}}];,
(* GGS,
	res =  Join[res,{{names, temp[[j,2,1]]//. subIndizesGen}}];,
GGV,
	res =  Join[res,{{names, (temp[[j,2,1]]*temp[[j,2,2]])//. subIndizesGen}}];, *)
VVV,
	res =  Join[res,{{names, - temp[[j,2,1]]*temp[[j,2,2]]//. subIndizesGen}}];,
VVVV,
	res =  Join[res,{{names,  (temp[[j,2,1]]*temp[[j,2,2]]+temp[[j,3,1]]*temp[[j,3,2]]+temp[[j,4,1]]*temp[[j,4,2]])//. subIndizesGen //. sum[a_,b_,c_,d_]:>(d /. (a -> Index[ToExpression["Generation"<>ToString[c]],x,ToExpression[StringTake[ToString[a],{2}]]]))}}];
];
j++;];
];
i++;];

res=res //. sum[a_,b_,c_,d_]:>Sum[d,{a,b,c}] //. Dot[0,a__]->0;
VertexListWHIZARDnonExp[CurrentEigenstates]=res ;
VertexListWHIZARD[CurrentEigenstates]=res ;

tempVert= {};

Print["The following generic classes have been excluded: ",Exclude];
Print["The following generic classes are included: ",Complement[{SSSS,SSS,SSVV,SSV,SVV,VVV,VVVV,FFS,FFV,GGS,GGV},Exclude]];
Print[""];
timeexpansion=TimeUsed[];
progressNrWO=0;
(* Print["Expanding Vertices (Number of Vertices: ",Length[res],")"]; *)
Print["Expanding Vertices : ",Dynamic[progressNrWO],"/",Length[res]," (",Dynamic[progressCoupWO],")"];
For[i=1,i<=Length[res],
progressNrWO=i;
progressCoupWO=res[[i,1]] /. Index[a_,b_]->b;
(* If[Mod[i,10]==0,Print["...",i," finished"];]; *)
If[Length[res[[i,1]]]==3,
tempVert=Join[tempVert,ExpandWHIZARD3[res[[i]]]];,
tempVert=Join[tempVert,ExpandWHIZARD4[res[[i]]]];
];
i++;];
progressCoupWO="All done in "<>ToString[TimeUsed[]-timeexpansion]<>"s";
Print["  ... number of expanded vertices: ", Length[tempVert]];



VertexListWHIZARDexpanded = tempVert //. conj->Conjugate //.  Delta[a__]->IndexDelta[a];

Put[VertexListWHIZARDexpanded,ToFileName[$sarahCurrentWODir,"vlist.m"]];,
VertexListWHIZARDexpanded=Get[ToFileName[$sarahCurrentWODir,"vlist.m"]];
];

PartName=ToString;

(*
Print[""];
Print[" - - - SARAH interface to WHIZARD/O'Mega - - -"];
Print[" - - - Authors:  C. Speckner, F.Staub - - -"];
Print[""];
*)

If[ModelNameInput===Automatic,
woModelName = ModelName<>"_SARAH";,
woModelName = ModelNameInput;
];

If[Head[woModelName]=!=String,woModelName = ToString[woModelName];];

WO`WriteOutput[WO`WOVertexList->VertexListWHIZARDexpanded,WO`WOModelName->woModelName,WO`WOMaxNcf->4,WO`WOGauge->ChosenGauge,WO`WOGaugeParameter->"Rxi",WO`WOWhizardVersion->WOVersion,WO`WOVerbose->False,WO`WOAutoGauge->AGauge,WO`WOMaxCouplingsPerFile->maxNumber,WO`WORunParameters->{aS,strongCoupling},WO`WOOutputDir->StringDrop[$sarahCurrentWODir,-1],WO`WOOplotter->False,WO`WOFast->True,WO`WOMassList->MassListFR,WO`WOWidthList->WidthListFR,WO`WOEParamList->EParamList,WO`WOIParamList->IParamList,WO`WOPartList->PartListFR];

If[WriteModelDirectories==True,
WriteString[DirectoryNamesFile,"WHIZARDdir="<>ToString[$sarahCurrentWODir] <>"\n"];
];

WriteWOexample[woModelName];

Print[""];
Print["All Done. WHIZARD/OMEGA files generated in ",TimeUsed[]-startedtime, "s"];
Print["Output is saved in ",StyleForm[$sarahCurrentWODir,"Section",FontSize->10]];

(* ]; *)
];


 WOForm[x_]:=Return[x  /. ReplacementsWO /. subGreek]; 




ExpandWHIZARD3[vlist_]:=Block[{i,j,gf1,gf2,gf3,start1,start2,start3,iter1,iter2,iter3,ff1,ff2,ff3,fstart1,fstart2,fstart3,fiter1,fiter2,fiter3,temp},
gf1=getGen[vlist[[1,1]] /. CC[a_]->a];
gf2=getGen[vlist[[1,2]]/. CC[a_]->a];
gf3=getGen[vlist[[1,3]]/. CC[a_]->a];

ff1=getFla[vlist[[1,1]] /. CC[a_]->a];
ff2=getFla[vlist[[1,2]]/. CC[a_]->a];
ff3=getFla[vlist[[1,3]]/. CC[a_]->a];

(*
If[getColorRep[vlist[[1,1]]]===O,ind1=nix1;, ind1=gt1;];
If[getColorRep[vlist[[1,2]]]===O,ind2=nix1;, ind2=gt2;];
If[getColorRep[vlist[[1,3]]]===O,ind3=nix1;, ind3=gt3;];
*)

ind1=gt1;ind2=gt2;ind3=gt3;


If[(vlist[[1,2]] /. {gt2->gt1,ct2->ct1,ft2->ft1})===vlist[[1,1]],
start2=Hold[iter1];
fstart2=Hold[fiter1];,
start2=1;
fstart2=1;
];

If[(vlist[[1,3]] /. {gt3->gt2,ft3->ft2})===vlist[[1,2]],
start3=Hold[iter2];
fstart3=Hold[fiter2];,
If[(vlist[[1,3]] /. {gt3->gt1,ft3->ft1})===vlist[[1,1]],
start3=Hold[iter1];
fstart3=Hold[fiter1];,
start3=1;
fstart3=1;
];
];

If[FreeQ[vlist,Delta[gt1,gt2]]==False, start2=Hold[iter1]; gf2=Hold[iter1]; ];
If[FreeQ[vlist,Delta[gt1,gt3]]==False, start3=Hold[iter1]; gf3=Hold[iter1];];
If[FreeQ[vlist,Delta[gt2,gt3]]==False,start3=Hold[iter2]; gf3=Hold[iter2];];

If[FreeQ[vlist,Delta[ft1,ft2]]==False, fstart2=Hold[fiter1]; ff2=Hold[fiter1]; ];
If[FreeQ[vlist,Delta[ft1,ft3]]==False, fstart3=Hold[fiter1]; ff3=Hold[fiter1];];
If[FreeQ[vlist,Delta[ft2,ft3]]==False, fstart3=Hold[fiter2]; ff3=Hold[fiter2];];

value =vlist[[2]];
temp={};

For[iter1=1,iter1<=gf1,
For[fiter1=1,fiter1<=ff1,
For[iter2=ReleaseHold[start2],iter2<=ReleaseHold[gf2],
For[fiter2=ReleaseHold[fstart2],fiter2<=ReleaseHold[ff2],
For[iter3=ReleaseHold[start3],iter3<=ReleaseHold[gf3],
For[fiter3=ReleaseHold[fstart3],fiter3<=ReleaseHold[ff3],
valueC =value //. {ind1->iter1,ind2->iter2,ind3->iter3,ft1->fiter1,ft2->fiter2,ft3->fiter3};
If[valueC=!=0,
 temp = Join[temp,{{Table[{vlist[[1,k]],k} //. {ind1->iter1,ind2->iter2,ind3->iter3,ft1->fiter1,ft2->fiter2,ft3->fiter3} //.subAlways /. subPartWO,{k,1,Length[vlist[[1]]]}],WOForm[valueC]}}]; 
];
fiter3++;];
iter3++;];
fiter2++;];
iter2++;];
fiter1++;];
iter1++;];
Return[temp /. {act1->Index[Generation8,Ext[1]],act2->Index[Generation8,Ext[2]],act3->Index[Generation8,Ext[3]]}];
];


ExpandWHIZARD4[vlist_]:=Block[{i,j,gf1,gf2,gf3,gf4,start1,start2,start3,start4,iter1,iter2,iter3,iter4,ff1,ff2,ff3,ff4,fstart1,fstart2,fstart3,fstart4,fiter1,fiter2,fiter3,fiter4,temp},
gf1=getGen[vlist[[1,1]]];
gf2=getGen[vlist[[1,2]]];
gf3=getGen[vlist[[1,3]]];
gf4=getGen[vlist[[1,4]]];

ff1=getFla[vlist[[1,1]]];
ff2=getFla[vlist[[1,2]]];
ff3=getFla[vlist[[1,3]]];
ff4=getFla[vlist[[1,4]]];

(*
If[getColorRep[vlist[[1,1]]]===O,ind1=nix1;, ind1=gt1;];
If[getColorRep[vlist[[1,2]]]===O,ind2=nix1;, ind2=gt2;];
If[getColorRep[vlist[[1,3]]]===O,ind3=nix1;, ind3=gt3;];
If[getColorRep[vlist[[1,4]]]===O,ind4=nix1;, ind4=gt4;];
*)

ind1=gt1;ind2=gt2;ind3=gt3;ind4=gt4;

temp = {};
value=vlist[[2]];


If[(vlist[[1,2]] /. {gt2->gt1,ft2->ft1} )===vlist[[1,1]],
start2=Hold[iter1];
fstart2=Hold[fiter1];,
start2=1;
fstart2=1;
];

If[(vlist[[1,3]] /. {gt3->gt2,ft3->ft2} )===vlist[[1,2]],
start3=Hold[iter2];
fstart3=Hold[fiter2];,
If[(vlist[[1,3]] /. {gt3->gt1,ft3->ft1} )===vlist[[1,1]],
start3=Hold[iter1];
fstart3=Hold[fiter1];,
start3=1;
fstart3=1;
];
];


If[(vlist[[1,4]] /. {gt4->gt3,ft4->ft3} )===vlist[[1,3]],
start4=Hold[iter3];
fstart4=Hold[fiter3];,
If[(vlist[[1,4]] /. {gt4->gt2,ft4->ft2} )===vlist[[1,2]],
start4=Hold[iter2];
fstart4=Hold[fiter2];,
If[(vlist[[1,4]] /. {gt4->gt1,ft4->ft1} )===vlist[[1,1]],
start4=Hold[iter1];
fstart4=Hold[fiter1];,
start4=1;
fstart4=1;
];
];
];



If[FreeQ[vlist,Delta[gt1,gt2]]==False,start2=Hold[iter1];gf2=Hold[iter1];];
If[FreeQ[vlist,Delta[gt1,gt3]]==False,start3=Hold[iter1];gf3=Hold[iter1];];
If[FreeQ[vlist,Delta[gt2,gt3]]==False,start3=Hold[iter2];gf3=Hold[iter2];];
If[FreeQ[vlist,Delta[gt1,gt4]]==False,start4=Hold[iter1];gf4=Hold[iter1];];
If[FreeQ[vlist,Delta[gt3,gt4]]==False,start4=Hold[iter3];gf4=Hold[iter3];];
If[FreeQ[vlist,Delta[gt2,gt4]]==False,start4=Hold[iter2];gf4=Hold[iter2];];

If[FreeQ[vlist,Delta[ft1,ft2]]==False,fstart2=Hold[fiter1];ff2=Hold[fiter1];];
If[FreeQ[vlist,Delta[ft1,ft3]]==False,fstart3=Hold[fiter1];ff3=Hold[fiter1];];
If[FreeQ[vlist,Delta[ft2,ft3]]==False,fstart3=Hold[fiter2];ff3=Hold[fiter2];];
If[FreeQ[vlist,Delta[ft1,ft4]]==False,fstart4=Hold[fiter1];ff4=Hold[fiter1];];
If[FreeQ[vlist,Delta[ft3,ft4]]==False,fstart4=Hold[fiter3];ff4=Hold[fiter3];];
If[FreeQ[vlist,Delta[ft2,ft4]]==False,fstart4=Hold[fiter2];ff4=Hold[fiter2];];



For[iter1=1,iter1<=gf1,
For[fiter1=1,fiter1<=ff1,
For[iter2=ReleaseHold[start2],iter2<=ReleaseHold[gf2],
For[fiter2=ReleaseHold[fstart2],fiter2<=ReleaseHold[ff2],
For[iter3=ReleaseHold[start3],iter3<=ReleaseHold[gf3],
For[fiter3=ReleaseHold[fstart3],fiter3<=ReleaseHold[ff3],
For[iter4=ReleaseHold[start4],iter4<=ReleaseHold[gf4],
For[fiter4=ReleaseHold[fstart4],fiter4<=ReleaseHold[ff4],
temp = Join[temp,{{Table[{vlist[[1,k]],k} //. {ind1->iter1,ind2->iter2,ind3->iter3, ind4->iter4,ft1->fiter1,ft2->fiter2,ft3->fiter3,ft4->fiter4} //.subAlways/. subPartWO,{k,1,Length[vlist[[1]]]}], WOForm[value //. {ind1->iter1,ind2->iter2,ind3->iter3,ind4->iter4,ft1->fiter1,ft2->fiter2,ft3->fiter3,ft4->fiter4}]}}]; 
fiter4++;];
iter4++;];
fiter3++;];
iter3++;];
fiter2++;];
iter2++;];
fiter1++;];
iter1++;];
Return[temp/. {act1->Index[Generation8,Ext[1]],act2->Index[Generation8,Ext[2]],act3->Index[Generation8,Ext[3]],act4->Index[Generation8,Ext[4]]}];
];





CreateParamListWO:=Block[{i,temp,temp2, allDependences,j1,j2,j3,angles},
Print["Creating parameter List"];

angles=Select[Intersection[DeleteCases[Flatten[{Cases[VertexListNonCC,x_Sin,99],Cases[VertexListNonCC,x_Cos,99],Cases[VertexListNonCC,x_Tan,99],Cases[VertexListNonCC,x_Sec,99],Cases[VertexListNonCC,x_Sec,99],Cases[VertexListNonCC,x_Cot,99],Cases[subNumDependences,x_Cot,99],Cases[subNumDependences,x_Cos,99],Cases[subNumDependences,x_Csc,99],Cases[subNumDependences,x_Sec,99],Cases[subNumDependences,x_Sin,99],Cases[subNumDependences,x_Tan,99],Cases[subAlways,x_Cot,99],Cases[subAlways,x_Cos,99],Cases[subAlways,x_Csc,99],Cases[subAlways,x_Sec,99],Cases[subAlways,x_Sin,99],Cases[subAlways,x_Tan,99]}] /. Sec[x_]->x /. Cos[x_]-> x /. Tan[x_]->x /. Cot[x_]->x /. Sin[x_]-> x /. Csc[x_]->x,_Integer,5]],(Head[#]==Symbol)&];

IParamList={};
EParamList={};

allDependences =Flatten[{subAlways,subNumDependences,subDependences}];

For[i=1,i<=Length[parameters],
If[(FreeQ[SA`ParNum,parameters[[i,1]]]==False || FreeQ[SA`ParDep,parameters[[i,1]]]==False  || FreeQ[SA`ParNeed ,parameters[[i,1]]]==False || FreeQ[subNumDependencesMasses,parameters[[i,1]]]==False ),
If[FreeQ[SA`ParDep,parameters[[i,1]]]==False,
Switch[Length[parameters[[i,2]]],
0,
	IParamList=Join[IParamList,{{parameters[[i,1]],parameters[[i,1]] /. allDependences,If[Head[parameters[[i,1]]]===Mass,False,FreeQ[realVar,parameters[[i,1]]]],getDescriptionParameter[parameters[[i,1]]]}}];,
1,
	IParamList = Join[IParamList,Table[{parameters[[i,1]][j1],parameters[[i,1]][j1] /. allDependences,If[Head[parameters[[i,1]]]===Mass,False,FreeQ[realVar,parameters[[i,1]]]],getDescriptionParameter[parameters[[i,1]]]<>" "<>ToString[j1]},{j1,1,parameters[[i,3,1]]}]];,
2,
	IParamList = Join[IParamList,Flatten[Table[{parameters[[i,1]][j1,j2],parameters[[i,1]][j1,j2] /. allDependences,FreeQ[realVar,parameters[[i,1]]],getDescriptionParameter[parameters[[i,1]]]<>" "<>ToString[j1]<>" "<>ToString[j2]},{j1,1,parameters[[i,3,1]]},{j2,1,parameters[[i,3,2]]}],1]];,
3,
	IParamList = Join[IParamList,Flatten[Table[{parameters[[i,1]][j1,j2,j3],parameters[[i,1]][j1,j2,j3] /. allDependences,FreeQ[realVar,parameters[[i,1]]],getDescriptionParameter[parameters[[i,1]]]<>" "<>ToString[j1]<>" "<>ToString[j2]<>" "<>ToString[j3]},{j1,1,parameters[[i,3,1]]},{j2,1,parameters[[i,3,2]]},{j3,1,parameters[[i,3,3]]}],2]];
];,

Switch[Length[parameters[[i,2]]],
0,
	EParamList=Join[EParamList,{{LHBlockName[parameters[[i,1]]],{{{LHPos[parameters[[i,1]]]},{parameters[[i,1]],parameters[[i,1]] /. subNum /. If[parameters[[i,1]]===VEVSM1 || parameters[[i,1]]===VEVSM2 || parameters[[i,1]]===VEVSM ||parameters[[i,1]]===PhaseGlu || MemberQ[angles,parameters[[i,1]]] || FreeQ[subNumDependences,parameters[[i,1]]]===False,parameters[[i,1]]->1.,parameters[[i,1]]->0.],If[Head[parameters[[i,1]]]===Mass,False,FreeQ[realVar,parameters[[i,1]]]],getDescriptionParameter[parameters[[i,1]]]}}}}}];,
1,
	EParamList = Join[EParamList,{{LHBlockName[parameters[[i,1]]],Table[{{j1},{parameters[[i,1]][j1],parameters[[i,1]][j1] /. subNum /. parameters[[i,1]][j1]->0.,FreeQ[realVar,parameters[[i,1]]],getDescriptionParameter[parameters[[i,1]]]<>" "<>ToString[j1]}},{j1,1,parameters[[i,3,1]]}]}}];,
2,
	EParamList = Join[EParamList,{{LHBlockName[parameters[[i,1]]],Flatten[Table[{{j1,j2},{parameters[[i,1]][j1,j2],parameters[[i,1]][j1,j2] /. subNum /. parameters[[i,1]][j1,j2]->0.,FreeQ[realVar,parameters[[i,1]]],getDescriptionParameter[parameters[[i,1]]]<>" "<>ToString[j1]<>" "<>ToString[j2]}},{j1,1,parameters[[i,3,1]]},{j2,1,parameters[[i,3,2]]}],1]}}];,
3,
	EParamList = Join[EParamList,{{LHBlockName[parameters[[i,1]]],Flatten[Table[{{j1,j2,j3},{parameters[[i,1]][j1,j2,j3],parameters[[i,1]][j1,j2,j3] /. subNum /. parameters[[i,1]][j1,j2,j3]->0.,FreeQ[realVar,parameters[[i,1]]],getDescriptionParameter[parameters[[i,1]]]<>" "<>ToString[j1]<>" "<>ToString[j2]<>" "<>ToString[j3]}},{j1,1,parameters[[i,3,1]]},{j2,1,parameters[[i,3,2]]},{j3,1,parameters[[i,3,3]]}],2]}}];
];
];
];
i++;];

IParamList = {};

For[i=1,i<=Length[SA`ParDep],
pos=Position[Transpose[parameters][[1]],SA`ParDep[[i]]][[1,1]];
Switch[Length[parameters[[pos,2]]],
0,
	IParamList=Join[IParamList,{{parameters[[pos,1]],parameters[[pos,1]] /. allDependences,If[Head[parameters[[pos,1]]]===Mass,False,FreeQ[realVar,parameters[[pos,1]]]],getDescriptionParameter[parameters[[pos,1]]]}}];,
1,
	IParamList = Join[IParamList,Table[{parameters[[pos,1]][j1],parameters[[pos,1]][j1] /. allDependences,If[Head[parameters[[pos,1]]]===Mass,False,FreeQ[realVar,parameters[[pos,1]]]],getDescriptionParameter[parameters[[pos,1]]]<>" "<>ToString[j1]},{j1,1,parameters[[pos,3,1]]}]];,
2,
	IParamList = Join[IParamList,Flatten[Table[{parameters[[pos,1]][j1,j2],parameters[[pos,1]][j1,j2] /. allDependences,FreeQ[realVar,parameters[[pos,1]]],getDescriptionParameter[parameters[[pos,1]]]<>" "<>ToString[j1]<>" "<>ToString[j2]},{j1,1,parameters[[pos,3,1]]},{j2,1,parameters[[pos,3,2]]}],1]];,
3,
	IParamList = Join[IParamList,Flatten[Table[{parameters[[pos,1]][j1,j2,j3],parameters[[pos,1]][j1,j2,j3] /. allDependences,FreeQ[realVar,parameters[[pos,1]]],getDescriptionParameter[parameters[[pos,1]]]<>" "<>ToString[j1]<>" "<>ToString[j2]<>" "<>ToString[j3]},{j1,1,parameters[[pos,3,1]]},{j2,1,parameters[[pos,3,2]]},{j3,1,parameters[[pos,3,3]]}],2]];
];
i++;];


For[i=1,i<=Length[AllParticlesWHO],
For[j=1,j<=getGen[AllParticlesWHO[[i]]],
If[getMassNumerical[particles[[i]],j]===Internal,
IParamList = Join[IParamList,{{
getMass[particles[[i]],j],getMassNumerical[particles[[i]],j,ReturnEquation->True],True,"Mass of "<>ToString[AllParticlesWHO[[i]]]
}}];
];
j++;];
i++;];


IParamList = WOForm/@(IParamList /. Mass[x_,b___]:>getMassW[x,b]);
EParamList = WOForm/@(EParamList /. Mass[x_,b___]:>getMassW[x,b]);

];  


CreatePartListWO:=Block[{i,j,k,temp,temp2,particle,depmass},

Print["Creating particle List"];
depmass=Table[subNumDependencesMasses[[i,1]],{i,1,Length[subNumDependencesMasses]}] /. Mass[x_]->x;
particles=Flatten[{Transpose[PART[F]][[1]],Transpose[PART[S]][[1]],Transpose[PART[V]][[1]]}];
DummyPDG=999900;
AutoFAnr = 1;
PartListFR={};
MassListFR={};
WidthListFR={};
subPartWO={};
AllParticlesWHO=particles;

For[i=1,i<=Length[particles],
temp2={};
For[j=1,j<=getGen[particles[[i]]],
For[k=1,k<=getFla[particles[[i]]],
temp2=Join[temp2,{{
ToString[getOutputName[particles[[i]],j,k]],ToString[getOutputNameAnti[particles[[i]],j,k]],getType[particles[[i]]],
getPropagatorType[particles[[i]]],getMassW[particles[[i]],j,k],getWidthW[particles[[i]],j,k],
getColorRep[particles[[i]]],getOutputName[particles[[i]],j,k],getPDG[particles[[i]],j,k] /. 0:>DummyPDG++,
getDescriptionField[particles[[i]],j,k],getLaTeXField[particles[[i]],j,k],getLaTeXField[AntiField[particles[[i]]],j,k],CheckGoldstone[particles[[i]],j,k]
}}];
If[FreeQ[depmass,particles[[i]]],
MassListFR = Join[MassListFR,{{{Abs[getPDG[particles[[i]],j,k]]},getMassW[particles[[i]],j,k],getMassNumerical[particles[[i]],j,k]}}] ;,
MassListFR = Join[MassListFR,{{{Abs[getPDG[particles[[i]],j,k]]},getMassW[particles[[i]],j,k],Internal}}] ;
];
WidthListFR = Join[WidthListFR,{{{Abs[getPDG[particles[[i]],j,k]]},getWidthW[particles[[i]],j,k],getWidthNumerical[particles[[i]],j,k]}}];

If[getGen[particles[[i]]]>1,
If[getFla[particles[[i]]]>1,
subPartWO = Join[subPartWO,{AntiField[particles[[i]][{j,k,a___}]]->getOutputNameAnti[particles[[i]],j,k]}];
subPartWO = Join[subPartWO,{particles[[i]][{j,k,a___}]->getOutputName[particles[[i]],j,k]}];,
subPartWO = Join[subPartWO,{AntiField[particles[[i]][{j,a___}]]->getOutputNameAnti[particles[[i]],j,k]}];
subPartWO = Join[subPartWO,{particles[[i]][{j,a___}]->getOutputName[particles[[i]],j,k]}];
];,
If[Length[getIndizes[particles[[i]]]]>0,
subPartWO = Join[subPartWO,{AntiField[particles[[i]][{a___}]]->getOutputNameAnti[particles[[i]],j,k]}];
subPartWO = Join[subPartWO,{particles[[i]][{a___}]->getOutputName[particles[[i]],j,k]}];,
subPartWO = Join[subPartWO,{AntiField[particles[[i]]]->getOutputNameAnti[particles[[i]],j,k]}];
subPartWO = Join[subPartWO,{particles[[i]]->getOutputName[particles[[i]],j,k]}];
];
];
k++;];
j++;];
PartListFR=Join[PartListFR,{{{getType[particles[[i]]][FANumber[particles[[i]]]],getOutputName[particles[[i]],0]},temp2}}];
i++;];

PartListFR = PartListFR /. {Straight -> S,Sine -> W, ScalarDash->D, GhostDash->C} /. 0->ZERO;

MassListFR = Select[MassListFR,(FreeQ[#,0]==True)&] /. {LesHouches -> External, Mass ->External} /. External -> 100;
WidthListFR = Select[WidthListFR,(FreeQ[#,0]==True)&] /. {Width ->External} /. External ->1;

];

(* getColorRep[x_]:=Block[{},
If[FreeQ[getIndizes[getBlank[x]],color]==True,
If[FreeQ[ColoredGaugeParticles,getBlank[x]]==True,
Return[S];,
Return[O];
];,
Return[T];
];
]; *)

getColorRep[x_]:=Block[{temp,pos,posC},
temp=getIndizesWI[getBlank[x]];
If[FreeQ[temp,color],Return[S];];
pos=Position[temp,color][[1,1]];
posC=Position[Gauge,color][[1,1]];
Switch[temp[[pos,2]],
3,
	If[SA`DynL[getBlank[x],posC]==={1,0},
	Return[T];,
	Return[-T];
	];,
6,
	If[SA`DynL[getBlank[x],posC]==={2,0},	
	Return[Six];,
	Return[-Six];
	];,
8,Return[O];
];
];


CheckGoldstone[field_,gen_,fla___]:=Block[{pos,temp},
temp = field /. {bar[x_]->x, conj[x_]->x} /. A_[{a___}]->A;
If[getType[temp]=!=S,Return[NoGS]];
If[getGen[temp]>1,
If[FreeQ[GoldstoneGhost,temp[{gen}]],
Return[NoGS];,
pos=Position[GoldstoneGhost,temp[{gen}]][[1,1]];
If[FreeQ[GoldstoneGhost[[pos]],conj[temp[{gen}]]],
Return[getOutputName[GoldstoneGhost[[pos]][[1]],1]];,
Return[getOutputNameAnti[GoldstoneGhost[[pos]][[1]],1]];
];
];,
If[FreeQ[GoldstoneGhost,temp],
Return[NoGS];,
pos=Position[GoldstoneGhost,temp][[1,1]];
If[FreeQ[GoldstoneGhost[[pos]],conj[temp]],
Return[getOutputName[GoldstoneGhost[[pos]][[1]],1]];,
Return[getOutputNameAnti[GoldstoneGhost[[pos]][[1]],1]];
];
];
];
];

getMass[field_]:=getMass[field,1,1];
getWidth[field_]:=getWidth[field,1,1];

getMassW[field_]:=getMassW[field,1,1];
getWidthW[field_]:=getWidthW[field,1,1];

getMassW[field_,gen_]:=getMassW[field,gen,1];
getWidthW[field_,gen_]:=getWidthW[field,gen,1];

getWidthW[field_,gen_,fla_]:=getMassWidthOutputName[field,gen,fla,"W"];
getMassW[field_,gen_,fla_]:=getMassWidthOutputName[field,gen,fla,"M"];


WriteWOexample[modelname_]:=Block[{},
woEx=OpenWrite[ToFileName[$sarahCurrentWODir,"e+e-_mu+mu-Scatter.sin"]];
WriteString[woEx,"model="<>modelname<>"\n \n"];

WriteString[woEx,"process eemumus="<>ToString[getOutputNameAnti[Electron,1]]<>","<>ToString[getOutputName[Electron,1]]<>"=>"<>ToString[getOutputNameAnti[Electron,2]]<>","<>ToString[getOutputName[Electron,2]]<>"\n \n"];

WriteString[woEx,"sqrts=0.2 TeV \n \n"];
WriteString[woEx,"integrate (eemumu) {iterations=3:10000,6:20000} \n \n"];
Close[woEx];
];





