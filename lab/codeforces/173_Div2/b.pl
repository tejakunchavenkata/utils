chomp ($n = <STDIN>);
$x = 0;
$y = 0;
while ($n--) {
	chomp ($str = <STDIN>);
	($a, $b) = split /\s+/, $str;
	if ($x < $y) { $x += $a } else { $y += $b }
}
