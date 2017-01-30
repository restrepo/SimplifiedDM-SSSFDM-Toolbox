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
        double precision  p_jet_phi_1
        double precision  p_jet_theta_1
        double precision  p_bjet_e_1
        double precision  p_bjet_phi_1
        double precision  p_bjet_theta_1
        double precision  p_gjet_e_1
        double precision  p_gjet_phi_1
        double precision  p_gjet_theta_1
        double precision  p_elec_e_1
        double precision  p_elec_phi_1
        double precision  p_elec_theta_1
        double precision  p_muon_e_1
        double precision  p_muon_phi_1
        double precision  p_muon_theta_1
        double precision  p_tau_e_1
        double precision  p_tau_phi_1
        double precision  p_tau_theta_1
        double precision  p_init_x1_1
        double precision  p_init_x2_1
       Common/to_TF_param/p_jet_e_1,p_jet_phi_1,p_jet_theta_1,
     &p_bjet_e_1,p_bjet_phi_1,p_bjet_theta_1,p_gjet_e_1,
     &p_gjet_phi_1,p_gjet_theta_1,p_elec_e_1,p_elec_phi_1,
     &p_elec_theta_1,p_muon_e_1,p_muon_phi_1,p_muon_theta_1,
     &p_tau_e_1,p_tau_phi_1,p_tau_theta_1,p_init_x1_1,p_init_x2_1