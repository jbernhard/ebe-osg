cmake_minimum_required (VERSION 2.6)
project (ebe-osg)



#
# initialization
#

# load Fortran compiler
enable_language (Fortran)

# add local dir to CMake path
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake")

# require GSL
find_package(GSL REQUIRED)




#
# compiler options
#

# always want optimized binaries
set (CMAKE_CXX_FLAGS "-O3")
set (CMAKE_Fortran_FLAGS "-O3")


# special flags for Intel compilers
set (INTEL_FLAGS "-ipo -no-prec-div")


# static linking on by default
option(STATIC "Compile statically linked binaries." ON)

if (STATIC)
  message (STATUS "Static build")

  # add static to compiler flags
  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static")
  set (CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -static")

  # extra Intel architecture flags with static linking
  set (INTEL_FLAGS "${INTEL_FLAGS} -axsse4.2,sse4.1 -msse2")

  # unset a bunch of shared-library crap set by the CMake modules
  unset (CMAKE_SHARED_LIBRARY_CXX_FLAGS)
  unset (CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS)
  unset (CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS)
  unset (CMAKE_SHARED_LIBRARY_RUNTIME_CXX_FLAG)
  unset (CMAKE_SHARED_LIBRARY_RUNTIME_CXX_FLAG_SEP)
  unset (CMAKE_SHARED_LIBRARY_SONAME_CXX_FLAG)
  unset (CMAKE_SHARED_LIBRARY_Fortran_FLAGS)
  unset (CMAKE_SHARED_LIBRARY_CREATE_Fortran_FLAGS)
  unset (CMAKE_SHARED_LIBRARY_LINK_Fortran_FLAGS)
  unset (CMAKE_SHARED_LIBRARY_RUNTIME_Fortran_FLAG)
  unset (CMAKE_SHARED_LIBRARY_RUNTIME_Fortran_FLAG_SEP)
  unset (CMAKE_SHARED_LIBRARY_SONAME_Fortran_FLAG)
endif (STATIC)


# append Intel flags if appropriate
if (${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")
  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${INTEL_FLAGS}")
endif (${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")

if (${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel")
  set (CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${INTEL_FLAGS} -heap-arrays")
endif (${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel")


# optional quiet build
option(QUIET "Suppress warnings." OFF)

if (QUIET)
  message (STATUS "Warnings will be suppressed")
  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -w")
  set (CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -w")
endif (QUIET)


# output chosen flags for reference
message(STATUS "CMAKE_CXX_FLAGS = ${CMAKE_CXX_FLAGS}")
message(STATUS "CMAKE_Fortran_FLAGS = ${CMAKE_Fortran_FLAGS}")




#
# subprojects
#

add_subdirectory (superMC)
add_subdirectory (iSS)
add_subdirectory (VISHNew)
add_subdirectory (osc2u)
add_subdirectory (urqmd)




#
# installation / packaging
#

# install run script and dependency
install (PROGRAMS run-ebe DESTINATION .)
install (FILES msg DESTINATION .)

# package options
set (CPACK_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}")
set (CPACK_GENERATOR "TGZ")
set (CPACK_INCLUDE_TOPLEVEL_DIRECTORY 0)
include(CPack)
