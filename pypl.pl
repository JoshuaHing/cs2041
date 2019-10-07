#!/usr/local/bin/perl -w

$lines_read = 0;
$indent = "";
$prev_indent = "";
@code = ();
open F, "<", $ARGV[0] or die "Cannot open file";
@lines = <F>;
foreach $line (@lines) {

    if ($line =~ /(\#!\/usr\/bin\/)python3/) {
        $line = "$1perl -w\n";
        push @code, $line;
    } elsif ($line =~ /^ *#.*$/ || $line =~ /^ *$/) {
        push @code, $line;
    } elsif ($line =~ /import sys/) {
        shift @code;
    }
    
    
    $prev_indent = $indent;
    if ($line =~ /(.*?)( *)(print)\(\"?(.*)\"?\);?(.*)/) {
        if ($1 eq "") {
            $indent = $2;
        } else {
            $indent = "";
        }
        if ($lines_read == $#lines) {
            $end_line = "";
        } else {
            $end_line = ";";
        }
        if ($line =~ /(.*?)( *)(print)\(\"(.*)\"\);?(.*)/) {
            $line = "$1$2$3 \"$4\\n\"$end_line$5\n";
        } elsif ($line =~ /(.*?)( *)(print)\((.*)\);?(.*)/) {
            $line = "$1$2$3 ";
            if ((@words = split (/[^A-Za-z]/, $4)) == 1) {
                $line .= "\"";
                $line .= conv(@words);
                $line .= "\\n\"$end_line$5\n";
            } else {
                $line .= conv(@words);
                $line .= ", \"\\n\"$end_line$5\n";
            }
            
        } 
        close_brace();
        push @code, $line if ($1 =~ / */ && !defined($5));
    }

    if ($line =~ /( *)sys\.stdout\.write\((.*)\)/) {
        $indent = $1;
        $line = "${indent}print $2;\n";
        close_brace();
        push @code, $line;
    } elsif ($line =~ /( *)break/) {
        $indent = $1;
        $line = "${indent}last;\n";
        push @code, $line;
    }
    
    if ($line =~ /^( *)(if *)(.*)\:(.*)$/ || $line =~ /^( *)(while *)(.*)\:(.*)$/) {
        ($indent, $block, $condition, $code) = ($1, $2, $3, $4);
        if (defined($code)) {  
             @words = split(/;/, $code);
             $conv_code = "";
             foreach $word (@words) {
                $conv_code .= "$indent    ";
                $word =~ s/^ +//;
                @words = split (/ /, $word);
                $conv_code .= conv(@words);
                $conv_code .= "\;\n";
            }
        }
        $conv_condition = conv(@words = split(/ /, $condition));
        $line = "$indent$block($conv_condition) {\n";
        #add fn
        push @code, $line, $conv_code;
        if ($code ne "") {
            push @code, "$indent}\n";
        }
    } elsif ($line =~ /( *)else *:/) {
        $indent = $1;
        $line = "$indent} else {\n";
        push @code, $line;
    } elsif ($line =~ /^( *)for( *)(.*?)( *)in( *)range( *)\((\d+) *, *(\d+)\) *:/) {
        $var{$3} = 1; 
        ($indent, $lower, $upper) = ($1, $7, $8 - 1);
        $line = conv(@words = $3);
        $line = "${indent}foreach $line ($lower..$upper) {\n";      
        push @code, "$line";
        
    } elsif ($line =~ /^( *)(.*?) *= *(.*)$/) {
        ($indent, $variable, $assignment) = ($1, $2, $3);
        $var{$2} = 1; 
        if ($line =~ /^( *)(.*?) *= *.*sys\.stdin\.readline.*/) {
           @words = split(/ /, $variable);
           $conv_code = conv(@words);
           $line = "$indent$conv_code = \<STDIN\>;\n";
        } else { 
            add_spaces(\$assignment);
            @words = split(/ /, "$variable = $assignment");
            $conv_code = conv(@words);
            $line = "$indent$conv_code\;\n";
        }
        close_brace();
        push @code, $line;
    }
    #print "$lines_read, $#lines\n";
    if($lines_read == $#lines) {
        if (defined($indent) && $indent =~ / +/) {
            $line = "}\n";
            push @code, $line;
        }
    }
    $lines_read++;   
} 

print @code;

sub close_brace {
    $prev_size = split(//, $prev_indent);
    $curr_size = split(//, $indent);
    while ($prev_size > $curr_size) {
        $prev_indent =~ s/ {4}//;
        $closing_brace = "$prev_indent}\n";
        push @code, $closing_brace;
        $prev_size = split(//, $prev_indent);
    }
}

sub conv {
    my @words = @_; 
    my $result = "";
    foreach my $word (@words) { 
        if ($word eq $words[$#words]) {
            $append = "";
        } else {
            $append = " ";
        }
        if (defined($var{$word})) {
            $result .= "\$$word$append";
        } else {
            $result .= "$word$append";
        }
    }
    return $result;
}

sub add_spaces {
    print "called\n";
    my $line = $$_[0];
    print "line = $line\n";
    $line = "$1 $2 $3" if ($line =~ /(\S+)(\+|\-|\/|\*)(\S+)/);
    return $line;
}

#helper function
sub check_vars {
    foreach $var (keys %var) {
        print "$var defined\n";
    }
}



    
