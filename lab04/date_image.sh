#!/bin/bash

for arg in "$@"
do
    file_name=`echo $arg | cut -d"." -f1`
    date_modified=`ls -l $arg| cut -d" " -f6-8`
    convert -gravity south -pointsize 36 -draw "text 0,10 '$date_modified'" "$arg" "$arg"
done
