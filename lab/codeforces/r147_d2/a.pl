#! /usr/bin/perl -wl
#------------------------------------------------
# Author:    vj
# Created:   Thu Oct 25 21:02:27 IST 2012
# File Name: a.pl
# USAGE: 
#       a.pl 
# 
# 
#------------------------------------------------
use List::Util qw(first max maxstr min minstr reduce shuffle sum);
chomp (my $n = <STDIN>);
my %times;
my $buf;
while ($n--) {
  chomp ($buf = <STDIN>);
  $times{$buf}++; 
}
print &max(values %times);
