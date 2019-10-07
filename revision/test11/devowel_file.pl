#!/usr/local/bin/perl -w

open F, "<", $ARGV[0] or die "cannot open file";
foreach $line (<F>) {
    $line =~ s/[aeiou]//gi;
    push @lines, $line;
}
close F;

open F2,  ">", $ARGV[0] or die "cannot write to file";
print F2 @lines;
close F2;
