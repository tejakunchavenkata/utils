#! /usr/bin/perl -wl
#------------------------------------------------
# Author:    vj
# Created:   Wed Nov 21 22:10:07 IST 2012
# File Name: c.pl
# USAGE: 
#       c.pl 
# 
# 
#------------------------------------------------
chomp (my ($n, $k) = split /\s+/, <STDIN>);
chomp (my @lst = sort {$a <=> $b} split /\s+/, <STDIN>);

my $prefix = '';
my $i = 1;
while ($k > 0) {
        foreach ( @lst ) {
                print "$i $prefix$_";
                $k--;
                last if not ($k > 0);
        }
        $prefix .= pop @lst;
        $prefix .= ' ';
        $i++;
}
