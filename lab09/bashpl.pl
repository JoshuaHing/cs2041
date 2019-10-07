#!/usr/local/bin/perl -w

@code = ();
open F, "<", $ARGV[0] or die "Cannot open file";
foreach $line (<F>) {
    if ($line =~ /#!\/bin\/bash/) {
       $line = "#!\/usr\/bin\/perl -w\n";
       push @code, $line;
    } elsif ($line =~ /^ *#.*/ || $line =~ /^ *$/) {
        push @code, $line;
    } elsif ($line =~ /([ *\t]*)while *\(\((.*)\)\)/) {
        ($indent, $condition) = ($1, $2);
        @words = split (/ /, $condition);
        $conv_condition = convert(@words);
        #print "conv = $conv_condition\n";
        $line = "${indent}while ($conv_condition) {\n";
        push @code, $line;
    } elsif ($line =~ /^([ *\t]*)if *\(\((.*)\)\)/) {
        #print "hhi!!\n";
        ($indent, $condition) = ($1, $2);
        @words = split(/ /, $condition);
        $conv_condition = convert(@words);
        $line = "${indent}if ($conv_condition) {\n";
        push @code, $line;
    } elsif ($line =~ /^([ \t]*)else/) {
        $line = "$1} else {\n";
        push @code, $line;
    } elsif ($line =~ /^([ \t]*)done/) {
        $line = "$1}\n";
        push @code, $line;
    } elsif ($line =~ /^([ \t]*)fi$/) {
        $line = "$1}\n";
        push @code, $line;
    } elsif ($line =~ /^([ \t]*)echo ["']?(.*)["']?/) {
        $line = "$1print \"$2\\n\";\n";
        push @code, $line;
    } elsif ($line =~ /^([ \t]*)(.*)=\$\(\((.*?)\)\) */) {
        ($indent, $variable, $assignment) = ($1, $2, $3);
        @words = split(/ /, $assignment);
        $conv_assignment = convert(@words);
        $line = "$indent\$$variable = $conv_assignment;\n";
        push @code, $line;   
    } elsif ($line =~ /^([ \t]*)(.*)=(.*?) *$/) {
        $var{$2} = 1;
        $line = "$1\$$2 = $3;\n";
        push @code, $line;
    }

}

print @code;

sub convert {
    my $count = 0;
    my $line = "";
    my @words = @_;
    foreach $word (@words) {
        if ($count == $#words) {
            $end = "";
        } else {
            $end = " ";
        }
        if (defined($var{$word})) {
            $line .= "\$$word$end";
        } else {
            $line .="$word$end";
        }
        $count++;
    }       
    return $line;
}
