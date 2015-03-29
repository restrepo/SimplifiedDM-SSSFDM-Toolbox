import os.path
import commands
def test_micromegas():
    assert os.path.isfile('SPHENO/bin/SPhenoSSDM'), 'run ./butler SSDM first'
    a=commands.getoutput('SPHENO/bin/SPhenoSSDM SPHENO/SSDM/LesHouches.in.SSDM')
    assert os.path.isfile('SPheno.spc.SSDM')
    a=commands.getoutput('micromegas/SSDM/CalcOmega SPheno.spc.SSDM')
    assert eval(a.split('\n')[-1].split('%')[0])==4, 'micrOMEGAS failed'
    
if __name__=='__main__':
    test_micromegas()