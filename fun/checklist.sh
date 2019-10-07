#!/bin/bash

echo -n "Number of q's? "
read num
echo "$num"


for i in "$num"
do
    echo "q$i ?"
    if test read "\n"
    then
        echo "woohoo!"
    fi
done
