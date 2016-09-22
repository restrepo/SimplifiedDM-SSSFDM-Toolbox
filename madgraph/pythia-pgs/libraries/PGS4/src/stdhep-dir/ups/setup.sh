#!/bin/sh
# **********************************************************************
# * setup    Program Library Installlation ENVironment                 *
# *                                                                    *
# * Garren     6/17/94 Configured for stdhep                           *
# **********************************************************************
 
PDG_MASS_TBL=$STDHEP_DIR/mass_width_04.mc;	export PDG_MASS_TBL
Phase()
{
  $STDHEP_DIR/bin/Phase
}
Space()
{
  $STDHEP_DIR/bin/Space
}
