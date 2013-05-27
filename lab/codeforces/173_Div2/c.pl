chomp ($str1 = <STDIN>);
chomp ($str2 = <STDIN>);
if (length($str1) == length($str2)) {
	printf "YES\n" if ($str1 =~ /1/ && $str2 =~ /1/);
	printf "YES\n" if ($str1 !~ /1/ && $str2 !~ /1/);
	printf "NO\n"  if ($str1 !~ /1/ && $str2 =~ /1/);
	printf "NO\n"  if ($str1 =~ /1/ && $str2 !~ /1/);
} else {
	printf "NO\n";
}
