cmake_minimum_required (VERSION 2.6)
project (VISHNew Fortran)

add_subdirectory (src)

# install dependencies
install (FILES Vishydro.inp extraParas.inp DESTINATION ${PROJECT_NAME})
install (DIRECTORY EOS Initial results DESTINATION ${PROJECT_NAME})
