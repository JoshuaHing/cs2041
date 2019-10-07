#!/usr/bin/python3.6
import sys
sys.argv.pop(0)
numbers = []
for arg in sys.argv:
    numbers.append(arg);

numbers = sorted(numbers, key=int)
print (numbers[len(numbers)//sss2])
  
