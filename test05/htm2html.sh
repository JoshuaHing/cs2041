#!/bin/bash
for file in *.htm
do
    new_file_name=`echo "$file" | sed 's/\.htm/\.html/g'`
    for files in *.html
    do
        if test "$new_file_name" = "$files"
        then
            echo "$new_file_name exists"
            exit 1
        fi
    done
    mv "$file" "$new_file_name"
done
