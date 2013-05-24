cmake_minimum_required (VERSION 2.6)
project (superMC)

# load config script if this is not a subproject of ebe-osg
if (NOT ebe-osg_BINARY_DIR)
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../CMake")
  include(SetAll)
  SetCXX ()
  SetGeneric ()
endif (NOT ebe-osg_BINARY_DIR)

add_executable(superMC
  main.cpp
  Bases.cpp
  MCnucl.cpp
  GlueDensity.cpp
  MakeDensity.cpp
  KLNModel.cpp
  OverLap.cpp
  Largex.cpp
  Regge96.cpp
  rcBKfunc.cpp
  MathBasics.cpp
  ParameterReader.cpp
  arsenal.cpp
  EOS.cpp
  GaussianNucleonsCal.cpp
  NBD.cpp
  RandomVariable.cpp
  TableFunction.cpp
  Table.cpp
  )

# link to GSL
target_link_libraries(superMC ${GSL_LIBRARIES})
