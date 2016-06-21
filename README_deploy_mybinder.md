Try directly here:

[![Binder](http://mybinder.org/badge.svg)](http://mybinder.org/repo/restrepo/SimplifiedDM-SDFDM-Toolbox)

From your forked repo e.g: `USER/BSM-Toolbox`` clone your branch: CATEGORY+MODEL

```bash
#1
git clone -b CATEGORY+MODEL git@github.com:USER/BSM-Toolbox.git
#2
git branch master
git checkout master
git remote add mybinder git@github.com:USER/CATEGORY-MODEL-Toolbox.git
git push -u mybinder master
```
Go to http://mybinder.org and creates your virtual machine with `requirements.txt` checked in __Configure dependencies__ section.

For updates from USER/BSM-Toolbox:

```bash
git checkout USER/BSM-Toolbox
```
and follow after step `#2` before

To re-build a model  afer change SARAH model files:

```bash
 cd micromegas 
 make
 make
 cd ..
 ./butler MODEL # Requires mathematica
```

