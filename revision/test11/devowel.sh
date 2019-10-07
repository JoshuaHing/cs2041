#!/usr/local/bin/sh

`sed 's/[aeiouAEIOU]//g' $1|  $1.tmp`;
