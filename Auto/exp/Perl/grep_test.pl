#! /usr/bin/perl -w
#
#
#
#
#
#
#
#
#
    system ("grep DC_SIZE config.in | sed 's/.*DC_SIZE/.equ dc_waysize/g' | sed 's#//#;#g'") ;
