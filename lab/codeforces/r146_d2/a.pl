#! /usr/bin/perl -wl
#------------------------------------------------
# Author:    vj
# Created:   Sun Oct 21 12:41:36 IST 2012
# File Name: a.pl
# USAGE: 
#       a.pl 
# 
# 
#------------------------------------------------
chomp (my $IP = <STDIN>);
%hash = map { $_ => 1 } split '\s*', $IP;
if ((scalar keys %hash) & 1) {
  print "IGNORE HIM!";
} else {
  print "CHAT WITH HER!";
}
