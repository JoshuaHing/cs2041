#!/usr/bin/python3

import sys

n = int(sys.argv[1])
i = 2
while i < n:
    if n%i == 0:
        print("{0} is composite".format(n))
        sys.exit(0)
    i += 1
print("{0} is prime".format(n))
