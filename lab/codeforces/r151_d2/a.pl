#! /usr/bin/perl -wl
#------------------------------------------------
# Author:    vj
# Created:   Wed Nov 21 21:11:17 IST 2012
# File Name: a.pl
# USAGE: 
#       a.pl 
# 
# 
#------------------------------------------------
chomp (my $var = <STDIN>);

if ($var < 3) {
        print "-1";
} else {
        $var -= 2;
        print "2 2",  " 1"x$var;
}
