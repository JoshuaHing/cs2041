#!/usr/local/bin/perl -w

foreach $arg (@ARGV) {
    push @numbers, $arg;
}

@numbers = sort {$a <=> $b} @numbers;
print $numbers[@numbers/2], "\n";
