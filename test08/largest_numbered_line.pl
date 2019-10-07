#!/usr/local/bin/perl -w

$max = 0;
@lines = <STDIN>;
foreach $line (@lines) {
    my (@num) = $line =~ /-?\d[\d.]*/g;
    foreach $num (@num) {
        if ($num > $max) {
            $max = $num;
        }     
    }
}

foreach $line (@lines) {
    my (@num) = $line =~ /-?\d[\d.]*/g;
    foreach $num (@num) {
        if ($num == $max) {
            print "$line";
        }     
    }
}

