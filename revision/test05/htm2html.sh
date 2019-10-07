#!/usr/local/bin/sh

for file in *.htm
do
    new_file=`echo $file|sed 's/\.htm/\.html/'`
    if test -e $new_file
    then
        echo "$new_file exists"
        exit 0
    fi
    mv $file $new_file
done
