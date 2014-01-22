cmake_minimum_required (VERSION 2.6)
project (urqmd Fortran)

add_subdirectory (src)

# install dependency
install (FILES uqmd.burner DESTINATION ${PROJECT_NAME})
