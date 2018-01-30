program test;

  typedef bit [31:0] addr_t;

  typedef struct {
    addr_t from, till;
    bit isValid;
    bit isCached;
  } seg_t;

  typedef seg_t segs_t [8];

  class c;
    segs_t segs;

    rand addr_t addr;
    rand bit dc;

    constraint ca {
      ((segs[0].isValid) && (addr inside {[segs[0].from : segs[0].till]})) ||
      ((segs[1].isValid) && (addr inside {[segs[1].from : segs[1].till]})) ||
      ((segs[2].isValid) && (addr inside {[segs[2].from : segs[2].till]})) ||
      ((segs[3].isValid) && (addr inside {[segs[3].from : segs[3].till]})) ||
      ((segs[4].isValid) && (addr inside {[segs[4].from : segs[4].till]})) ||
      ((segs[5].isValid) && (addr inside {[segs[5].from : segs[5].till]})) ||
      ((segs[6].isValid) && (addr inside {[segs[6].from : segs[6].till]})) ||
      ((segs[7].isValid) && (addr inside {[segs[7].from : segs[7].till]}));
    }

    constraint cd {
      (addr inside {[segs[0].from : segs[0].till]}) -> (dc == segs[0].isCached);
      (addr inside {[segs[1].from : segs[1].till]}) -> (dc == segs[1].isCached);
      (addr inside {[segs[2].from : segs[2].till]}) -> (dc == segs[2].isCached);
      (addr inside {[segs[3].from : segs[3].till]}) -> (dc == segs[3].isCached);
      (addr inside {[segs[4].from : segs[4].till]}) -> (dc == segs[4].isCached);
      (addr inside {[segs[5].from : segs[5].till]}) -> (dc == segs[5].isCached);
      (addr inside {[segs[6].from : segs[6].till]}) -> (dc == segs[6].isCached);
      (addr inside {[segs[7].from : segs[7].till]}) -> (dc == segs[7].isCached);
    }

    function void post_randomize;
      $displayh (">>> Here ", addr, " ", dc);
    endfunction : post_randomize
  endclass : c

  c cObj = new;

  initial begin
    cObj.segs[0] = '{from:'h0000_0000, till:'h0000_00ff, isValid:1, isCached:0};
    cObj.segs[1] = '{from:'h0010_0000, till:'h0010_00ff, isValid:1, isCached:0};
    cObj.segs[2] = '{from:'h0020_0000, till:'h0020_00ff, isValid:1, isCached:0};
    cObj.segs[3] = '{from:'h0030_0000, till:'h0030_00ff, isValid:1, isCached:0};
    cObj.segs[4] = '{from:'h0040_0000, till:'h0040_00ff, isValid:1, isCached:0};
    cObj.segs[5] = '{from:'h0050_0000, till:'h0050_00ff, isValid:1, isCached:0};
    cObj.segs[6] = '{from:'h0060_0000, till:'h0060_00ff, isValid:1, isCached:0};
    // cObj.segs[7] = '{from:'h0070_0000, till:'h0070_00ff, isValid:1, isCached:0};
    $displayh(cObj.segs);
    repeat (1) cObj.randomize with {dc == 0;};
  end
endprogram
