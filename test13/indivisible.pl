#!/usr/local/bin/perl -w

while ($line = <STDIN>) {
    chomp $line;
    @numbers = split(' ', $line);
    for $number (@numbers) {
        if ($number ne "") {
            $hash{$number}++;
        }
    }
}

foreach $key1 (keys %hash) {
    if ($hash{$key1} > 1) {
        delete($hash{$key1});
    }
}

foreach $key1 (keys %hash) {
    $skip = 0;
    foreach $key2 (keys %hash) {
        if ($key1 == $key2) {
            next;
        }
        if ($key1 % $key2 == 0) {
            $skip = 1;
        }
    }
    if ($skip) {
        next;
    }
    $indiv{$key1}++; 
    
}

foreach $key (sort {$a <=> $b} keys %indiv) {
    print "$key ";
}

print "\n";
