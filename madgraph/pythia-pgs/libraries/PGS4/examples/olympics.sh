#!/bin/bash

if [ $# -eq 2 ]
then
    echo ""
    echo "Running PGS in non-interactive mode:"

    filename=$1

    if [ -r ./input/$filename.pyt ]
    then
    echo "    Using $filename.pyt as the input file."
    else
        echo "    File $filename does not exist!  Exiting..."
        exit
    fi

    type=`echo "$2" | sed s/[=].*//`
    num=`echo "$2" | sed s/.*[=]//`
    if [ $type = nev ]
    then
        echo "    Generating $num events."
    else
       if [ $type = lum ]
       then
          echo "    Generating $num pb^-1 of data."
       else
          echo "    '$type' is not 'nev' or 'lum'.  Exiting..."
          exit
       fi
    fi
    echo ""
fi

if [ $# -eq 1 ]
then
    echo "This script requires zero or two arguments. Please run again."
    exit
fi

if [ $# -ge 3 ]
then
    echo "This script requires zero or two arguments. Please run again." 
    exit
fi



if [ $# -eq 0 ]
then
    echo ""
    echo "Welcome to the PGS / LHC Olympics event generator!"
    echo ""

    echo "These are the available parameter input files."
    echo ""
    cd ./input
    ls *.pyt | sed /.pyt/s/// > index.txt
    sed = index.txt | sed 'N;s/\n/  /'
    cd ..
    echo ""
    echo "Enter the name (or number) of the one you would like to use:"
    read a

    if [ -z `echo $a | egrep [0-9]+$` ]
    then
        filename=$a
    else
        filename=`sed "${a}q;d" ./input/index.txt`
    fi

    if [ -r ./input/$filename.pyt ]
    then
        echo "( $filename )"
    else
        echo "sFile $filename does not exist!  Exiting..."
        exit
    fi


    echo "Would you like to set total number of events (nev) or target luminosity (lum)?"
    read type

    if [ $type  = nev ]
    then
       echo "Enter target number of events:"
       read num
    else
       if [ $type  = lum ]
       then
          echo "Enter target luminosity in inverse picobarns (integers only):"
          read num
       else
          echo "    '$type' is not 'nev' or 'lum'.  Exiting..."
          exit
       fi
    fi

    echo ""
    echo "Now launching PGS with the following settings:"
    echo ""

    if [ -r ./input/$filename.pyt ]
    then
    echo "    Using $filename.pyt as the input file."
    else
        echo "    File $filename does not exist!  Exiting..."
        exit
    fi

    if [ $type = nev ]
    then
        echo "    Generating $num events."
    else
       if [ $type = lum ]
       then
          echo "    Generating $num pb^-1 of data."
       else
          echo "    '$type' is not 'nev' or 'lum'.  Exiting..."
          exit 
       fi
    fi
    echo ""

fi

if [ $type = nev ]
then
    printtype="--nev"
else  
    if [ $type = lum ]
    then   
        printtype="--lum"
    else   
        echo "    '$type' is not 'nev' or 'lum'.  Exiting..."
        exit
    fi  
fi

cd examples
./olympics --pythia ../input/$filename.pyt $printtype $num --L2 --numToPrint 1  ../output/$filename.lhco --logFile ../output/$filename.log