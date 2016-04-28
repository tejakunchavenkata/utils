chomp ($x = <STDIN>);

NEXT_CASE: foreach $case (1 .. $x) { 
  @arena = ();
  $dotCnt = 0;

  foreach $i (0 .. 3) {
    chomp ($_ = <STDIN>);
    push @arena, $_;

    $dotCnt += s#\.#$&#g;

    if (4 == s#X|T#$&#g) {
      print "Case #$case: X won";
      $_ = <STDIN> foreach ($i .. 3);
      next NEXT_CASE;
    }
    if (4 == s#O|T#$&#g) {
      print "Case #$case: O won";
      $_ = <STDIN> foreach ($i .. 3);
      next NEXT_CASE;
    }
  }
  $_ = <STDIN>; # Kill New Line
  #print ">> \n", join "\n", @arena;

  foreach $col (0 .. 3) {
    $str = substr ($arena[0], $col, 1) . substr ($arena[1], $col, 1) . substr ($arena[2], $col, 1) . substr ($arena[3], $col, 1);
    if (4 == ($str =~ s#X|T#$&#g)) { print "Case #$case: X won"; next NEXT_CASE }
    if (4 == ($str =~ s#O|T#$&#g)) { print "Case #$case: O won"; next NEXT_CASE }
  }
  
  $str = substr ($arena[0], 0, 1) . substr ($arena[1], 1, 1) . substr ($arena[2], 2, 1) . substr ($arena[3], 3, 1);
  if (4 == ($str =~ s#X|T#$&#g)) { print "Case #$case: X won"; next NEXT_CASE }
  if (4 == ($str =~ s#O|T#$&#g)) { print "Case #$case: O won"; next NEXT_CASE }
  
  $str = substr ($arena[0], 3, 1) . substr ($arena[1], 2, 1) . substr ($arena[2], 1, 1) . substr ($arena[3], 0, 1);
  if (4 == ($str =~ s#X|T#$&#g)) { print "Case #$case: X won"; next NEXT_CASE }
  if (4 == ($str =~ s#O|T#$&#g)) { print "Case #$case: O won"; next NEXT_CASE }

  if ($dotCnt) {
    print "Case #$case: Game has not completed"
  } else {
    print "Case #$case: Draw"
  }
}
