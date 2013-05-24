#
# automatically sets various compiler-related parameters for ebe-osg
#

# settings for C++
macro (SetCXX)
  find_package(GSL REQUIRED)
  if (QUIET)
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-write-strings")
  endif (QUIET)
endmacro (SetCXX)

# settings for Fortran
macro (SetFortran)
  enable_language (Fortran)
  set (CMAKE_Fortran_FLAGS "-cpp")
  if (QUIET)
    set (CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -w")
  endif (QUIET)
endmacro (SetFortran)

# shortcut to call all the above macros
macro (SetAll)
  SetCXX ()
  SetFortran ()
endmacro (SetAll)


# generic settings
option(QUIET "Suppress warnings." OFF)

if (QUIET)
  message (STATUS "Selected quiet build, warnings will be suppressed.")
endif (QUIET)
