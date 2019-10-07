#!/usr/bin/perl -w

open (F,"<",$ARGV[0]) or die ("could not open file");

print "#!/usr/bin/\n";

while($line = <F>){
	if($line =~ m/^[^ ]+=[0-9]+ *$/){
		chomp $line;
		print "\$";
		print "$line";
		print ";\n";
	} elsif ($line =~ m/^\s*while (.)$/){
		chomp $line;
		print "$line";
		print "\n";
	} elsif ($line =~ m/^\s*do *$/){
		print "{\n";
	} elsif ($line =~ m/^\s*done *$/){
		print "}\n";
	} elsif ($line =~ m/^\s*([a-z0-9])+=\$\(\(([a-z0-9]+) [+-] ([a-z0-9]+)\)\) *$/){
		print "$1\n";
	}
}
