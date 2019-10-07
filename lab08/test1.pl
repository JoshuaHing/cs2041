#!/usr/local/bin/perl -w


$line = "2 2 3 4 5\n";

 
my(@numbers) = $line =~ /(\d+)/;

print "numbers = @numbers\n";
