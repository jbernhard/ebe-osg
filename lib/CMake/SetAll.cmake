#
# automatically sets various compiler-related parameters for ebe-osg
#

# settings for C++
macro (SetCXX)
  find_package(GSL REQUIRED)
endmacro (SetCXX)

# settings for Fortran
macro (SetFortran)
  enable_language (Fortran)
  set (CMAKE_Fortran_FLAGS "-cpp")
endmacro (SetFortran)

# shortcut to call all the above macros
macro (SetAll)
  SetCXX ()
  SetFortran ()
endmacro (SetAll)
