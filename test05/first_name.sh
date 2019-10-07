#!/bin/bash

egrep COMP[29]041 $1| cut -d"|" -f3 | cut -d"," -f2 | sed 's/ //' | cut -d" " -f1 | sort | uniq -c | sort | cut -d" " -f8 | tail -1
