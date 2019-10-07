#!/usr/local/bin/perl -w

foreach $line (<STDIN>) { 
    chomp $line;
    @words = split (/ /, $line);
    foreach $word (@words) {
        if (! $word eq "") {
            $to_sort{$word}++;
        }
    }

    foreach $word (sort keys %to_sort) {
        for ($i = 0; $i < $to_sort{$word}; $i++) {
            print "$word ";
        }
    }
    print "\n";
    
    undef %to_sort;
}


