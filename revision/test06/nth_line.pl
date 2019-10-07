#!/usr/local/bin/perl -w

open F, "<", $ARGV[1] or die "cannot open file";
@lines = <F>;
if ($ARGV[0] <= @lines && $ARGV[0] > 1) {
    print "$lines[$ARGV[0]-1]";
}


print $lines[-1];
