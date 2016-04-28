sub find {
	foreach (0 .. 3) {
		chomp ($n = <STDIN>);
		$n =~ tr/#./10/;
		@{$a[$_]} = split //, $n;
	}

	if (($a[0][0] + $a[0][1] + $a[1][0] + $a[1][1]) >= 3) { printf "YES\n"; return }
	if (($a[0][1] + $a[0][2] + $a[1][1] + $a[1][2]) >= 3) { printf "YES\n"; return }
	if (($a[0][2] + $a[0][3] + $a[1][2] + $a[1][3]) >= 3) { printf "YES\n"; return }
	if (($a[1][0] + $a[1][1] + $a[2][0] + $a[2][1]) >= 3) { printf "YES\n"; return }
	if (($a[1][1] + $a[1][2] + $a[2][1] + $a[2][2]) >= 3) { printf "YES\n"; return }
	if (($a[1][2] + $a[1][3] + $a[2][2] + $a[2][3]) >= 3) { printf "YES\n"; return }
	if (($a[2][0] + $a[2][1] + $a[3][0] + $a[3][1]) >= 3) { printf "YES\n"; return }
	if (($a[2][1] + $a[2][2] + $a[3][1] + $a[3][2]) >= 3) { printf "YES\n"; return }
	if (($a[2][2] + $a[2][3] + $a[3][2] + $a[3][3]) >= 3) { printf "YES\n"; return }

	if (($a[0][0] + $a[0][1] + $a[1][0] + $a[1][1]) <= 1) { printf "YES\n"; return }
	if (($a[0][1] + $a[0][2] + $a[1][1] + $a[1][2]) <= 1) { printf "YES\n"; return }
	if (($a[0][2] + $a[0][3] + $a[1][2] + $a[1][3]) <= 1) { printf "YES\n"; return }
	if (($a[1][0] + $a[1][1] + $a[2][0] + $a[2][1]) <= 1) { printf "YES\n"; return }
	if (($a[1][1] + $a[1][2] + $a[2][1] + $a[2][2]) <= 1) { printf "YES\n"; return }
	if (($a[1][2] + $a[1][3] + $a[2][2] + $a[2][3]) <= 1) { printf "YES\n"; return }
	if (($a[2][0] + $a[2][1] + $a[3][0] + $a[3][1]) <= 1) { printf "YES\n"; return }
	if (($a[2][1] + $a[2][2] + $a[3][1] + $a[3][2]) <= 1) { printf "YES\n"; return }
	if (($a[2][2] + $a[2][3] + $a[3][2] + $a[3][3]) <= 1) { printf "YES\n"; return }

	printf "NO\n"; return
}

&find();
