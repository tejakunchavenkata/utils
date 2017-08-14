#! /usr/bin/perl -w
sub ADD;
sub SORT;
sub DISPLAY;
sub REMOVE;
sub OPEN;
#.............................................
if (! defined $ARGV[0]){ die ("Vj:\tPlease give a valid option"); }
$usr = `logname`;
chomp $usr;
if ($ARGV[0] eq "-a")
{
	ADD;
}
elsif ($ARGV[0] eq "-r")
{
	REMOVE;
}
elsif ($ARGV[0] eq "-d")
{
	DISPLAY;
}
elsif ($ARGV[0] eq "-o")
{
	OPEN;
}
else
{
	print "Invalid Option\n";
}
#.............................................
sub ADD
{
	open (FH, ">>/home/$usr/.ASSIGNMENTS.list") || die ("Vj:\tFILE OPENING PROBLEM\nSystem:\t$!");
	system "clear";
	print "\nEnter the file location:\n\t";
	$temp = <STDIN>;
	$temp =~ s!^http://!mozilla !g;
	print "\nEnter the date of submission (YYYY-MM-DD): ";
	$dos = <STDIN>;
	chomp $dos;
	print FH "$dos/$temp";
	close FH;
	SORT;
	DISPLAY;
}
#.............................................
sub SORT
{
	system "sort -t / -u ~/.ASSIGNMENTS.list -o .temp_Assign.pl_data_file";
	unlink "/home/$usr/.ASSIGNMENTS.list";
	rename ".temp_Assign.pl_data_file", "/home/$usr/.ASSIGNMENTS.list";
}
#.............................................
sub DISPLAY
{
	system "clear ; echo '___________________________' ; echo -n 'Today:\t' ; date +%F ; echo '---------------------------' ; echo List: ";
	system "cut -d / -f 1,5- ~/.ASSIGNMENTS.list | replace '/' \"`echo '\t\t'`\" '.pdf' '' 'Synthesis' 'Synth..' 'System_Verilog' 'SV'| cat -n ";
}
#.............................................
sub REMOVE
{
	DISPLAY;
	open (FH, "</home/$usr/.ASSIGNMENTS.list") || die ("Vj:\tFILE OPENING PROBLEM\nSystem:\t$!");
	open (FHT, ">.temp_Assign.pl_data_file") || die ("Vj:\tTEMP FILE OPENING PROBLEM\nSystem:\t$!");
	print "REMOVE_?: ";
	$no = <STDIN>;
	while (<FH>)
	{
		print FHT if ($. != $no);
	}
	close FH;
	close FHT;
	unlink "/home/$usr/.ASSIGNMENTS.list";
	rename ".temp_Assign.pl_data_file", "/home/$usr/.ASSIGNMENTS.list";
	DISPLAY;
}
#.............................................
sub OPEN
{
	DISPLAY;
	open (FH, "</home/$usr/.ASSIGNMENTS.list") || die ("Vj:\tFILE OPENING PROBLEM\nSystem:\t$!");
	print "OPEN_?: ";
	$no = <STDIN>;
	while (<FH>)
	{
		do {$_ =~ s#^\d\d\d\d-\d\d-\d\d/##g; system "$_"; last} if ($. == $no);
	}
}
