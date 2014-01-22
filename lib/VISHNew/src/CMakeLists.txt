add_executable(${PROJECT_NAME}
  VISH2p1V1.10.0.for
  PhyBdary-1.10.for
  InputEOS-1.3.for
  OSCARoutput.for
  Arsenal-0.7.for
  Initialization-1.03.for
  InputFun-1.29RC6.for
  )

# require preprocessor
set (CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -cpp")

# install compiled binary
install (TARGETS ${PROJECT_NAME} DESTINATION ${PROJECT_NAME})
