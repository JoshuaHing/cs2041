#!/usr/local/bin/perl -w
if ($ARGV[0] eq "-d") {
    $flag = shift @ARGV;
}
foreach $file (<lyrics/*.txt>) {
    open F, "<", $file or die "$0: Cannot open $file: $!";
    ($artist) = $file =~ /lyrics\/(.*).txt/;
    $artist =~ s/_/ /g;
    push @artists, $artist;
    foreach $line (<F>) {
        @words = split(/[^A-Za-z]/, $line);
        foreach $word (@words) {
            if ($word ne "") {
                $word = lc $word;
                $count{$artist}{$word}++;
                $total_count{$artist}++;
            }
        }
    }
}   

foreach $artist (sort keys %count) {
    foreach $word (sort keys %{$count{$artist}}) {
        $log{$artist}{$word} = log(($count{$artist}{$word}+1)/$total_count{$artist});
    }
}

foreach $file (@ARGV) {
    open F, "<", $file or die "$0: Cannot open $file: $!";
    foreach $line (<F>) {
        @words = split(/[^A-Za-z]/, $line);
        foreach $word (@words) {
            if ($word ne "") {
                $word = lc $word;
                foreach $artist (@artists) {
                    if (exists ($count{$artist}{$word})) {
                        $conseq_log{$artist} += $log{$artist}{$word};
                    } else {
                        $conseq_log{$artist} += log(1/$total_count{$artist});
                    }
                }
            }
        }
    }
    
    foreach $artist (sort {$conseq_log{$b} <=> $conseq_log{$a}} keys %conseq_log) {
        if (defined($flag)) {
            printf("$file: log_probability of %5.1f for %s\n", $conseq_log{$artist}, $artist);
        }
    }
    
    $key = (sort ({$conseq_log{$b} <=> $conseq_log{$a}} keys %conseq_log))[0];
    printf("$file most resembles the work of %s (log-probability=%5.1f)\n", $key, $conseq_log{$key});
    
    undef %conseq_log;
}   


