#!/usr/bin/perl -w

foreach $arg (@ARGV) {
    push @args, $arg;
    $hash{$arg}++;
}
if (@ARGV > 0) {
    $max = $hash{$args[0]};
    $max_arg = $args[0];
    foreach $arg (@args) {
        if ($hash{$arg} > $max) {
            $max = $hash{$arg};
            $max_arg = $arg;
        }
    }

    print "$max_arg\n";
}

