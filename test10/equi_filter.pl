#!/usr/bin/perl -w
$i = 0;
foreach $line (<STDIN>) {
    chomp $line;
    @words = split(/ /, $line);
    foreach $word (@words) {
        if ($word =~ /(Equi:)/ || $word =~ /(Not-equi:)/) {
            $is_equi[$i++] = "$1";
        } else {
            if ($word ne "") {
                @letters = split(//, $word);
                $last_num = 0;
                foreach $letter (@letters) {
                    $letter = lc $letter;
                    $equi{$letter}++;
                    $last_num = $equi{$letter};
                }
                $skip = 0;
                foreach $key (keys %equi) {
                    if ($equi{$key} != $last_num) {
                        $skip = 1;
                    }
                }
                if ($skip == 1) {
                    undef %equi;
                    next;
                }
                $is_equi[$i++] = "$word";
                undef %equi;
            }
        }
        
    }
    for ($i = 0; $i < @is_equi; $i++) {
        print "$is_equi[$i] ";
    }
    print "\n";
    $i = 0;
    undef @is_equi;
}


        
       
            
