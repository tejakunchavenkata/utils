#! /usr/bin/perl -wl
#------------------------------------------------
# Author:    vj
# Created:   Tue Nov 27 15:45:13 IST 2012
# File Name: b.pl
# USAGE: 
#       b.pl 
# 
# 
#------------------------------------------------
use List::Util qw(first max maxstr min minstr reduce shuffle sum);

chomp (my $n = <STDIN>);
$n--;

if ($n < 2) {
        print '-1'
} elsif ($n == 2) {
        print '210';
} else {
        my $sign = 1;
        $sign = -1 if ( ($n / 3) % 2);

        my $strt = 10 ** ($n % 3);
        #print $strt, ' ' . length $strt;
        #print $n - 3 - length $strt;

        foreach my $x (0 .. 9) {
                foreach my $y (0 .. 9) {
                        if ( ((100 * $x + 10 * $y + $sign * $strt) % 7 == 0) && ($x + $y + 1) % 3 == 0 ){
                                print $strt . '0'x&max(0, ($n - 2 - length $strt)) . $x . $y . '0';
                                goto END;
                        }
                }
        }
}
END:
