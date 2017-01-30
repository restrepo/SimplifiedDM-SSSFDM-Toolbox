#!/usr/bin/env python
##########################################################################
##                                                                      ##
##                               MadWeight                              ##
##                               ---------                              ##
##########################################################################
##                                                                      ##
##   author: Mattelaer Olivier (CP3)                                    ##
##       email:  olivier.mattelaer@uclouvain.be                         ##
##   author: Artoisenet Pierre (CP3)                                    ##
##       email:  pierre.artoisenet@uclouvain.be                         ##
##                                                                      ##
##########################################################################
##                                                                      ##
##   license: GNU                                                       ##
##   last-modif:10/06/08                                                ##
##                                                                      ##
##########################################################################
##                                                                      ##
##   Content                                                            ##
##   -------                                                            ##
##########################################################################
import os
import sys
sys.path.append('./new_transfer')
from create_transfert_functions import create_TF_main

def detect_SubProcess(pos='.'):

    Transfer_list=[]
    
    list_dir=os.listdir(pos)
    print list_dir
    for name in list_dir:
        print os.path.isdir(name)
        if os.path.isdir(name)  and name not in ['common','new_transfer','CVS']:    Transfer_list.append(name)

                
    return Transfer_list


def update_dir(dir,opt=0):

    os.chdir(dir)
    if opt==2:
        os.system('mv transfer_card.dat transfer_card.bk')
#    os.system('python ../new_transfer/create_transfert_functions.py')
    create_TF_main() 
    if opt==1:
        os.system('mv transfer_card_default.dat transfer_card.dat')
    elif opt==2:
        os.system('cp transfer_card.dat transfer_card.new')
        os.system('mv transfer_card.bk transfer_card.dat')
        

    os.chdir('..')

if(__name__=='__main__'):

    list=detect_SubProcess()

    print 'How to treat existing transfer_card? '
    print ' 0: overwrite standard one'
    print ' 1: replace by the actual default one'
    print ' 2: don\'t touch neither to the actual one neither to the default one (created transfer_card.new)'
    value=raw_input()
    opt=int(value)

    print list
    for directory in list:
        update_dir(directory,opt)
