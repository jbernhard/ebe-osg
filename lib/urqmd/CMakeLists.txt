add_executable(urqmd
  urqmd.f
  addpart.f
  angdis.f
  anndec.f
  blockres.f
  cascinit.f
  coload.f
  dectim.f
  delpart.f
  detbal.f
  dwidth.f
  genranf.f
  getmass.f
  getspin.f
  init.f
  input.f
  ityp2pdg.f
  error.f
  make22.f
  numrec.f
  output.f
  paulibl.f
  jdecay2.f
  iso.f
  pdummy.f
  proppot.f
  saveinfo.f
  scatter.f
  siglookup.f
  string.f
  tabinit.f
  whichres.f
  boxprg.f
  shine.f
  )

# suppress warnings if requested
if (QUIET)
  set (CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -w")
endif (QUIET)
