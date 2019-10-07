#!/usr/local/bin/perl -w

foreach $line (<STDIN>) {
    $indiviudal_count =~ 's/\d$line/';
    print "count = $individual_count";
    
}
