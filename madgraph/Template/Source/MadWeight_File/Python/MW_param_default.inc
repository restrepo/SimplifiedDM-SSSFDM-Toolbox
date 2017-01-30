mw_run  1               integer  0          # cluster type
mw_run  3               logical  F          # control efficiency
mw_run  write_log       logical  mw_run@@3  # write the log/out/err for each job
mw_run  4               logical  T          # normalize wegiht by cross section
mw_run  acceptance_run  logical  F          # compute the acceptance run 
mw_run  5               integer  10000      # number of points for MadEvent integration
mw_run  6               integer  10000      # number of points for MadWeight integration
mw_run  accuracy_cross  float    0.001      # accuracy asked for the cross section computation
mw_run  nb_loop_cross   integer  3          # number of loop in order to be sure of the precision of the cross section
mw_run  9               logical  F          # use the cut defined in run_card.dat for weight computation
mw_run  91              logical  mw_run@@9  # use the cut defined in run_card.dat for cross-section computation
mw_run  22              logical  0          # put on 1 to add a new events in the analysis (for step 5)
mw_run  histo           logical F           # put one creates histogram for value defined in topgraph.f
mw_parameter 2          logical 0           # put on 1 to add new param_card.dat (for step 1) creates the corresponding new events dir if step 5 already performs

mw_perm      2          logical 1           #consider bjet like normal jet for permutation
mw_perm      21         logical mw_perm@@2  #don't use btagging for selceting events (follow precedent rules)
