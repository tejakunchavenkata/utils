#! /usr/bin/perl -wl
#------------------------------------------------
# Author:    vj
# Created:   Tue Nov 27 16:59:06 IST 2012
# File Name: c.pl
# USAGE: 
#       c.pl 
# 
# 
#------------------------------------------------
use List::Util qw(first max maxstr min minstr reduce shuffle sum);

chomp (my ($y1, $y2, $yw, $xb, $yb, $r) = split /\s+/, <STDIN>);
$y1 += $r;
#$y2 -= $r;

my $sol = ($xb * ($y1 - $yw + $r) / ($yb - 2 * ($yw - $r)  + $y1));

if ($sol <= $r) {
        print -1;
} else {
        if ($sol * ($y2 - $y1) / ($yw - $y1 - $r) < $r) {
                print -1;
        } else {
                print $sol;
        }
}
