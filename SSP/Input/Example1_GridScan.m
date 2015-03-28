(* ::Package:: *)

(* This example performs three different runs:
   1) m0 from 0 to 1000 with everything else fixed
   2) m12 from 0 to 1000 with setting m0 to 2*m12
   3) 2D grid in the m0/m12 plane
*)


(* Load the file which defines the properties of the different tools *)
LoadSettings="DefaultSettings.m.MSSM";

(* Several scans can be done in a row. Give each one a name... *)
RunScans = {ScanM0,ScanM12,ScanM0M12};


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

DEFINITION[ScanM0][MINPAR]={
  {{1}, {Min->0,Max->1000, Steps->10,Distribution->LINEAR}},
  {{2}, {Value->500}},
  {{3}, {Value->10}},
  {{4}, {Value->1}},
  {{5}, {Value->0}}
  };

DEFINITION[ScanM12][MINPAR]={
  {{1}, {Value->2*MINPAR[2]}},
  {{2}, {Min->0,Max->1000, Steps->10,Distribution->LINEAR}},
  {{3}, {Value->10}},
  {{4}, {Value->1}},
  {{5}, {Value->0}}
  };

DEFINITION[ScanM0M12][MINPAR]={
  {{1}, {Min->0,Max->1000, Steps->10,Distribution->LINEAR}},
  {{2}, {Min->0,Max->1000, Steps->10,Distribution->LINEAR}},
  {{3}, {Value->10}},
  {{4}, {Value->1}},
  {{5}, {Value->0}}
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



(* ---------------------------------------------------------------------------------------- *)
(* Define what should be plotted                                                            *)
(* ---------------------------------------------------------------------------------------- *)

(* Existing types so far:    
       P2D: (x,y)-Plot;   
       P3D: Contour plot;
*) 

DEFINITION[ScanM0][Plots]={
  {P2D, {MINPAR[1],{MASS[25],MASS[35],MASS[36]}},Style1,"m0_Higgs.eps"},
  {P2D, {MINPAR[1],{MASS[1000011],MASS[2000011],MASS[1000013],MASS[2000013],MASS[1000015],MASS[2000015]}},Style2,"m0_Selectrons.eps"}
};

DEFINITION[ScanM12][Plots]={
  {P2D, {MINPAR[2],{MASS[25],MASS[35],MASS[36]}},Style3,"m12_Higgs.eps"},
  {P2D, {MINPAR[2],{MASS[1000022],MASS[1000023],MASS[1000034],MASS[1000035]}},Style4,"m12_Neutralinos.eps"}
};


DEFINITION[ScanM0M12][Plots]={
  {P2D, {MINPAR[1],{MASS[25],MASS[35],MASS[36]}},Style1,"m0_Higgs_different_m12.eps"},
  {P2D, {MINPAR[1],{MASS[1000011],MASS[2000011],MASS[1000013],MASS[2000013],MASS[1000015],MASS[2000015]}},Style2,"m0_Selectrons_different_m12.eps"},
  {P2D, {MINPAR[2],{MASS[25],MASS[35],MASS[36]}},Style3,"m12_Higgs_different_m0.eps"},
  {P2D, {MINPAR[2],{MASS[1000022],MASS[1000023],MASS[1000034],MASS[1000035]}},Style4,"m12_Neutralinos_different_m0.eps"},
  {P3D, {MINPAR[1],MINPAR[2],MASS[25]},Style5,"m0_m12_Mass25.eps"},
  {P3D, {MINPAR[1],MINPAR[2],MASS[35]},Style5,"m0_m12_Mass35.eps"}
};


BasicStyle1= {Frame->True, Axes->False,FrameLabel->{UseLaTeX["$m_0$"],UseLaTeX["$m_{h_i}$"]},Joined->False, FrameTicksStyle -> Directive[Black, 14]};
Style1 = Map[Join[BasicStyle1,{PlotStyle->#}]&,{Red,Green,Blue}];
BasicStyle2= {Frame->True, Axes->False,FrameLabel->{UseLaTeX["$m_0$"],UseLaTeX["$m_{\\tilde{e}_i}$"]},Joined->False, FrameTicksStyle -> Directive[Black, 14]};
Style2 = Map[Join[BasicStyle2,{PlotStyle->#}]&,{Red,Green,Blue,Black,Orange,Pink}];

BasicStyle3= {Frame->True, Axes->False,FrameLabel->{UseLaTeX["$M_{1/2}$"],UseLaTeX["$m_{h_i}$"]},Joined->False, FrameTicksStyle -> Directive[Black, 14]};
Style3 = Map[Join[BasicStyle3,{PlotStyle->#}]&,{Red,Green,Blue}];
BasicStyle4= {Frame->True, Axes->False,FrameLabel->{UseLaTeX["$M_{1/2}$"],UseLaTeX["$m_{\\tilde{\\chi}^0_i}$"]},Joined->False, FrameTicksStyle -> Directive[Black, 14]};
Style4 = Map[Join[BasicStyle4,{PlotStyle->#}]&,{Red,Green,Blue,Black}];

Style5= {Frame->True, Axes->False,FrameLabel->{UseLaTeX["$m_0$"],UseLaTeX["$M_{1/2}$"]},FrameTicksStyle -> Directive[Black, 14],ContourLabels->True};

