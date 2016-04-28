chomp ($n = <STDIN>);
$x = 0;
while ($n--) {
	chomp ($str = <STDIN>);
	if ($str =~ /--/) { $x-- } else { $x++}
}
printf "$x\n";
