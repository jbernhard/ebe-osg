cmake_minimum_required (VERSION 2.6)
project (ebe-osg)

# load config files
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake")
include(SetCXX)
include(SetFortran)

# add subprojects
add_subdirectory (superMC)
add_subdirectory (iSS)
add_subdirectory (VISHNew)
add_subdirectory (osc2u)
add_subdirectory (urqmd)
