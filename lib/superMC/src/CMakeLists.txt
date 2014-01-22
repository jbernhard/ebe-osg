add_executable(${PROJECT_NAME}
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

# require GSL
target_link_libraries(${PROJECT_NAME} ${GSL_LIBRARIES})

# install compiled binary
install (TARGETS ${PROJECT_NAME} DESTINATION ${PROJECT_NAME})
