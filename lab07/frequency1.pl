#!/usr/local/bin/perl -w

foreach $file (<lyrics/*.txt>) {
    $word_count = $match_count = 0;
    open F, "<", $file or die "$0: Cannot open $file: $!";
    ($artist) = $file =~ /lyrics\/(.*).txt/;
    $artist =~ s/_/ /g;
    foreach $line (<F>) {
        @words = split(/[^A-Za-z]/, $line);
        foreach $word (@words) {
            $word_count++ if ($word ne "");
            $match_count++ if ($word =~ /^$ARGV[0]$/i);
        }
    }
    $count{$artist}{$word} = $match_count;
    $total_count{$artist} = $word_count;
}   

foreach $artist (sort keys %count) {
    foreach $word (sort keys %{$count{$artist}}) {
        printf("%4d/%6d = %.9f %s\n", $match_count, $total_count{$artist}, $match_count/$total_count{$artist}, $artist);
    }
}
        
