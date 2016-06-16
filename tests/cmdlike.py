'''
Implementation of usual commands in python way
'''
def grep(pattern,multilinestring):
    '''Grep replacement in python
    as in: $ echo $multilinestring | grep pattern
    dev: re.M is for multiline strings
    '''
    import re 
    grp=re.finditer('(.*)%s(.*)' %pattern, multilinestring,re.M)
    return '\n'.join([g.group(0) for g in grp])
