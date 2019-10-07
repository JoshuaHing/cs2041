#!/usr/local/bin/perl -w

$url = "http://www.unsw.edu.au";


open F, "wget -O- $url|" or die; 
foreach $line (<F>) {
    if ($line =~ /[0-9]+( [0-9]*)*/) {
        print "$line\n";
    }
}

close F;
