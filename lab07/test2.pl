#!/usr/local/bin/perl -w

@array = (1,2,3,4);

$result = add_array(@array);
print "result = $result\n";


sub add_array {

    my @x = @_;
    
    if (@x == 0) {
        return;
    } else {
        return $x[0] += add_array(@x[1..$#x]);
    }
}

$num = 1+=2+=3+=4;
print "num = $num\n";
