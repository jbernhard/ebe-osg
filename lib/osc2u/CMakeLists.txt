cmake_minimum_required (VERSION 2.6)
project (osc2u)

# include Fortran config if this is not a subproject of ebe-osg
if (NOT ebe-osg_BINARY_DIR)
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../CMake")
  include(SetFortran)
endif (NOT ebe-osg_BINARY_DIR)

add_executable(osc2u
  osc2u.f
  pdg2ityp.f
  vni_procev.f
  blockres.f
  dectim.f
  gnuranf.f
  )
