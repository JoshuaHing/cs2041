#!/bin/bash

# Traverse through all jpg files
for file in *.jpg
do 
    # Get the string for the png representation of the jpg file
    converted_file=`echo "$file"| sed 's/jpg/png/'`
    # First check that the png file doesn't already exist
    for files in *.png
    do
        if test "$converted_file" = "$files"
        then
            echo "$converted_file already exists"
            exit 1
        fi
    done
    # If it doesn't already exist, convert the file to png
    convert "$file" "$converted_file"
    # Remove the jpg file
    rm "$file"
done
