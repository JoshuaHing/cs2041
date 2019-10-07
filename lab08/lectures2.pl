#!/usr/local/bin/perl -w

if ($ARGV[0] eq "-d") {
    $dflag = shift @ARGV;
} elsif ($ARGV[0] eq "-t") {
    $tflag = shift @ARGV;
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
                        $s1 = 1;
                    } else {
                        $sem = "S2";
                        $s2 = 1;
                    }
                }
                
                $line = <F>;
            }
            @array = split (/\<.*?\>/, $line);
            if ($array[1] =~ /Weeks/) {
                if (!defined $already_printed{"$arg: $sem $array[1]"} && !defined $dflag && !defined $tflag) {
                    $already_printed{"$arg: $sem $array[1]"} = 1;
                    print "$arg: $sem $array[1]\n";
                } elsif (defined $dflag) {
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
                } elsif (defined $tflag) {
                    @hours = (9..20);
                    @days = ("Mon", "Tue", "Wed", "Thu", "Fri");
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
                                $session = "$day $hour";
                                if (!defined($session_used{$sem}{$session})) {
                                    $session_used{$sem}{$session} = 1;
                                    $count_sessions{$sem}{$session}++;
                                }
                                $hour++;
                            }  
                        }
                    }
                }
            }
        }
    }
    undef %session_used;
}
if (defined($tflag)) {
    if (defined($s1)) {
        $sem = "S1";
        print "$sem       Mon   Tue   Wed   Thu   Fri\n";
        foreach $hour (@hours) {
            if ($hour < 10) {
                print "0$hour:00 ";
            } else {
                print "$hour:00 ";
            }
            foreach $day (@days) {
                $session = "$day $hour";
                if (defined($count_sessions{$sem}{$session})) {
                                          
                    print "     $count_sessions{$sem}{$session}";
                } else {
                    print "      ";
                }
            }
            print "\n";
        }
    }
    if (defined($s2)) {
        $sem = "S2";
        print "$sem       Mon   Tue   Wed   Thu   Fri\n";
        foreach $hour (@hours) {
            if ($hour < 10) {
                print "0$hour:00 ";
            } else {
                print "$hour:00 ";
            }
            foreach $day (@days) {
                $session = "$day $hour";
                if (defined($count_sessions{$sem}{$session})) {
                    print "     $count_sessions{$sem}{$session}";
                } else {
                    print "      ";
                }
            }
            print "\n";
        }
    }             
}

