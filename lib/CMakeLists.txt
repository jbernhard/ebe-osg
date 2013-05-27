cmake_minimum_required (VERSION 2.6)
project (ebe-osg)


# add local dir to CMake path
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake")


# optional quiet build
option(QUIET "Suppress warnings." OFF)

if (QUIET)
  message (STATUS "Selected quiet build, warnings will be suppressed.")
endif (QUIET)



#
# C++
#



#
# Fortran
#

enable_language (Fortran)


# add subprojects
add_subdirectory (superMC)
add_subdirectory (iSS)
add_subdirectory (VISHNew)
add_subdirectory (osc2u)
add_subdirectory (urqmd)
