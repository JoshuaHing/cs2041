#!/usr/local/bin/perl -w


foreach $line (<STDIN>) {
    chomp $line;
    while ($line =~ /(.*?)\<(.*?)\>(.*)/) {
        ($bef, $contents, $aft) = ($1, $2, $3);
        if ($contents =~ /\!(.*)/) {
            $command = $1;
            $output = `$command`;
            $line = "$bef$output$aft";
        } else {
            $output = `cat $contents`;
            $line = "$bef$output$aft";
        }  
    }
    print "$line\n";
}
