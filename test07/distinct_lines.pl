#!/usr/local/bin/perl -w

while ($line = <STDIN>) {
    chomp $line;
    $line =~ s/^ +//;
    $line =~ s/ +/ /g;
    $line = lc $line;
    $word_count++;
    $word_count{$line}++;
    if ($word_count{$line} == 1) {
        $distinct_count++;
    }
    if ($distinct_count == $ARGV[0]) {
        print "$distinct_count distinct lines seen after $word_count lines read.\n";
        exit 0;
    }
   

    
    
}

    print "End of input reached after $word_count lines read - $ARGV[0] different lines not seen.\n";
