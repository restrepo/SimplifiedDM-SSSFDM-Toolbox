#!/usr/bin/env bash
tv=1.2.9
cd tarballs
wget http://www.hepforge.org/archive/sarah/toolbox-1.2.9.tar.gz
tar -zxvf toolbox-$tv.tar.gz
rsync -avxz toolbox-$tv/ ../../
cd toolbox-$tv
./configure --disable-whizard --disable-higgsbounds --disable-higgssignals
cd ../../
for i in SSP SARAH SPHENO calchep micromegas madgraph; do
    rsync -avxz tarballs/toolbox-$tv/$i/ $i
done
#rm -rf tarballs/toolbox-$tv*
patch README < README.patch
#Make user independent
patch Makefile < Makefile.patch
patch butler < butler.patch
echo "Check if new files were added with: git status"
	 
