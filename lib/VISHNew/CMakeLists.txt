cmake_minimum_required (VERSION 2.6)
project (VISHNew)

# load config script if this is not a subproject of ebe-osg
if (NOT ebe-osg_BINARY_DIR)
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../CMake")
  include(SetAll)
  SetFortran ()
endif (NOT ebe-osg_BINARY_DIR)

add_executable(VISHNew
  VISH2p1V1.10.0.for
  PhyBdary-1.10.for
  InputEOS-1.3.for
  OSCARoutput.for
  Arsenal-0.7.for
  Initialization-1.03.for
  InputFun-1.29RC6.for
  )
