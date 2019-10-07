#!/bin/sh

# Case: Less/more than 2 args have been inputted.
if [ $# != 2 ]
then
    echo "Usage: $0 <number of lines> <string>"
else 
    # Case: If arg1 is 0, then exit program.
    if [ $1 = 0 ]   
    then
        exit 1
    fi
    # Case: If arg1 is negative.
    if ! [[ $1 =~ ^[1-9][0-9]*$ ]]
    then
       echo "$0: argument 1 must be a non-negative integer"
       exit 1
    # Case: If arg1 is valid, print out the string n times.
    else
        for ((n = 0 ; n < $1 ; n++))
        do
            echo $2
        done
    fi
fi


