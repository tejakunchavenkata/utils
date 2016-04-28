#! /usr/bin/perl -wl
#------------------------------------------------
# Author:    vj
# Created:   Sun Oct 21 13:04:19 IST 2012
# File Name: c.pl
# USAGE:
#       c.pl
#
#
#------------------------------------------------
use List::Util qw(first max maxstr min minstr reduce shuffle sum);

sub gcf {
  my ($x, $y) = @_;
  ($x, $y) = ($y, $x % $y) while $y;
  return $x;
}

sub lcm {
  return($_[0] * $_[1] / gcf($_[0], $_[1]));
}

sub multigcf {
  my $x = shift;
  $x = gcf($x, shift) while @_;
  return $x;
}

sub multilcm {
  my $x = shift;
  $x = lcm($x, shift) while @_;
  return $x;
}

chomp ($no = <STDIN>);
my $dist = 20;
my @vals;
foreach my $x (&max(1, $no-$dist) .. $no) {
  foreach my $y (&max(1, $no-$dist) .. $no) {
    foreach my $z (&max(1, $no-$dist) .. $no) {
      push @vals, &multilcm ($x, $y, $z);
    }
  }
}
printf "%llu\n", &max (@vals)
