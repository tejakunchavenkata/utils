#! /usr/bin/perl -wl
#------------------------------------------------
# Author:    vj
# Created:   Thu Nov  1 21:33:17 IST 2012
# File Name: a.pl
# USAGE: 
#       a.pl 
# 
# 
#------------------------------------------------
use strict;
use List::Util qw(first max maxstr min minstr reduce shuffle sum);

my $buf;

chomp ($buf = <STDIN>);
my ($m, $k) = split /\s+/, $buf;

chomp ($buf = <STDIN>);
my @d = split /\s+/, $buf;

chomp ($buf = <STDIN>);
my @f = split /\s+/, $buf;

my ($time, $fuel) = (0, 0);
my ($curfuel, $maxfuel) = (0, 0);

foreach (@d) {
  $curfuel = shift @f;
  $fuel += $curfuel;
  $maxfuel = $maxfuel > $curfuel ? $maxfuel : $curfuel;

  while ($fuel < $_) {
    $fuel += $maxfuel;
    $time += $k;
  }
  $time += $_;
  $fuel -= $_;
}
print $time;
