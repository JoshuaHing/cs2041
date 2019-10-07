#!/usr/local/bin/perl -w

if ($ARGV[0] eq "-d") {
    $flag = shift @ARGV;
}
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
                if (!defined $already_printed{"$arg: $sem $array[1]"} && !defined $flag) {
                    $already_printed{"$arg: $sem $array[1]"} = 1;
                    print "$arg: $sem $array[1]\n";
                } elsif (defined $flag) {
                   # print "line = $line\n";
                    @times = split (/\(.*?\)/, $line);
                    foreach $element (@times) {
                        #print "element = $element\n";
                        ($day, $start, $end) = $element =~ /([a-z]{3}) ([0-9]+):[0-9]+ - ([0-9]+):[0-9]+ /i;
                        if (defined $day && defined $start && defined $end) {
                            $hour = $start;
                            if ($hour < 10) {
                                $hour =~ s/0//;
                            }
                            while ($hour < $end) {
                                if (!defined $already_printed{"$sem $arg $day $hour"}) {
                                    $already_printed{"$sem $arg $day $hour"} = 1;
                                    print "$sem $arg $day $hour\n";
                                }
                                $hour++;
                            }  
                        }
                    }      
                }
            }
        }
    }
}
