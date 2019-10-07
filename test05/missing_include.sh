#!/bin/bash

for args in $@
do
    included_file=`egrep "#include \"" $args| cut -d\" -f2`
    for header_files in $included_file
    do
        if !(test -r "$header_files")
        then
            echo "$header_files included into $args does not exist"
        fi            
    done 
done
    
