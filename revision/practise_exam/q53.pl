#!/usr/local/bin/perl -w

foreach $line (<STDIN>) {
    chomp $line;
    ($name, $amount) = split(/ /, $line);
    $hash{$name} += $amount;
}

$max = $hash{$name};
$max_name = $name;
foreach $key (sort keys %hash) {
    if ($hash{$key} > $max) {
        $max = $hash{$key};
        $max_name = $key;
    }
}

print "Expel $max_name whose library fines total \$ $max\n";
