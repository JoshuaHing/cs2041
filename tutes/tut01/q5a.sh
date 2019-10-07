#!/bin/bash

#Write a regexp to match C preprocessor commands in a C program.
#egrep "^#include"

#Write a regexp to match all the lines in a C program except preprocessor commands
#egrep -v "^#include"

#Write a regexp to find line in a C program with trailing white space - one or white space at the end of line
#egrep " +$"

#Write a regexp to match the names Barry, Harry, Larry and Parry
#egrep "[BHLP]arry"

#Write a regexp to match a string containing the word hello followed later by the word world
#egrep "hello.*world"

#Write regexp to match the word calendar and all mis-spellings with 'a' replaced 'e' or vice-versa
#egrep "c[ae]l[ae]nd[ae]r"

#Write regexp to match a list of positive integers separated by commas, e.g.
#egrep "[0-9][0-9]*(,[0-9][0-9]*)"

#***Write regexp to match a C string whose last character is newline
#egrep "\n$"

#Give five reasons why this attempt to search a file for HTML paragraph and break tags may fail.
#grep <p>|<br> /tmp/index.html



