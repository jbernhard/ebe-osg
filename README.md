# EbE-OSG

This package provides programs and utilities for running event-by-event (EbE) heavy-ion collision
simulations on the Open Science Grid (OSG).  By default, it runs hybrid hydro+UrQMD events and
copies the raw UrQMD output to nukeserv at Duke.


## Organization 

Files are organize as follows:

  * etc/:  Miscellaneous files.
  * inputs/:  Input files, to be distributed to the OSG.
  * lib/:  Main library directory.  Contains the EbE codes and scripts.
  * runs/:  Created at runtime by the submit script.  Contains Condor-related files and logs.


## Scripts

Besides the actual EbE codes, several scripts control the workflow:

  * lib/build:  Compiles all EbE codes and creates a package for distribution on the OSG.
  * lib/run-ebe:  Runs the actual event simulations.  Executes each EbE code in sequence.
  * lib/remote-job-wrapper:  The Condor executable.  Responsible for copying necessary files to OSG
      nodes, calling run-ebe, and then copying output to the destination.
  * submit:  Generates and submits jobs.
