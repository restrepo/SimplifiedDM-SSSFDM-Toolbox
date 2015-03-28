(* ::Package:: *)

(* For a variation of A_ 0 the check of two e^+ e^- cross sections is included *)

RunScans = {ScanA0wCS};

(* Load the file which defines the properties of the different tools *)
LoadSettings="DefaultSettings.m.MSSM";


(* --------------------------------------------------------- *)
(* Initialize CalcHep *)
(* --------------------------------------------------------- *)

DEFINITION[a_][IncludeCalcHep]=True;
DEFINITION[a_][CalcHepRuns]= {{"","",""}};

(* For example: 
DEFINITION[a_][CalcHepRuns]={
{"~/CH-Processes/ee-h1Z_MSSM","./n_calchep -blind \"[[[[[[[[[[{}]]{[[[[[{}}\"","prt_1"},
{"~/CH-Processes/ee-CC_MSSM","./n_calchep -blind \"[[[[[[[[[[{}]]{[[[[[{}}\"","prt_1"}
};
*)


(* ---------------------------------------------------------------------------------------- *)
(* Define the parameter ranges and all other information for the LesHouches input file *)
(* ---------------------------------------------------------------------------------------- *)

(* Names of all blocks *)

DEFINITION[a_][Blocks]={MODSEL,SMINPUTS,MINPAR,SPhenoInput};



(* parameter ranges *)
(* Possible Distributions: FIXED, LINEAR, LOG, RANDOM *)

DEFINITION[a_][MODSEL]={
  {{1},{Value->1}},
  {{6},{Value->1}}
};

DEFINITION[a_][SMINPUTS]={
  {{2},{Value->1.166390*10^-5}},
  {{3},{Value->0.1172}},
  {{4},{Value->91.18760}},
  {{5},{Value->4.2}},
  {{6},{Value->172.9}},
  {{7},{Value->1.777}}
};

DEFINITION[a_][MINPAR]={
  {{1}, {Value->500}},
  {{2}, {Value->500}},
  {{3}, {Value->10}},
  {{4}, {Value->1}},
  {{5}, {Min->0,Max->1000, Steps->10,Distribution->LINEAR}}
  };




DEFINITION[a_][SPhenoInput]={
  {{1},{Value->-1}},
  {{2},{Value->1}},
  {{11},{Value->0}},
  {{12},{Value->12}},
  {{21},{Value->0}},
  {{75},{Value->1}},
  {{76},{Value->1}}
};


(* Define what should be plotted *)
(* Existing types so far:    
       P2D: (x,y)-Plot;   
       P2DLog: log (x,y)-Plot;       
	   P3D: Contour plot;
       P3DLog: log Contour plot;
*) 

DEFINITION[a_][Plots]={
  {P2D, {MINPAR[5],{MASS[25],MASS[35]}},Style1,"A0_Higgs.eps"},
  {P2D, {MINPAR[5],{CHep[1],CHep[2]}},Style1,"A0_CS.eps"},
  {P2D, {MINPAR[5],{MASS[1000011],MASS[2000011],MASS[1000013],MASS[2000013],MASS[1000015],MASS[2000015]}},Style2,"A0_Selectrons.eps"}
};




BasicStyle= {Frame->True, Axes->False,FrameLabel->{UseLaTeX["$A_0$~[GeV]"],UseLaTeX["$m$ ~[GeV]"]},Joined->True};
BasicStyle2= {Frame->True, Axes->False,FrameLabel->{UseLaTeX["$A_0$~[GeV]"],UseLaTeX["$\\sigma$~[pb]"]},Joined->False};
Style1 = Map[Join[BasicStyle,{PlotStyle->#}]&,{Red,Green}];
Style2 = Map[Join[BasicStyle,{PlotStyle->#}]&,{Red,Green,Blue,Black,Orange,Pink}];

