add_executable(${LOCAL_NAME}
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

# install compiled binary
install (TARGETS ${LOCAL_NAME} DESTINATION ${LOCAL_NAME})
