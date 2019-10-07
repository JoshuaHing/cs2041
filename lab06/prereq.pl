#!/usr/local/bin/perl -w

$undergrad_url = "http://www.handbook.unsw.edu.au/undergraduate/courses/current/$ARGV[0].html";
$postgrad_url = "http://www.handbook.unsw.edu.au/postgraduate/courses/current/$ARGV[0].html";



($course_code) = $ARGV[0] =~ /[0-9]/g;
($course_init) = $ARGV[0] =~ /[^0-9]+/g;

if ($course_code < 9) {
    $url = $undergrad_url;
} else {
    $url = $postgrad_url;
}

open F, "wget -q -O- $url|" or die;
while ($line = <F>) {
    if ($line =~ /.*Prerequisite.*/) {
        $line =~ s/Excluded.*//;
        (@post_courses) = $line =~ /$course_init[0-9]+/g;
    }  
}
close F;

$i = 0;
foreach $course (@post_courses) {
    if ($course_code < 9) {
        $course_url[$i] = "http://www.handbook.unsw.edu.au/undergraduate/courses/current/$course.html";
    } else {
        $course_url[$i] = "http://www.handbook.unsw.edu.au/postgraduate/courses/current/$course.html";
    }
    $i++;
}
#print "post = @post_courses\n";
#print "courses = @course_url\n";
foreach $url (@course_url) {
    open F, "wget -q -O- $url|" or die; 
    while ($line = <F>) {
        if ($line =~ /.*Equivalent.*/) {
            $line =~ s/Prerequisite.*Equivalent//;
           # print "line = $line\n";
            (@equivalent_courses) = $line =~ /$course_init[0-9]+/g;
        }
    }
    close F;
}
#print "equiv courses = @equivalent_courses\n";
foreach $course (@equivalent_courses) {
    if (!grep(/$course/,@post_courses)) {
        push @post_courses,$course;
    }
}
#print "postcourses = @post_courses\n";
@sorted_post_courses = sort @post_courses;

foreach $prereq (@sorted_post_courses) {
    print "$prereq\n";
}




