program test;

  typedef struct {
    int unsigned from;
    int unsigned till;
  } Region_t;

  Region_t regions[$];

  initial begin
    int unsigned addr;
    int unsigned idx;

    regions.push_back('{from: 'h1000_0000, till: 'h1FFF_FFFF});
    regions.push_back('{from: 'h3000_0000, till: 'h3FFF_FFFF});
    regions.push_back('{from: 'h6000_0000, till: 'h6FFF_FFFF});
    regions.push_back('{from: 'h9000_0000, till: 'hFFFF_FFFF});
    $displayh(regions);

    repeat (10000) begin
      std::randomize(idx, addr) with {
        // solve idx before addr;
        addr inside {[regions[idx].from: regions[idx].till]};
      };

      $displayh(">>> Here ", idx, " ", addr[31:28]);
    end
  end
endprogram : test
