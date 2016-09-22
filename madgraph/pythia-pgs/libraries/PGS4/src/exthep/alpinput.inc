c PGS event header and control information

      integer nevpgs,nprpgs,numarg,pgs_iseed,pgs_jseed
      integer pgs_log_unit,target_lum
      integer pgs_herwig_proc

      character*6 optpgs,evtlum
      character*40 pgs_args
      character*80 pgs_input_file,pgs_output_file
      character*80 pgs_param_file,pgs_log_file,pgs_herwig_susy
      character*80 pgs_isajet_decay,pgs_isajet_cards,pgs_pythia_cards
      character*80 pgs_alpgen_stem 

      common /pgsevt/ numarg,             ! number of arguments supplied to program
     .                pgs_args(10),       ! list of arguments (char*40)
     .                nevpgs,             ! number of events to generate/read
     .                target_lum,         ! target luminosity (in pb-1)
     .                nprpgs,             ! number of events to print out 
     .                pgs_iseed,pgs_jseed,! seeds for pgs_ranmar
     .                pgs_log_unit,       ! log file unit number
     .                optpgs,             ! type of run: 'PYTHIA', 'ISAJET', 'FILE', ...
     .                evtlum,             ! number of events ('events') or luminosity ('pb-1')
     .                pgs_input_file,     ! input file
     .                pgs_output_file,    ! output file
     .                pgs_log_file,       ! log file
     .                pgs_param_file,     ! detector parameter file
     .                pgs_isajet_decay,   ! ISAJET decay table file name
     .                pgs_isajet_cards,   ! ISAJET card file name
     .                pgs_pythia_cards,   ! PYTHIA card file name
     .                pgs_herwig_proc,    ! HERWIG process to generate
     .                pgs_herwig_susy,     ! HERWIG SUSY data file
     .                pgs_alpgen_stem     ! ALPGEN unweighted events file stem
