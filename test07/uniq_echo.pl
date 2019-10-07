#!/usr/local/bin/perl -w

foreach $arg (@ARGV) {
    if (!defined($uniq{$arg})) {
        print "$arg ";
        $uniq{$arg} = 1;
    }
}

print "\n";

