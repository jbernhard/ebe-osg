cmake_minimum_required (VERSION 2.6)
project (superMC CXX)

# add local dir to CMake path
# contains FindGSL.cmake
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/CMake")

# require GSL
find_package(GSL REQUIRED)

add_subdirectory (src)

# install dependencies
install (FILES parameters.dat DESTINATION ${PROJECT_NAME})
install (DIRECTORY data s95p-PCE DESTINATION ${PROJECT_NAME})
