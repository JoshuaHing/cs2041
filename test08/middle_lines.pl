#!/usr/local/bin/perl -w

open F, "<", $ARGV[0] or die "Cannot open file";
@array = <F>;
if (@array) {
    if (@array % 2 == 1) {
        $index = (@array / 2);
        print "$array[$index]";
    } else {  
        $index = (@array/2);
        print "$array[$index-1]";
        print "$array[$index]";
    }
}
