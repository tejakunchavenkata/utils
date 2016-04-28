#! /usr/bin/perl -wl
#------------------------------------------------
# Author:    vj
# Created:   Thu Nov  1 22:22:13 IST 2012
# File Name: b.pl
# USAGE: 
#       b.pl 
# 
# 
#------------------------------------------------
use strict;
use List::Util qw(first max maxstr min minstr reduce shuffle sum);

my ($m, $n, $k) = split /\s+/, <STDIN>;

my ($curline, @city, %loc);
for (my $i=0; $i<$m; $i++) {
  my $j = 0;
  chomp ($curline = <STDIN>);
  foreach (split //, $curline) {
    $loc{$_} = "$i,$j" if ( /[a-z]/ );
    $j++;
  }  
  push @city, $curline;
}
=copy
print join "\n", @city;
print join "\n", @intcity;
print "$_ $loc{$_}" foreach (sort keys %loc);

my ($sx, $sy, $s, $dx, $dy) = split /\s+/, <STDIN>;

while ($k--) {

}
=cut

&minpath ("1,1-8,8");

sub minpath {
  my ($sX, $sY, $dX, $dY) = split /[-,]/, $_[0];

  my @weightCity;
  my @boolCity;
  my %scouts;
  my @nearScout;
  my @curScout;
  my $curWeight;
  $scouts{"$sX,$sY"}++;

  foreach ( @city ) {
    $_ =~ s/[^#]/0/g; print $_;
    push @weightCity, [split //, $_];
    push @boolCity, [split //, $_];
  }

  while (1) {
    @nearScout = split /,/, shift ([keys %scouts]);
    foreach (keys %scouts) {
      @curScout = split /,/;
      @nearScout = @curScout if ($weightCity[$curScout[0]][$curScout[1]] < $weightCity[$nearScout[0]][$nearScout[1]]) 
    }

    last if ($nearScout[0] == $dX && $nearScout[1] == $dY);
    
    $curWeight = 1 + $weightCity[$nearScout[0]][$nearScout[1]];

    foreach (
      [$nearScout[0] - 1, $nearScout[1]],
      [$nearScout[0], $nearScout[1] - 1],
      [$nearScout[0] + 1, $nearScout[1]],
      [$nearScout[0], $nearScout[1] + 1]
    ) {
      if (
        (${$_}[0] < $m && ${$_}[0] >= 0) && (${$_}[1] < $n && ${$_}[1] >= 0) &&
        ($boolCity[${$_}[0]][${$_}[1]] eq 0)
      ) {
        if ($weightCity[${$_}[0]][${$_}[1]] == 0) { $weightCity[${$_}[0]][${$_}[1]] = $curWeight }
        else { $weightCity[${$_}[0]][${$_}[1]] = &min ($weightCity[${$_}[0]][${$_}[1]], $curWeight) }
        $scouts{"${$_}[0],${$_}[1]"}++;
      }
    }

    $boolCity[$nearScout[0]][$nearScout[1]] = 1;
    delete $scouts{"$nearScout[0],$nearScout[1]"};
  }
  print join "\t", @{$_} foreach ( @weightCity );
}
