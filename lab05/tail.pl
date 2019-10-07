#!/usr/bin/perl -w
$num_to_print = 10;
foreach $arg (@ARGV) {
    if ($arg eq "--version") {
        print "$0: version 0.1\n";
        exit 0;
    } elsif ($arg =~ /^-[0-9]+/) {
        $num_to_print = -1*$arg;
    } else {
        push @files, $arg;
    }
}

$i = 0;
if (!defined @files) {
    while ($line = <STDIN>) {
        $array[$i++] = $line;
    }
    if (@array < $num_to_print) {
        print "@array"
    } else {
        for ($i = @array-$num_to_print; $i < @array; $i++) {
            print "$array[$i]";
        } 
    }     
} else {
    foreach $f (@files) {
        open F, '<', $f or die "$0: Can't open $f: $!\n";
        while ($line = <F>) {
            $array[$i++] = $line;
        }
        if (@files > 1) {
            print "==> $f <==\n";
        }
        if (@array < $num_to_print) {
            print "@array"
        } else {
            for ($i = @array-$num_to_print; $i < @array; $i++) {
                print "$array[$i]";
            }  
        }
        undef @array;
        $i = 0;
        close F;
    }
}
