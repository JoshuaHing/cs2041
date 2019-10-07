#!/usr/local/bin/perl -w

foreach $arg (@ARGV) {
    $hash{$arg}++;
    if ($hash{$arg} == 1) {
        print "$arg ";
    }
}
print "\n";
