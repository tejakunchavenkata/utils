#! /usr/bin/perl -wl
#------------------------------------------------
# Author:    vj
# Created:   Wed Nov 21 21:21:55 IST 2012
# File Name: b.pl
# USAGE: 
#       b.pl 
# 
# 
#------------------------------------------------
chomp (my $n = <STDIN>);
chomp (my $sum = eval join '+', split /\s+/, <STDIN>);

if ($sum % $n == 0) {
        print $n
} else {
        print 1 > $n - 1 ? 1 : $n - 1
}
