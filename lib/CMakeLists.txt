#
# main CMakeLists.txt for ebe-osg
#


# list of projects to compile
# each of these must be a directory containing a valid CMakeLists.txt
# each path may be relative or absolute and are NOT required to be in the ebe-osg tree
# a completely independent CMake project may be added here
set (SUBPROJECTS
  superMC
  iSS
  VISHNew
  osc2u
  urqmd
  )




### do not edit below this line

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
set (CMAKE_CXX_FLAGS_OSG "-O3")
set (CMAKE_Fortran_FLAGS_OSG "-O3")


# special flags for Intel compilers
set (INTEL_FLAGS "-ipo -no-prec-div")


# static linking on by default
option(STATIC "Compile statically linked binaries." ON)

if (STATIC)
  message (STATUS "Static build")

  # add static to compiler flags
  set (CMAKE_CXX_FLAGS_OSG "${CMAKE_CXX_FLAGS_OSG} -static")
  set (CMAKE_Fortran_FLAGS_OSG "${CMAKE_Fortran_FLAGS_OSG} -static")

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
  set (CMAKE_CXX_FLAGS_OSG "${CMAKE_CXX_FLAGS_OSG} ${INTEL_FLAGS}")
endif (${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")

if (${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel")
  set (CMAKE_Fortran_FLAGS_OSG "${CMAKE_Fortran_FLAGS_OSG} ${INTEL_FLAGS} -heap-arrays")
endif (${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel")


# optional quiet build
option(QUIET "Suppress warnings." OFF)

if (QUIET)
  message (STATUS "Warnings will be suppressed")
  set (CMAKE_CXX_FLAGS_OSG "${CMAKE_CXX_FLAGS_OSG} -w")
  set (CMAKE_Fortran_FLAGS_OSG "${CMAKE_Fortran_FLAGS_OSG} -w")
endif (QUIET)


# output chosen flags for reference
message(STATUS "CMAKE_CXX_FLAGS_OSG = ${CMAKE_CXX_FLAGS_OSG}")
message(STATUS "CMAKE_Fortran_FLAGS_OSG = ${CMAKE_Fortran_FLAGS_OSG}")




#
# add subprojects
#

FOREACH (DIR ${SUBPROJECTS})
  get_filename_component (BN ${DIR} NAME)
  add_subdirectory (${DIR} ${BN})
ENDFOREACH (DIR)




#
# installation / packaging
#

# install run script and dependency
install (PROGRAMS run-ebe DESTINATION .)
install (FILES msg DESTINATION .)

# package options
set (CPACK_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}")
set (CPACK_GENERATOR "TGZ")
set (CPACK_INCLUDE_TOPLEVEL_DIRECTORY FALSE)
include(CPack)
