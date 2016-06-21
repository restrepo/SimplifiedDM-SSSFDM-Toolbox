In master, after clone this repo
* See GIT_MANAGEMENT to build all the relevant tools of SARAH-Toolbox
* Create branch  `CATEGORY+MODEL` and checkout there:
```bash
  checkout CATEGORY+MODEL
```
* Creates the main SARAH file as

`SARAH/Models/CATEGORY/MODEL/CATEGORY-MODEL.m`
 
with: Model\`Name = "CATEGORYMODEL" inside `CATEGORY-MODEL.m`

* Update clean.sh and update and execute clean_repo.sh
* To avoid clutter the repo with binary files, please execute from the main Toolbox dir

```bash
  ./butler CATEGORY/MODEL
  cd micromegas/CATEGORYMODEL
  make clean
  cd ../../
  git add SPHENO/CATEGORYMODEL
  git add micromegas/CATEGORYMODEL
  #Be sure to include so_generated dir
  git add micromegas/SimplifiedDMSDFDM/work/so_generated/
``` 

* Rebuild micromegas binaries

```bash
  make main=CalcOmega.cpp
  make main=CalcOmega_with_DDetection_MOv....cpp
``` 

* The jupyter notebook files `index_bash.ipynb` (`tests/CATEGORY-MODEL.ipynb`) must be updated (created).
* Update README.md mybinder button
* There is a script `micromegas_prtcl_fix.sh` to fix the `prtcl1.mdl` file if necessary (see http://goo.gl/n6Oypj)
* Commit the changes and make the pull request for the CATEGORY+MODEL branch




