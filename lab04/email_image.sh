#!/bin/bash

for i in "$@"
do
    display "$i"
done

for i in "$@"
do
    echo -n "Address to e-mail this image to? "
    read address
    echo -n "Message to accompany image? "
    read message
    echo "$message"|mutt -e 'set copy=no' -a "$i" -- "$address"
    echo "$i sent to $address"
done



