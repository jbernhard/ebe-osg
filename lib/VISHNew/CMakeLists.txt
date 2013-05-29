set (LOCAL_NAME VISHNew)

add_executable(${LOCAL_NAME}
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

# install compiled binary and its dependencies
install (TARGETS ${LOCAL_NAME} DESTINATION ${LOCAL_NAME})
install (FILES Vishydro.inp extraParas.inp DESTINATION ${LOCAL_NAME})
install (DIRECTORY EOS Initial movie results DESTINATION ${LOCAL_NAME})
