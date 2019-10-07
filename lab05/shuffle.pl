#!/usr/local/bin/perl -w
# First, read lines from stdin
# Use a hash and store the lines using randomly generated keys
# The indexes are randomised, ensuring that the hash function 
# won't return the keys in the same "random" order.
open F, '<', $ARGV[0] or die "$0: Can't open file: $!\n";
foreach $line (<F>) {  
    $array{rand(42)} = $line;
}

foreach $element (keys %array) {  
    print "$array{$element}";
}

