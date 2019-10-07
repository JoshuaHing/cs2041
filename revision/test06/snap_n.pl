#!/usr/local/bin/perl -w

$snap_num = $ARGV[0];
while ($line = <STDIN>) {
    chomp $line;
    $hash{$line}++;
    if ($hash{$line} == $snap_num) {
        print "Snap: $line\n";
        last;
    }   
    
}
