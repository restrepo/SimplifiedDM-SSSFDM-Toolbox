#!/usr/bin/env bash
USAGE="USAGE:
 $0 MODEL prt1 prt2 [...]
MODEL: model name 
prt1 prt2 [...]: list of Z2-odd particles in right order"

if [ ! $3 ];then
    echo "$USAGE"
    exit
fi
#General configuration
prtfile=prtcls1.mdl
#creates tmp files
tmpfile=$(mktemp /tmp/prtcls1.XXX)
tmplist=$(mktemp /tmp/list.XXX)
i=1
for p in $@; do
    if [ $i -eq 1 ];then
	if [ -d micromegas/$p/work/models ];then
	    cd micromegas/$p/work/models
	    
	else
	    echo "MODEL DOES NOT EXISTS: $p"
	    echo "$USAGE"
	    exit
	fi    
    fi
    if [ $i -gt 1 ];then
	grep ^$p $prtfile >> $tmplist #extract line
	grep -v ^$p $prtfile > $tmpfile # remove line
	cp $tmpfile $prtfile
    fi

    i=$(($i+1))
done
cat $tmplist >> $prtfile

#clean tmp files
for f in "$tmpfile" "$tmplist"; do
    if [ -f "$f" ];then
	rm -f "$f"
    fi
done
