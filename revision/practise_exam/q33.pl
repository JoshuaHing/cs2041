#!/usr/local/bin/perl -w

$filename = $ARGV[0];
$to_match = $ARGV[1];

open F, "<", $filename or die "Cannot open file.";
foreach $line (<F>) {
    chomp $line;
    while ($line =~ /(.*?[^(]*)($to_match)([^)]*.*)/) {
        ($bef, $match, $aft) = ($1, $2, $3);
        print "bef = $bef, match = $match, aft = $aft\n";
        $line = "$bef($match)$aft";
    }
    print "line = $line\n";
}

close F;
