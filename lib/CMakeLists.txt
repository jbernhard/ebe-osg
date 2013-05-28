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

set (CMAKE_CXX_FLAGS "-O3")

if (${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")
  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ipo -no-prec-div -axsse4.2,sse4.1 -msse2")
endif (${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")

if (STATIC)
  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static")
  unset (CMAKE_SHARED_LIBRARY_CXX_FLAGS)
  unset (CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS)
  unset (CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS)
  unset (CMAKE_SHARED_LIBRARY_RUNTIME_CXX_FLAG)
  unset (CMAKE_SHARED_LIBRARY_RUNTIME_CXX_FLAG_SEP)
  unset (CMAKE_SHARED_LIBRARY_SONAME_CXX_FLAG)
endif (STATIC)

message(STATUS "CMAKE_CXX_FLAGS = ${CMAKE_CXX_FLAGS}")


#
# Fortran
#

enable_language (Fortran)

set (CMAKE_Fortran_FLAGS "-O3")

if (${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel")
  set (CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -ipo -no-prec-div -axsse4.2,sse4.1 -msse2 -heap-arrays")
endif (${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel")

if (STATIC)
  set (CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -static")
  unset (CMAKE_SHARED_LIBRARY_Fortran_FLAGS)
  unset (CMAKE_SHARED_LIBRARY_CREATE_Fortran_FLAGS)
  unset (CMAKE_SHARED_LIBRARY_LINK_Fortran_FLAGS)
  unset (CMAKE_SHARED_LIBRARY_RUNTIME_Fortran_FLAG)
  unset (CMAKE_SHARED_LIBRARY_RUNTIME_Fortran_FLAG_SEP)
  unset (CMAKE_SHARED_LIBRARY_SONAME_Fortran_FLAG)
endif (STATIC)

message(STATUS "CMAKE_Fortran_FLAGS = ${CMAKE_Fortran_FLAGS}")



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
