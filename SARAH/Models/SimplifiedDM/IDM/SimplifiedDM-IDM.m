Off[General::spell]

Model`Name      = "SimplifiedDMIDM";
Model`NameLaTeX = "Inert doublet Model";
Model`Authors   = "N. Rojas, A. Vicente";
Model`Date      = "2015-04-28";

(* "28-04-2015 (first implementation)" *)
(* "25-05-2015 (removed mixings in scalar sector)" *)
(* "10-06-2015 (fixed conventions)" *)


(*------------Particle Content---------------*)

(* Global Symmetries *)
Global[[1]] = {Z[2], Z2};

(*--------------Gauge Groups-----------------*)
Gauge[[1]]={B,   U[1], hypercharge, g1, False, 1};
Gauge[[2]]={WB, SU[2], left,        g2, True , 1};
Gauge[[3]]={G,  SU[3], color,       g3, False, 1};

(*--------------Matter Fields----------------*)
FermionFields[[1]] = {q , 3, {uL, dL},     1/6, 2,  3, 1};
FermionFields[[2]] = {l , 3, {vL, eL},    -1/2, 2,  1, 1};
FermionFields[[3]] = {d , 3, conj[dR],     1/3, 1, -3, 1};
FermionFields[[4]] = {u , 3, conj[uR],    -2/3, 1, -3, 1};
FermionFields[[5]] = {e , 3, conj[eR],       1, 1,  1, 1};

ScalarFields[[1]] =  {H,  1, {Hp, H0},     1/2, 2,  1,  1};
ScalarFields[[2]] =  {Et, 1, {etp,et0},    1/2, 2,  1, -1};

(*---------------DEFINITION------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= 
{
  {LagFer   ,      {AddHC->True}},
  {LagH     ,      {AddHC->False}},
  {LagEt    ,      {AddHC->False}},
  {LagHEt   ,      {AddHC->False}},
  {LagHEtHC ,      {AddHC->True}}
};

LagFer   = Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q;
LagH     = -(- mH2 conj[H].H     + 1/2 lambda1 conj[H].H.conj[H].H );
LagEt    = -(+ mEt2 conj[Et].Et  + 1/2 lambda2 conj[Et].Et.conj[Et].Et );
LagHEt   = -(+ lambda3 conj[H].H.conj[Et].Et + lambda4 conj[H].Et.conj[Et].H );
LagHEtHC = -(+ 1/2 lambda5 conj[H].Et.conj[H].Et );

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{
  {H0,  {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]}, {hh, 1/Sqrt[2]}},
  {et0, {0, 0}, {etI, \[ImaginaryI]/Sqrt[2]}, {etR, 1/Sqrt[2]}}
};

DEFINITION[EWSB][MatterSector]=
{
  {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
  {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
  {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}
};

(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]=
{
  Fd  -> {  DL, conj[DR]},
  Fe  -> {  EL, conj[ER]},
  Fu  -> {  UL, conj[UR]},
  Fv  -> {  vL, 0}
};

DEFINITION[EWSB][GaugeES]=
{
  Fd1 ->{  FdL, 0},
  Fd2 ->{  0, FdR},
  Fu1 ->{  Fu1, 0},
  Fu2 ->{  0, Fu2},
  Fe1 ->{  Fe1, 0},
  Fe2 ->{  0, Fe2}
};
