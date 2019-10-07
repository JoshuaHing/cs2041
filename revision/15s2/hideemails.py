#!/usr/bin/python3

import sys, re;

read_file = open(sys.argv[1])
file_lines = read_file.readlines()
lines = []

for line in file_lines:
    line = line.strip()
    line = re.sub(' +', ' ', line)
    line = re.sub(r'\@[^ ]*', '@example.com', line)
    lines.append(line)


write_file = open(sys.argv[1], "w")
for line in lines:
    write_file.write(line+"\n")
