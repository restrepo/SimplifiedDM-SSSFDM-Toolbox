#!/usr/bin/env python

"""
.. module:: tools.physicsUnits
   :synopsis: This introduces physical units (GeV, fb) to the framework.

.. moduleauthor:: Wolfgang Waltenberger <wolfgang.waltenberger@gmail.com>

"""

import unum
import logging

logger = logging.getLogger(__name__)


# description see
# http://home.scarlet.be/be052320/Unum.html
# http://home.scarlet.be/be052320/docs.html

# install it with:
# sudo pip install ez_setup
# sudo easy_install Unum
# or sth similar

# can be switched off with a single switch
useUnits = True

# make sure we define only once
# if len(Unum.getUnitTable())==0:
unum.Unum.reset()
unum.Unum.VALUE_FORMAT = "%0.2E"
unum.Unum.UNIT_HIDE_EMPTY = True

m = unum.Unum.unit('m')
cm = unum.Unum.unit('cm', 0.01 * m )

fb = unum.Unum.unit('fb')
pb = unum.Unum.unit('pb', 1000 * fb)

eV = unum.Unum.unit('eV')
keV = unum.Unum.unit('keV', 10 ** 3 * eV)
MeV = unum.Unum.unit('MeV', 10 ** 6 * eV)
GeV = unum.Unum.unit('GeV', 10 ** 9 * eV)
TeV = unum.Unum.unit('TeV', 10 ** 12 * eV)


if __name__ == "__main__":
    """
    Called as script, will print some physicsUnits.
    
    """
    three = 3.0 * fb
    print(three, "=", three.asUnit(pb))
    seven = 7.0 * TeV
    print(seven, "=", seven.asUnit(GeV))
