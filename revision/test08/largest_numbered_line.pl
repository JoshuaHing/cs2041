#!/usr/local/bin/perl -w

@lines = <STDIN>;

foreach $line (@lines) {
    chomp $line;
    if (@matches = $line =~ /(-?\d*\.?\d+)/g) {
        if (!(defined($max))) {
            $max = $matches[0];
            $max_line = $line;
        }
        for $match (@matches) {
            if ($match > $max) {
                $max = $match;
                $max_line = $line;
            }
        }
    }
}
if (defined($max_line)) {
    foreach $line (@lines) {
        if ($line =~ /$max/) {
            push @answer, $line;
        }
    }
}

foreach $ans (@answer) {
    print "$ans\n";
}
