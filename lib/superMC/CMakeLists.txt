cmake_minimum_required (VERSION 2.6)
project (superMC)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/../CMake")
find_package(GSL REQUIRED)

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

target_link_libraries(superMC ${GSL_LIBRARIES})
