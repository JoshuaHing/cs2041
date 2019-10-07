#!/usr/local/bin/perl -w

foreach $line (<STDIN>) {
    chomp $line;
    if ($line =~ /(.*?)(\d+)(.*)/) {
        ($bef, $num1, $aft) = ($1, $2, $3);
        if ($aft =~ /(.*?)(\d+)(.*)/) {
            ($one, $two, $three) = ($1, $2, $3);
            $line = "$bef$two$one$num1$three";
            print "$line\n";
        } else {
            $line = "$bef$num1$aft";
            print "$line\n";
        }
    } else {
        print $line, "\n";
    }
        


}
