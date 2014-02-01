cmake_minimum_required (VERSION 2.6)
project (VISHNew Fortran)

add_subdirectory (src)

# install dependencies
install (FILES Vishydro.inp extraParas.inp DESTINATION ${PROJECT_NAME})
install (DIRECTORY EOS DESTINATION ${PROJECT_NAME} FILES_MATCHING PATTERN "*.dat")
install (DIRECTORY DESTINATION ${PROJECT_NAME}/Initial)
install (DIRECTORY DESTINATION ${PROJECT_NAME}/results)
