#!/bin/sh 
SMALL=10 
MEDIUM_SIZED=100 
declare small_files 
declare medium_files 
declare large_files

for file in *
do 
    x="$(wc -l $file)"
    if test x -lt 10
    then 
        small_files="$small_files $file" 
    elif test x -lt 100
    then 
        medium_files="$medium_files $file" 
    else 
        large_files="$large_files $file" 
    fi 
done

sort small_files
sort medium_files
sort large_files
echo "Small files:$small_files"
echo "Medium-sized files:$medium_files"
echo "Large files:$large_files"
