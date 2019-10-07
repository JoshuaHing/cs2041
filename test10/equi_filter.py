#!/usr/bin/python3.5 -u
import sys
is_equi = []
equi = {}
i = 0
for line in sys.stdin:
    line = line.strip()
    words = line.split(" ")
    for word in words:
        if (word == "Equi:"):
            is_equi.append("Equi:")
        elif (word == "Not-equi:"):
            is_equi.append("Not-equi:")
        else:
            if (word != ""):
                last_num = 0
                for letter in (word):
                    letter = letter.lower()
                    if letter in equi:
                        equi[letter] += 1
                    else:
                        equi[letter] = 1
                    last_num = equi[letter]
                skip = 0
                for key in equi.keys():
                    if (equi[key] != last_num):
                        skip = 1
                if (skip == 1):
                    equi.clear()
                    continue
                is_equi.append(word)
                equi.clear()
    for element in is_equi:
        sys.stdout.write("{0} ".format(element))
    print()
    i = 0
    is_equi.clear()
                    
                    
        
