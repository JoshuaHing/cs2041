#!/usr/local/bin/perl -w
$distinct_lines = 0;
$lines_read = 0;
while ($line = <STDIN>) {
    $line = lc $line;
    $line =~ s/^ +//;
    $line =~ s/ +$//;
    $line =~ s/ +//g;
    $hash{$line}++;
    $lines_read++;
    if ($hash{$line} == 1) {
        $distinct_lines++;
    }
    if ($distinct_lines ==  $ARGV[0]) {
        print "$distinct_lines distinct lines seen after $lines_read lines read.\n";
        exit 1;
    } 
}

print "End of input reached after $lines_read lines read - $ARGV[0] different lines not seen.\n";

