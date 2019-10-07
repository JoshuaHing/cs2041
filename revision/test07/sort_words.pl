#!/usr/local/bin/perl -w

foreach $line (<STDIN>) {
    chomp $line;
    @words = split(/ +/, $line);
    @words = sort @words;
    $ans = join(" ", @words);
    print "$ans\n";
}
