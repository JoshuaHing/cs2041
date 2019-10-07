#!/usr/local/bin/perl -w

foreach $file (<lyrics/*.txt>) {
    open F, "<", $file or die "$0: Cannot open $file: $!";
    $num_words = $num_match = 0;
    ($artist) = $file =~ /lyrics\/(.*).txt/;
    $artist =~ s/_/ /g;
    foreach $line (<F>) {
        @words = split(/[^A-Za-z]/, $line);
        foreach $word (@words) {
            if ($word ne "") {
                $num_words++;
            }
            if ($word =~ /^$ARGV[0]$/i) {
                $word = lc $word;
                $num_match++;
            }
        }
    }
    $count{$artist}{$ARGV[0]} = $num_match;
    $total_count{$artist} = $num_words;
}   

foreach $artist (sort keys %count) {
    foreach $word (sort keys %{$count{$artist}}) {
        printf("%4d/%6d = %.9f %s\n", $count{$artist}{$word}, $total_count{$artist}, $count{$artist}{$word}/$total_count{$artist}, $artist);
    }
}

