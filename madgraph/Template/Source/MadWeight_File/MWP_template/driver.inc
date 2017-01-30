C+-----------------------------------------------------------------------+
C|                   DEFINITION FOR MADWEIGHT DRIVER                     |
C|                                                                       |
C|     Author: Pierre Artoisenet (UCL-CP3)                               |
C|             Olivier Mattelaer (UCL-CP3)                               |
C+-----------------------------------------------------------------------+

c     channel position
c
      integer config_pos,perm_pos
      common /to_config/config_pos,perm_pos
c
c
      integer max_channel
      parameter (max_channel=1000)
c
c
c
c                                                                         
c      integer good_points(20,20,max_channel),bad_points(20,20,max_channel)
c      common /to_stat/good_points, bad_points
