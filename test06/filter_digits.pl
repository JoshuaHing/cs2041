#!/usr/local/bin/perl -w

$i = 0;
foreach $line (<STDIN>) {
    $line =~ s/[0-9]//g;
    $array[$i++] = $line; 
}

print @array;
