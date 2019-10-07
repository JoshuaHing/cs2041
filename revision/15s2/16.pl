#!/usr/local/bin/perl -w

foreach $line (<STDIN>) {
    chomp $line;
    @words = split(/ /, $line);
    foreach $word (@words) {
        if ($word =~ /(\d+)/) {
            $num = $1;
            if (!defined($min)) {
                $min = $num;
            }
            if (!defined($max)) {
                $max = $num;
            }
            if ($num > $max) {
                $max = $num;
            }
            if ($num < $min) {
                $min = $num;
            }
            $numbers{$num} = 1;
        }
    }
}

$i = $min;
while ($i < $max) {
    if (!(defined($numbers{$i}))) {
        print "$i\n";
    }
    $i++;
}
