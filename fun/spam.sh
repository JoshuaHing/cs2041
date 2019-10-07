#!/bin/sh

spam_number="$1"
target="$2"
i=0


while test $i -lt $spam_number
do
    echo "- Josh" |mail -s "Happy Birthday!" $2
    echo "sent"
    i=`expr $i + 1`
    echo $i
done
