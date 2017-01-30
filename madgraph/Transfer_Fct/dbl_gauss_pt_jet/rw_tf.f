
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
      call get_real_t(npara,param,value,"p_jet_e_2"    ,p_jet_e_2,   1d0)
      call get_real_t(npara,param,value,"p_jet_e_3"    ,p_jet_e_3,   1d0)
      call get_real_t(npara,param,value,"p_jet_e_4"    ,p_jet_e_4,   1d0)
      call get_real_t(npara,param,value,"p_jet_e_5"    ,p_jet_e_5,   1d0)
      call get_real_t(npara,param,value,"p_jet_e_6"    ,p_jet_e_6,   1d0)
      call get_real_t(npara,param,value,"p_jet_e_7"    ,p_jet_e_7,   1d0)
      call get_real_t(npara,param,value,"p_jet_e_8"    ,p_jet_e_8,   1d0)
      call get_real_t(npara,param,value,"p_jet_e_9"    ,p_jet_e_9,   1d0)
      call get_real_t(npara,param,value,"p_jet_e_10"    ,p_jet_e_10,   1d0)
      call get_real_t(npara,param,value,"p_jet_e_11"    ,p_jet_e_11,   1d0)
      call get_real_t(npara,param,value,"p_jet_e_12"    ,p_jet_e_12,   1d0)
      call get_real_t(npara,param,value,"p_jet_e_13"    ,p_jet_e_13,   1d0)
      call get_real_t(npara,param,value,"p_jet_e_14"    ,p_jet_e_14,   1d0)
      call get_real_t(npara,param,value,"p_jet_e_15"    ,p_jet_e_15,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_1"    ,p_bjet_e_1,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_2"    ,p_bjet_e_2,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_3"    ,p_bjet_e_3,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_4"    ,p_bjet_e_4,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_5"    ,p_bjet_e_5,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_6"    ,p_bjet_e_6,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_7"    ,p_bjet_e_7,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_8"    ,p_bjet_e_8,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_9"    ,p_bjet_e_9,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_10"    ,p_bjet_e_10,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_11"    ,p_bjet_e_11,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_12"    ,p_bjet_e_12,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_13"    ,p_bjet_e_13,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_14"    ,p_bjet_e_14,   1d0)
      call get_real_t(npara,param,value,"p_bjet_e_15"    ,p_bjet_e_15,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_1"    ,p_gjet_e_1,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_2"    ,p_gjet_e_2,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_3"    ,p_gjet_e_3,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_4"    ,p_gjet_e_4,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_5"    ,p_gjet_e_5,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_6"    ,p_gjet_e_6,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_7"    ,p_gjet_e_7,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_8"    ,p_gjet_e_8,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_9"    ,p_gjet_e_9,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_10"    ,p_gjet_e_10,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_11"    ,p_gjet_e_11,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_12"    ,p_gjet_e_12,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_13"    ,p_gjet_e_13,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_14"    ,p_gjet_e_14,   1d0)
      call get_real_t(npara,param,value,"p_gjet_e_15"    ,p_gjet_e_15,   1d0)
      


      done=.true.
      return
 99   write(*,*) 'error in reading'
      return
      end



