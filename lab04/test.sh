#!/bin/bash

if `echo "$1" | egrep -i "vs\."`
then
    echo "success!"
fi

: '
if  test `egrep -i "[a-z]-[a-z]" "$1"`
then
    echo "wjeiqew"
fi
'

