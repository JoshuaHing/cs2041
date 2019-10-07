#!/usr/local/bin/perl -w

@lines = <STDIN>;
$curr_index= 0;
foreach $line (@lines) {
    
    if ($line =~ /^\#(\d+)$/) {
        $index = $1 - 1;
    } else {
        $index = $curr_index;
    }
    $lines[$curr_index] = $lines[$index];
    $curr_index++;
}

foreach $line (@lines) {
    print "$line";
}
   
