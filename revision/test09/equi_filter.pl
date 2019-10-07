#!/usr/local/bin/perl -w

foreach $line (<STDIN>) {
    chomp $line;
    $ans = "";
    @equi = ();
    @words = split(/ /, $line);
    foreach $word (@words) {
        @letters = split(//, $word);
        
        undef %hash;
        foreach $letter (@letters) {
            $letter = lc $letter;
            $hash{$letter}++;
            $num_occurrences = $hash{$letter};
        }
        $skip = 0;
        foreach $key (keys %hash) {
            if (!($hash{$key} == $num_occurrences)) {
                $skip = 1;
            }
        }
        if ($skip) {
            next;
        } else {
            push @equi, $word;
        }
    }
    $ans = join(" ", @equi);
    print "$ans\n";
        
}
