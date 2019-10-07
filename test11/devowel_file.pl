#!/usr/bin/perl -w

open $old, "<", $ARGV[0] or die "cannot open file";
open $new, ">", "$ARGV[0].tmp";

foreach $line (<$old>) {
    $line =~ s/[aeiou]//gi;
    print $new "$line";
}
`mv $new $old`;
close OLD_F;
close NEW_F;


