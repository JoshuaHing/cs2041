#!/usr/local/bin/sh

for file in "*.c"
do
    var=`cat $file|egrep "#include \""| cut -d\" -f2`
    for include in $var
    do
        if ! test -e $include
        then
            echo "$include included into $file does not exist"
        fi  
    done
done

