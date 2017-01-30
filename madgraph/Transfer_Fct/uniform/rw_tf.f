
      subroutine setTF
      implicit none
c
c     arguments
c     
      integer iunit
      logical done
      include '../../nexternal.inc'
      include 'TF_param.inc'

      logical use_condor,use_perm,perm_with_b
      common/global_run_param/use_condor,use_perm,perm_with_b


      integer maxpara
      parameter (maxpara=1000)
c
c     local
c
      integer npara
      character*20 param(maxpara),value(maxpara),ctemp

      call Init_MET_LHCO
      call load_tf_para(npara,param,value,"transfer_card.dat")

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
c
C     user parameter for transfert functions
c
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC


      call get_real_t(npara,param,value,"p_jet_e_1"    ,p_jet_e_1,   1d0)
      call get_real_t(npara,param,value,"p_jet_phi_1"    ,p_jet_phi_1,   1d0)
      call get_real_t(npara,param,value,"p_jet_theta_1"    ,p_jet_theta_1,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_1"    ,p_bjet_e_1,   1d0)
      call get_real_t(npara,param,value,"p_bjet_phi_1"    ,p_bjet_phi_1,   1d0)
      call get_real_t(npara,param,value,"p_bjet_theta_1"    ,p_bjet_theta_1,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_1"    ,p_gjet_e_1,   1d0)
      call get_real_t(npara,param,value,"p_gjet_phi_1"    ,p_gjet_phi_1,   1d0)
      call get_real_t(npara,param,value,"p_gjet_theta_1"    ,p_gjet_theta_1,   1d0)
      call get_real_t(npara,param,value,"p_muon_e_1"    ,p_muon_e_1,   1d0)
      call get_real_t(npara,param,value,"p_muon_phi_1"    ,p_muon_phi_1,   1d0)
      call get_real_t(npara,param,value,"p_muon_theta_1"    ,p_muon_theta_1,   1d0)
      call get_real_t(npara,param,value,"p_elec_e_1"    ,p_elec_e_1,   1d0)
      call get_real_t(npara,param,value,"p_elec_phi_1"    ,p_elec_phi_1,   1d0)
      call get_real_t(npara,param,value,"p_elec_theta_1"    ,p_elec_theta_1,   1d0)
      call get_real_t(npara,param,value,"p_init_x1_1"    ,p_init_x1_1,   1d0)
      call get_real_t(npara,param,value,"p_init_x2_1"    ,p_init_x2_1,   1d0)
      


      done=.true.
      return
 99   write(*,*) 'error in reading'
      return
      end



