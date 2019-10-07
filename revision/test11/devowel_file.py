#!/usr/bin/python3.6

import sys, re
f = open(sys.argv[1])
lines = []
file_lines = f.readlines()
for line in file_lines:
    line = re.sub('[aeiouAEIOU]','', line)
    lines.append(line)

f2 = open(sys.argv[1], "w")
for line in lines:
    f2.write(line)
    
