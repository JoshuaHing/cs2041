#!/usr/local/bin/perl -w


$url = "http://www.timetable.unsw.edu.au/current/$ARGV[0]KENS.html";
open F, "wget -q -O- $url|" or die;
while ($line = <F>) {
    if ($line =~ /($ARGV[0]\d{4})/) {
        $course_code{$1}++;
        print "$1\n" if ($course_code{$1} == 1);  
    }
}


