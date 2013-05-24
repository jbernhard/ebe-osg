cmake_minimum_required (VERSION 2.6)
project (iSS)

# load config script if this is not a subproject of ebe-osg
if (NOT ebe-osg_BINARY_DIR)
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../CMake")
  include(SetAll)
  SetCXX ()
endif (NOT ebe-osg_BINARY_DIR)

add_executable(iSS
  main.cpp
  arsenal.cpp
  ParameterReader.cpp
  RandomVariable1DArray.cpp
  RandomVariable2DArray.cpp
  RandomVariable.cpp
  NBD.cpp
  TableFunction.cpp
  emissionfunction.cpp
  Table.cpp
  readindata.cpp
  )

# link to GSL
target_link_libraries(iSS ${GSL_LIBRARIES})
