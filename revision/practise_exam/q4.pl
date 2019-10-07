#!/usr/local/bin/perl -w

foreach $line (<STDIN>) {
    chomp $line;
    $ans = "";
    @words = split(/ /, $line);
    foreach $word (@words) {
        if ($word =~ /(.*?)([\d\.]+)(.*)/) {
            ($bef, $num, $aft) = ($1, $2, $3);
            if ($num =~ /(\d+)\.(\d)\d*/) {
                ($num1, $num2) = ($1, $2);
                if ($num2 > 5) {
                    $num1 = $num1 + 1;
                }
            } else {
                $num1 = $num;
            }
            $ans .= "$bef$num1$aft ";

        } else {
            $ans .= "$word ";
        }
   }
   print "$ans\n";
            
    
}
