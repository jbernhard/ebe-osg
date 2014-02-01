### adapted from UrQMD-3.3p1 GNUmakefile and mk/{Linux,Intel}.mk

# different numerical functions depending on the compiler
if (${CMAKE_Fortran_COMPILER_ID} STREQUAL "GNU")
  set (SYSTEM_FILES gnuranf.f)
elseif (${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel")
  set (SYSTEM_FILES intranf.f erf.f)
endif (${CMAKE_Fortran_COMPILER_ID} STREQUAL "GNU")


add_executable(${PROJECT_NAME}
  1fluid.f
  addpart.f
  angdis.f
  anndec.f
  bessel.f
  blockres.f
  boxprg.f
  cascinit.f
  coload.f
  dectim.f
  delpart.f
  detbal.f
  dwidth.f
  error.f
  getmass.f
  getspin.f
  hepnam.f
  hepchg.f
  hepcmp.f
  init.f
  input.f
  iso.f
  ityp2pdg.f
  jdecay2.f
  make22.f
  numrec.f
  output.f
  paulibl.f
  proppot.f
  pythia6409.f
  saveinfo.f
  scatter.f
  siglookup.f
  string.f
  tabinit.f
  uhmerge.f
  upmerge.f
  whichres.f
  urqmd.f
  ${SYSTEM_FILES}
  )


# install compiled binary
install (TARGETS ${PROJECT_NAME} DESTINATION ${PROJECT_NAME})
