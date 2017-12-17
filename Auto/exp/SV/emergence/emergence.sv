program emergence;

  typedef enum {
    WORKER,
    SOLDIER,
    GATHERER,
    CARETAKER
  } job_t;

  class Ant;
    rand job_t job;

    job_t frinedJobs[$];
    local int unsigned count[job_t];

    function void meet(input job_t job);

      // Ant's brain is small, do not bother about too many friends
      if (frinedJobs.size() == `MAX_FRIENDS) count[frinedJobs.pop_front()]--;

      // Remember friend's job
      frinedJobs.push_back(job);
      count[job]++;

      // Unless enough numbers are available, keep meeting friends
      if (frinedJobs.size() < `MAX_FRIENDS) return;

      // When very few frineds are doing specific job, volenteer
      foreach (count[x]) if (count[x] < `THRESHOLD) this.job = x;
    endfunction : meet
  endclass : Ant

  class Colony;
    static local Ant ants[$];
    static int unsigned count[job_t];

    function new;
      Ant ant;

      // Populate random Ants
      repeat (`POPULATION) begin
        ant = new();
        ant.randomize();
        ants.push_back(ant);
      end

      calcCounts;
      showCounts;
    endfunction : new

    static function void show;
      foreach (ants[x]) begin
        $display("%d %s", x, ants[x].job.name);
      end
    endfunction : show

    static function calcCounts;
      foreach (count[x]) count[x] = 0;
      foreach (ants[x]) count[ants[x].job]++;
    endfunction : calcCounts

    static function showCounts;
      job_t job;

      for (job = job.first(); job != job.last(); job = job.next()) $write("%0d,", count[job]);
      $display("%0d", count[job]);
    endfunction : showCounts

    static function meet;
      int a, b;

      repeat (`POPULATION / 10) begin
        std::randomize(a,b) with {
          a >= 0;
          a < ants.size();
          b >= 0;
          b < ants.size();
          a != b;
        };

        count[ants[a].job]--;
        count[ants[b].job]--;
        ants[a].meet(ants[b].job);
        ants[b].meet(ants[a].job);
        count[ants[a].job]++;
        count[ants[b].job]++;
        showCounts;
      end
    endfunction : meet

    static task kill;
      job_t job;
      int killCount;
      int delay;
      int idxes[$];

      std::randomize(delay) with {
        delay >= 400;
        delay <= 499;
      };

      #delay;

      std::randomize(job, killCount) with {
        killCount >= 100;
        killCount <= 150;
      };

      idxes = ants.find_index() with (item.job == job);
      idxes = idxes[0:killCount-1];
      foreach (idxes[x]) ants.delete(idxes[x] - x);
      calcCounts;
      showCounts;
    endtask : kill

    static function void rePopulate;
      Ant ant;

      if (ants.size() < `POPULATION) begin
        ant = new();
        ant.randomize();
        ants.push_back(ant);
        count[ant.job]++;
      end
      showCounts;
    endfunction : rePopulate
  endclass : Colony

  Colony colony;

  initial begin
    colony = new;

    fork
      forever begin #0;   Colony::kill;       end
      forever begin #1;   Colony::rePopulate; end
      forever begin #1;   Colony::meet;       end
    join_none

    #1_000 $finish;
  end
endprogram : emergence
