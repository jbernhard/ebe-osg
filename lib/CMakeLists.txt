cmake_minimum_required (VERSION 2.6)
project (ebe-osg CXX Fortran)


#
# OSG compiler flags
#

# Release flags with static linking
set (CMAKE_CXX_FLAGS_OSG "${CMAKE_CXX_FLAGS_RELEASE} -static")
set (CMAKE_Fortran_FLAGS_OSG "${CMAKE_Fortran_FLAGS_RELEASE} -static")

# additional flags for Intel compilers
set (INTEL_FLAGS "-axsse4.2,sse4.1 -msse2 -ipo -no-prec-div")

if (${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")
  set (CMAKE_CXX_FLAGS_OSG "${CMAKE_CXX_FLAGS_OSG} ${INTEL_FLAGS}")
endif (${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")

if (${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel")
  set (CMAKE_Fortran_FLAGS_OSG "${CMAKE_Fortran_FLAGS_OSG} ${INTEL_FLAGS} -heap-arrays")
endif (${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel")

#if (${CMAKE_BUILD_TYPE} STREQUAL "OSG")
#  # unset a bunch of shared-library crap set by the CMake modules
#  unset (CMAKE_SHARED_LIBRARY_CXX_FLAGS)
#  unset (CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS)
#  unset (CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS)
#  unset (CMAKE_SHARED_LIBRARY_RUNTIME_CXX_FLAG)
#  unset (CMAKE_SHARED_LIBRARY_RUNTIME_CXX_FLAG_SEP)
#  unset (CMAKE_SHARED_LIBRARY_SONAME_CXX_FLAG)
#  unset (CMAKE_SHARED_LIBRARY_Fortran_FLAGS)
#  unset (CMAKE_SHARED_LIBRARY_CREATE_Fortran_FLAGS)
#  unset (CMAKE_SHARED_LIBRARY_LINK_Fortran_FLAGS)
#  unset (CMAKE_SHARED_LIBRARY_RUNTIME_Fortran_FLAG)
#  unset (CMAKE_SHARED_LIBRARY_RUNTIME_Fortran_FLAG_SEP)
#  unset (CMAKE_SHARED_LIBRARY_SONAME_Fortran_FLAG)
#endif (${CMAKE_BUILD_TYPE} STREQUAL "OSG")



#
# add subprojects
#

add_subdirectory (superMC)
add_subdirectory (VISHNew)
add_subdirectory (iSS)
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
set (CPACK_INCLUDE_TOPLEVEL_DIRECTORY FALSE)
include (CPack)
