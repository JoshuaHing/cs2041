#!/usr/bin/python3.5

import sys, re

string = sys.argv[1]
string.strip()

low = 0
high = len(string) - 1

is_palindrome = True
while (low < high):
    #print ("low =", string[low], "high=", string[high])
    while not string[low].isalpha():
        low += 1
    while not string[high].isalpha():
        high -= 1
    if not string[low].lower() == string[high].lower():
       is_palindrome = False
    low += 1
    high -= 1
    
if is_palindrome:
    print ("True")
else:
    print("False")
