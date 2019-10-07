#!/usr/local/bin/perl -w

open F, "<", $ARGV[0] or die "cannot open file";
foreach $line (<F>) {
    chomp $line;
    $line =~ s/ +/ /g;
    $line =~ s/\@[^ ]*/\@example.com/g;
    push @lines, $line;
}
close F;

open G, ">", $ARGV[0] or die "cannot write to file";
foreach $line (@lines) {
    print G $line, "\n";
}
close G;
