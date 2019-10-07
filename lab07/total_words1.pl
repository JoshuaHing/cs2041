#!/usr/local/bin/perl -w

$word_count = 0;
foreach $line (<STDIN>) {
    @array = split(/[^A-Za-z]/,$line);
    foreach $word (@array) {
        if ($word ne "") {
            $word_count++;
        }
    }
}

print "$word_count words\n";
