#!/usr/local/bin/perl -w

foreach $arg (@ARGV) {
    $url = "http://timetable.unsw.edu.au/current/$arg.html";
    open F, "wget -q -O- $url|" or die;
    while ($line = <F>) {
        chomp $line;
        if ($line =~ /Lecture/) { 
            for ($i = 0; $i < 6; $i++) {
                if ($i == 1) {
                    if ($line =~ /^.*T1.*$/) {
                        $sem = "S1";
                    } else {
                        $sem = "S2";
                    }
                }
                
                $line = <F>;
            }
            @array = split (/\<.*?\>/, $line);
            if ($array[1] =~ /Weeks/) {
                if (!defined $already_printed{"$arg: $sem $array[1]"}) {
                    $already_printed{"$arg: $sem $array[1]"} = 1;
                    print "$arg: $sem $array[1]\n";
                }
            }
        }
    }
}
