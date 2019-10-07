#!/usr/local/bin/perl -w


foreach $line (<STDIN>) {
    ($count) = $line =~ /[0-9]+/g;
    ($species) = $line =~ /[^0-9]+/g;
    chomp $species;
    $species = lc $species;
    $species =~ s/^ *//g;
    $species =~ s/ *$//g;
    $species =~ s/ {2,100}/ /g;
    $species =~ s/s$//; 
    $individuals{$species} += $count;
    $pods{$species}++;
    
}

foreach $animal (sort keys %individuals) {
    print "$animal observations: $pods{$animal} pods, $individuals{$animal} individuals\n";
}


