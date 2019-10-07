#!/usr/local/bin/perl -w

$start_word = $ARGV[1];
$end_word = $ARGV[2];
@start_letters = split(//, $start_word);
@end_letters = split(//, $end_word);



$curr_word = $start_word;
$length = @start_letters - 1;



while ($curr_word ne $end_word) {
    $i = 0;
    
    while ($i < $length) {
        $curr_letters = split(//, $curr_word);
        if ($curr_letters[$i] ne $end_letters[$i]) {
            $new_word = join("", @curr_letters[0..$i-1]);
            $new_word .= $end_letters[$i];
            $new_word .= join("", @curr_letters[$i+1..@curr_letters - 1]);
            $curr_word = $new_word;
        }
        $i++;
    }
}

print "curr_word = $curr_word\n";


