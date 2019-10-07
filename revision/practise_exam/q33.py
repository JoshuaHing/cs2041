#!/usr/bin/python3.6

import sys, re
to_match = sys.argv[2]
file = open(sys.argv[1])

for line in file.readlines():
    line = line.strip()
    match = re.search("({0})".format(to_match), line)
    if match:
        match = match.group(1)
        line = re.sub(match, "(" + match + ")", line)
        print (line)
    

