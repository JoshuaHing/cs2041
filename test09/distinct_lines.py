#!/usr/bin/python3.5 -u

import sys, fileinput
num_to_read = int(sys.argv[1])
word_hash = {}
distinct_lines = 0
lines_read = 0
for line in (sys.stdin):
    line = " ".join(line.split())
    line = line.lower()
    #print("line = {0}".format(line))
    if not line in word_hash:
        word_hash[line] = 1
        distinct_lines += 1
    else:
        word_hash[line] += 1
    lines_read += 1 
    if (distinct_lines == num_to_read):
        print("{0} distinct lines seen after {1} lines read.".format(distinct_lines, lines_read))
        exit()
        
print("End of input reached after {0} lines read -  {1} different lines not seen.".format(lines_read, num_to_read))


    
