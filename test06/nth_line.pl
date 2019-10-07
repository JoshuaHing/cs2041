#!/usr/local/bin/perl -w

open F, "<", $ARGV[1] or die;

$i = 0;
foreach $line (<F>) {
    $array[$i++] = $line;
}
if ($ARGV[0] == 0) {
 
} elsif ($#array >= $ARGV[0]-1) {
    print "$array[$ARGV[0]-1]";
}
