set (LOCAL_NAME superMC)

add_executable(${LOCAL_NAME}
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

# require GSL
find_package(GSL REQUIRED)
target_link_libraries(${LOCAL_NAME} ${GSL_LIBRARIES})

# install compiled binary and its dependencies
install (TARGETS ${LOCAL_NAME} DESTINATION ${LOCAL_NAME})
install (FILES parameters.dat DESTINATION ${LOCAL_NAME})
install (DIRECTORY data s95p-PCE DESTINATION ${LOCAL_NAME})
