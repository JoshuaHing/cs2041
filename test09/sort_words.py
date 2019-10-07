#!/usr/bin/python3.5 -u

import sys, re
word_hash = {}
lines = sys.stdin.readlines()
i = 0
for line in (lines):
    split_line = re.split(" |\n", line)
    for word in (split_line):
        if (word != ""):
            if not word in word_hash:
                word_hash[word] = 1
            else:
                word_hash[word] += 1
                
    for key in sorted(word_hash.keys()):
        for i in range(0, word_hash[key]):
            print("%s " % key, end="")
         
    print()
    word_hash.clear()
