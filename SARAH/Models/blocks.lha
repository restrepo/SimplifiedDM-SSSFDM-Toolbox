Block DobletFermion #Doublet fermion
1 FermionFields[[1]] = {rd, 1, {vd, ed},   -1/2, 2,  1,-1}; # U(1)xSU(2)xSU(3)xZ_2
2 FermionFields[[2]] = {ru, 1, {- eu,vu},     1/2, 2,  1,-1};
Block DobletFermion-Lagrangian
1 -MDF rd.ru
Block DobletFermion-Mixing
1  {{vd, vu}, {Rv0, ZvN}}
Block DobletFermion-Spinor
1 Nv0 ->{ Rv0, conj[Rv0]}
Block DobletFermion-particles-WeylFermionAndIndermediate
1  {rd,     {LaTeX -> "R^d" }}
2  {ru,     {LaTeX -> "R^u" }},
3  {vd,     {LaTeX -> "R_v^d" }}
4  {vu,     {LaTeX -> "R_v^u" }}
5  {Rv0,    {LaTeX -> "R_\\nu^0",OutputName -> "Rv0",PDG -> 0 }}
Block DobletFermion-particles-EWSB
1  {Nv0,  {  LaTeX ->"\\tilde{\\chi}^0",OutputName -> "Nv0",PDG -> {210000002,210000003} }}
Block DobletFermion-parameters
1  {MDF,{ LaTeX -> "M_D",OutputName -> MDF,LesHouches -> MDF}}
Block DobletFermion-SPheno-MINPAR    
1 {1,MDFIN}
Block DobletFermion-SPheno-BoundaryLowScaleInput
1 {MDF,MDFIN}
Block DobletFermion-SPheno-ListDecayParticles
1 Nv0
Block DobletFermion-SPheno-ListDecayParticles3B
1 {Nv0,"Nv0.f90"}
Block DobletFermion-SPheno-DefaultInputValues
1 MDFIN -> 200.
