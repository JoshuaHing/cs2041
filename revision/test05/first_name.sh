#!/usr/local/bin/sh

egrep COMP[29]041 $1 | cut -d"|" -f3| sed 's/.*, //'| cut -d" " -f1| sort | uniq -c | sort | tail -1|cut -d" " -f8

