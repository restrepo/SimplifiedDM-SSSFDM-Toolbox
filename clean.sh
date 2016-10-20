#!/usr/bin/env bash
if [ ! "$1" ];then
    echo USAGE MODEL
    exit
fi
MODEL="$1"
#fix egrep special characters
MODEL=$(echo $MODEL | sed 's/+/::/g') 
models="darkLR
diphotonModels
LR+DM
tripletLR
radinert+T13A
radinert+RSIII
SM+HighScale
Zee
SimplifiedDM+IDM
SimplifiedDM+SDFDM
SimplifiedDM+TFDM
SimplifiedDM+SSSFDM
"
Nm=$(echo "$models" | wc -l)
models=$(echo "$models" |sed 's/+/::/g' | egrep  -v '^'"$MODEL"'$' | sed 's/::/+/g')
Nmn=$(echo "$models" | wc -l)

if [ $Nm -ne $Nmn ] && [ -n "$models" ]; then
    for m in $models;do
	m=$(echo "$m" | sed 's/+/\//g')
	echo rm -rf SARAH/Models/"$m"
	rm -rf SARAH/Models/"$m"
	m=$(echo "$m" | sed 's/\///g')
    	echo rm -rf SPHENO/"$m"
	rm -rf SPHENO/"$m"
	echo rm -rf micromegas/"$m"
	rm -rf micromegas/"$m"
	echo rm -rf madgraph/"$m"
	rm -rf madgraph/"$m"
    done
fi

