#!/usr/local/bin/perl -w

foreach $line (<STDIN>) {
    chomp $line;
    if ($line =~ /(.*\|.*\|)(.*)(\|.*\|.*)/) {
        ($bef, $to_change, $aft) = ($1, $2, $3);
        if ($to_change =~ /(.*), (.*)/) {
            ($to_change1, $to_change2) = ($1, $2);
            $to_change = "$to_change2 $to_change1";
        }
        $line = "$bef$to_change$aft";
        print "$line\n";
        
    }   
    
}
