#!/usr/local/bin/perl -w

foreach $line (<STDIN>) {
    $array{$line}++;
}

foreach $line (keys %array) {
    if ($array{$line} == $ARGV[0]) {
        print "Snap: $line";
    }
}
