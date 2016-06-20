#!/usr/bin/env bash

if [ ! $2 ];then
    echo USAGE:
    echo $0 MODEL prt1 prt2 [...]
    echo Model name and list of Z2-odd particles in right order
    exit
fi
#General configuration
prtfile=prtcls1.mdl
#creates tmp files
tmpfile=$(mktemp /tmp/prtcls1.XXX)
tmplist=$(mktemp /tmp/list.XXX)
i=1
for p in $@; do
    echo $i
    
    if [ $i -eq 1 ];then
	if [ -d micromegas/$p/work/models ];then
	    echo cd micromegs/$p/work/models
	    
	else
	    echo $p
	    echo MODEL DOES NOT EXISTS
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
