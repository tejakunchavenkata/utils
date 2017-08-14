class board;
  typedef enum {
    AAA=1,
    AAB=2,
    AAC=3,
    AAD
  } elements;
  rand elements ele[4][4];
  constraint all {
    ele[0][0] != ele[0][1];
    ele[0][0] != ele[0][2];
    ele[0][0] != ele[0][3];
    ele[0][0] != ele[1][0];
    ele[0][0] != ele[1][1];
    ele[0][0] != ele[2][0];
    ele[0][0] != ele[3][0];
    ele[0][1] != ele[0][2];
    ele[0][1] != ele[0][3];
    ele[0][1] != ele[1][0];
    ele[0][1] != ele[1][1];
    ele[0][1] != ele[2][1];
    ele[0][1] != ele[3][1];
    ele[0][2] != ele[0][3];
    ele[0][2] != ele[1][2];
    ele[0][2] != ele[1][3];
    ele[0][2] != ele[2][2];
    ele[0][2] != ele[3][2];
    ele[0][3] != ele[1][2];
    ele[0][3] != ele[1][3];
    ele[0][3] != ele[2][3];
    ele[0][3] != ele[3][3];
    ele[1][0] != ele[1][1];
    ele[1][0] != ele[1][2];
    ele[1][0] != ele[1][3];
    ele[1][0] != ele[2][0];
    ele[1][0] != ele[3][0];
    ele[1][1] != ele[1][2];
    ele[1][1] != ele[1][3];
    ele[1][1] != ele[2][1];
    ele[1][1] != ele[3][1];
    ele[1][2] != ele[1][3];
    ele[1][2] != ele[2][2];
    ele[1][2] != ele[3][2];
    ele[1][3] != ele[2][3];
    ele[1][3] != ele[3][3];
    ele[2][0] != ele[2][1];
    ele[2][0] != ele[2][2];
    ele[2][0] != ele[2][3];
    ele[2][0] != ele[3][0];
    ele[2][0] != ele[3][1];
    ele[2][1] != ele[2][2];
    ele[2][1] != ele[2][3];
    ele[2][1] != ele[3][0];
    ele[2][1] != ele[3][1];
    ele[2][2] != ele[2][3];
    ele[2][2] != ele[3][2];
    ele[2][2] != ele[3][3];
    ele[2][3] != ele[3][2];
    ele[2][3] != ele[3][3];
    ele[3][0] != ele[3][1];
    ele[3][0] != ele[3][2];
    ele[3][0] != ele[3][3];
    ele[3][1] != ele[3][2];
    ele[3][1] != ele[3][3];
    ele[3][2] != ele[3][3];
  // NUMBER OF CONSTRAINTS: 56
  }
  function new ();
    if (! this.randomize ()) begin
      $display ("ERROR: Randomization failed...!!!");
    end
  endfunction: new
  function show ();
    $display (ele[0][0], ele[0][1], ele[0][2], ele[0][3]);
    $display (ele[1][0], ele[1][1], ele[1][2], ele[1][3]);
    $display (ele[2][0], ele[2][1], ele[2][2], ele[2][3]);
    $display (ele[3][0], ele[3][1], ele[3][2], ele[3][3]);
  endfunction: show
endclass: board
