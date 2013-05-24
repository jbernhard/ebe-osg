cmake_minimum_required (VERSION 2.6)
project (iSS)

# normally, GSL is loaded by ebe-osg
# but if this is a separate build, GSL must be loaded here
if (NOT ebe-osg_BINARY_DIR)
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../CMake")
  find_package(GSL REQUIRED)
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
