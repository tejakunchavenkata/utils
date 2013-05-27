use bignum;
chomp ($n = <STDIN>);
($n, $k) = split /\s+/, $n;
$n--;
if ($n == 0) { printf "0\n"; exit}
if ($n > ($k * ($k-1) / 2)) { printf "-1\n"; exit }

$b = 2 * $k + 1;
$d = ($b * $b - 8 * $n.'0') ** 0.5;
printf "$d\n";
$x = ($b - int ($d)) >> 1;
$x -= 10;
$x = $x > 0 ? $x : 1;
while (1) {
	last if ((-($x * $x) + $x * (($k << 1) + 1)) > ($n << 1));
	$x++;
}
printf "$x\n";
