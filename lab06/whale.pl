#!/usr/local/bin/perl -w

$string_to_match = $ARGV[0];

$pod_count = 0;
$individual_count = 0;
foreach $line (<STDIN>) {   
    ($count) = $line =~ /[0-9]+/g;
    ($species) = $line =~ /[^0-9]+/g;
    $species =~ s/ //;
    chomp $species;
    if ($species eq $string_to_match) {
        $pod_count++;
        $individual_count += $count;
    }
    
}

print "$string_to_match observations: $pod_count pods, $individual_count individuals\n";

