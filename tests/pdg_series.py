def revert_dict(dictionary):
        return dict((v,k) for k,v in dictionary.iteritems())
class pdg(object):
    '''
    self.pdg_id[pid]    -> returns name
    self.pdg_name[pname] -> returns pid
    self.pdg_new_names -> returns updated values
    self[pname]=pid  -> Update Series 
    '''
    import pandas as pd
    import pdg as pdgtmp
    _Series=pd.Series
    _fullnames=_Series(pdgtmp.pdgid_names)
    def __init__(self, *args, **kwargs):
        self.pdg_new_names=self._Series()    
        self.pdg_id=self._Series(self._fullnames)
        self.pdg_name=self._Series(revert_dict(self.pdg_id))
        
    def __setitem__(self, pname,pid):
        self.pdg_id[pid]=pname
        self.pdg_name=self._Series(revert_dict(self.pdg_id))
        self.pdg_new_names[pname]=pid
