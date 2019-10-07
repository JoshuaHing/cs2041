#!/usr/local/bin/perl -w

if (!(@ARGV == 0)) {
    

    foreach $arg (@ARGV) {

        $hash{$arg}++;
        if ($hash{$arg} == 1) {
            print "$arg ";
        }

    }

    print "\n";
}
