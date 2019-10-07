#!/usr/local/bin/bash

lower=$1
higher=$2
filename=$3

if test -e $filename
then
    rm $filename
fi
while test $lower -le $higher;
do
    echo $lower >> $filename;
    lower=$((lower + 1))

done
