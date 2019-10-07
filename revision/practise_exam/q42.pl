#!/usr/local/bin/perl -w

foreach $line (<STDIN>) {
    $am_flag = 0;
    $pm_flag = 0;
    if ($line =~ /(.*?)(\d{2})(:\d{2}:\d{2})(.*)/) {
        ($beff, $bef, $aft, $aftt) = ($1, $2, $3, $4);
        if ($bef == 0) {
            $bef = 12;
            $am_flag = 1;
        } elsif ($bef > 12) {
            $bef = $bef - 12;
            $pm_flag = 1;
        } else {
            $am_flag = 1;
        }
    }
    if ($am_flag) {
        printf "%s%10.02d%sam%s\n", $beff, $bef, $aft, $aftt;
    } elsif ($pm_flag) {
        printf "%s%10.02d%spm%s\n", $beff, $bef, $aft, $aftt;
    }
}
        
