cmake_minimum_required (VERSION 2.6)
project (ebe-osg CXX Fortran)


#
# OSG compiler flags
#

# use a new build type 'OSG'
# start with the generic 'Release' type and add static linking
# static linking is absolutely essential for running on the grid
# jobs will almost certainly fail if they are dynamically linked
set (CMAKE_CXX_FLAGS_OSG "${CMAKE_CXX_FLAGS_RELEASE} -static")
set (CMAKE_Fortran_FLAGS_OSG "${CMAKE_Fortran_FLAGS_RELEASE} -static")

if (${CMAKE_BUILD_TYPE} STREQUAL "OSG")
  unset (CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS)
  #unset (CMAKE_SHARED_LIBRARY_Fortran_FLAGS)
  #unset (CMAKE_SHARED_LIBRARY_CREATE_Fortran_FLAGS)
  unset (CMAKE_SHARED_LIBRARY_LINK_Fortran_FLAGS)
  #unset (CMAKE_SHARED_LIBRARY_RUNTIME_Fortran_FLAG)
  #unset (CMAKE_SHARED_LIBRARY_RUNTIME_Fortran_FLAG_SEP)
  #unset (CMAKE_SHARED_LIBRARY_SONAME_Fortran_FLAG)
endif (${CMAKE_BUILD_TYPE} STREQUAL "OSG")

# additional flags for Intel compilers
# the Intel compilers can generate multiple binaries for different CPUs and store them in the same file
# the correct binary will then be chosen at runtime
# here, the -ax option generates two binaries for Intel CPUs with SSE4.2 and 4.1 support
# the -m option generates a fallback for generic CPUs with SSE2 support
# this appears to work with every CPU on the OSG
# the remaining flags are suggested by the Intel docs for performance
set (INTEL_FLAGS "-axsse4.2,sse4.1 -msse2 -ipo -ipo-jobs8 -no-prec-div")

if (${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")
  set (CMAKE_CXX_FLAGS_OSG "${CMAKE_CXX_FLAGS_OSG} ${INTEL_FLAGS}")
endif (${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")

if (${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel")
  set (CMAKE_Fortran_FLAGS_OSG "${CMAKE_Fortran_FLAGS_OSG} ${INTEL_FLAGS} -heap-arrays")
endif (${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel")




#
# add subprojects
#

# list the projects which you wish to compile
# each add_subdirectory command must point to a path containing a valid CMake project
# the paths may be absolute or relative and need not be within the ebe-osg tree
# run 'cmake --help-command add_subdirectory' for more information
add_subdirectory (superMC)
add_subdirectory (VISHNew)
add_subdirectory (iSS)
add_subdirectory (osc2u)
add_subdirectory (urqmd)




#
# installation
#

# install run script and dependency
install (PROGRAMS run-ebe DESTINATION .)
install (FILES msg DESTINATION .)

# create empty results directory
install (DIRECTORY DESTINATION results)




# CPack not used at this time

# package options
#set (CPACK_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}")
#set (CPACK_GENERATOR "TGZ")
#set (CPACK_INCLUDE_TOPLEVEL_DIRECTORY FALSE)
#include (CPack)
