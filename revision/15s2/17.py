#!/usr/bin/python3

import sys, re

string1 = sys.argv[1]
string2 = sys.argv[2]

if (string1 == string2):
    print(string1)
else:
    match = re.search(r'(.*?)(\d+)(.*)', string1)
    if match:
        bef = match.group(1)
        lower = int(match.group(2))
        aft = match.group(3)
    match = re.search(r'(\d+)', string2)
    if match:
        higher = int(match.group(1))
    i = lower
    while (i <= higher):
        line = bef+str(i)+aft
        print (line)
        i += 1
  
        
