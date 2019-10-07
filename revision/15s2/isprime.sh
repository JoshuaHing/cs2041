#!/usr/local/bin/sh

n=$1
i=2

while test $i -lt $n
do
    if test `expr $n % $i` -eq 0
    then
        echo "$n is composite"
        exit 0
    
    fi
    i=$((i + 1))
done
echo "$n is prime"
