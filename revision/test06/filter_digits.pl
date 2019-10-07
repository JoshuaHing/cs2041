#!/usr/local/bin/perl -w

foreach $line (<STDIN>) {
    chomp $line;
    $line =~ s/\d+//g;
    print "$line\n";   
    
}
