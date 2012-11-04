#! /usr/bin/perl -wl
#------------------------------------------------
# Author:    vj
# Created:   Thu Oct 25 21:17:17 IST 2012
# File Name: b.pl
# USAGE: 
#       b.pl 
# 
# 
#------------------------------------------------
use List::Util qw(first max maxstr min minstr reduce shuffle sum);

chomp (my $n = <STDIN>);
chomp (my @size = split /\s+/, <STDIN>);

my ($s, @buf, @db, @sol) = (&sum (@size));
my ($no, $x, $y, $i, $p, $q, $found) = (0);

for ($i=0; $i < $n; $i++) {
  chomp (@buf = split /\s+/, <STDIN>);
  push @db, [ @buf ];
}

for ($x=0; $x < $n; $x++) {
  for ($y=0; $y < $size[$x]; $y++) {
    $no++;
    $found = 0;
    for ($p=$x; !$found && $p < $n; $p++) {
      for ($q=0; !$found && $q < $size[$p]; $q++) {
        if ($db[$p][$q] == $no) {
          $found = 1;
          if (!($x==$p && $y==$q)) {
            push @sol, sprintf "%d %d %d %d", $x+1, $y+1, $p+1, $q+1;
            ($db[$x][$y], $db[$p][$q]) = ($db[$p][$q], $db[$x][$y]);
          }
          #print STDERR "----------------"; print STDERR "@{$_}" foreach ( @db );
        }
      }
    }
  }
}
print scalar @sol;
print join "\n", @sol;
