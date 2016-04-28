#! /usr/bin/perl -wl
#------------------------------------------------
# Author:    vj
# Created:   Tue Nov 27 15:24:24 IST 2012
# File Name: a.pl
# USAGE: 
#       a.pl 
# 
# 
#------------------------------------------------
use List::Util qw(first max maxstr min minstr reduce shuffle sum);

chomp (my $n = <STDIN>);
my ($a, $b, @l, @r);

@r = @l = (0, 0);

while ($n--) {
        chomp ( ($a, $b) = split /\s+/, <STDIN> );
        $l[$a]++;
        $r[$b]++;
}

print &min (@l) + &min (@r);
