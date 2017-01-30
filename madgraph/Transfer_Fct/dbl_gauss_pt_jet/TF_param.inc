c*********************************************************
c                  TF_param.inc                         **
c*********************************************************
        include 'genps.inc'
c
c external functions
c
        double precision pt,eta,phi,theta,rap,rho
	external pt,eta,phi,theta,rap,rho
c
c local
c
	double precision prov1,prov2,prov3,prov4,prov5
	double precision prov6,prov7,prov8,prov9,prov10
c
c LHCO input   
c
      integer tag_init(3:nexternal),type(nexternal-1),run_number,trigger
      double precision eta_init(nexternal-1),phi_init(nexternal-1),
     &pt_init(nexternal-1),j_mass(nexternal-1),ntrk(nexternal-1),
     &btag(nexternal-1),had_em(nexternal-1),dummy1(nexternal-1),
     &dummy2(nexternal-1)
      common/LHCO_input/eta_init,phi_init,pt_init,
     &j_mass,ntrk,btag,had_em,dummy1,dummy2,tag_init,type,run_number,
     &trigger
c
c	MET tag
c
	integer met_lhco,opt_lhco
	common/LHCO_met_tag/met_lhco,opt_lhco
c
c	generated
c
c
c     global
c
      double precision momenta(0:3,-max_branch:2*nexternal)
      double precision mvir2(-max_branch:2*nexternal)    
      common /to_diagram_kin/ momenta, mvir2
c
c parameters to init in transfert_card.dat
c	
        double precision  p_jet_e_1
        double precision  p_jet_e_2
        double precision  p_jet_e_3
        double precision  p_jet_e_4
        double precision  p_jet_e_5
        double precision  p_jet_e_6
        double precision  p_jet_e_7
        double precision  p_jet_e_8
        double precision  p_jet_e_9
        double precision  p_jet_e_10
        double precision  p_jet_e_11
        double precision  p_jet_e_12
        double precision  p_jet_e_13
        double precision  p_jet_e_14
        double precision  p_jet_e_15
        double precision  p_bjet_e_1
        double precision  p_bjet_e_2
        double precision  p_bjet_e_3
        double precision  p_bjet_e_4
        double precision  p_bjet_e_5
        double precision  p_bjet_e_6
        double precision  p_bjet_e_7
        double precision  p_bjet_e_8
        double precision  p_bjet_e_9
        double precision  p_bjet_e_10
        double precision  p_bjet_e_11
        double precision  p_bjet_e_12
        double precision  p_bjet_e_13
        double precision  p_bjet_e_14
        double precision  p_bjet_e_15
        double precision  p_gjet_e_1
        double precision  p_gjet_e_2
        double precision  p_gjet_e_3
        double precision  p_gjet_e_4
        double precision  p_gjet_e_5
        double precision  p_gjet_e_6
        double precision  p_gjet_e_7
        double precision  p_gjet_e_8
        double precision  p_gjet_e_9
        double precision  p_gjet_e_10
        double precision  p_gjet_e_11
        double precision  p_gjet_e_12
        double precision  p_gjet_e_13
        double precision  p_gjet_e_14
        double precision  p_gjet_e_15
       Common/to_TF_param/p_jet_e_1,p_jet_e_2,p_jet_e_3,
     &p_jet_e_4,p_jet_e_5,p_jet_e_6,p_jet_e_7,p_jet_e_8,
     &p_jet_e_9,p_jet_e_10,p_jet_e_11,p_jet_e_12,p_jet_e_13,
     &p_jet_e_14,p_jet_e_15,p_bjet_e_1,p_bjet_e_2,p_bjet_e_3,
     &p_bjet_e_4,p_bjet_e_5,p_bjet_e_6,p_bjet_e_7,p_bjet_e_8,
     &p_bjet_e_9,p_bjet_e_10,p_bjet_e_11,p_bjet_e_12,
     &p_bjet_e_13,p_bjet_e_14,p_bjet_e_15,p_gjet_e_1,
     &p_gjet_e_2,p_gjet_e_3,p_gjet_e_4,p_gjet_e_5,p_gjet_e_6,
     &p_gjet_e_7,p_gjet_e_8,p_gjet_e_9,p_gjet_e_10,
     &p_gjet_e_11,p_gjet_e_12,p_gjet_e_13,p_gjet_e_14,p_gjet_e_15