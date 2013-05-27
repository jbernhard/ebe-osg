cmake_minimum_required (VERSION 2.6)
project (ebe-osg)



# add local dir to CMake path
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake")


# optional quiet build
option(QUIET "Suppress warnings." OFF)

if (QUIET)
  message (STATUS "Selected quiet build, warnings will be suppressed.")
endif (QUIET)


# static linking on by default
option(STATIC "Compile statically linked binaries." ON)

if (STATIC)
  message (STATUS "Selected static build, binaries will be compiled with static linking.")
endif (STATIC)



#
# C++
#

if (STATIC)
  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static")
endif (STATIC)


#
# Fortran
#

enable_language (Fortran)

if (STATIC)
  set (CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -static")
endif (STATIC)



# add subprojects
add_subdirectory (superMC)
add_subdirectory (iSS)
add_subdirectory (VISHNew)
add_subdirectory (osc2u)
add_subdirectory (urqmd)


# install run script and dependency
install (PROGRAMS run-event DESTINATION .)
install (FILES msg DESTINATION .)


# packaging options
set (CPACK_PACKAGE_FILE_NAME "ebe")
set (CPACK_GENERATOR "TGZ")
set (CPACK_INCLUDE_TOPLEVEL_DIRECTORY 0)
include(CPack)
