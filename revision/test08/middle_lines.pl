#!/usr/local/bin/perl -w

open F, "<", $ARGV[0] or die "cannot open file";

@lines = <F>;
if (!(@lines == 0)) {
    if (@lines % 2 == 0) {
        print "$lines[(@lines-1)/2]";
    }
    print "$lines[(@lines)/2]"
}
 

