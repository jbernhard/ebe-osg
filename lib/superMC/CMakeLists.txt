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

# suppress warnings if requested
if (QUIET)
  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-write-strings")
endif (QUIET)

# requires GSL
find_package(GSL REQUIRED)
target_link_libraries(superMC ${GSL_LIBRARIES})
