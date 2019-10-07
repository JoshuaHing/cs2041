#!/usr/bin/python3.5 -u

import sys
words = {}
array = sys.argv
array.pop(0)
for element in array:
    words[element] = 1
    
for element in array:
    if (words[element] == 1):
        print("%s " % element, end="")
        words[element] += 1
        
print()
 
 
