#!/usr/local/bin/perl -w



$string1 = $ARGV[0];
$string2 = $ARGV[1];

if ($string1 eq $string2) {
    print "$string1\n";
} else {    
    if ($string1 =~ /(.*?)(\d+)(.*)/) {
        ($bef, $lower, $aft) = ($1, $2, $3);
    }
    if ($string2 =~ /(\d+)/) {
        $higher = $1;
    }
    $i = $lower;
    while ($i <= $higher) {
        $line = "$bef$i$aft";
        print "$line\n";
        $i++;
    }
}
