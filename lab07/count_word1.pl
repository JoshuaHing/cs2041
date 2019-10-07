#!/usr/local/bin/perl -w

$word_count = 0;
foreach $line (<STDIN>) {
    @array = split(/[^A-Za-z]/,$line);
    foreach $word (@array) {
        if ($word =~ /^$ARGV[0]$/i) {
            $num_match++;
        }
    }
}

print "$ARGV[0] occurred $num_match times\n";
